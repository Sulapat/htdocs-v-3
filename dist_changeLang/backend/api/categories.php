<?php
/**
 * GET /api/categories.php
 * ส่งคืนรายการหมวดหมู่ทั้งหมด (เดิมคือ categoryConfig.js)
 */
ini_set('display_errors', 1);
error_reporting(E_ALL);
header('Content-Type: application/json; charset=utf-8');
require_once __DIR__ . '/../config/db.php';

$pdo = getPDO();
$stmt = $pdo->query("SELECT code, label, icon, color FROM categories ORDER BY code");
echo json_encode($stmt->fetchAll(), JSON_UNESCAPED_UNICODE);
