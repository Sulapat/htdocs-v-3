-- ═══════════════════════════════════════════════════════════════
-- Migration: article_view_logs
-- ใช้เก็บ log การเข้าชมบทความ เพื่อกันการนับยอดวิวซ้ำ
-- (จาก IP เดียวกัน ภายในช่วง cooldown 30 นาที — ดู registerArticleView() ใน api_i18n.php)
-- ═══════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS article_view_logs (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    article_id  INT NOT NULL,
    ip_hash     VARCHAR(64) NOT NULL,   -- sha256(ip + salt) ไม่เก็บ IP ดิบเพื่อความเป็นส่วนตัว
    viewed_at   DATETIME NOT NULL,

    KEY idx_article_ip_time (article_id, ip_hash, viewed_at),

    CONSTRAINT fk_article_view_logs_article
        FOREIGN KEY (article_id) REFERENCES articles(id)
        ON DELETE CASCADE
);

-- (ทางเลือก) ถ้าตารางจะโตเร็วและอยากลบ log เก่าอัตโนมัติ
-- สามารถตั้ง cron/event ลบ log ที่เก่ากว่า 24 ชม. ได้ เพราะเก็บไว้แค่กันซ้ำระยะสั้นเท่านั้น
-- ตัวอย่าง event scheduler (ต้องเปิด event_scheduler = ON ที่ MySQL ก่อน):
--
-- CREATE EVENT IF NOT EXISTS cleanup_article_view_logs
-- ON SCHEDULE EVERY 1 DAY
-- DO
--   DELETE FROM article_view_logs WHERE viewed_at < (NOW() - INTERVAL 1 DAY);
