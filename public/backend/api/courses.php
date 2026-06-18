<?php
/**
 * GET /api/courses.php                -> รายการคอร์สทั้งหมด (สำหรับ Courses.vue)
 * GET /api/courses.php?category=MNT   -> filter ตามหมวด
 * GET /api/courses.php?slug=xxx       -> รายละเอียดคอร์สเต็ม (สำหรับ CourseDetail.vue / detail.vue)
 */
header('Content-Type: application/json; charset=utf-8');
require_once __DIR__ . '/../config/db.php';

$pdo      = getPDO();
$slug     = isset($_GET['slug']) ? $_GET['slug'] : null;
$category = isset($_GET['category']) ? $_GET['category'] : null;

if ($slug) {
    $stmt = $pdo->prepare(
        "SELECT c.id, c.course_code AS courseCode, c.slug, c.title, c.english_title AS englishTitle,
                c.short_desc AS `desc`, c.description, c.category_code AS category,
                c.duration, c.capacity, c.price, c.badge, c.badge_class AS badgeClass, c.image,
                cat.label AS categoryLabel, cat.icon AS categoryIcon, cat.color AS categoryColor
         FROM courses c LEFT JOIN categories cat ON c.category_code = cat.code
         WHERE c.slug = ?"
    );
    $stmt->execute([$slug]);
    $course = $stmt->fetch();

    if (!$course) {
        http_response_code(404);
        echo json_encode(['error' => 'Course not found']);
        exit;
    }

    $id = $course['id'];

    $s = $pdo->prepare("SELECT objective FROM course_objectives WHERE course_id=? ORDER BY sort_order");
    $s->execute([$id]);
    $course['objectives'] = array_column($s->fetchAll(), 'objective');

    $s = $pdo->prepare("SELECT target_group FROM course_target_groups WHERE course_id=? ORDER BY sort_order");
    $s->execute([$id]);
    $course['targetGroups'] = array_column($s->fetchAll(), 'target_group');

    $s = $pdo->prepare("SELECT id, title FROM course_topics WHERE course_id=? ORDER BY sort_order");
    $s->execute([$id]);
    $topics = $s->fetchAll();
    foreach ($topics as &$topic) {
        $si = $pdo->prepare("SELECT item FROM course_topic_items WHERE topic_id=? ORDER BY sort_order");
        $si->execute([$topic['id']]);
        $topic['items'] = array_column($si->fetchAll(), 'item');
        unset($topic['id']);
    }
    unset($topic);
    $course['topics'] = $topics;

    $s = $pdo->prepare("SELECT id, time_range AS time FROM course_schedules WHERE course_id=? ORDER BY sort_order");
    $s->execute([$id]);
    $schedules = $s->fetchAll();
    foreach ($schedules as &$sch) {
        $sa = $pdo->prepare("SELECT activity FROM course_schedule_activities WHERE schedule_id=? ORDER BY sort_order");
        $sa->execute([$sch['id']]);
        $sch['activities'] = array_column($sa->fetchAll(), 'activity');
        unset($sch['id']);
    }
    unset($sch);
    $course['schedules'] = $schedules;

    $s = $pdo->prepare("SELECT method FROM course_training_methods WHERE course_id=? ORDER BY sort_order");
    $s->execute([$id]);
    $course['trainingMethod'] = array_column($s->fetchAll(), 'method');

    $s = $pdo->prepare("SELECT equipment FROM course_equipments WHERE course_id=? ORDER BY sort_order");
    $s->execute([$id]);
    $course['equipments'] = array_column($s->fetchAll(), 'equipment');

    $s = $pdo->prepare("SELECT note FROM course_notes WHERE course_id=? ORDER BY sort_order");
    $s->execute([$id]);
    $course['notes'] = array_column($s->fetchAll(), 'note');

    echo json_encode($course, JSON_UNESCAPED_UNICODE);
    exit;
}

// ----- list mode -----
$sql = "SELECT c.id, c.course_code AS courseCode, c.slug, c.title, c.english_title AS englishTitle,
               c.short_desc AS `desc`, c.category_code AS category, c.duration, c.capacity, c.price,
               c.badge, c.badge_class AS badgeClass, c.image,
               cat.label AS categoryLabel, cat.icon AS categoryIcon, cat.color AS categoryColor
        FROM courses c LEFT JOIN categories cat ON c.category_code = cat.code";
$params = [];
if ($category) {
    $sql .= " WHERE c.category_code = ?";
    $params[] = $category;
}
$sql .= " ORDER BY c.id";

$stmt = $pdo->prepare($sql);
$stmt->execute($params);
echo json_encode($stmt->fetchAll(), JSON_UNESCAPED_UNICODE);
