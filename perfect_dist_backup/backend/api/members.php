<?php
/**
 * GET /api/members.php                 -> รายชื่อสมาชิกทั้งหมด (เดิมคือ sampleData)
 * GET /api/members.php?filter=CATII    -> filter ตาม cert code (CATII, CATIII, CATIV, BMV)
 * GET /api/members.php?stats=1         -> คืนค่าจำนวนแยกตามประเภท (เดิมคือ countByCourse)
 */
header('Content-Type: application/json; charset=utf-8');
require_once __DIR__ . '/../config/db.php';

$pdo    = getPDO();
$filter = isset($_GET['filter']) ? $_GET['filter'] : null;
$stats  = isset($_GET['stats']);

if ($stats) {
    $codes = ['CATII', 'CATIII', 'CATIV', 'BMV'];
    $result = [];
    foreach ($codes as $code) {
        $s = $pdo->prepare("SELECT COUNT(*) AS cnt FROM member_certifications WHERE cert_code = ?");
        $s->execute([$code]);
        $result[$code] = (int)$s->fetch()['cnt'];
    }
    echo json_encode($result, JSON_UNESCAPED_UNICODE);
    exit;
}

if ($filter) {
    $stmt = $pdo->prepare(
        "SELECT m.id AS `ID`, m.first_name AS `First Name`, m.last_name AS `Last Name`,
                m.company AS `Company`, m.email AS `Mail`, m.level_text AS `Level`, m.member_no AS `Member`
         FROM members m
         INNER JOIN member_certifications mc ON mc.member_id = m.id
         WHERE mc.cert_code = ?
         ORDER BY m.id"
    );
    $stmt->execute([$filter]);
    echo json_encode($stmt->fetchAll(), JSON_UNESCAPED_UNICODE);
    exit;
}

$stmt = $pdo->query(
    "SELECT id AS `ID`, first_name AS `First Name`, last_name AS `Last Name`,
            company AS `Company`, email AS `Mail`, level_text AS `Level`, member_no AS `Member`
     FROM members ORDER BY id"
);
echo json_encode($stmt->fetchAll(), JSON_UNESCAPED_UNICODE);
