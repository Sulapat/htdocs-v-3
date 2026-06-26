<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
/**
 * api_i18n.php — Bilingual public API
 *
 * Usage:  ?action=<action>&lang=th|en[&<params>]
 *
 * Actions:
 *   categories    → list categories
 *   courses       → list courses (card view)                [&category=MNT]
 *   course        → single course detail                     &slug=xxx
 *   news          → list news articles
 *   news_detail   → single news article                      &id=xxx
 *   members       → search members                          [&q=xxx][&cert=CATII]
 *   members_stats → count per cert_code { CATII, CATIII, CATIV, BMV }
 *
 * ─── DB i18n strategy ────────────────────────────────────────────────────────
 * ทุก entity มีตาราง "หลัก" (TH) และตาราง "_en" คู่กัน เช่น:
 *   courses  + courses_en
 *   news     + news_en   ฯลฯ
 *
 * lang=th → อ่านตารางหลักตรงๆ (ไม่ JOIN _en เพื่อประหยัด query)
 * lang=en → LEFT JOIN _en ด้วย id เดียวกัน แล้ว COALESCE(en_col, th_col)
 *           ถ้า row _en ยังไม่มีข้อมูล → fallback เป็นไทยอัตโนมัติ ไม่ error
 * ─────────────────────────────────────────────────────────────────────────────
 *
 * ข้อมูลที่ไม่ผันตามภาษา (ไม่ต้อง JOIN _en):
 *   - members, member_certifications  → ชื่อ/อีเมล/รหัสสมาชิกเป็นข้อมูลจริง
 *   - news_images                     → รูปภาพใช้ร่วมกันทั้งสองภาษา
 *   - categories.icon, .color         → ค่า CSS ไม่ผันตามภาษา
 */

header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');

require_once __DIR__ . '/../config/db.php';
$pdo = getPDO();

// ── Helpers ───────────────────────────────────────────────────────────────────

$lang   = in_array($_GET['lang'] ?? 'th', ['th', 'en']) ? ($_GET['lang'] ?? 'th') : 'th';
$action = $_GET['action'] ?? 'courses';

