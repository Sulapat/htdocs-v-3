# Backend สำหรับเชื่อม Vue กับ MySQL (ผ่าน phpMyAdmin)

โครงสร้างนี้แปลงข้อมูล static จาก `coursesdetail.js`, `newsData.js`, `categoryConfig.js`, `sampledata.js`
ให้กลายเป็นฐานข้อมูล MySQL จริง พร้อม PHP API ให้ฝั่ง Vue เรียกใช้

**ทดสอบแล้วจริงกับ MySQL/MariaDB + PHP 8.3**: import schema → import ข้อมูล (53 คอร์ส, 8 ข่าว, 15 สมาชิก) →
เรียก API ทุกตัวได้ผลลัพธ์ถูกต้อง 100%

```
backend/
├── sql/
│   ├── schema.sql       ← สร้างตาราง (รันก่อน)
│   └── seed_data.sql    ← ข้อมูลจริงทั้งหมดที่แปลงมาจาก .js เดิม (รันหลัง schema.sql)
├── config/
│   └── db.sample.php    ← คัดลอกเป็น db.php แล้วกรอกรหัสผ่านจริง
└── api/
    ├── categories.php
    ├── courses.php
    ├── news.php
    └── members.php
```

## ขั้นตอนที่ 1 — สิ่งที่ต้องถามแอดมิน/ฝ่าย IT

ส่งข้อความนี้ให้แอดมินที่ดูแล server/phpMyAdmin ของบริษัท:

> รบกวนสอบถามครับ
> 1. Server นี้รองรับการรัน PHP หรือไม่ (เวอร์ชันอะไร) และมีวิธีอัปโหลดไฟล์ PHP ขึ้นไปอย่างไร (cPanel File Manager / FTP / git)
> 2. ขอ host, ชื่อฐานข้อมูล, username, password สำหรับเชื่อมต่อ MySQL (หรือถ้าให้ผมสร้างฐานข้อมูลเองใน phpMyAdmin ได้ ก็ไม่ต้องขอ)
> 3. โดเมน/URL ที่จะใช้ deploy เว็บ Vue และ backend PHP (อยู่โดเมนเดียวกัน)

**ถ้า server ไม่รองรับ PHP** (เช่นเป็น static hosting เท่านั้น) ต้องเปลี่ยนแผนเป็นใช้ Node.js backend แทน
หรือใช้บริการ BaaS — กลับมาบอกผมได้ ผมจะปรับ API ให้เป็น Node.js/Express แทน

## ขั้นตอนที่ 2 — สร้างฐานข้อมูลและ import

1. เข้า phpMyAdmin ของบริษัท → สร้างฐานข้อมูลใหม่ (เลือก Collation เป็น `utf8mb4_unicode_ci` เพื่อรองรับภาษาไทย)
2. เลือกฐานข้อมูลที่สร้าง → แท็บ **Import** → เลือกไฟล์ `sql/schema.sql` → กด Go
3. ทำซ้ำ แท็บ **Import** อีกครั้ง → เลือกไฟล์ `sql/seed_data.sql` → กด Go
4. ตรวจสอบ: ไปที่แท็บ Browse ของตาราง `courses` ควรเห็น 53 แถว, `news` เห็น 8 แถว, `members` เห็น 15 แถว

## ขั้นตอนที่ 3 — ตั้งค่าและอัปโหลด PHP backend

1. คัดลอก `config/db.sample.php` เป็น `config/db.php`
2. แก้ค่า `DB_HOST`, `DB_NAME`, `DB_USER`, `DB_PASS` ให้ตรงกับที่ IT ให้มา (ปกติ `DB_HOST` เป็น `localhost`
   เพราะ PHP กับ MySQL อยู่เครื่องเดียวกัน)
3. อัปโหลดทั้งโฟลเดอร์ `backend/` (config, api, sql) ขึ้น server ผ่าน FTP/cPanel File Manager
   — แนะนำวางไว้นอก public root เช่น `public_html/backend/` หรือถ้าไม่มีสิทธิ์เลือก path ก็วางตามที่ IT กำหนด
4. ทดสอบเปิดเบราว์เซอร์ไปที่ `https://โดเมนของนาย/backend/api/categories.php`
   ถ้าเห็น JSON ของหมวดหมู่ทั้ง 7 หมวด แสดงว่าเชื่อมต่อสำเร็จ

## ขั้นตอนที่ 4 — แก้ฝั่ง Vue ให้เรียก API จริง

ดูตัวอย่างที่ `frontend-example/src/services/api.js` และ `frontend-example/EXAMPLE_USAGE.md`
แนวคิดคือเปลี่ยนจาก

```js
import { courses } from './data/coursesdetail.js'
```

เป็น

```js
import { getCourses } from '@/services/api.js'
const courses = await getCourses()
```

หลักการเดียวกันใช้กับ news และ members

## ความปลอดภัย

- ห้าม commit ไฟล์ `config/db.php` ขึ้น git (ใส่ใน `.gitignore`)
- เวอร์ชันนี้เป็น API แบบอ่านอย่างเดียว (GET) ยังไม่มี endpoint สำหรับเพิ่ม/แก้/ลบข้อมูลจากฝั่งเว็บ
  ถ้าต้องการหน้า Admin สำหรับจัดการคอร์ส/ข่าวในอนาคต บอกได้ จะเพิ่ม endpoint POST/PUT/DELETE
  พร้อมระบบ login ป้องกันให้

## หมายเหตุเรื่อง Clients.vue และ Portfolio.vue

ยังไม่ได้ออกแบบตารางให้ส่วนนี้ เพราะยังไม่เห็นไฟล์ข้อมูล/โค้ดที่ใช้อยู่ ส่งไฟล์ `Clients.vue` และ
`Portfolio.vue` มาเพิ่มได้ จะออกแบบตารางและ API ให้ครบ
