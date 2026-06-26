<?php
/**
 * GET /api/news.php       -> รายการข่าว/สัมมนาทั้งหมด
 * GET /api/news.php?id=1  -> รายละเอียดข่าวเต็ม (รวม images[] และ fullDescription)
 */
header('Content-Type: application/json; charset=utf-8');
require_once __DIR__ . '/../config/db.php';

$pdo = getPDO();
$id  = isset($_GET['id']) ? (int)$_GET['id'] : null;

if ($id) {
    $stmt = $pdo->prepare(
        "SELECT id, title, short_desc AS shortDesc, cover_image AS image,
                event_date_text AS date, location, full_description AS fullDescription
         FROM news WHERE id = ?"
    );
    $stmt->execute([$id]);
    $news = $stmt->fetch();

    if (!$news) {
        http_response_code(404);
        echo json_encode(['error' => 'News not found']);
        exit;
    }

    $s = $pdo->prepare("SELECT image_url FROM news_images WHERE news_id=? ORDER BY sort_order");
    $s->execute([$id]);
    $news['images'] = array_column($s->fetchAll(), 'image_url');

    $s = $pdo->prepare("SELECT tag FROM news_tags WHERE news_id=?");
    $s->execute([$id]);
    $news['tags'] = array_column($s->fetchAll(), 'tag');

    echo json_encode($news, JSON_UNESCAPED_UNICODE);
    exit;
}

// ----- list mode -----
$stmt = $pdo->query(
    "SELECT id, title, short_desc AS shortDesc, cover_image AS image,
            event_date_text AS date, location
     FROM news ORDER BY id DESC"
);
$list = $stmt->fetchAll();

foreach ($list as &$n) {
    $s = $pdo->prepare("SELECT tag FROM news_tags WHERE news_id=?");
    $s->execute([$n['id']]);
    $n['tags'] = array_column($s->fetchAll(), 'tag');
}
unset($n);

echo json_encode($list, JSON_UNESCAPED_UNICODE);
