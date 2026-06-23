<?php
/**
 * api_i18n.php  — Bilingual API helper
 *
 * Usage (query string):  ?lang=th  or  ?lang=en   (default: th)
 *
 * Endpoints (set via ?action=):
 *   courses          → list all courses (card view)
 *   course           → single course detail (?slug=xxx)
 *   categories       → list categories with translated label
 *   news             → list news articles
 *   news_detail      → single news article (?id=xxx)
 *   members          → search members (?q=xxx&cert=CATII)
 */

header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');

// ── DB connection ─────────────────────────────────────
$host = 'localhost';
$db   = 'your_database';
$user = 'your_user';
$pass = 'your_password';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'DB connection failed']);
    exit;
}

// ── Helpers ───────────────────────────────────────────
$lang   = in_array($_GET['lang'] ?? 'th', ['th', 'en']) ? ($_GET['lang'] ?? 'th') : 'th';
$action = $_GET['action'] ?? 'courses';

function query(PDO $pdo, string $sql, array $params = []): array {
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function queryOne(PDO $pdo, string $sql, array $params = []): ?array {
    $rows = query($pdo, $sql, $params);
    return $rows[0] ?? null;
}

function ok(mixed $data): void {
    echo json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

function fail(string $msg, int $code = 404): void {
    http_response_code($code);
    echo json_encode(['error' => $msg]);
    exit;
}

// ── Routes ────────────────────────────────────────────

// GET /api.php?action=categories&lang=en
if ($action === 'categories') {
    $rows = query($pdo, "
        SELECT c.code, c.icon, c.color, ct.label
        FROM categories c
        JOIN category_translations ct ON ct.code = c.code AND ct.lang = ?
        ORDER BY c.code
    ", [$lang]);
    ok($rows);
}

// GET /api.php?action=courses&lang=en[&category=MNT]
if ($action === 'courses') {
    $params = [$lang];
    $where  = '';
    if (!empty($_GET['category'])) {
        $where = 'AND c.category_code = ?';
        $params[] = $_GET['category'];
    }

    $rows = query($pdo, "
        SELECT
            c.id,
            c.course_code,
            c.slug,
            c.category_code,
            c.price,
            c.badge,
            c.badge_class,
            c.image,
            ct.title,
            ct.short_desc,
            ct.duration_label  AS duration,
            ct.capacity_label  AS capacity,
            cat.label          AS category_label
        FROM courses c
        JOIN course_translations ct ON ct.course_id = c.id AND ct.lang = ?
        LEFT JOIN category_translations cat ON cat.code = c.category_code AND cat.lang = ?
        WHERE 1=1 $where
        ORDER BY c.course_code
    ", array_merge([$lang, $lang], !empty($_GET['category']) ? [$_GET['category']] : []));

    ok($rows);
}

// GET /api.php?action=course&lang=en&slug=bolt-nut-tightening-techniques
if ($action === 'course') {
    $slug = $_GET['slug'] ?? '';
    if (!$slug) fail('slug required', 400);

    $course = queryOne($pdo, "
        SELECT
            c.id, c.course_code, c.slug, c.category_code,
            c.price, c.badge, c.badge_class, c.image,
            ct.title, ct.short_desc, ct.description,
            ct.duration_label AS duration, ct.capacity_label AS capacity,
            cat.label AS category_label
        FROM courses c
        JOIN course_translations ct ON ct.course_id = c.id AND ct.lang = ?
        LEFT JOIN category_translations cat ON cat.code = c.category_code AND cat.lang = ?
        WHERE c.slug = ?
    ", [$lang, $lang, $slug]);

    if (!$course) fail('Course not found');

    $id = $course['id'];

    // Objectives
    $course['objectives'] = array_column(query($pdo, "
        SELECT cot.objective
        FROM course_objectives co
        JOIN course_objective_translations cot ON cot.objective_id = co.id AND cot.lang = ?
        WHERE co.course_id = ?
        ORDER BY co.sort_order
    ", [$lang, $id]), 'objective');

    // Target groups
    $course['target_groups'] = array_column(query($pdo, "
        SELECT tgt.target_group
        FROM course_target_groups tg
        JOIN course_target_group_translations tgt ON tgt.target_group_id = tg.id AND tgt.lang = ?
        WHERE tg.course_id = ?
        ORDER BY tg.sort_order
    ", [$lang, $id]), 'target_group');

    // Topics + items
    $topics_raw = query($pdo, "
        SELECT ct2.id AS topic_id, ctt.title AS topic_title, ct2.sort_order AS topic_sort
        FROM course_topics ct2
        JOIN course_topic_translations ctt ON ctt.topic_id = ct2.id AND ctt.lang = ?
        WHERE ct2.course_id = ?
        ORDER BY ct2.sort_order
    ", [$lang, $id]);

    $topics = [];
    foreach ($topics_raw as $t) {
        $items = array_column(query($pdo, "
            SELECT citt.item
            FROM course_topic_items cti
            JOIN course_topic_item_translations citt ON citt.item_id = cti.id AND citt.lang = ?
            WHERE cti.topic_id = ?
            ORDER BY cti.sort_order
        ", [$lang, $t['topic_id']]), 'item');
        $topics[] = ['title' => $t['topic_title'], 'items' => $items];
    }
    $course['topics'] = $topics;

    // Schedules + activities
    $scheds_raw = query($pdo, "
        SELECT id AS schedule_id, time_range, sort_order
        FROM course_schedules
        WHERE course_id = ?
        ORDER BY sort_order
    ", [$id]);

    $schedules = [];
    foreach ($scheds_raw as $s) {
        $activities = array_column(query($pdo, "
            SELECT csat.activity
            FROM course_schedule_activities csa
            JOIN course_schedule_activity_translations csat ON csat.activity_id = csa.id AND csat.lang = ?
            WHERE csa.schedule_id = ?
            ORDER BY csa.sort_order
        ", [$lang, $s['schedule_id']]), 'activity');
        $schedules[] = ['time_range' => $s['time_range'], 'activities' => $activities];
    }
    $course['schedules'] = $schedules;

    // Training methods
    $course['training_methods'] = array_column(query($pdo, "
        SELECT cmt.method
        FROM course_training_methods cm
        JOIN course_training_method_translations cmt ON cmt.method_id = cm.id AND cmt.lang = ?
        WHERE cm.course_id = ?
        ORDER BY cm.sort_order
    ", [$lang, $id]), 'method');

    // Equipment
    $course['equipment'] = array_column(query($pdo, "
        SELECT cet.equipment
        FROM course_equipments ce
        JOIN course_equipment_translations cet ON cet.equipment_id = ce.id AND cet.lang = ?
        WHERE ce.course_id = ?
        ORDER BY ce.sort_order
    ", [$lang, $id]), 'equipment');

    // Notes
    $course['notes'] = array_column(query($pdo, "
        SELECT cnt.note
        FROM course_notes cn
        JOIN course_note_translations cnt ON cnt.note_id = cn.id AND cnt.lang = ?
        WHERE cn.course_id = ?
        ORDER BY cn.sort_order
    ", [$lang, $id]), 'note');

    ok($course);
}

// GET /api.php?action=news&lang=en
if ($action === 'news') {
    $rows = query($pdo, "
        SELECT
            n.id, n.cover_image, n.created_at,
            nt.title, nt.short_desc, nt.event_date_text, nt.location
        FROM news n
        JOIN news_translations nt ON nt.news_id = n.id AND nt.lang = ?
        ORDER BY n.created_at DESC
    ", [$lang]);

    // Attach tags
    foreach ($rows as &$row) {
        $row['tags'] = array_column(query($pdo, "
            SELECT ntt.tag
            FROM news_tags ntag
            JOIN news_tag_translations ntt ON ntt.tag_id = ntag.id AND ntt.lang = ?
            WHERE ntag.news_id = ?
        ", [$lang, $row['id']]), 'tag');
    }
    ok($rows);
}

// GET /api.php?action=news_detail&lang=en&id=1
if ($action === 'news_detail') {
    $id = (int)($_GET['id'] ?? 0);
    if (!$id) fail('id required', 400);

    $article = queryOne($pdo, "
        SELECT n.id, n.cover_image, n.created_at,
               nt.title, nt.short_desc, nt.event_date_text, nt.location, nt.full_description
        FROM news n
        JOIN news_translations nt ON nt.news_id = n.id AND nt.lang = ?
        WHERE n.id = ?
    ", [$lang, $id]);

    if (!$article) fail('Article not found');

    $article['images'] = array_column(query($pdo, "
        SELECT image_url FROM news_images WHERE news_id = ? ORDER BY sort_order
    ", [$id]), 'image_url');

    $article['tags'] = array_column(query($pdo, "
        SELECT ntt.tag
        FROM news_tags ntag
        JOIN news_tag_translations ntt ON ntt.tag_id = ntag.id AND ntt.lang = ?
        WHERE ntag.news_id = ?
    ", [$lang, $id]), 'tag');

    ok($article);
}

// GET /api.php?action=members&q=name&cert=CATII
if ($action === 'members') {
    $q    = trim($_GET['q'] ?? '');
    $cert = trim($_GET['cert'] ?? '');

    $params = [];
    $where  = ['1=1'];

    if ($q !== '') {
        $where[]  = '(m.first_name LIKE ? OR m.last_name LIKE ? OR m.email LIKE ? OR m.member_no LIKE ?)';
        $like = "%$q%";
        array_push($params, $like, $like, $like, $like);
    }
    if ($cert !== '') {
        $where[]  = 'EXISTS (SELECT 1 FROM member_certifications mc WHERE mc.member_id = m.id AND mc.cert_code = ?)';
        $params[] = $cert;
    }

    $sql = "
        SELECT m.id, m.first_name, m.last_name, m.company, m.email, m.level_text, m.member_no,
               GROUP_CONCAT(mc.cert_code ORDER BY mc.cert_code SEPARATOR ',') AS certifications
        FROM members m
        LEFT JOIN member_certifications mc ON mc.member_id = m.id
        WHERE " . implode(' AND ', $where) . "
        GROUP BY m.id
        ORDER BY m.last_name, m.first_name
    ";

    ok(query($pdo, $sql, $params));
}

fail('Unknown action', 400);