function db(PDO $pdo, string $sql, array $params = []): array {
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function dbOne(PDO $pdo, string $sql, array $params = []): ?array {
    $rows = db($pdo, $sql, $params);
    return $rows[0] ?? null;
}

function ok($data): void {
    echo json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

function fail(string $msg, int $code = 404): void {
    http_response_code($code);
    echo json_encode(['error' => $msg]);
    exit;
}

/**
 * tcol — สร้าง SQL fragment สำหรับคอลัมน์ที่ผันตามภาษา
 *
 * lang=th → "$main.$col AS `$as`"
 * lang=en → "COALESCE($en.$col, $main.$col) AS `$as`"
 *           (fallback เป็น TH อัตโนมัติถ้า row _en ไม่มีหรือ col เป็น NULL)
 */
function tcol(string $lang, string $main, string $en, string $col, ?string $as = null): string {
    $as ??= $col;
    return $lang === 'en'
        ? "COALESCE($en.$col, $main.$col) AS `$as`"
        : "$main.$col AS `$as`";
}

/**
 * tjoin — สร้าง LEFT JOIN กับตาราง _en
 * lang=th → '' (ไม่ JOIN เพื่อประหยัด query)
 * lang=en → "LEFT JOIN $enTable $enAlias ON $enAlias.$key = $mainAlias.$key"
 */
function tjoin(string $lang, string $enTable, string $enAlias, string $mainAlias, string $key = 'id'): string {
    return $lang === 'en'
        ? "LEFT JOIN $enTable $enAlias ON $enAlias.$key = $mainAlias.$key"
        : '';
}

// ── GET ?action=categories ────────────────────────────────────────────────────
// DB: categories + categories_en (key: code)
// ค่า icon, color ไม่ผันตามภาษา → อ่านจากตารางหลักเสมอ

if ($action === 'categories') {
    $join = tjoin($lang, 'categories_en', 'cat_en', 'c', 'code');
    ok(db($pdo, "
        SELECT c.code, c.icon, c.color,
               " . tcol($lang, 'c', 'cat_en', 'label') . "
        FROM categories c $join
        ORDER BY c.code
    "));
}

// ── GET ?action=courses[&category=MNT] ───────────────────────────────────────
// DB: courses + courses_en, categories + categories_en
// icon, color, price, badge ไม่ผันตามภาษา

if ($action === 'courses') {
    $join    = tjoin($lang, 'courses_en',    'c_en',   'c');
    $catJoin = tjoin($lang, 'categories_en', 'cat_en', 'cat', 'code');

    $params = [];
    $where  = '';
    if (!empty($_GET['category'])) {
        $where    = 'WHERE c.category_code = ?';
        $params[] = $_GET['category'];
    }

    ok(db($pdo, "
        SELECT c.id,
               c.course_code AS courseCode,
               c.slug,
               " . tcol($lang, 'c', 'c_en', 'title') . ",
               " . tcol($lang, 'c', 'c_en', 'short_desc', 'desc') . ",
               c.category_code AS category,
               " . tcol($lang, 'c', 'c_en', 'duration') . ",
               " . tcol($lang, 'c', 'c_en', 'capacity') . ",
               c.price,
               c.badge,
               c.badge_class AS badgeClass,
               c.image,
               " . tcol($lang, 'cat', 'cat_en', 'label', 'categoryLabel') . ",
               cat.icon  AS categoryIcon,
               cat.color AS categoryColor
        FROM courses c
        $join
        LEFT JOIN categories cat ON c.category_code = cat.code
        $catJoin
        $where
        ORDER BY c.id
    ", $params));
}

// ── GET ?action=course&slug=xxx ───────────────────────────────────────────────
// DB: courses + courses_en + ตาราง sub-tables ทั้งหมด + _en คู่กัน

if ($action === 'course') {
    $slug = trim($_GET['slug'] ?? '');
    if (!$slug) fail('slug is required', 400);

    $join    = tjoin($lang, 'courses_en',    'c_en',   'c');
    $catJoin = tjoin($lang, 'categories_en', 'cat_en', 'cat', 'code');

    $course = dbOne($pdo, "
        SELECT c.id,
               c.course_code AS courseCode,
               c.slug,
               " . tcol($lang, 'c', 'c_en', 'title') . ",
               " . tcol($lang, 'c', 'c_en', 'short_desc', 'desc') . ",
               " . tcol($lang, 'c', 'c_en', 'description') . ",
               c.category_code AS category,
               " . tcol($lang, 'c', 'c_en', 'duration') . ",
               " . tcol($lang, 'c', 'c_en', 'capacity') . ",
               c.price,
               c.badge,
               c.badge_class AS badgeClass,
               c.image,
               " . tcol($lang, 'cat', 'cat_en', 'label', 'categoryLabel') . ",
               cat.icon  AS categoryIcon,
               cat.color AS categoryColor
        FROM courses c
        $join
        LEFT JOIN categories cat ON c.category_code = cat.code
        $catJoin
        WHERE c.slug = ?
    ", [$slug]);

    if (!$course) fail('Course not found');
    $id = $course['id'];

    // Objectives — DB: course_objectives + course_objectives_en
    $j = tjoin($lang, 'course_objectives_en', 'o_en', 'o');
    $course['objectives'] = array_column(db($pdo, "
        SELECT " . tcol($lang, 'o', 'o_en', 'objective') . "
        FROM course_objectives o $j
        WHERE o.course_id = ? ORDER BY o.sort_order
    ", [$id]), 'objective');

    // Target groups — DB: course_target_groups + course_target_groups_en
    $j = tjoin($lang, 'course_target_groups_en', 'tg_en', 'tg');
    $course['targetGroups'] = array_column(db($pdo, "
        SELECT " . tcol($lang, 'tg', 'tg_en', 'target_group') . "
        FROM course_target_groups tg $j
        WHERE tg.course_id = ? ORDER BY tg.sort_order
    ", [$id]), 'target_group');

    // Topics — DB: course_topics + course_topics_en
    $topicJoin = tjoin($lang, 'course_topics_en', 't_en', 't');
    $topics = db($pdo, "
        SELECT t.id, " . tcol($lang, 't', 't_en', 'title') . "
        FROM course_topics t $topicJoin
        WHERE t.course_id = ? ORDER BY t.sort_order
    ", [$id]);

    // Topic items — DB: course_topic_items + course_topic_items_en
    $itemJoin = tjoin($lang, 'course_topic_items_en', 'ti_en', 'ti');
    foreach ($topics as &$topic) {
        $topic['items'] = array_column(db($pdo, "
            SELECT " . tcol($lang, 'ti', 'ti_en', 'item') . "
            FROM course_topic_items ti $itemJoin
            WHERE ti.topic_id = ? ORDER BY ti.sort_order
        ", [$topic['id']]), 'item');
        unset($topic['id']);
    }
    unset($topic);
    $course['topics'] = $topics;

    // Schedules — DB: course_schedules + course_schedules_en
    $schedJoin = tjoin($lang, 'course_schedules_en', 's_en', 's');
    $schedules = db($pdo, "
        SELECT s.id, " . tcol($lang, 's', 's_en', 'time_range', 'time') . "
        FROM course_schedules s $schedJoin
        WHERE s.course_id = ? ORDER BY s.sort_order
    ", [$id]);

    // Schedule activities — DB: course_schedule_activities + course_schedule_activities_en
    $actJoin = tjoin($lang, 'course_schedule_activities_en', 'sa_en', 'sa');
    foreach ($schedules as &$sch) {
        $sch['activities'] = array_column(db($pdo, "
            SELECT " . tcol($lang, 'sa', 'sa_en', 'activity') . "
            FROM course_schedule_activities sa $actJoin
            WHERE sa.schedule_id = ? ORDER BY sa.sort_order
        ", [$sch['id']]), 'activity');
        unset($sch['id']);
    }
    unset($sch);
    $course['schedules'] = $schedules;

    // Training methods — DB: course_training_methods + course_training_methods_en
    $j = tjoin($lang, 'course_training_methods_en', 'm_en', 'm');
    $course['trainingMethod'] = array_column(db($pdo, "
        SELECT " . tcol($lang, 'm', 'm_en', 'method') . "
        FROM course_training_methods m $j
        WHERE m.course_id = ? ORDER BY m.sort_order
    ", [$id]), 'method');

    // Equipments — DB: course_equipments + course_equipments_en
    $j = tjoin($lang, 'course_equipments_en', 'e_en', 'e');
    $course['equipments'] = array_column(db($pdo, "
        SELECT " . tcol($lang, 'e', 'e_en', 'equipment') . "
        FROM course_equipments e $j
        WHERE e.course_id = ? ORDER BY e.sort_order
    ", [$id]), 'equipment');

    // Notes — DB: course_notes + course_notes_en
    $j = tjoin($lang, 'course_notes_en', 'n_en', 'n');
    $course['notes'] = array_column(db($pdo, "
        SELECT " . tcol($lang, 'n', 'n_en', 'note') . "
        FROM course_notes n $j
        WHERE n.course_id = ? ORDER BY n.sort_order
    ", [$id]), 'note');

    ok($course);
}

// ── GET ?action=news ──────────────────────────────────────────────────────────
// DB: news + news_en, news_tags + news_tags_en
// news_images ไม่มี _en → รูปใช้ร่วมกันทั้งสองภาษา

if ($action === 'news') {
    $join    = tjoin($lang, 'news_en',      'n_en', 'n');
    $tagJoin = tjoin($lang, 'news_tags_en', 't_en', 't');

    $rows = db($pdo, "
        SELECT n.id,
               n.cover_image AS image,
               " . tcol($lang, 'n', 'n_en', 'title') . ",
               " . tcol($lang, 'n', 'n_en', 'short_desc', 'shortDesc') . ",
               " . tcol($lang, 'n', 'n_en', 'event_date_text', 'date') . ",
               " . tcol($lang, 'n', 'n_en', 'location') . "
        FROM news n $join
        ORDER BY n.id DESC
    ");

    foreach ($rows as &$row) {
        $row['tags'] = array_column(db($pdo, "
            SELECT " . tcol($lang, 't', 't_en', 'tag') . "
            FROM news_tags t $tagJoin
            WHERE t.news_id = ?
        ", [$row['id']]), 'tag');
    }
    unset($row);
    ok($rows);
}

// ── GET ?action=news_detail&id=xxx ────────────────────────────────────────────
if ($action === 'news_detail') {
    $id = (int)($_GET['id'] ?? 0);
    if (!$id) fail('id is required', 400);

    $join    = tjoin($lang, 'news_en',      'n_en', 'n');
    $tagJoin = tjoin($lang, 'news_tags_en', 't_en', 't');

    $article = dbOne($pdo, "
        SELECT n.id,
               n.cover_image AS image,
               " . tcol($lang, 'n', 'n_en', 'title') . ",
               " . tcol($lang, 'n', 'n_en', 'short_desc', 'shortDesc') . ",
               " . tcol($lang, 'n', 'n_en', 'event_date_text', 'date') . ",
               " . tcol($lang, 'n', 'n_en', 'location') . ",
               " . tcol($lang, 'n', 'n_en', 'full_description', 'fullDescription') . "
        FROM news n $join
        WHERE n.id = ?
    ", [$id]);

    if (!$article) fail('Article not found');

    // รูปภาพ: ไม่ผันตามภาษา → อ่าน news_images ตรงๆ ไม่ JOIN _en
    $article['images'] = array_column(db($pdo, "
        SELECT image_url FROM news_images WHERE news_id = ? ORDER BY sort_order
    ", [$id]), 'image_url');

    $article['tags'] = array_column(db($pdo, "
        SELECT " . tcol($lang, 't', 't_en', 'tag') . "
        FROM news_tags t $tagJoin
        WHERE t.news_id = ?
    ", [$id]), 'tag');

    ok($article);
}

// ── GET ?action=members[&q=xxx][&cert=CATII] ──────────────────────────────────
// DB: members, member_certifications (ไม่มี _en — ข้อมูลคนไม่ผันตามภาษา)
// ค้นหาด้วย: first_name, last_name, email, member_no
// กรองด้วย: cert_code (CATII | CATIII | CATIV | BMV)

if ($action === 'members') {
    $q    = trim($_GET['q']    ?? '');
    $cert = trim($_GET['cert'] ?? '');

    $params = [];
    $where  = ['1=1'];

    if ($q !== '') {
        $where[]  = '(m.first_name LIKE ? OR m.last_name LIKE ? OR m.email LIKE ? OR m.member_no LIKE ?)';
        $like     = "%$q%";
        array_push($params, $like, $like, $like, $like);
    }
    if ($cert !== '') {
        $where[]  = 'EXISTS (SELECT 1 FROM member_certifications mc2 WHERE mc2.member_id = m.id AND mc2.cert_code = ?)';
        $params[] = $cert;
    }

    ok(db($pdo, "
        SELECT m.id,
               m.first_name  AS firstName,
               m.last_name   AS lastName,
               m.company,
               m.email,
               m.level_text  AS levelText,
               m.member_no   AS memberNo,
               GROUP_CONCAT(mc.cert_code ORDER BY mc.cert_code SEPARATOR ',') AS certifications
        FROM members m
        LEFT JOIN member_certifications mc ON mc.member_id = m.id
        WHERE " . implode(' AND ', $where) . "
        GROUP BY m.id
        ORDER BY m.last_name, m.first_name
    ", $params));
}

// ── GET ?action=members_stats ─────────────────────────────────────────────────
// DB: member_certifications (ไม่มี _en)
// คืนค่าจำนวนสมาชิกแยกตาม cert_code เช่น { "CATII": 12, "CATIII": 8, ... }
// สำหรับ StatsIndex.vue / Dashboard widget

if ($action === 'members_stats') {
    $codes  = ['CATII', 'CATIII', 'CATIV', 'BMV'];
    $result = [];

    // Query เดียว ไม่วน loop หลาย query
    $in     = implode(',', array_fill(0, count($codes), '?'));
    $rows   = db($pdo, "
        SELECT cert_code, COUNT(*) AS cnt
        FROM member_certifications
        WHERE cert_code IN ($in)
        GROUP BY cert_code
    ", $codes);

    // เติม 0 สำหรับ cert ที่ไม่มีข้อมูล เพื่อให้ frontend ไม่ต้อง handle undefined
    foreach ($codes as $code) $result[$code] = 0;
    foreach ($rows  as $row)  $result[$row['cert_code']] = (int)$row['cnt'];

    ok($result);
}

// ── Fallback ──────────────────────────────────────────────────────────────────
fail('Unknown action: ' . htmlspecialchars($action), 400);