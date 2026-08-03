<?php
/**
 * ไฟล์นี้ถูก handle ผ่าน api_i18n.php (action=course)
 * แต่ถ้าใช้ courses.php ตรงๆ ก็รองรับ ?slug=xxx&lang=th|en
 *
 * GET /api/courses.php?slug=xxx&lang=th  -> TH (ตารางหลัก)
 * GET /api/courses.php?slug=xxx&lang=en  -> EN (LEFT JOIN _en, COALESCE fallback TH)
 * GET /api/courses.php?lang=th           -> list ทั้งหมด
 * GET /api/courses.php?category=MNT&lang=en -> list filter หมวด EN
 */
header('Content-Type: application/json; charset=utf-8');
require_once __DIR__ . '/../config/db.php';

$pdo      = getPDO();
$slug     = $_GET['slug']     ?? null;
$category = $_GET['category'] ?? null;
$lang     = $_GET['lang']     ?? 'th';   // ← รับ lang param

$isEN = ($lang === 'en');

// ══════════════════════════════════════════════════════════
//  DETAIL MODE  (slug ระบุ)
// ══════════════════════════════════════════════════════════
if ($slug) {

    if ($isEN) {
        // JOIN courses_en → COALESCE(EN, TH) ทุก field ที่แปลได้
        $stmt = $pdo->prepare("
            SELECT
                c.id,
                c.course_code           AS courseCode,
                c.slug,
                COALESCE(ce.title,          c.title)         AS title,
                COALESCE(ce.english_title,  c.english_title) AS englishTitle,
                COALESCE(ce.short_desc,     c.short_desc)    AS `desc`,
                COALESCE(ce.description,    c.description)   AS description,
                c.category_code         AS category,
                COALESCE(ce.duration,       c.duration)      AS duration,
                COALESCE(ce.capacity,       c.capacity)      AS capacity,
                c.price,
                COALESCE(ce.badge,          c.badge)         AS badge,
                c.badge_class           AS badgeClass,
                c.image,
                COALESCE(cate.label,        cat.label)       AS categoryLabel,
                cat.icon                AS categoryIcon,
                cat.color               AS categoryColor
            FROM courses c
            LEFT JOIN courses_en        ce   ON ce.course_id  = c.id
            LEFT JOIN categories        cat  ON cat.code       = c.category_code
            LEFT JOIN categories_en     cate ON cate.category_id = cat.id
            WHERE c.slug = ?
        ");
    } else {
        $stmt = $pdo->prepare("
            SELECT
                c.id,
                c.course_code           AS courseCode,
                c.slug,
                c.title,
                c.english_title         AS englishTitle,
                c.short_desc            AS `desc`,
                c.description,
                c.category_code         AS category,
                c.duration,
                c.capacity,
                c.price,
                c.badge,
                c.badge_class           AS badgeClass,
                c.image,
                cat.label               AS categoryLabel,
                cat.icon                AS categoryIcon,
                cat.color               AS categoryColor
            FROM courses c
            LEFT JOIN categories cat ON cat.code = c.category_code
            WHERE c.slug = ?
        ");
    }

    $stmt->execute([$slug]);
    $course = $stmt->fetch();

    if (!$course) {
        http_response_code(404);
        echo json_encode(['error' => 'Course not found']);
        exit;
    }

    $id = $course['id'];

    // ── objectives ──────────────────────────────────────────
    if ($isEN) {
        $s = $pdo->prepare("
            SELECT COALESCE(oe.objective, o.objective) AS objective
            FROM course_objectives o
            LEFT JOIN course_objectives_en oe ON oe.objective_id = o.id
            WHERE o.course_id = ? ORDER BY o.sort_order
        ");
    } else {
        $s = $pdo->prepare("SELECT objective FROM course_objectives WHERE course_id=? ORDER BY sort_order");
    }
    $s->execute([$id]);
    $course['objectives'] = array_column($s->fetchAll(), 'objective');

    // ── target groups ────────────────────────────────────────
    if ($isEN) {
        $s = $pdo->prepare("
            SELECT COALESCE(te.target_group, t.target_group) AS target_group
            FROM course_target_groups t
            LEFT JOIN course_target_groups_en te ON te.target_group_id = t.id
            WHERE t.course_id = ? ORDER BY t.sort_order
        ");
    } else {
        $s = $pdo->prepare("SELECT target_group FROM course_target_groups WHERE course_id=? ORDER BY sort_order");
    }
    $s->execute([$id]);
    $course['targetGroups'] = array_column($s->fetchAll(), 'target_group');

    // ── topics + items ───────────────────────────────────────
    if ($isEN) {
        $s = $pdo->prepare("
            SELECT t.id, COALESCE(te.title, t.title) AS title
            FROM course_topics t
            LEFT JOIN course_topics_en te ON te.topic_id = t.id
            WHERE t.course_id = ? ORDER BY t.sort_order
        ");
    } else {
        $s = $pdo->prepare("SELECT id, title FROM course_topics WHERE course_id=? ORDER BY sort_order");
    }
    $s->execute([$id]);
    $topics = $s->fetchAll();

    foreach ($topics as &$topic) {
        if ($isEN) {
            $si = $pdo->prepare("
                SELECT COALESCE(ie.item, i.item) AS item
                FROM course_topic_items i
                LEFT JOIN course_topic_items_en ie ON ie.item_id = i.id
                WHERE i.topic_id = ? ORDER BY i.sort_order
            ");
        } else {
            $si = $pdo->prepare("SELECT item FROM course_topic_items WHERE topic_id=? ORDER BY sort_order");
        }
        $si->execute([$topic['id']]);
        $topic['items'] = array_column($si->fetchAll(), 'item');
        unset($topic['id']);
    }
    unset($topic);
    $course['topics'] = $topics;

    // ── schedules + activities ───────────────────────────────
    $s = $pdo->prepare("SELECT id, time_range AS time FROM course_schedules WHERE course_id=? ORDER BY sort_order");
    $s->execute([$id]);
    $schedules = $s->fetchAll();

    foreach ($schedules as &$sch) {
        if ($isEN) {
            $sa = $pdo->prepare("
                SELECT COALESCE(ae.activity, a.activity) AS activity
                FROM course_schedule_activities a
                LEFT JOIN course_schedule_activities_en ae ON ae.activity_id = a.id
                WHERE a.schedule_id = ? ORDER BY a.sort_order
            ");
        } else {
            $sa = $pdo->prepare("SELECT activity FROM course_schedule_activities WHERE schedule_id=? ORDER BY sort_order");
        }
        $sa->execute([$sch['id']]);
        $sch['activities'] = array_column($sa->fetchAll(), 'activity');
        unset($sch['id']);
    }
    unset($sch);
    $course['schedules'] = $schedules;

    // ── training methods ─────────────────────────────────────
    if ($isEN) {
        $s = $pdo->prepare("
            SELECT COALESCE(me.method, m.method) AS method
            FROM course_training_methods m
            LEFT JOIN course_training_methods_en me ON me.method_id = m.id
            WHERE m.course_id = ? ORDER BY m.sort_order
        ");
    } else {
        $s = $pdo->prepare("SELECT method FROM course_training_methods WHERE course_id=? ORDER BY sort_order");
    }
    $s->execute([$id]);
    $course['trainingMethod'] = array_column($s->fetchAll(), 'method');

    // ── equipments ───────────────────────────────────────────
    if ($isEN) {
        $s = $pdo->prepare("
            SELECT COALESCE(ee.equipment, e.equipment) AS equipment
            FROM course_equipments e
            LEFT JOIN course_equipments_en ee ON ee.equipment_id = e.id
            WHERE e.course_id = ? ORDER BY e.sort_order
        ");
    } else {
        $s = $pdo->prepare("SELECT equipment FROM course_equipments WHERE course_id=? ORDER BY sort_order");
    }
    $s->execute([$id]);
    $course['equipments'] = array_column($s->fetchAll(), 'equipment');

    // ── notes ────────────────────────────────────────────────
    if ($isEN) {
        $s = $pdo->prepare("
            SELECT COALESCE(ne.note, n.note) AS note
            FROM course_notes n
            LEFT JOIN course_notes_en ne ON ne.note_id = n.id
            WHERE n.course_id = ? ORDER BY n.sort_order
        ");
    } else {
        $s = $pdo->prepare("SELECT note FROM course_notes WHERE course_id=? ORDER BY sort_order");
    }
    $s->execute([$id]);
    $course['notes'] = array_column($s->fetchAll(), 'note');

    echo json_encode($course, JSON_UNESCAPED_UNICODE);
    exit;
}

// ══════════════════════════════════════════════════════════
//  LIST MODE
// ══════════════════════════════════════════════════════════
if ($isEN) {
    $sql = "
        SELECT
            c.id,
            c.course_code           AS courseCode,
            c.slug,
            COALESCE(ce.title,       c.title)      AS title,
            COALESCE(ce.short_desc,  c.short_desc) AS `desc`,
            c.category_code         AS category,
            COALESCE(ce.duration,    c.duration)   AS duration,
            COALESCE(ce.capacity,    c.capacity)   AS capacity,
            c.price,
            COALESCE(ce.badge,       c.badge)      AS badge,
            c.badge_class           AS badgeClass,
            c.image,
            COALESCE(cate.label,     cat.label)    AS categoryLabel,
            cat.icon                AS categoryIcon,
            cat.color               AS categoryColor
        FROM courses c
        LEFT JOIN courses_en    ce   ON ce.course_id    = c.id
        LEFT JOIN categories    cat  ON cat.code         = c.category_code
        LEFT JOIN categories_en cate ON cate.category_id = cat.id
    ";
} else {
    $sql = "
        SELECT
            c.id,
            c.course_code  AS courseCode,
            c.slug,
            c.title,
            c.short_desc   AS `desc`,
            c.category_code AS category,
            c.duration,
            c.capacity,
            c.price,
            c.badge,
            c.badge_class  AS badgeClass,
            c.image,
            cat.label      AS categoryLabel,
            cat.icon       AS categoryIcon,
            cat.color      AS categoryColor
        FROM courses c
        LEFT JOIN categories cat ON cat.code = c.category_code
    ";
}

$params = [];
if ($category) {
    $sql .= " WHERE c.category_code = ?";
    $params[] = $category;
}
$sql .= " ORDER BY c.id";

$stmt = $pdo->prepare($sql);
$stmt->execute($params);
echo json_encode($stmt->fetchAll(), JSON_UNESCAPED_UNICODE);