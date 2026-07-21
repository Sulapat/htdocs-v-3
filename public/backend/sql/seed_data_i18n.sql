-- =====================================================
-- Seed data — i18n version (TH + EN)
-- Run AFTER schema_i18n.sql
-- =====================================================
SET NAMES utf8mb4;

-- categories
INSERT INTO categories (code, icon, color) VALUES ('MNT', 'fas fa-wrench', '#3b82f6');
INSERT INTO category_translations (code, lang, label) VALUES ('MNT', 'th', 'Maintenance');
INSERT INTO category_translations (code, lang, label) VALUES ('MNT', 'en', 'Maintenance');
INSERT INTO categories (code, icon, color) VALUES ('TPM', 'fas fa-cogs', '#8b5cf6');
INSERT INTO category_translations (code, lang, label) VALUES ('TPM', 'th', 'Total Productive');
INSERT INTO category_translations (code, lang, label) VALUES ('TPM', 'en', 'Total Productive Maintenance');
INSERT INTO categories (code, icon, color) VALUES ('SYS', 'fas fa-sitemap', '#06b6d4');
INSERT INTO category_translations (code, lang, label) VALUES ('SYS', 'th', 'System Management');
INSERT INTO category_translations (code, lang, label) VALUES ('SYS', 'en', 'System Management');
INSERT INTO categories (code, icon, color) VALUES ('MST', 'fas fa-ruler-combined', '#f59e0b');
INSERT INTO category_translations (code, lang, label) VALUES ('MST', 'th', 'Maintenance Standard');
INSERT INTO category_translations (code, lang, label) VALUES ('MST', 'en', 'Maintenance Standard');
INSERT INTO categories (code, icon, color) VALUES ('ANA', 'fas fa-chart-bar', '#10b981');
INSERT INTO category_translations (code, lang, label) VALUES ('ANA', 'th', 'Maintenance Analysis');
INSERT INTO category_translations (code, lang, label) VALUES ('ANA', 'en', 'Maintenance Analysis');
INSERT INTO categories (code, icon, color) VALUES ('IMP', 'fas fa-arrow-trend-up', '#ef4444');
INSERT INTO category_translations (code, lang, label) VALUES ('IMP', 'th', 'Focused Improvement');
INSERT INTO category_translations (code, lang, label) VALUES ('IMP', 'en', 'Focused Improvement');
INSERT INTO categories (code, icon, color) VALUES ('MRM', 'fas fa-clipboard-list', '#f97316');
INSERT INTO category_translations (code, lang, label) VALUES ('MRM', 'th', 'Maintenance');
INSERT INTO category_translations (code, lang, label) VALUES ('MRM', 'en', 'Maintenance Resource Management');

-- Course MNT001
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('MNT001', 'bolt-nut-tightening-techniques', 'MNT', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', '/images/courses/MNT001.png');
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'เทคนิคการขันยึดโบลท์และนัตอย่างถูกต้องเพื่อความเที่ยงตรง', 'หลักสูตรเพื่อพัฒนาทักษะการขันยึดโบลท์และนัตอย่างถูกต้อง ลดการขัดข้องของเครื่องจักรจากปัญหาการขันไม่แน่นหรือขันแน่นเกินไป', 'ในโรงงานอุตสาหกรรม โบลท์และนัตเป็นชิ้นส่วนพื้นฐานที่พบในแทบทุกเครื่องจักร แม้จะดูเล็กน้อย แต่ปัญหาจากโบลท์และนัตเป็นหนึ่งในสาเหตุสำคัญที่ทำให้เกิดการขัดข้องหรือหยุดชะงักของกระบวนการผลิต หลักสูตรนี้เน้นพัฒนาทักษะการขันยึดให้ถูกต้องและปลอดภัย', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Bolt and Nut Tightening Techniques', 'หลักสูตรเพื่อพัฒนาทักษะการขันยึดโบลท์และนัตอย่างถูกต้อง ลดการขัดข้องของเครื่องจักรจากปัญหาการขันไม่แน่นหรือขันแน่นเกินไป', 'ในโรงงานอุตสาหกรรม โบลท์และนัตเป็นชิ้นส่วนพื้นฐานที่พบในแทบทุกเครื่องจักร แม้จะดูเล็กน้อย แต่ปัญหาจากโบลท์และนัตเป็นหนึ่งในสาเหตุสำคัญที่ทำให้เกิดการขัดข้องหรือหยุดชะงักของกระบวนการผลิต หลักสูตรนี้เน้นพัฒนาทักษะการขันยึดให้ถูกต้องและปลอดภัย', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เสริมสร้างทักษะ ความรู้ และความเข้าใจเกี่ยวกับประเภทของโบลท์และนัต แนวทางในการเลือกใช้อย่างเหมาะสม การประกอบ และการขันยึดให้แน่นอย่างถูกต้อง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เสริมสร้างทักษะ ความรู้ และความเข้าใจเกี่ยวกับประเภทของโบลท์และนัต แนวทางในการเลือกใช้อย่างเหมาะสม การประกอบ และการขันยึดให้แน่นอย่างถูกต้อง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'พัฒนาทักษะในการขันยึดให้แน่นโดยไม่ใช้ประแจทอร์ค (Torque Wrench) อย่างถูกต้องและปลอดภัย');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'พัฒนาทักษะในการขันยึดให้แน่นโดยไม่ใช้ประแจทอร์ค (Torque Wrench) อย่างถูกต้องและปลอดภัย');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เรียนรู้วิธีการตั้งค่าแรงบิด (Torque Setting) ที่เหมาะสม และฝึกทักษะการปฏิบัติตามลำดับการขันแน่นที่ถูกต้อง ทั้งในกรณีของหน้าแปลนกลม และหน้าแปลนเหลี่ยม');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เรียนรู้วิธีการตั้งค่าแรงบิด (Torque Setting) ที่เหมาะสม และฝึกทักษะการปฏิบัติตามลำดับการขันแน่นที่ถูกต้อง ทั้งในกรณีของหน้าแปลนกลม และหน้าแปลนเหลี่ยม');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างซ่อมประกอบ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างซ่อมประกอบ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างบำรุงรักษาเครื่องจักร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างบำรุงรักษาเครื่องจักร');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ความรู้พื้นฐานเกี่ยวกับโบลท์และนัต');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ความรู้พื้นฐานเกี่ยวกับโบลท์และนัต');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้พื้นฐานเกี่ยวกับส่วนประกอบของโบลท์และนัต รวมถึงจุดที่มักเกิดการหักขาด');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้พื้นฐานเกี่ยวกับส่วนประกอบของโบลท์และนัต รวมถึงจุดที่มักเกิดการหักขาด');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'หน้าที่ของโบลท์ (Bolts) นัต (Nut) และการทำงานเพื่อความเข้าใจในทักษะการประกอบขันแน่น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'หน้าที่ของโบลท์ (Bolts) นัต (Nut) และการทำงานเพื่อความเข้าใจในทักษะการประกอบขันแน่น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'มาตรฐานของโบลท์และนัตในระบบอังกฤษ (Imperial) และระบบเมตริก (Metric)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'มาตรฐานของโบลท์และนัตในระบบอังกฤษ (Imperial) และระบบเมตริก (Metric)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วัดขนาดเส้นผ่านศูนย์กลาง ความยาว และระยะพิตช์เกลียวอย่างแม่นยำ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วัดขนาดเส้นผ่านศูนย์กลาง ความยาว และระยะพิตช์เกลียวอย่างแม่นยำ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเลือกประเภทของโบลท์และนัต');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเลือกประเภทของโบลท์และนัต');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'หน้าที่ประเภทแหวนรอง แหวนกันคลาย แหวนล็อกยึดแน่น และทักษะการล็อกแน่นกันหลวมคลาย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'หน้าที่ประเภทแหวนรอง แหวนกันคลาย แหวนล็อกยึดแน่น และทักษะการล็อกแน่นกันหลวมคลาย');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'เทคนิคและขั้นตอนการขันยึด');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'เทคนิคและขั้นตอนการขันยึด');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เทคนิคและลำดับขั้นตอนการขันยึดแน่น สำหรับฝา หน้าแปลน ท่อทรงกลม และฝาทรงสี่เหลี่ยม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เทคนิคและลำดับขั้นตอนการขันยึดแน่น สำหรับฝา หน้าแปลน ท่อทรงกลม และฝาทรงสี่เหลี่ยม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การอ่านรหัสตัวเลขและขีดบ่งชี้เกรดความแข็งแรงบนหัวโบลท์และนัต');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การอ่านรหัสตัวเลขและขีดบ่งชี้เกรดความแข็งแรงบนหัวโบลท์และนัต');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การใช้ตารางมาตรฐานแรงบิด (Torque) เพื่อเลือกค่าแรงขันที่เหมาะสมกับขนาดและเกรดของโบลท์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การใช้ตารางมาตรฐานแรงบิด (Torque) เพื่อเลือกค่าแรงขันที่เหมาะสมกับขนาดและเกรดของโบลท์');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'พื้นฐานเกี่ยวกับส่วนประกอบของโบลท์และนัต รวมถึงจุดที่มักเกิดการหักขาด');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'พื้นฐานเกี่ยวกับส่วนประกอบของโบลท์และนัต รวมถึงจุดที่มักเกิดการหักขาด');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'หน้าที่ของโบลท์ (Bolts) นัต (Nut) และการทำงาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'หน้าที่ของโบลท์ (Bolts) นัต (Nut) และการทำงาน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'มาตรฐานของโบลท์และนัตในระบบอังกฤษ (Imperial) และระบบเมตริก (Metric)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'มาตรฐานของโบลท์และนัตในระบบอังกฤษ (Imperial) และระบบเมตริก (Metric)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วัดขนาดเส้นผ่านศูนย์กลาง ความยาว และระยะพิตช์เกลียวอย่างแม่นยำ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วัดขนาดเส้นผ่านศูนย์กลาง ความยาว และระยะพิตช์เกลียวอย่างแม่นยำ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การเลือกใช้ประเภทของโบลท์และนัต');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การเลือกใช้ประเภทของโบลท์และนัต');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'หน้าที่ประเภทแหวนรอง แหวนกันคลาย แหวนล็อกยึดแน่น และทักษะการล็อกแน่นกันหลวมคลาย');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'หน้าที่ประเภทแหวนรอง แหวนกันคลาย แหวนล็อกยึดแน่น และทักษะการล็อกแน่นกันหลวมคลาย');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เทคนิคและลำดับขั้นตอนการขันยึดแน่น สำหรับฝา หน้าแปลน ท่อทรงกลม และฝาทรงสี่เหลี่ยม');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เทคนิคและลำดับขั้นตอนการขันยึดแน่น สำหรับฝา หน้าแปลน ท่อทรงกลม และฝาทรงสี่เหลี่ยม');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การอ่านรหัสตัวเลขและขีดบ่งชี้เกรดความแข็งแรงบนหัวโบลท์และนัต');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การอ่านรหัสตัวเลขและขีดบ่งชี้เกรดความแข็งแรงบนหัวโบลท์และนัต');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การใช้ตารางมาตรฐานแรงบิด (Torque) เพื่อเลือกค่าแรงขันที่เหมาะสม');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การใช้ตารางมาตรฐานแรงบิด (Torque) เพื่อเลือกค่าแรงขันที่เหมาะสม');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop) จากเครื่องจักรจำลองโรงงาน');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop) จากเครื่องจักรจำลองโรงงาน');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course MNT002
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('MNT002', 'pneumatics-fundamentals', 'MNT', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'พื้นฐานระบบนิวเมติกส์ (Pneumatics)', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะการทำงานกับระบบนิวเมติกส์ในโรงงานอุตสาหกรรม ลดความขัดข้องและเพิ่มประสิทธิภาพการผลิต', 'ระบบนิวเมติกส์เป็นระบบที่ใช้พลังงานจากลมอัดเพื่อแปลงเป็นพลังงานกล ในการใช้งานจริงมักพบปัญหาการทำงานล่าช้าหรือหยุดค้าง เนื่องจากการติดตั้งไม่ถูกต้อง การเดินท่อลมไม่เหมาะสม หรือการบำรุงรักษาที่ไม่เป็นระบบ หลักสูตรนี้เน้นให้บุคลากรสามารถวิเคราะห์ แก้ไข และป้องกันปัญหาได้อย่างมีประสิทธิภาพ', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Pneumatics Fundamentals', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะการทำงานกับระบบนิวเมติกส์ในโรงงานอุตสาหกรรม ลดความขัดข้องและเพิ่มประสิทธิภาพการผลิต', 'ระบบนิวเมติกส์เป็นระบบที่ใช้พลังงานจากลมอัดเพื่อแปลงเป็นพลังงานกล ในการใช้งานจริงมักพบปัญหาการทำงานล่าช้าหรือหยุดค้าง เนื่องจากการติดตั้งไม่ถูกต้อง การเดินท่อลมไม่เหมาะสม หรือการบำรุงรักษาที่ไม่เป็นระบบ หลักสูตรนี้เน้นให้บุคลากรสามารถวิเคราะห์ แก้ไข และป้องกันปัญหาได้อย่างมีประสิทธิภาพ', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้ ความเข้าใจระบบการทำงานด้วยลมอัด นิวเมติกส์');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้ ความเข้าใจระบบการทำงานด้วยลมอัด นิวเมติกส์');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้ ความเข้าใจการติดตั้งท่อลม อุปกรณ์ลมอัด');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้ ความเข้าใจการติดตั้งท่อลม อุปกรณ์ลมอัด');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีทักษะการวิเคราะห์ปัญหา สาเหตุ และการบำรุงรักษา');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีทักษะการวิเคราะห์ปัญหา สาเหตุ และการบำรุงรักษา');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สามารถติดตั้ง ปรับตั้ง และใช้งานอุปกรณ์ลมอัดได้อย่างถูกต้องและปลอดภัย');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สามารถติดตั้ง ปรับตั้ง และใช้งานอุปกรณ์ลมอัดได้อย่างถูกต้องและปลอดภัย');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 4);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพิ่มทักษะในการประยุกต์ใช้ระบบนิวเมติกส์ให้สอดคล้องกับกระบวนการผลิต ลดต้นทุน และเพิ่มผลผลิต');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพิ่มทักษะในการประยุกต์ใช้ระบบนิวเมติกส์ให้สอดคล้องกับกระบวนการผลิต ลดต้นทุน และเพิ่มผลผลิต');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานควบคุมและเดินเครื่องจักร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานควบคุมและเดินเครื่องจักร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างซ่อมประกอบ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างซ่อมประกอบ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างบำรุงรักษา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างบำรุงรักษา');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'หลักการและอุปกรณ์ระบบนิวเมติกส์');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'หลักการและอุปกรณ์ระบบนิวเมติกส์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'หลักการเบื้องต้นระบบนิวเมติกส์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'หลักการเบื้องต้นระบบนิวเมติกส์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การใช้งานระบบนิวเมติกส์ในอุตสาหกรรมต่างๆ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การใช้งานระบบนิวเมติกส์ในอุตสาหกรรมต่างๆ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ข้อดี-ข้อเสีย การใช้งานระบบนิวเมติกส์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ข้อดี-ข้อเสีย การใช้งานระบบนิวเมติกส์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'อุปกรณ์ การทำงาน และสัญลักษณ์ในระบบนิวเมติกส์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'อุปกรณ์ การทำงาน และสัญลักษณ์ในระบบนิวเมติกส์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเตรียมลมอัด คุณภาพลมอัด ท่อทางลมอัด');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเตรียมลมอัด คุณภาพลมอัด ท่อทางลมอัด');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ชุดบริการลมอัด (Air Service Unit): ไส้กรองลมอัด, วาล์วควบคุมความดันลม, ตัวเติมน้ำมันหล่อลื่นลมอัด');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ชุดบริการลมอัด (Air Service Unit): ไส้กรองลมอัด, วาล์วควบคุมความดันลม, ตัวเติมน้ำมันหล่อลื่นลมอัด');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'วาล์วและกระบอกสูบ และการวิเคราะห์ปัญหา');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'วาล์วและกระบอกสูบ และการวิเคราะห์ปัญหา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วาล์วควบคุมทิศทาง (Direction Control Valve): หลักการทำงาน, ชนิดของวาล์ว');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วาล์วควบคุมทิศทาง (Direction Control Valve): หลักการทำงาน, ชนิดของวาล์ว');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'กระบอกสูบลม: ชนิดของกระบอกสูบลม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'กระบอกสูบลม: ชนิดของกระบอกสูบลม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ แก้ไขปัญหาระบบ Pneumatic ด้วยตาราง Know Why Sheet');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ แก้ไขปัญหาระบบ Pneumatic ด้วยตาราง Know Why Sheet');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 10:30', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'หลักการเบื้องต้นระบบนิวเมติกส์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'หลักการเบื้องต้นระบบนิวเมติกส์');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การใช้งานระบบนิวเมติกส์ในอุตสาหกรรมต่างๆ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การใช้งานระบบนิวเมติกส์ในอุตสาหกรรมต่างๆ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ข้อดี-ข้อเสีย การใช้งานระบบนิวเมติกส์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ข้อดี-ข้อเสีย การใช้งานระบบนิวเมติกส์');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '10:45 - 12:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'อุปกรณ์ การทำงาน และสัญลักษณ์ในระบบนิวเมติกส์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'อุปกรณ์ การทำงาน และสัญลักษณ์ในระบบนิวเมติกส์');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 14:30', 2);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การเตรียมลมอัด คุณภาพลมอัด ท่อทางลมอัด');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การเตรียมลมอัด คุณภาพลมอัด ท่อทางลมอัด');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ชุดบริการลมอัด (Air Service Unit)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ชุดบริการลมอัด (Air Service Unit)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ไส้กรองลมอัด วาล์วควบคุมความดันลม ตัวเติมน้ำมันหล่อลื่นลมอัด');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ไส้กรองลมอัด วาล์วควบคุมความดันลม ตัวเติมน้ำมันหล่อลื่นลมอัด');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '14:45 - 16:00', 3);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วาล์วควบคุมทิศทาง (Direction Control Valve)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วาล์วควบคุมทิศทาง (Direction Control Valve)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'กระบอกสูบลม');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'กระบอกสูบลม');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์ แก้ไขปัญหาระบบ Pneumatic ด้วยตาราง Know Why Sheet');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์ แก้ไขปัญหาระบบ Pneumatic ด้วยตาราง Know Why Sheet');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ถาม-ตอบ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ถาม-ตอบ');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'วิเคราะห์เชิงปฏิบัติ ภาคปฏิบัติ');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'วิเคราะห์เชิงปฏิบัติ ภาคปฏิบัติ');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course MNT003
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('MNT003', 'hydraulics-fundamentals', 'MNT', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'พื้นฐานระบบไฮดรอลิก (Hydraulics)', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะการทำงานกับระบบไฮดรอลิก ลดเวลาเสียหายจากการหยุดเครื่อง และเพิ่มประสิทธิภาพของระบบในโรงงานอุตสาหกรรม', 'ในอุตสาหกรรมการผลิต ระบบไฮดรอลิกถือเป็นหัวใจสำคัญของการถ่ายทอดพลังงานและควบคุมการทำงานของเครื่องจักร หลักสูตรนี้มุ่งให้ผู้เข้าอบรมมีความรู้ความเข้าใจในหลักการทำงานของระบบไฮดรอลิก สามารถวิเคราะห์ปัญหาเบื้องต้น ตรวจสอบสาเหตุ และดูแลรักษาระบบได้อย่างถูกต้อง', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Hydraulics Fundamentals', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะการทำงานกับระบบไฮดรอลิก ลดเวลาเสียหายจากการหยุดเครื่อง และเพิ่มประสิทธิภาพของระบบในโรงงานอุตสาหกรรม', 'ในอุตสาหกรรมการผลิต ระบบไฮดรอลิกถือเป็นหัวใจสำคัญของการถ่ายทอดพลังงานและควบคุมการทำงานของเครื่องจักร หลักสูตรนี้มุ่งให้ผู้เข้าอบรมมีความรู้ความเข้าใจในหลักการทำงานของระบบไฮดรอลิก สามารถวิเคราะห์ปัญหาเบื้องต้น ตรวจสอบสาเหตุ และดูแลรักษาระบบได้อย่างถูกต้อง', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้ ความเข้าใจ และทักษะระบบการทำงานด้วยน้ำมันไฮดรอลิก (Hydraulic)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้ ความเข้าใจ และทักษะระบบการทำงานด้วยน้ำมันไฮดรอลิก (Hydraulic)');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีทักษะการติดตั้ง การปรับค่าความดันน้ำมันป้องกันความเสียหาย');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีทักษะการติดตั้ง การปรับค่าความดันน้ำมันป้องกันความเสียหาย');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีทักษะการวิเคราะห์ปัญหา สาเหตุ และการบำรุงรักษา');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีทักษะการวิเคราะห์ปัญหา สาเหตุ และการบำรุงรักษา');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างซ่อมประกอบ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างซ่อมประกอบ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานบำรุงรักษาเครื่องจักร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานบำรุงรักษาเครื่องจักร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานควบคุมเครื่องจักร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานควบคุมเครื่องจักร');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'หลักการและโครงสร้างระบบไฮดรอลิก');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'หลักการและโครงสร้างระบบไฮดรอลิก');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'หลักการพื้นฐานของระบบ Hydraulic');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'หลักการพื้นฐานของระบบ Hydraulic');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การทำงานและโครงสร้างระบบ Hydraulic เบื้องต้น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การทำงานและโครงสร้างระบบ Hydraulic เบื้องต้น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ถังพักและอุปกรณ์ประกอบถังพัก (Hydraulic reservoir)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ถังพักและอุปกรณ์ประกอบถังพัก (Hydraulic reservoir)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ปั๊มไฮดรอลิก (Hydraulic Pump)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ปั๊มไฮดรอลิก (Hydraulic Pump)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วาล์วควบคุมในระบบ Hydraulic เบื้องต้น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วาล์วควบคุมในระบบ Hydraulic เบื้องต้น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'กระบอกสูบ ซีลและอุปกรณ์ระบบท่อ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'กระบอกสูบ ซีลและอุปกรณ์ระบบท่อ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'สัญลักษณ์แทนอุปกรณ์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'สัญลักษณ์แทนอุปกรณ์');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การวิเคราะห์ปัญหาและการติดตั้ง');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การวิเคราะห์ปัญหาและการติดตั้ง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การปนเปื้อนในน้ำมันไฮดรอลิก');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การปนเปื้อนในน้ำมันไฮดรอลิก');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ปัญหาจากถังน้ำมัน ปั๊ม วาล์วควบคุม และลูกสูบ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ปัญหาจากถังน้ำมัน ปั๊ม วาล์วควบคุม และลูกสูบ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การติดตั้งท่อทางสายไฮดรอลิก');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การติดตั้งท่อทางสายไฮดรอลิก');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ แก้ไขปัญหาระบบไฮดรอลิก ด้วยตาราง Know Why Sheet');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ แก้ไขปัญหาระบบไฮดรอลิก ด้วยตาราง Know Why Sheet');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 10:30', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'หลักการพื้นฐานของระบบ Hydraulic');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'หลักการพื้นฐานของระบบ Hydraulic');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การทำงานและโครงสร้างระบบ Hydraulic เบื้องต้น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การทำงานและโครงสร้างระบบ Hydraulic เบื้องต้น');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ถังพักและอุปกรณ์ประกอบถังพัก');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ถังพักและอุปกรณ์ประกอบถังพัก');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ปั๊มไฮดรอลิก วาล์วควบคุม กระบอกสูบ ซีลและอุปกรณ์ระบบท่อ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ปั๊มไฮดรอลิก วาล์วควบคุม กระบอกสูบ ซีลและอุปกรณ์ระบบท่อ');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '10:45 - 12:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'สัญลักษณ์แทนอุปกรณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'สัญลักษณ์แทนอุปกรณ์');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การปนเปื้อนในน้ำมันไฮดรอลิกและผลเสีย');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การปนเปื้อนในน้ำมันไฮดรอลิกและผลเสีย');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 14:30', 2);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ปัญหาจากน้ำมัน ปัญหาจากปั๊ม ปัญหาจากวาล์วควบคุม ปัญหาจากลูกสูบ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ปัญหาจากน้ำมัน ปัญหาจากปั๊ม ปัญหาจากวาล์วควบคุม ปัญหาจากลูกสูบ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การติดตั้งท่อทางสายไฮดรอลิก');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การติดตั้งท่อทางสายไฮดรอลิก');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '14:45 - 16:00', 3);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์ แก้ไขปัญหาระบบ Hydraulic ด้วยตาราง Know Why Sheet');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์ แก้ไขปัญหาระบบ Hydraulic ด้วยตาราง Know Why Sheet');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ถาม-ตอบ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ถาม-ตอบ');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop) จากเครื่องจักรจำลองโรงงาน');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop) จากเครื่องจักรจำลองโรงงาน');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course MNT004
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('MNT004', 'mechanical-power-transmission-maintenance', 'MNT', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'เทคนิคการบำรุงรักษาระบบส่งกำลังทางกล', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะการบำรุงรักษาระบบส่งกำลังระหว่างมอเตอร์กับอุปกรณ์ต่างๆ ในโรงงานอุตสาหกรรม', 'ระบบส่งกำลังระหว่างมอเตอร์กับอุปกรณ์เช่น ปั๊ม เกียร์ พัดลม โบลเวอร์ และสปินเดิล มีหลายรูปแบบ ทั้งคัปปลิ้ง สายพาน และโซ่ การมีความรู้ในการเลือกใช้ บำรุงรักษา และวิเคราะห์ปัญหาอย่างถูกต้อง ช่วยลดการหยุดเครื่อง ลดต้นทุน และเพิ่มประสิทธิภาพการผลิต', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Mechanical Power Transmission Maintenance Techniques', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะการบำรุงรักษาระบบส่งกำลังระหว่างมอเตอร์กับอุปกรณ์ต่างๆ ในโรงงานอุตสาหกรรม', 'ระบบส่งกำลังระหว่างมอเตอร์กับอุปกรณ์เช่น ปั๊ม เกียร์ พัดลม โบลเวอร์ และสปินเดิล มีหลายรูปแบบ ทั้งคัปปลิ้ง สายพาน และโซ่ การมีความรู้ในการเลือกใช้ บำรุงรักษา และวิเคราะห์ปัญหาอย่างถูกต้อง ช่วยลดการหยุดเครื่อง ลดต้นทุน และเพิ่มประสิทธิภาพการผลิต', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้ ความเข้าใจเรื่องการส่งกำลัง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้ ความเข้าใจเรื่องการส่งกำลัง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้ ความเข้าใจการเลือกใช้ประเภทการส่งกำลังที่ถูกต้อง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้ ความเข้าใจการเลือกใช้ประเภทการส่งกำลังที่ถูกต้อง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้ ความเข้าใจวิธีการประกอบ การปรับตั้งแนวศูนย์ตรง (Alignment)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้ ความเข้าใจวิธีการประกอบ การปรับตั้งแนวศูนย์ตรง (Alignment)');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีทักษะการวิเคราะห์ปัญหา สาเหตุ การบำรุงรักษา และป้องกัน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีทักษะการวิเคราะห์ปัญหา สาเหตุ การบำรุงรักษา และป้องกัน');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างซ่อมประกอบ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างซ่อมประกอบ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างบำรุงรักษา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างบำรุงรักษา');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานควบคุมการเดินเครื่องจักร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานควบคุมการเดินเครื่องจักร');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ระบบส่งกำลังและคัปปลิ้ง');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ระบบส่งกำลังและคัปปลิ้ง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้ ความเข้าใจระบบส่งกำลัง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้ ความเข้าใจระบบส่งกำลัง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประเภทและชนิดของการส่งกำลัง: คัปปลิ้ง, สายพานขับ, โซ่ขับ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประเภทและชนิดของการส่งกำลัง: คัปปลิ้ง, สายพานขับ, โซ่ขับ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ข้อดี ข้อเสีย และการเลือกใช้การส่งกำลังแต่ละประเภท');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ข้อดี ข้อเสีย และการเลือกใช้การส่งกำลังแต่ละประเภท');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'คัปปลิ้งแบบขับตรง แบบยืดหยุ่น แบบเฟือง แบบโซ่ และแบบนิรภัย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'คัปปลิ้งแบบขับตรง แบบยืดหยุ่น แบบเฟือง แบบโซ่ และแบบนิรภัย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การปรับตั้งแนวศูนย์กลางระหว่างเพลาด้วยเครื่องมือวัดไดอัลเกจ (Dial gauge alignment)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การปรับตั้งแนวศูนย์กลางระหว่างเพลาด้วยเครื่องมือวัดไดอัลเกจ (Dial gauge alignment)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'สายพาน โซ่ และการปรับตั้ง');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'สายพาน โซ่ และการปรับตั้ง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'สายพานร่องวี สายพานร่องชุด สายพานฟันเฟือง สายพานฟันปลา สายพานข้อโซ่');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'สายพานร่องวี สายพานร่องชุด สายพานฟันเฟือง สายพานฟันปลา สายพานข้อโซ่');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'โซ่โรเลอร์ โซ่บูช โซ่โบลท์ โซ่ฟัน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'โซ่โรเลอร์ โซ่บูช โซ่โบลท์ โซ่ฟัน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การคำนวณอัตราทด ความเร็วรอบ แรงบิดทอร์ค (Torque)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การคำนวณอัตราทด ความเร็วรอบ แรงบิดทอร์ค (Torque)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การปรับตั้งแนวศูนย์ตรงสายพานขับและโซ่ขับ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การปรับตั้งแนวศูนย์ตรงสายพานขับและโซ่ขับ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ แก้ไขปัญหาคัปปลิ้ง สายพานขับ โซ่ขับ ด้วยตาราง Know Why Sheet');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ แก้ไขปัญหาคัปปลิ้ง สายพานขับ โซ่ขับ ด้วยตาราง Know Why Sheet');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 10:30', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความรู้ ความเข้าใจระบบส่งกำลัง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความรู้ ความเข้าใจระบบส่งกำลัง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ประเภทและชนิดของการส่งกำลัง: คัปปลิ้ง, สายพานขับ, โซ่ขับ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ประเภทและชนิดของการส่งกำลัง: คัปปลิ้ง, สายพานขับ, โซ่ขับ');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '10:45 - 12:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การปรับตั้งแนวศูนย์กลางระหว่างเพลาด้วยเครื่องมือวัดไดอัลเกจ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การปรับตั้งแนวศูนย์กลางระหว่างเพลาด้วยเครื่องมือวัดไดอัลเกจ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'สายพานและโซ่ประเภทต่างๆ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'สายพานและโซ่ประเภทต่างๆ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การคำนวณอัตราทด ความเร็วรอบ แรงบิดทอร์ค');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การคำนวณอัตราทด ความเร็วรอบ แรงบิดทอร์ค');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 14:30', 2);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การปรับตั้งแนวศูนย์ตรงสายพานขับ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การปรับตั้งแนวศูนย์ตรงสายพานขับ');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '14:45 - 16:00', 3);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การปรับตั้งแนวศูนย์ตรงโซ่ขับ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การปรับตั้งแนวศูนย์ตรงโซ่ขับ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์ แก้ไขปัญหาคัปปลิ้ง สายพานขับ โซ่ขับ ด้วยตาราง Know Why Sheet');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์ แก้ไขปัญหาคัปปลิ้ง สายพานขับ โซ่ขับ ด้วยตาราง Know Why Sheet');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบและแลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบและแลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การทำแบบทดสอบก่อนและหลังอบรม ประเมิน Skill');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การทำแบบทดสอบก่อนและหลังอบรม ประเมิน Skill');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course MNT005
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('MNT005', 'machine-lubrication-maintenance', 'MNT', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'เทคนิคการบำรุงรักษางานหล่อลื่นเครื่องจักร', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะงานหล่อลื่นในระบบบำรุงรักษาเชิงป้องกัน เลือกใช้สารหล่อลื่นได้ถูกต้อง ลดต้นทุนและความเสียหายของเครื่องจักร', 'งานหล่อลื่นในระบบบำรุงรักษาเชิงป้องกัน (PM) เป็นงานที่สำคัญ หากขาดความรู้ความเข้าใจที่ถูกต้องตั้งแต่การเลือกชนิด เกรด มาตรฐาน จำนวน ปริมาณ และความถี่การหล่อลื่น จะส่งผลกระทบต่อเครื่องจักรอุปกรณ์ คุณภาพ การผลิต และต้นทุนค่าใช้จ่ายสูง', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Machine Lubrication Maintenance Techniques', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะงานหล่อลื่นในระบบบำรุงรักษาเชิงป้องกัน เลือกใช้สารหล่อลื่นได้ถูกต้อง ลดต้นทุนและความเสียหายของเครื่องจักร', 'งานหล่อลื่นในระบบบำรุงรักษาเชิงป้องกัน (PM) เป็นงานที่สำคัญ หากขาดความรู้ความเข้าใจที่ถูกต้องตั้งแต่การเลือกชนิด เกรด มาตรฐาน จำนวน ปริมาณ และความถี่การหล่อลื่น จะส่งผลกระทบต่อเครื่องจักรอุปกรณ์ คุณภาพ การผลิต และต้นทุนค่าใช้จ่ายสูง', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้ ความเข้าใจความสำคัญของการหล่อลื่นเครื่องจักรและอุปกรณ์');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้ ความเข้าใจความสำคัญของการหล่อลื่นเครื่องจักรและอุปกรณ์');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้ ความเข้าใจการเลือกใช้ประเภทสารหล่อลื่นที่ถูกต้อง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้ ความเข้าใจการเลือกใช้ประเภทสารหล่อลื่นที่ถูกต้อง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้ ความเข้าใจการกำหนดมาตรฐานจำนวนและความถี่สารหล่อลื่น');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้ ความเข้าใจการกำหนดมาตรฐานจำนวนและความถี่สารหล่อลื่น');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีทักษะการวิเคราะห์ปัญหา สาเหตุ การบำรุงรักษา และป้องกัน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีทักษะการวิเคราะห์ปัญหา สาเหตุ การบำรุงรักษา และป้องกัน');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการบำรุงรักษาและวางแผน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการบำรุงรักษาและวางแผน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการบริการเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการบริการเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการศูนย์ฝึกอบรมทางเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการศูนย์ฝึกอบรมทางเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'Maintenance Performance Auditor');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'Maintenance Performance Auditor');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ความรู้เกี่ยวกับสารหล่อลื่น');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ความรู้เกี่ยวกับสารหล่อลื่น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้เกี่ยวกับสารหล่อลื่น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้เกี่ยวกับสารหล่อลื่น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประโยชน์ หน้าที่ การทำงานของการหล่อลื่น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประโยชน์ หน้าที่ การทำงานของการหล่อลื่น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเลือกใช้สารหล่อลื่นให้ถูกต้องกับประเภทเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเลือกใช้สารหล่อลื่นให้ถูกต้องกับประเภทเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วิธีการหล่อลื่นและจำนวน ปริมาณมาตรฐาน เพื่อป้องกันปัญหาร้อนจัด หก รั่ว ล้น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วิธีการหล่อลื่นและจำนวน ปริมาณมาตรฐาน เพื่อป้องกันปัญหาร้อนจัด หก รั่ว ล้น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบริหาร ควบคุมการหล่อลื่น ด้วยวิธีมองเห็น (Visual Control)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบริหาร ควบคุมการหล่อลื่น ด้วยวิธีมองเห็น (Visual Control)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'จาระบีและการวิเคราะห์สารหล่อลื่น');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'จาระบีและการวิเคราะห์สารหล่อลื่น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'จาระบี: ประเภทและการเลือกใช้');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'จาระบี: ประเภทและการเลือกใช้');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'มาตรฐานจำนวนการอัดจาระบี เพื่อป้องกันเครื่องจักรแบริ่งอุณหภูมิสูง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'มาตรฐานจำนวนการอัดจาระบี เพื่อป้องกันเครื่องจักรแบริ่งอุณหภูมิสูง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์สภาพภายในเครื่องจักรจากน้ำมันหล่อลื่นใช้แล้วด้วยตนเอง (ภาคปฏิบัติ)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์สภาพภายในเครื่องจักรจากน้ำมันหล่อลื่นใช้แล้วด้วยตนเอง (ภาคปฏิบัติ)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ แก้ไขปัญหา การหล่อลื่น บำรุงรักษา และป้องกันด้วยตาราง Know Why Sheet');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ แก้ไขปัญหา การหล่อลื่น บำรุงรักษา และป้องกันด้วยตาราง Know Why Sheet');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 10:30', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความรู้เกี่ยวกับสารหล่อลื่น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความรู้เกี่ยวกับสารหล่อลื่น');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ประโยชน์ หน้าที่ การทำงานของการหล่อลื่น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ประโยชน์ หน้าที่ การทำงานของการหล่อลื่น');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การเลือกใช้สารหล่อลื่นให้ถูกต้องกับประเภทเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การเลือกใช้สารหล่อลื่นให้ถูกต้องกับประเภทเครื่องจักร');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '10:45 - 12:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วิธีการหล่อลื่นและมาตรฐานปริมาณ เพื่อป้องกันปัญหาร้อนจัด หก รั่ว ล้น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วิธีการหล่อลื่นและมาตรฐานปริมาณ เพื่อป้องกันปัญหาร้อนจัด หก รั่ว ล้น');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การบริหาร ควบคุมการหล่อลื่น ด้วยวิธีมองเห็น (Visual Control)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การบริหาร ควบคุมการหล่อลื่น ด้วยวิธีมองเห็น (Visual Control)');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 14:30', 2);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'จาระบีหล่อลื่น: ประเภทและการเลือกใช้');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'จาระบีหล่อลื่น: ประเภทและการเลือกใช้');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'มาตรฐานจำนวนการอัดจาระบีเพื่อป้องกันเครื่องจักรแบริ่งอุณหภูมิสูง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'มาตรฐานจำนวนการอัดจาระบีเพื่อป้องกันเครื่องจักรแบริ่งอุณหภูมิสูง');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '14:45 - 16:00', 3);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์สภาพภายในเครื่องจักรจากน้ำมันหล่อลื่นใช้แล้วด้วยตนเอง (ภาคปฏิบัติ)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์สภาพภายในเครื่องจักรจากน้ำมันหล่อลื่นใช้แล้วด้วยตนเอง (ภาคปฏิบัติ)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์ แก้ไขปัญหา การหล่อลื่น บำรุงรักษา และป้องกันด้วยตาราง Know Why Sheet');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์ แก้ไขปัญหา การหล่อลื่น บำรุงรักษา และป้องกันด้วยตาราง Know Why Sheet');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop) จากเครื่องจักรจำลองโรงงาน');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop) จากเครื่องจักรจำลองโรงงาน');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course MNT006
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('MNT006', 'industrial-electrical-systems-fundamentals', 'MNT', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'พื้นฐานระบบไฟฟ้าในงานอุตสาหกรรม', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะด้านระบบไฟฟ้าและมอเตอร์ไฟฟ้าในโรงงานอุตสาหกรรม ลดความเสียหายและการหยุดขัดข้องฉุกเฉิน', 'อุปกรณ์ไฟฟ้าและมอเตอร์ไฟฟ้าเป็นเครื่องต้นกำลังหลักที่มีความสำคัญต่อกระบวนการผลิต การมีความรู้ความเข้าใจหน้าที่ การทำงาน และการบำรุงรักษาอุปกรณ์ไฟฟ้าอย่างถูกต้อง จะช่วยลดการเสียหายและการหยุดขัดข้องฉุกเฉิน ลดค่าใช้จ่ายในการซ่อมแซม และเพิ่มผลผลิต', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Industrial Electrical Systems Fundamentals', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะด้านระบบไฟฟ้าและมอเตอร์ไฟฟ้าในโรงงานอุตสาหกรรม ลดความเสียหายและการหยุดขัดข้องฉุกเฉิน', 'อุปกรณ์ไฟฟ้าและมอเตอร์ไฟฟ้าเป็นเครื่องต้นกำลังหลักที่มีความสำคัญต่อกระบวนการผลิต การมีความรู้ความเข้าใจหน้าที่ การทำงาน และการบำรุงรักษาอุปกรณ์ไฟฟ้าอย่างถูกต้อง จะช่วยลดการเสียหายและการหยุดขัดข้องฉุกเฉิน ลดค่าใช้จ่ายในการซ่อมแซม และเพิ่มผลผลิต', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'พัฒนาความรู้ ทักษะ ให้มีความรู้ความเข้าใจเกี่ยวกับอุปกรณ์ไฟฟ้าพื้นฐาน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'พัฒนาความรู้ ทักษะ ให้มีความรู้ความเข้าใจเกี่ยวกับอุปกรณ์ไฟฟ้าพื้นฐาน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้ ความเข้าใจส่วนประกอบ อุปกรณ์ไฟฟ้า การทำงานแต่ละชนิด');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้ ความเข้าใจส่วนประกอบ อุปกรณ์ไฟฟ้า การทำงานแต่ละชนิด');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สามารถดูแลบำรุงรักษาอุปกรณ์ไฟฟ้าเบื้องต้นได้');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สามารถดูแลบำรุงรักษาอุปกรณ์ไฟฟ้าเบื้องต้นได้');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างซ่อมประกอบ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างซ่อมประกอบ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างบำรุงรักษา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างบำรุงรักษา');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานควบคุมและเดินเครื่องจักร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานควบคุมและเดินเครื่องจักร');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ความรู้พื้นฐานและอุปกรณ์ไฟฟ้า');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ความรู้พื้นฐานและอุปกรณ์ไฟฟ้า');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้พื้นฐานทางไฟฟ้า: การเกิดไฟฟ้า และระบบการส่งไฟฟ้า, ชนิดของไฟฟ้า');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้พื้นฐานทางไฟฟ้า: การเกิดไฟฟ้า และระบบการส่งไฟฟ้า, ชนิดของไฟฟ้า');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'อุปกรณ์ป้องกันไฟฟ้ารั่ว (Earth Leakage Breaker)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'อุปกรณ์ป้องกันไฟฟ้ารั่ว (Earth Leakage Breaker)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เครื่องตัดวงจรไฟฟ้า (Circuit breaker)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เครื่องตัดวงจรไฟฟ้า (Circuit breaker)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เครื่องตัดวงจรไฟฟ้าแม่เหล็ก (Magnetic contactor)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เครื่องตัดวงจรไฟฟ้าแม่เหล็ก (Magnetic contactor)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ลิมิตสวิทช์ (Limit Switch), Proximity Sensor');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ลิมิตสวิทช์ (Limit Switch), Proximity Sensor');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การปรับตั้งโอเวอร์โหลด (Over Load)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การปรับตั้งโอเวอร์โหลด (Over Load)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวัดอุณหภูมิ (Thermocouple), การวัดแรงดัน (Pressure Switch), วัดการไหล (Flow Switch), วัดการลื่น สลิป (Slip Detector)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวัดอุณหภูมิ (Thermocouple), การวัดแรงดัน (Pressure Switch), วัดการไหล (Flow Switch), วัดการลื่น สลิป (Slip Detector)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'มอเตอร์ไฟฟ้าและตู้ควบคุม');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'มอเตอร์ไฟฟ้าและตู้ควบคุม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้พื้นฐาน และการทำงานมอเตอร์ไฟฟ้า');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้พื้นฐาน และการทำงานมอเตอร์ไฟฟ้า');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ปัญหาของมอเตอร์ไฟฟ้า และการบำรุงรักษามอเตอร์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ปัญหาของมอเตอร์ไฟฟ้า และการบำรุงรักษามอเตอร์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวัดความสั่นสะเทือนเครื่องจักร (Vibration)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวัดความสั่นสะเทือนเครื่องจักร (Vibration)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวัดสภาพแบริ่ง (Bearing)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวัดสภาพแบริ่ง (Bearing)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การตรวจสอบ บำรุงรักษาตู้ควบคุมไฟฟ้า');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การตรวจสอบ บำรุงรักษาตู้ควบคุมไฟฟ้า');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ แก้ไขปัญหาไฟฟ้าจากตาราง Know Why Sheet');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ แก้ไขปัญหาไฟฟ้าจากตาราง Know Why Sheet');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 10:30', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความรู้พื้นฐานทางไฟฟ้า');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความรู้พื้นฐานทางไฟฟ้า');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การเกิดไฟฟ้า และระบบการส่งไฟฟ้า');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การเกิดไฟฟ้า และระบบการส่งไฟฟ้า');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ชนิดของไฟฟ้า');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ชนิดของไฟฟ้า');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '10:45 - 12:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'อุปกรณ์ไฟฟ้าที่ใช้ในกระบวนการผลิต หน้าที่ การทำงาน การต่อวงจร และบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'อุปกรณ์ไฟฟ้าที่ใช้ในกระบวนการผลิต หน้าที่ การทำงาน การต่อวงจร และบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Earth Leakage Breaker, Circuit breaker, Magnetic contactor, Limit Switch, Proximity Sensor');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Earth Leakage Breaker, Circuit breaker, Magnetic contactor, Limit Switch, Proximity Sensor');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 2);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความรู้พื้นฐาน และการทำงานมอเตอร์ไฟฟ้า');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความรู้พื้นฐาน และการทำงานมอเตอร์ไฟฟ้า');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ปัญหาของมอเตอร์ไฟฟ้า และการบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ปัญหาของมอเตอร์ไฟฟ้า และการบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวัดการสั่นสะเทือน (Vibration) และสภาพแบริ่ง (Bearing)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวัดการสั่นสะเทือน (Vibration) และสภาพแบริ่ง (Bearing)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การตรวจสอบ บำรุงรักษาตู้ควบคุมไฟฟ้า');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การตรวจสอบ บำรุงรักษาตู้ควบคุมไฟฟ้า');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์ แก้ไขปัญหาไฟฟ้าด้วยตาราง Know Why Sheet');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์ แก้ไขปัญหาไฟฟ้าด้วยตาราง Know Why Sheet');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การทำแบบทดสอบก่อนและหลังการอบรมเพื่อประเมิน Skill');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การทำแบบทดสอบก่อนและหลังการอบรมเพื่อประเมิน Skill');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course MNT007
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('MNT007', 'safety-maintenance-practice', 'MNT', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'ความปลอดภัยในงานซ่อมบำรุง เชิงปฏิบัติ', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะด้านความปลอดภัยในงานซ่อมบำรุง มุ่งสู่เป้าหมายการเกิดอุบัติเหตุ ''ศูนย์'' อย่างยั่งยืน', 'งานซ่อมบำรุงเป็นงานที่มีความเสี่ยงสูงต่อการเกิดอุบัติเหตุ หากพนักงานและผู้ควบคุมงานขาดความรู้ความเข้าใจเกี่ยวกับความเสี่ยงและมาตรการป้องกันที่ถูกต้อง อาจนำไปสู่ความสูญเสียที่หลีกเลี่ยงได้ หลักสูตรนี้มุ่งให้ผู้เข้าอบรมเข้าใจมาตรการด้านความปลอดภัยในงานซ่อมบำรุง', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Safety Maintenance Practice', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะด้านความปลอดภัยในงานซ่อมบำรุง มุ่งสู่เป้าหมายการเกิดอุบัติเหตุ ''ศูนย์'' อย่างยั่งยืน', 'งานซ่อมบำรุงเป็นงานที่มีความเสี่ยงสูงต่อการเกิดอุบัติเหตุ หากพนักงานและผู้ควบคุมงานขาดความรู้ความเข้าใจเกี่ยวกับความเสี่ยงและมาตรการป้องกันที่ถูกต้อง อาจนำไปสู่ความสูญเสียที่หลีกเลี่ยงได้ หลักสูตรนี้มุ่งให้ผู้เข้าอบรมเข้าใจมาตรการด้านความปลอดภัยในงานซ่อมบำรุง', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้ ความเข้าใจพื้นฐานของงานซ่อมบำรุงเพื่อความปลอดภัย');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้ ความเข้าใจพื้นฐานของงานซ่อมบำรุงเพื่อความปลอดภัย');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'รู้จักประเภทงานซ่อมบำรุงลักษณะต่างๆ ที่ก่อให้เกิดอุบัติเหตุ มาตรการควบคุม ป้องกัน เพื่อความปลอดภัย');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'รู้จักประเภทงานซ่อมบำรุงลักษณะต่างๆ ที่ก่อให้เกิดอุบัติเหตุ มาตรการควบคุม ป้องกัน เพื่อความปลอดภัย');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'การบริหารส่งเสริมความปลอดภัยในการทำงาน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'การบริหารส่งเสริมความปลอดภัยในการทำงาน');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการบำรุงรักษาและวางแผน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการบำรุงรักษาและวางแผน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการบริการเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการบริการเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างซ่อมประกอบ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างซ่อมประกอบ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างบำรุงรักษา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างบำรุงรักษา');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานควบคุมเครื่องจักร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานควบคุมเครื่องจักร');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'หลักการและมาตรการความปลอดภัย');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'หลักการและมาตรการความปลอดภัย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้ ความเข้าใจ การบริหารความปลอดภัยในการทำงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้ ความเข้าใจ การบริหารความปลอดภัยในการทำงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'จิตสำนึกของความปลอดภัยคืออะไร และจะสร้างอย่างไร?');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'จิตสำนึกของความปลอดภัยคืออะไร และจะสร้างอย่างไร?');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเริ่มงานซ่อมที่ปลอดภัย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเริ่มงานซ่อมที่ปลอดภัย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ปฏิญาณความปลอดภัย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ปฏิญาณความปลอดภัย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การหยั่งรู้ ระวังภัย ด้วย KYT');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การหยั่งรู้ ระวังภัย ด้วย KYT');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วิธีการตัดแยกพลังงานเครื่องต้นกำลัง (SW Off / Power Off) เพื่อความปลอดภัย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วิธีการตัดแยกพลังงานเครื่องต้นกำลัง (SW Off / Power Off) เพื่อความปลอดภัย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'รู้จัก และใช้งานให้ถูกวิธีกับอุปกรณ์คุ้มครองความปลอดภัยส่วนบุคคล (PPE)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'รู้จัก และใช้งานให้ถูกวิธีกับอุปกรณ์คุ้มครองความปลอดภัยส่วนบุคคล (PPE)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'งานซ่อมบำรุงประเภทต่างๆ และการบริหารความปลอดภัย');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'งานซ่อมบำรุงประเภทต่างๆ และการบริหารความปลอดภัย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ลักษณะงานซ่อมบำรุงประเภทต่างๆ ที่ก่อให้เกิดอุบัติเหตุ และมาตรการป้องกัน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ลักษณะงานซ่อมบำรุงประเภทต่างๆ ที่ก่อให้เกิดอุบัติเหตุ และมาตรการป้องกัน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การควบคุมและป้องกันจากเครื่องมือกล งานหมุน งานตัดเฉือน งานบีบหนีบ งานเชื่อม งานสารเคมี งานในที่อับอากาศ งานบนที่สูง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การควบคุมและป้องกันจากเครื่องมือกล งานหมุน งานตัดเฉือน งานบีบหนีบ งานเชื่อม งานสารเคมี งานในที่อับอากาศ งานบนที่สูง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบริหารจัดการด้านความปลอดภัย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบริหารจัดการด้านความปลอดภัย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การประเมินความเสี่ยง และการวิเคราะห์งานเพื่อความปลอดภัย (JSA: Job Safety Analysis)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การประเมินความเสี่ยง และการวิเคราะห์งานเพื่อความปลอดภัย (JSA: Job Safety Analysis)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การขออนุญาต (Work permit) ทำงานในพื้นที่อันตราย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การขออนุญาต (Work permit) ทำงานในพื้นที่อันตราย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'กฎความปลอดภัยในงานซ่อมบำรุง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'กฎความปลอดภัยในงานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบริหาร ส่งเสริมความปลอดภัยในการทำงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบริหาร ส่งเสริมความปลอดภัยในการทำงาน');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 10:30', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความรู้ ความเข้าใจ การบริหารความปลอดภัยในการทำงาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความรู้ ความเข้าใจ การบริหารความปลอดภัยในการทำงาน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การเริ่มงานซ่อมที่ปลอดภัย');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การเริ่มงานซ่อมที่ปลอดภัย');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '10:45 - 12:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'รู้จักและใช้งานอุปกรณ์คุ้มครองความปลอดภัยส่วนบุคคล (PPE)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'รู้จักและใช้งานอุปกรณ์คุ้มครองความปลอดภัยส่วนบุคคล (PPE)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ลักษณะงานซ่อมบำรุงประเภทต่างๆ ที่ก่อให้เกิดอุบัติเหตุ และมาตรการป้องกัน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ลักษณะงานซ่อมบำรุงประเภทต่างๆ ที่ก่อให้เกิดอุบัติเหตุ และมาตรการป้องกัน');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 14:30', 2);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การบริหารจัดการด้านความปลอดภัย');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การบริหารจัดการด้านความปลอดภัย');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '14:45 - 16:00', 3);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'กฎความปลอดภัยในงานซ่อมบำรุง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'กฎความปลอดภัยในงานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การบริหาร ส่งเสริมความปลอดภัยในการทำงาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การบริหาร ส่งเสริมความปลอดภัยในการทำงาน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบและแลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบและแลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course TPM001
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('TPM001', 'preventive-maintenance', 'TPM', '1 วัน', '25 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การบำรุงรักษาเชิงป้องกัน', 'หลักสูตรเพื่อพัฒนาระบบการบำรุงรักษาเชิงป้องกัน มุ่งสู่เป้าหมายการเสียหายของเครื่องจักรเป็นศูนย์ (Zero Failure)', 'ในอุตสาหกรรมที่ใช้เครื่องจักรเป็นหลักในการผลิต มักไม่ได้สนใจหาวิธีการใช้และบำรุงรักษาอย่างถูกต้อง ผลที่ตามมาคือเครื่องจักรเสียบ่อย เสียเวลาซ่อม และต้นทุนสูง หลักสูตรนี้เน้นการวางแผน PM จากข้อมูลและประวัติเครื่องจักรเพื่อให้แผนมีความแม่นยำ โดยมีเป้าหมายหลักคือ Zero Failure', '1 วัน', '25 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Preventive Maintenance', 'หลักสูตรเพื่อพัฒนาระบบการบำรุงรักษาเชิงป้องกัน มุ่งสู่เป้าหมายการเสียหายของเครื่องจักรเป็นศูนย์ (Zero Failure)', 'ในอุตสาหกรรมที่ใช้เครื่องจักรเป็นหลักในการผลิต มักไม่ได้สนใจหาวิธีการใช้และบำรุงรักษาอย่างถูกต้อง ผลที่ตามมาคือเครื่องจักรเสียบ่อย เสียเวลาซ่อม และต้นทุนสูง หลักสูตรนี้เน้นการวางแผน PM จากข้อมูลและประวัติเครื่องจักรเพื่อให้แผนมีความแม่นยำ โดยมีเป้าหมายหลักคือ Zero Failure', '1 Day', '25 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ตระหนักถึงความสำคัญของการบำรุงรักษาที่ส่งผลกระทบต่อสถานประกอบการทั้งด้านคุณภาพ ต้นทุน และการส่งมอบ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ตระหนักถึงความสำคัญของการบำรุงรักษาที่ส่งผลกระทบต่อสถานประกอบการทั้งด้านคุณภาพ ต้นทุน และการส่งมอบ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจหลักการและขั้นตอนการทำ Preventive Maintenance');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจหลักการและขั้นตอนการทำ Preventive Maintenance');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สามารถนำความรู้เรื่องการบำรุงรักษาเชิงป้องกันไปประยุกต์ใช้ได้ในองค์กร');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สามารถนำความรู้เรื่องการบำรุงรักษาเชิงป้องกันไปประยุกต์ใช้ได้ในองค์กร');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้บริหาร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้บริหาร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานในหน่วยงานซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานในหน่วยงานซ่อมบำรุง');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'พื้นฐานระบบบำรุงรักษา');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'พื้นฐานระบบบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความเป็นมาและแนวคิดของระบบการบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความเป็นมาและแนวคิดของระบบการบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความสำคัญของระบบการบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความสำคัญของระบบการบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', '5 มาตรการเพื่อเครื่องจักรขัดข้องเป็นศูนย์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', '5 มาตรการเพื่อเครื่องจักรขัดข้องเป็นศูนย์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'โครงสร้างและหน้าที่ของการบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'โครงสร้างและหน้าที่ของการบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ตัวชี้วัดความสำเร็จของระบบการบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ตัวชี้วัดความสำเร็จของระบบการบำรุงรักษา');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ขั้นตอนการทำ Preventive Maintenance');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ขั้นตอนการทำ Preventive Maintenance');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เตรียมการและเก็บข้อมูล');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เตรียมการและเก็บข้อมูล');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วิเคราะห์ข้อมูล กำหนดมาตรฐาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วิเคราะห์ข้อมูล กำหนดมาตรฐาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'จัดทำแผน Preventive Maintenance');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'จัดทำแผน Preventive Maintenance');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ควบคุมและวัดผล');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ควบคุมและวัดผล');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความเป็นมาและแนวคิดของระบบการบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความเป็นมาและแนวคิดของระบบการบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', '5 มาตรการเพื่อเครื่องจักรขัดข้องเป็นศูนย์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', '5 มาตรการเพื่อเครื่องจักรขัดข้องเป็นศูนย์');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'โครงสร้างและหน้าที่ของการบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'โครงสร้างและหน้าที่ของการบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ตัวชี้วัดความสำเร็จของระบบการบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ตัวชี้วัดความสำเร็จของระบบการบำรุงรักษา');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอนการทำ Preventive Maintenance');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอนการทำ Preventive Maintenance');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เตรียมการและเก็บข้อมูล');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เตรียมการและเก็บข้อมูล');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วิเคราะห์ข้อมูล กำหนดมาตรฐาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วิเคราะห์ข้อมูล กำหนดมาตรฐาน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'จัดทำแผน Preventive Maintenance');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'จัดทำแผน Preventive Maintenance');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ควบคุมและวัดผล');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ควบคุมและวัดผล');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 2);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'นำเสนอผลงาน');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'นำเสนอผลงาน');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');
INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 1);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมค่าเดินทาง ค่าที่พัก (ถ้ามี)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course TPM002
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('TPM002', 'total-productive-maintenance', 'TPM', '1 วัน', '25 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'บริหารการบำรุงรักษาแบบมีส่วนร่วมเพื่อเพิ่มผลผลิต', 'หลักสูตรแนะนำระบบ TPM ครบวงจร เพื่อให้ผู้บริหารและพนักงานทุกระดับเข้าใจหลักการ 8 เสาหลัก และขับเคลื่อน TPM ในองค์กรได้อย่างเป็นระบบ', 'ในอุตสาหกรรมยุคดิจิทัลที่มีการแข่งขันสูง องค์กรจำเป็นต้องนำระบบ TPM (Total Productive Maintenance) มาใช้ในการบริหารจัดการ ซึ่งช่วยลดความสูญเสีย เพิ่มผลผลิต และยกระดับประสิทธิภาพการทำงานอย่างต่อเนื่อง หลักสูตรนี้ออกแบบจากประสบการณ์จริงของที่ปรึกษา พร้อมตัวอย่างและวิดีโอประกอบ', '1 วัน', '25 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Total Productive Maintenance (TPM)', 'หลักสูตรแนะนำระบบ TPM ครบวงจร เพื่อให้ผู้บริหารและพนักงานทุกระดับเข้าใจหลักการ 8 เสาหลัก และขับเคลื่อน TPM ในองค์กรได้อย่างเป็นระบบ', 'ในอุตสาหกรรมยุคดิจิทัลที่มีการแข่งขันสูง องค์กรจำเป็นต้องนำระบบ TPM (Total Productive Maintenance) มาใช้ในการบริหารจัดการ ซึ่งช่วยลดความสูญเสีย เพิ่มผลผลิต และยกระดับประสิทธิภาพการทำงานอย่างต่อเนื่อง หลักสูตรนี้ออกแบบจากประสบการณ์จริงของที่ปรึกษา พร้อมตัวอย่างและวิดีโอประกอบ', '1 Day', '25 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจหลักการ แนวคิด และความสำคัญของระบบ TPM ในการบริหารจัดการการผลิต');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจหลักการ แนวคิด และความสำคัญของระบบ TPM ในการบริหารจัดการการผลิต');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สร้างความรู้ ความเข้าใจเกี่ยวกับแนวทางการดำเนินงาน TPM ทั้ง 8 เสาหลัก และสามารถนำไปใช้ในองค์กรได้');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สร้างความรู้ ความเข้าใจเกี่ยวกับแนวทางการดำเนินงาน TPM ทั้ง 8 เสาหลัก และสามารถนำไปใช้ในองค์กรได้');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'วิเคราะห์ปัญหา ลดความสูญเสีย และเพิ่มผลผลิตได้อย่างเป็นรูปธรรม');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'วิเคราะห์ปัญหา ลดความสูญเสีย และเพิ่มผลผลิตได้อย่างเป็นรูปธรรม');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เตรียมความพร้อมให้แก่ผู้บริหาร หัวหน้างาน และพนักงานระดับผู้นำ (Key Man) ในการขับเคลื่อน TPM');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เตรียมความพร้อมให้แก่ผู้บริหาร หัวหน้างาน และพนักงานระดับผู้นำ (Key Man) ในการขับเคลื่อน TPM');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 4);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'แลกเปลี่ยนประสบการณ์จากกรณีศึกษาขององค์กรชั้นนำ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'แลกเปลี่ยนประสบการณ์จากกรณีศึกษาขององค์กรชั้นนำ');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้บริหาร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้บริหาร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่าย');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่าย');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานระดับผู้นำ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานระดับผู้นำ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายพัฒนาระบบในองค์กร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายพัฒนาระบบในองค์กร');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'พื้นฐาน TPM');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'พื้นฐาน TPM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การแข่งขันในด้านการผลิต ยุคการค้าดิจิทัล');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การแข่งขันในด้านการผลิต ยุคการค้าดิจิทัล');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความหมาย TPM');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความหมาย TPM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความสูญเสียหลัก 16 ประการ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความสูญเสียหลัก 16 ประการ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความเป็นมาของ TPM');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความเป็นมาของ TPM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเปลี่ยนแปลง 3 มิติของ TPM');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเปลี่ยนแปลง 3 มิติของ TPM');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', '8 เสาหลักของ TPM');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', '8 เสาหลักของ TPM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบำรุงรักษาด้วยตนเอง (AM: Autonomous Maintenance)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบำรุงรักษาด้วยตนเอง (AM: Autonomous Maintenance)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบำรุงรักษาตามแผน (PM: Planned Maintenance)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบำรุงรักษาตามแผน (PM: Planned Maintenance)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การให้การศึกษาและอบรม (ET: Education And Training)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การให้การศึกษาและอบรม (ET: Education And Training)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การปรับปรุงเฉพาะเรื่อง (FI: Focus Improvement)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การปรับปรุงเฉพาะเรื่อง (FI: Focus Improvement)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบำรุงรักษาเพื่อคุณภาพ (QM: Quality Maintenance)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบำรุงรักษาเพื่อคุณภาพ (QM: Quality Maintenance)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การควบคุมตั้งแต่การเริ่มต้น (EM: Early Management)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การควบคุมตั้งแต่การเริ่มต้น (EM: Early Management)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความปลอดภัยและสิ่งแวดล้อม (SHE)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความปลอดภัยและสิ่งแวดล้อม (SHE)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 7);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเพิ่มประสิทธิภาพฝ่ายส่งเสริมและสนับสนุน (OI: Office Improvement)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเพิ่มประสิทธิภาพฝ่ายส่งเสริมและสนับสนุน (OI: Office Improvement)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 2);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'เป้าหมายและการวัดผล');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'เป้าหมายและการวัดผล');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เป้าหมายของ TPM และการวัดผลความสำเร็จ (KPI)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เป้าหมายของ TPM และการวัดผลความสำเร็จ (KPI)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', '12 ขั้นตอนการตัดสินใจพัฒนาองค์กรสู่ TPM');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', '12 ขั้นตอนการตัดสินใจพัฒนาองค์กรสู่ TPM');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 10:30', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การแข่งขันในด้านการผลิต ยุคการค้าดิจิทัล');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การแข่งขันในด้านการผลิต ยุคการค้าดิจิทัล');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความหมายของ TPM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความหมายของ TPM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความสูญเสียหลัก 16 ประการ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความสูญเสียหลัก 16 ประการ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความเป็นมาของ TPM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความเป็นมาของ TPM');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '10:45 - 12:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การเปลี่ยนแปลง 3 มิติของ TPM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การเปลี่ยนแปลง 3 มิติของ TPM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ทำ TPM ไปทำไม ทำแล้วได้อะไร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ทำ TPM ไปทำไม ทำแล้วได้อะไร');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 14:30', 2);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วิธีการดำเนินการ 8 เสาหลักของ TPM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วิธีการดำเนินการ 8 เสาหลักของ TPM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ได้ประโยชน์อะไรจากการทำ TPM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ได้ประโยชน์อะไรจากการทำ TPM');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '14:45 - 16:00', 3);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เป้าหมายของ TPM และการวัดผลความสำเร็จ (KPI)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เป้าหมายของ TPM และการวัดผลความสำเร็จ (KPI)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', '12 ขั้นตอนการตัดสินใจ ว่าท่านพร้อมจะพัฒนาองค์กรสู่ TPM หรือไม่');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', '12 ขั้นตอนการตัดสินใจ ว่าท่านพร้อมจะพัฒนาองค์กรสู่ TPM หรือไม่');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรที่มีประสบการณ์ พร้อมตัวอย่าง');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรที่มีประสบการณ์ พร้อมตัวอย่าง');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A บาท (Exclude VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course TPM003
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('TPM003', 'autonomous-maintenance', 'TPM', '1 วัน', '25 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'TPM การบำรุงรักษาด้วยตนเอง', 'หลักสูตรเชิงปฏิบัติสำหรับพัฒนาพนักงานผลิตให้สามารถดูแลและบำรุงรักษาเครื่องจักรเบื้องต้นด้วยตนเองได้อย่างเป็นระบบ ตั้งแต่ Step 0-3', 'ในโรงงานอุตสาหกรรม พนักงานผลิตที่ปฏิบัติงานหน้าเครื่องจะเห็นอาการผิดปกติของเครื่องจักรเป็นอันดับแรก หากได้รับการพัฒนาความรู้และทักษะให้สามารถดูแลและบำรุงรักษาเบื้องต้นได้ด้วยตนเอง (AM) ซึ่งเป็นหนึ่งในเสาหลักของ TPM จะช่วยลดการหยุดเครื่อง ตรวจพบความผิดปกติได้เร็ว และเพิ่มเวลาการผลิต', '1 วัน', '25 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Autonomous Maintenance (AM)', 'หลักสูตรเชิงปฏิบัติสำหรับพัฒนาพนักงานผลิตให้สามารถดูแลและบำรุงรักษาเครื่องจักรเบื้องต้นด้วยตนเองได้อย่างเป็นระบบ ตั้งแต่ Step 0-3', 'ในโรงงานอุตสาหกรรม พนักงานผลิตที่ปฏิบัติงานหน้าเครื่องจะเห็นอาการผิดปกติของเครื่องจักรเป็นอันดับแรก หากได้รับการพัฒนาความรู้และทักษะให้สามารถดูแลและบำรุงรักษาเบื้องต้นได้ด้วยตนเอง (AM) ซึ่งเป็นหนึ่งในเสาหลักของ TPM จะช่วยลดการหยุดเครื่อง ตรวจพบความผิดปกติได้เร็ว และเพิ่มเวลาการผลิต', '1 Day', '25 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'พัฒนาความรู้ ทักษะ และความสามารถของพนักงานผลิตอย่างเป็นระบบทีละขั้นตอน ให้สามารถดูแลและบำรุงรักษาเครื่องจักรเบื้องต้นได้ด้วยตนเอง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'พัฒนาความรู้ ทักษะ และความสามารถของพนักงานผลิตอย่างเป็นระบบทีละขั้นตอน ให้สามารถดูแลและบำรุงรักษาเครื่องจักรเบื้องต้นได้ด้วยตนเอง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ให้พนักงานควบคุมและเดินเครื่องจักรสามารถทำงานได้ง่าย สะดวก รวดเร็ว');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ให้พนักงานควบคุมและเดินเครื่องจักรสามารถทำงานได้ง่าย สะดวก รวดเร็ว');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ลดการหยุดเครื่องและความขัดข้อง ส่งผลให้ผลผลิตเพิ่มขึ้น ลดต้นทุน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ลดการหยุดเครื่องและความขัดข้อง ส่งผลให้ผลผลิตเพิ่มขึ้น ลดต้นทุน');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายซ่อมบำรุงรักษา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายซ่อมบำรุงรักษา');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้าช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้าช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานควบคุม เดินเครื่องจักร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานควบคุม เดินเครื่องจักร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างบำรุงรักษา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างบำรุงรักษา');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 6);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายส่งเสริมพัฒนาระบบ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายส่งเสริมพัฒนาระบบ');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'พื้นฐาน TPM และ AM');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'พื้นฐาน TPM และ AM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้ ความเข้าใจ TPM คืออะไร จะมีการเปลี่ยนแปลงอะไรบ้าง และทำอย่างไร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้ ความเข้าใจ TPM คืออะไร จะมีการเปลี่ยนแปลงอะไรบ้าง และทำอย่างไร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระบบบำรุงรักษาด้วยตนเอง (AM) คืออะไร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระบบบำรุงรักษาด้วยตนเอง (AM) คืออะไร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การดำเนินการบำรุงรักษาด้วยตนเอง 7 ขั้นตอน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การดำเนินการบำรุงรักษาด้วยตนเอง 7 ขั้นตอน');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'Step 0: การเตรียมการ');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'Step 0: การเตรียมการ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การแต่งตั้งคณะทำงาน สมาชิก กลุ่มนำร่อง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การแต่งตั้งคณะทำงาน สมาชิก กลุ่มนำร่อง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ศึกษาเรียนรู้เครื่องจักรนำร่อง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ศึกษาเรียนรู้เครื่องจักรนำร่อง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'จัดทำแผนบำรุงรักษาสภาพการทำงานปกติของเครื่องจักร (Basic Condition)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'จัดทำแผนบำรุงรักษาสภาพการทำงานปกติของเครื่องจักร (Basic Condition)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดเป้าหมาย (KPI) และวางแผนดำเนินการ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดเป้าหมาย (KPI) และวางแผนดำเนินการ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Activity Board');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Activity Board');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 2);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'Step 1: งานทำสะอาดเบื้องต้น (Initial Cleaning)');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'Step 1: งานทำสะอาดเบื้องต้น (Initial Cleaning)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การค้นหาสิ่งผิดปกติ 7 ประเภท');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การค้นหาสิ่งผิดปกติ 7 ประเภท');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ชนิดของป้าย สีขาว สีชมพู สีเหลือง สีแดง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ชนิดของป้าย สีขาว สีชมพู สีเหลือง สีแดง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'บทเรียนรู้จุดเดียว เรื่องเดียว แผ่นเดียว OPL (One Point Lesson)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'บทเรียนรู้จุดเดียว เรื่องเดียว แผ่นเดียว OPL (One Point Lesson)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 3);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'Step 2: การแก้ไขปัญหาที่ต้นเหตุ (SOC)');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'Step 2: การแก้ไขปัญหาที่ต้นเหตุ (SOC)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แผนผังแสดงตำแหน่งที่ก่อให้เกิดแหล่งสิ่งสกปรก');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แผนผังแสดงตำแหน่งที่ก่อให้เกิดแหล่งสิ่งสกปรก');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เทคนิค C, E, R, S, A');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เทคนิค C, E, R, S, A');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 4);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'Step 3: จัดทำมาตรฐานบำรุงรักษาเบื้องต้นด้วยตนเอง');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'Step 3: จัดทำมาตรฐานบำรุงรักษาเบื้องต้นด้วยตนเอง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ตารางแสดงจุดตำแหน่งรายการบำรุงรักษาด้วยวิธีมองเห็น (Visual Control)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ตารางแสดงจุดตำแหน่งรายการบำรุงรักษาด้วยวิธีมองเห็น (Visual Control)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แผนปฏิทินการทำสะอาด');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แผนปฏิทินการทำสะอาด');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'มาตรฐานและแผนการหล่อลื่น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'มาตรฐานและแผนการหล่อลื่น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'มาตรฐานและแผนการตรวจสภาพ ปรับแต่ง ขันแน่น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'มาตรฐานและแผนการตรวจสภาพ ปรับแต่ง ขันแน่น');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Step 0 ขั้นตอนการเตรียมการ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Step 0 ขั้นตอนการเตรียมการ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Step 1 งานทำสะอาดเบื้องต้น (Initial Cleaning)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Step 1 งานทำสะอาดเบื้องต้น (Initial Cleaning)');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 17:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Step 2 การแก้ไขปัญหาที่ต้นเหตุ (SOC)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Step 2 การแก้ไขปัญหาที่ต้นเหตุ (SOC)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Step 3 การจัดทำมาตรฐานบำรุงรักษาเบื้องต้นด้วยตนเอง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Step 3 การจัดทำมาตรฐานบำรุงรักษาเบื้องต้นด้วยตนเอง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'นำเสนอผลดำเนินงาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'นำเสนอผลดำเนินงาน');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A บาท (Exclude VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course TPM004
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('TPM004', 'planned-maintenance', 'TPM', '1 วัน', '25 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'TPM การบำรุงรักษาตามแผน', 'หลักสูตรพัฒนาระบบบำรุงรักษาตามแผน 7 ขั้นตอน สำหรับฝ่ายซ่อมบำรุง เพื่อสนับสนุนการทำ Autonomous Maintenance และมุ่งสู่เป้าหมาย Zero Breakdown', 'ใน TPM เสา PM เป็นแกนสำคัญที่สนับสนุน AM และเชื่อมโยงการทำงานกับฝ่ายผลิต จัดซื้อ เทคนิค และความปลอดภัย เพื่อยกระดับประสิทธิภาพองค์กร มุ่งเป้าหมาย Zero Breakdown และลดต้นทุนการซ่อม', '1 วัน', '25 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Planned Maintenance (PM)', 'หลักสูตรพัฒนาระบบบำรุงรักษาตามแผน 7 ขั้นตอน สำหรับฝ่ายซ่อมบำรุง เพื่อสนับสนุนการทำ Autonomous Maintenance และมุ่งสู่เป้าหมาย Zero Breakdown', 'ใน TPM เสา PM เป็นแกนสำคัญที่สนับสนุน AM และเชื่อมโยงการทำงานกับฝ่ายผลิต จัดซื้อ เทคนิค และความปลอดภัย เพื่อยกระดับประสิทธิภาพองค์กร มุ่งเป้าหมาย Zero Breakdown และลดต้นทุนการซ่อม', '1 Day', '25 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สนับสนุนเสางาน Autonomous Maintenance (AM) เพื่อสู่เป้าหมายการเสียขัดข้องเป็นศูนย์');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สนับสนุนเสางาน Autonomous Maintenance (AM) เพื่อสู่เป้าหมายการเสียขัดข้องเป็นศูนย์');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'พัฒนาระบบบำรุงรักษา');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'พัฒนาระบบบำรุงรักษา');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้ ความเข้าใจการจัดทำข้อมูลบริหารเครื่องจักร มาตรฐาน และการวางแผนบำรุงรักษา');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้ ความเข้าใจการจัดทำข้อมูลบริหารเครื่องจักร มาตรฐาน และการวางแผนบำรุงรักษา');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ขั้นตอนดำเนินการ PM 7 Step By Step');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ขั้นตอนดำเนินการ PM 7 Step By Step');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายประกันคุณภาพ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายประกันคุณภาพ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร หัวหน้า ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร หัวหน้า ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานระดับผู้นำ (Leader)');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานระดับผู้นำ (Leader)');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายสนับสนุนส่งเสริมพัฒนาระบบงาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายสนับสนุนส่งเสริมพัฒนาระบบงาน');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'พื้นฐาน TPM และ PM');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'พื้นฐาน TPM และ PM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้ ความเข้าใจ TPM คืออะไร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้ ความเข้าใจ TPM คืออะไร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Planned Maintenance คืออะไร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Planned Maintenance คืออะไร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวคิด ลักษณะและจุดประสงค์ของการบำรุงรักษาตามแผน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวคิด ลักษณะและจุดประสงค์ของการบำรุงรักษาตามแผน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การแบ่งบทบาท หน้าที่ ความร่วมมือการบำรุงรักษา ระหว่างฝ่ายผลิต และฝ่ายซ่อม (Role Sharing)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การแบ่งบทบาท หน้าที่ ความร่วมมือการบำรุงรักษา ระหว่างฝ่ายผลิต และฝ่ายซ่อม (Role Sharing)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เปรียบเทียบความสัมพันธ์ระหว่าง AM 7 Step กับ PM 7 Step');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เปรียบเทียบความสัมพันธ์ระหว่าง AM 7 Step กับ PM 7 Step');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การดำเนินการบำรุงรักษาตามแผน 7 ขั้นตอน (PM 7 Step)');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การดำเนินการบำรุงรักษาตามแผน 7 ขั้นตอน (PM 7 Step)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'PM Step 0: ขั้นตอนการเตรียมการ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'PM Step 0: ขั้นตอนการเตรียมการ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'PM Step 1: ประเมินสภาพเครื่องจักรและสำรวจสภาพปัจจุบัน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'PM Step 1: ประเมินสภาพเครื่องจักรและสำรวจสภาพปัจจุบัน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'PM Step 2: การฟื้นฟูการเสื่อมสภาพและแก้ไขจุดอ่อน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'PM Step 2: การฟื้นฟูการเสื่อมสภาพและแก้ไขจุดอ่อน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'PM Step 3: สร้างระบบการบริหารข้อมูลบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'PM Step 3: สร้างระบบการบริหารข้อมูลบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'PM Step 4: สร้างระบบการบำรุงรักษาตามแผนเวลา (Preventive Maintenance System)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'PM Step 4: สร้างระบบการบำรุงรักษาตามแผนเวลา (Preventive Maintenance System)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'PM Step 5: สร้างระบบบำรุงรักษาพยากรณ์ (Predictive Maintenance)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'PM Step 5: สร้างระบบบำรุงรักษาพยากรณ์ (Predictive Maintenance)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'PM Step 6: ประเมินการบำรุงรักษาตามแผนงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'PM Step 6: ประเมินการบำรุงรักษาตามแผนงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 7);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'PM Step 7: การใช้เครื่องจักรอย่างคุ้มค่า');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'PM Step 7: การใช้เครื่องจักรอย่างคุ้มค่า');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความรู้ความเข้าใจ TPM คืออะไร จะมีอะไรเปลี่ยนแปลงและทำอย่างไร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความรู้ความเข้าใจ TPM คืออะไร จะมีอะไรเปลี่ยนแปลงและทำอย่างไร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Planned Maintenance คืออะไร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Planned Maintenance คืออะไร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวคิด ลักษณะและจุดประสงค์ของการบำรุงรักษาตามแผน (PM)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวคิด ลักษณะและจุดประสงค์ของการบำรุงรักษาตามแผน (PM)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Role Sharing');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Role Sharing');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เปรียบเทียบความสัมพันธ์ระหว่าง AM 7 Step กับ PM 7 Step');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เปรียบเทียบความสัมพันธ์ระหว่าง AM 7 Step กับ PM 7 Step');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Workshop บำรุงรักษาคุณภาพเชิงลึก');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Workshop บำรุงรักษาคุณภาพเชิงลึก');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'PM Step 0-7 ขั้นตอนการดำเนินการ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'PM Step 0-7 ขั้นตอนการดำเนินการ');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: Exclude VAT');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course TPM005
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('TPM005', 'focus-improvement', 'TPM', '1 วัน', '25 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'TPM การปรับปรุงเฉพาะเรื่องเพื่อลดความสูญเสีย', 'หลักสูตรเพื่อพัฒนาทักษะในการระบุปัญหา วิเคราะห์หาสาเหตุ และปรับปรุงเพื่อลดความสูญเสียในกระบวนการผลิตอย่างเป็นระบบ', 'Focused Improvement (FI) เป็นแนวทางสำคัญในการปรับปรุงงานเพื่อลดความสูญเสีย ความสูญเปล่า และต้นทุน เป็นหนึ่งในเสาหลักของ TPM ที่เน้นให้ทุกคนในองค์กรมีส่วนร่วม เพื่อสร้างวัฒนธรรมการทำงานที่เน้นการปรับปรุงอย่างไม่หยุดยั้ง', '1 วัน', '25 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Focus Improvement (FI)', 'หลักสูตรเพื่อพัฒนาทักษะในการระบุปัญหา วิเคราะห์หาสาเหตุ และปรับปรุงเพื่อลดความสูญเสียในกระบวนการผลิตอย่างเป็นระบบ', 'Focused Improvement (FI) เป็นแนวทางสำคัญในการปรับปรุงงานเพื่อลดความสูญเสีย ความสูญเปล่า และต้นทุน เป็นหนึ่งในเสาหลักของ TPM ที่เน้นให้ทุกคนในองค์กรมีส่วนร่วม เพื่อสร้างวัฒนธรรมการทำงานที่เน้นการปรับปรุงอย่างไม่หยุดยั้ง', '1 Day', '25 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สร้างความเข้าใจที่ถูกต้องเกี่ยวกับแนวคิดและบทบาทของ Focused Improvement (FI) ภายใต้ระบบ TPM');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สร้างความเข้าใจที่ถูกต้องเกี่ยวกับแนวคิดและบทบาทของ Focused Improvement (FI) ภายใต้ระบบ TPM');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ระบุความสูญเสีย/สูญเปล่าในกระบวนการทำงานได้อย่างเป็นระบบ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ระบุความสูญเสีย/สูญเปล่าในกระบวนการทำงานได้อย่างเป็นระบบ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ฝึกฝนการใช้เครื่องมือและขั้นตอน 10 ขั้นของการลดความสูญเสีย');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ฝึกฝนการใช้เครื่องมือและขั้นตอน 10 ขั้นของการลดความสูญเสีย');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'พัฒนาทักษะในการคำนวณประสิทธิภาพโดยรวมของเครื่องจักร (OEE) และเปรียบเทียบกับระดับ World Class');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'พัฒนาทักษะในการคำนวณประสิทธิภาพโดยรวมของเครื่องจักร (OEE) และเปรียบเทียบกับระดับ World Class');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้บริหารระดับกลาง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้บริหารระดับกลาง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการทุกฝ่าย');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการทุกฝ่าย');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานระดับผู้นำ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานระดับผู้นำ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายส่งเสริมพัฒนาระบบ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายส่งเสริมพัฒนาระบบ');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'พื้นฐาน FI');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'พื้นฐาน FI');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้ ความเข้าใจ TPM คืออะไร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้ ความเข้าใจ TPM คืออะไร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'FI: Focus Improvement คืออะไร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'FI: Focus Improvement คืออะไร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวคิดของการเพิ่มประสิทธิภาพการผลิต');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวคิดของการเพิ่มประสิทธิภาพการผลิต');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การปรับปรุงเพื่อขจัดการสูญเสียของเครื่องจักรให้เป็นศูนย์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การปรับปรุงเพื่อขจัดการสูญเสียของเครื่องจักรให้เป็นศูนย์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวคิดความสูญเสียแบบเรื้อรังกับความสูญเสียแบบฉับพลัน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวคิดความสูญเสียแบบเรื้อรังกับความสูญเสียแบบฉับพลัน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วิธีการคำนวณหาประสิทธิภาพโดยรวมของเครื่องจักร (OEE)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วิธีการคำนวณหาประสิทธิภาพโดยรวมของเครื่องจักร (OEE)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การลดความสูญเสีย');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การลดความสูญเสีย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'โครงสร้างความสูญเสียหลัก 16 ประการ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'โครงสร้างความสูญเสียหลัก 16 ประการ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความสูญเสียในงานสำนักงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความสูญเสียในงานสำนักงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเขียน Loss Tree Diagram');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเขียน Loss Tree Diagram');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การแบ่งระดับความสำคัญและขนาดของความสูญเสีย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การแบ่งระดับความสำคัญและขนาดของความสูญเสีย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เครื่องมือที่ใช้ในการปรับปรุงความสูญเสีย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เครื่องมือที่ใช้ในการปรับปรุงความสูญเสีย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอน 10 ขั้นตอนการปรับปรุงเพื่อลดความสูญเสีย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอน 10 ขั้นตอนการปรับปรุงเพื่อลดความสูญเสีย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ภาคปฏิบัติ Step By Step');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ภาคปฏิบัติ Step By Step');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความรู้ ความเข้าใจ TPM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความรู้ ความเข้าใจ TPM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'FI: Focus Improvement คืออะไร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'FI: Focus Improvement คืออะไร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวคิดของการเพิ่มประสิทธิภาพการผลิต');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวคิดของการเพิ่มประสิทธิภาพการผลิต');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การปรับปรุงเพื่อขจัดการสูญเสียของเครื่องจักรให้เป็นศูนย์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การปรับปรุงเพื่อขจัดการสูญเสียของเครื่องจักรให้เป็นศูนย์');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วิธีการคำนวณหาประสิทธิภาพโดยรวมของเครื่องจักร (OEE)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วิธีการคำนวณหาประสิทธิภาพโดยรวมของเครื่องจักร (OEE)');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'โครงสร้างความสูญเสียหลัก 16 ประการ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'โครงสร้างความสูญเสียหลัก 16 ประการ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การเขียน Loss Tree Diagram');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การเขียน Loss Tree Diagram');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เครื่องมือที่ใช้ในการปรับปรุงความสูญเสีย');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เครื่องมือที่ใช้ในการปรับปรุงความสูญเสีย');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอน 10 ขั้นตอนการปรับปรุงเพื่อลดความสูญเสีย');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอน 10 ขั้นตอนการปรับปรุงเพื่อลดความสูญเสีย');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ภาคปฏิบัติ Step By Step');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ภาคปฏิบัติ Step By Step');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 5);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ตัวอย่างจากการดำเนินการในโรงงานชั้นนำ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ตัวอย่างจากการดำเนินการในโรงงานชั้นนำ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 6);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ และแลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ และแลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A บาท (Exclude VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course TPM006
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('TPM006', 'quality-maintenance', 'TPM', '1 วัน', '25 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'TPM การบำรุงรักษาคุณภาพเพื่อเป้าหมาย Zero Defect', 'หลักสูตรพัฒนาระบบบำรุงรักษาคุณภาพ 7 ขั้นตอน ผ่าน QA Matrix เพื่อมุ่งสู่เป้าหมาย Zero Defect อย่างเป็นระบบ', 'ใน TPM ฝ่ายประกันคุณภาพมีหน้าที่พัฒนาระบบควบคุมคุณภาพอย่างต่อเนื่อง เพื่อมุ่งสู่เป้าหมาย Zero Defect โดยใช้เทคนิคการควบคุมกระบวนการผลิตอย่างเป็นระบบ และเชื่อมโยงข้อมูลระหว่างเงื่อนไขการผลิต เครื่องจักร และคุณภาพผ่าน QA Matrix', '1 วัน', '25 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Quality Maintenance (QM)', 'หลักสูตรพัฒนาระบบบำรุงรักษาคุณภาพ 7 ขั้นตอน ผ่าน QA Matrix เพื่อมุ่งสู่เป้าหมาย Zero Defect อย่างเป็นระบบ', 'ใน TPM ฝ่ายประกันคุณภาพมีหน้าที่พัฒนาระบบควบคุมคุณภาพอย่างต่อเนื่อง เพื่อมุ่งสู่เป้าหมาย Zero Defect โดยใช้เทคนิคการควบคุมกระบวนการผลิตอย่างเป็นระบบ และเชื่อมโยงข้อมูลระหว่างเงื่อนไขการผลิต เครื่องจักร และคุณภาพผ่าน QA Matrix', '1 Day', '25 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'แนวคิดและแนวทางการพัฒนาระบบบำรุงรักษาคุณภาพ (Quality Maintenance)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'แนวคิดและแนวทางการพัฒนาระบบบำรุงรักษาคุณภาพ (Quality Maintenance)');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจการประยุกต์ใช้เทคนิคหมายเลข 8 (Infinite Loop) เพื่อควบคุมและป้องกันการเกิดของเสีย');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจการประยุกต์ใช้เทคนิคหมายเลข 8 (Infinite Loop) เพื่อควบคุมและป้องกันการเกิดของเสีย');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สร้างและวิเคราะห์ QA Matrix เพื่อเชื่อมโยงเงื่อนไขกระบวนการผลิต เครื่องจักร และคุณภาพอย่างเป็นระบบ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สร้างและวิเคราะห์ QA Matrix เพื่อเชื่อมโยงเงื่อนไขกระบวนการผลิต เครื่องจักร และคุณภาพอย่างเป็นระบบ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ขั้นตอนการดำเนินงาน Quality Maintenance แบบ 7 ขั้นตอน (QM Step by Step)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ขั้นตอนการดำเนินงาน Quality Maintenance แบบ 7 ขั้นตอน (QM Step by Step)');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายประกันคุณภาพ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายประกันคุณภาพ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร หัวหน้า ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร หัวหน้า ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานระดับผู้นำ (Leader)');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานระดับผู้นำ (Leader)');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายสนับสนุนส่งเสริมพัฒนาระบบงาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายสนับสนุนส่งเสริมพัฒนาระบบงาน');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'พื้นฐาน QM');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'พื้นฐาน QM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความเข้าใจพื้นฐานของ TPM และแนวทางเปลี่ยนแปลงในการบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความเข้าใจพื้นฐานของ TPM และแนวทางเปลี่ยนแปลงในการบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวคิด จุดประสงค์ และความสำคัญของระบบบำรุงรักษาคุณภาพ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวคิด จุดประสงค์ และความสำคัญของระบบบำรุงรักษาคุณภาพ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เป้าหมายหลัก (KPI) ของ QM เช่น Zero Defect, Zero Complaint');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เป้าหมายหลัก (KPI) ของ QM เช่น Zero Defect, Zero Complaint');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วงจรบำรุงรักษาคุณภาพ 7 ขั้นตอน (QM 7 Step)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วงจรบำรุงรักษาคุณภาพ 7 ขั้นตอน (QM 7 Step)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'Maintenance Loop (Step 0,1,2,6,7)');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'Maintenance Loop (Step 0,1,2,6,7)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'QM Step 0: ขั้นตอนการเตรียมการ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'QM Step 0: ขั้นตอนการเตรียมการ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'QM Step 1: การตรวจสอบสถานะของของเสีย Defect');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'QM Step 1: การตรวจสอบสถานะของของเสีย Defect');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'QM Step 2: ตรวจสอบและทำ 4M ให้ได้มาตรฐาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'QM Step 2: ตรวจสอบและทำ 4M ให้ได้มาตรฐาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'QM Step 6: ปรับปรุงสภาพการทำงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'QM Step 6: ปรับปรุงสภาพการทำงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'QM Step 7: รักษาสภาวะที่ไม่ทำให้เกิดของเสีย Defect');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'QM Step 7: รักษาสภาวะที่ไม่ทำให้เกิดของเสีย Defect');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 2);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'Improvement Loop (Step 3,4,5)');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'Improvement Loop (Step 3,4,5)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'QM Step 3: วิเคราะห์สาเหตุที่ทำให้เกิด Defect');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'QM Step 3: วิเคราะห์สาเหตุที่ทำให้เกิด Defect');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'QM Step 4: กำจัดสาเหตุที่ทำให้เกิด Defect');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'QM Step 4: กำจัดสาเหตุที่ทำให้เกิด Defect');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'QM Step 5: สร้างสภาวะที่ไม่ทำให้เกิดของเสียและสร้างมาตรฐาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'QM Step 5: สร้างสภาวะที่ไม่ทำให้เกิดของเสียและสร้างมาตรฐาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'จัดทำ QM Matrix');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'จัดทำ QM Matrix');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความเข้าใจพื้นฐานของ TPM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความเข้าใจพื้นฐานของ TPM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวคิด จุดประสงค์ และความสำคัญของระบบบำรุงรักษาคุณภาพ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวคิด จุดประสงค์ และความสำคัญของระบบบำรุงรักษาคุณภาพ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เป้าหมายหลัก (KPI) ของ QM เช่น Zero Defect, Zero Complaint');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เป้าหมายหลัก (KPI) ของ QM เช่น Zero Defect, Zero Complaint');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วงจรบำรุงรักษาคุณภาพ 7 ขั้นตอน (QM 7 Step)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วงจรบำรุงรักษาคุณภาพ 7 ขั้นตอน (QM 7 Step)');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Workshop บำรุงรักษาคุณภาพเชิงลึก');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Workshop บำรุงรักษาคุณภาพเชิงลึก');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Maintenance Loop: Step 0,1,2,6,7');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Maintenance Loop: Step 0,1,2,6,7');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Improvement Loop: Step 3,4,5');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Improvement Loop: Step 3,4,5');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: Exclude VAT');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course TPM007
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('TPM007', 'early-management', 'TPM', '1 วัน', '25 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'TPM การพัฒนาโครงการและผลิตภัณฑ์ใหม่', 'หลักสูตรเน้นภาคปฏิบัติสำหรับฝ่ายโครงการและวิศวกรรม เพื่อออกแบบโครงการเชิงป้องกัน ลดปัญหาหน้างาน และให้เครื่องจักรหรือผลิตภัณฑ์ใหม่สามารถผลิตได้ทันทีโดยไม่มีปัญหา', 'EM (Early Management) เป็นแนวทางบริหารจัดการตั้งแต่ต้นทาง โดยวิเคราะห์ปัญหาจากการใช้งานจริง ทั้งด้านการผลิต คุณภาพ การซ่อมบำรุง และความปลอดภัย เพื่อนำมาวางแผนและออกแบบเชิงป้องกัน ช่วยให้โครงการเริ่มผลิตได้ทันที ลดปัญหาหน้างาน และเพิ่ม OEE', '1 วัน', '25 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Early Management (EM)', 'หลักสูตรเน้นภาคปฏิบัติสำหรับฝ่ายโครงการและวิศวกรรม เพื่อออกแบบโครงการเชิงป้องกัน ลดปัญหาหน้างาน และให้เครื่องจักรหรือผลิตภัณฑ์ใหม่สามารถผลิตได้ทันทีโดยไม่มีปัญหา', 'EM (Early Management) เป็นแนวทางบริหารจัดการตั้งแต่ต้นทาง โดยวิเคราะห์ปัญหาจากการใช้งานจริง ทั้งด้านการผลิต คุณภาพ การซ่อมบำรุง และความปลอดภัย เพื่อนำมาวางแผนและออกแบบเชิงป้องกัน ช่วยให้โครงการเริ่มผลิตได้ทันที ลดปัญหาหน้างาน และเพิ่ม OEE', '1 Day', '25 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'แนวคิดและวิธีการบำรุงรักษาที่ทุกคนมีส่วนร่วม');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'แนวคิดและวิธีการบำรุงรักษาที่ทุกคนมีส่วนร่วม');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ภาคปฏิบัติ: การออกแบบโครงการจำลองเครื่องจักรหรือผลิตภัณฑ์ใหม่');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ภาคปฏิบัติ: การออกแบบโครงการจำลองเครื่องจักรหรือผลิตภัณฑ์ใหม่');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ขั้นตอนการออกแบบโครงการและการควบคุมดูแลตั้งแต่เริ่มต้น');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ขั้นตอนการออกแบบโครงการและการควบคุมดูแลตั้งแต่เริ่มต้น');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'การออกแบบเชิงป้องกันเพื่อการบำรุงรักษา (Maintenance Prevention: MP)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'การออกแบบเชิงป้องกันเพื่อการบำรุงรักษา (Maintenance Prevention: MP)');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 4);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'แนวทางการออกแบบโครงการ 7 ขั้นตอน (7 Steps of Project Design)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'แนวทางการออกแบบโครงการ 7 ขั้นตอน (7 Steps of Project Design)');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายออกแบบ วิจัยและพัฒนา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายออกแบบ วิจัยและพัฒนา');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายโครงการ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายโครงการ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายสนับสนุนที่ส่งเสริมและพัฒนาระบบงาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายสนับสนุนที่ส่งเสริมและพัฒนาระบบงาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกรหัวหน้า ช่างเทคนิค และผู้นำระดับทีม (Leader)');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกรหัวหน้า ช่างเทคนิค และผู้นำระดับทีม (Leader)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'พื้นฐาน EM');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'พื้นฐาน EM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความสำคัญ TPM การบำรุงรักษาที่ทุกคนมีส่วนร่วม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความสำคัญ TPM การบำรุงรักษาที่ทุกคนมีส่วนร่วม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้ความเข้าใจ TPM คืออะไร มีองค์ประกอบและวิธีการอย่างไร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้ความเข้าใจ TPM คืออะไร มีองค์ประกอบและวิธีการอย่างไร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวคิด จุดประสงค์ และการควบคุมการออกแบบโครงการตั้งแต่ต้น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวคิด จุดประสงค์ และการควบคุมการออกแบบโครงการตั้งแต่ต้น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนด KPI สำคัญสำหรับการออกแบบโครงการ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนด KPI สำคัญสำหรับการออกแบบโครงการ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การดำเนินการออกแบบโครงการ 7 ขั้นตอน (EM 7 Step)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การดำเนินการออกแบบโครงการ 7 ขั้นตอน (EM 7 Step)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ภาคปฏิบัติ');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ภาคปฏิบัติ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความแตกต่างระหว่างการบริหารโครงการกับการออกแบบโครงการ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความแตกต่างระหว่างการบริหารโครงการกับการออกแบบโครงการ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ลักษณะงานโครงการและการจัดการเพื่อความสำเร็จ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ลักษณะงานโครงการและการจัดการเพื่อความสำเร็จ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การออกแบบโครงการเชิงป้องกัน (Maintenance Prevention: MP)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การออกแบบโครงการเชิงป้องกัน (Maintenance Prevention: MP)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'KPI และการควบคุมดูแลโครงการตั้งแต่ต้น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'KPI และการควบคุมดูแลโครงการตั้งแต่ต้น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การดำเนินงานออกแบบโครงการ 7 ขั้นตอน (EM 7 Step)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การดำเนินงานออกแบบโครงการ 7 ขั้นตอน (EM 7 Step)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การตรวจสอบโครงการด้วย Design Review (10 DR)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การตรวจสอบโครงการด้วย Design Review (10 DR)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำมาตรฐานและอบรมผู้เกี่ยวข้อง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำมาตรฐานและอบรมผู้เกี่ยวข้อง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 7);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การปิดงานโครงการ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การปิดงานโครงการ');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความสำคัญ TPM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความสำคัญ TPM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวคิด จุดประสงค์ การออกแบบโครงการตั้งแต่ต้น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวคิด จุดประสงค์ การออกแบบโครงการตั้งแต่ต้น');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การกำหนด KPI');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การกำหนด KPI');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'EM 7 Step');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'EM 7 Step');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความแตกต่างระหว่างการบริหารโครงการกับการออกแบบโครงการ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความแตกต่างระหว่างการบริหารโครงการกับการออกแบบโครงการ');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Maintenance Prevention (MP)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Maintenance Prevention (MP)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'KPI และการควบคุมดูแลโครงการ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'KPI และการควบคุมดูแลโครงการ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ภาคปฏิบัติ EM 7 Step');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ภาคปฏิบัติ EM 7 Step');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Design Review (10 DR)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Design Review (10 DR)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจัดทำมาตรฐานและปิดงานโครงการ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจัดทำมาตรฐานและปิดงานโครงการ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 5);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: Exclude VAT');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course TPM008
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('TPM008', 'office-improvement', 'TPM', '1 วัน', '25 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'TPM การบริหารสำนักงานอย่างมีประสิทธิภาพ', 'หลักสูตรภาคปฏิบัติสำหรับพนักงานสำนักงาน เพื่อลดความสูญเสียและสูญเปล่าในงานสำนักงาน สร้างสำนักงานให้เป็น Showroom ที่น่าทำงาน', 'สำนักงานสามารถเปรียบได้กับโรงงานการผลิตประเภทหนึ่ง เพียงแต่เปลี่ยนจากการผลิตสินค้า มาเป็นการผลิตเอกสาร การจัดการข้อมูล และการควบคุมกระบวนการต่างๆ หลักสูตรนี้นำแนวทาง FI, AM และ ET มาประยุกต์ใช้กับงานในสำนักงาน เพื่อลดความสูญเสียและเพิ่มประสิทธิภาพ', '1 วัน', '25 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Office Improvement (OI)', 'หลักสูตรภาคปฏิบัติสำหรับพนักงานสำนักงาน เพื่อลดความสูญเสียและสูญเปล่าในงานสำนักงาน สร้างสำนักงานให้เป็น Showroom ที่น่าทำงาน', 'สำนักงานสามารถเปรียบได้กับโรงงานการผลิตประเภทหนึ่ง เพียงแต่เปลี่ยนจากการผลิตสินค้า มาเป็นการผลิตเอกสาร การจัดการข้อมูล และการควบคุมกระบวนการต่างๆ หลักสูตรนี้นำแนวทาง FI, AM และ ET มาประยุกต์ใช้กับงานในสำนักงาน เพื่อลดความสูญเสียและเพิ่มประสิทธิภาพ', '1 Day', '25 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'พัฒนาความรู้และทักษะพนักงานในการค้นหาและลดความสูญเสียในสำนักงาน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'พัฒนาความรู้และทักษะพนักงานในการค้นหาและลดความสูญเสียในสำนักงาน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สร้างสำนักงานให้เป็น Showroom ที่น่าทำงาน มีระเบียบ และน่าอยู่');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สร้างสำนักงานให้เป็น Showroom ที่น่าทำงาน มีระเบียบ และน่าอยู่');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ลดความยุ่งยาก เพิ่มความสะดวก รวดเร็วในการทำงาน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ลดความยุ่งยาก เพิ่มความสะดวก รวดเร็วในการทำงาน');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายบริหาร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายบริหาร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายจัดหา-จัดซื้อ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายจัดหา-จัดซื้อ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายบุคคล');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายบุคคล');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้า พนักงานสำนักงาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้า พนักงานสำนักงาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายส่งเสริมพัฒนาระบบ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายส่งเสริมพัฒนาระบบ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้สนใจงานซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้สนใจงานซ่อมบำรุง');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'พื้นฐาน Office Improvement');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'พื้นฐาน Office Improvement');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้และความเข้าใจเกี่ยวกับ TPM คืออะไร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้และความเข้าใจเกี่ยวกับ TPM คืออะไร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้และความเข้าใจเกี่ยวกับการสูญเสียและสูญเปล่าในสำนักงาน (FI)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้และความเข้าใจเกี่ยวกับการสูญเสียและสูญเปล่าในสำนักงาน (FI)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เครื่องมือในการวิเคราะห์และลดความสูญเสียในแต่ละประเภท');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เครื่องมือในการวิเคราะห์และลดความสูญเสียในแต่ละประเภท');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เครื่องมือวิเคราะห์งาน: Makigami');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เครื่องมือวิเคราะห์งาน: Makigami');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอนการลดความสูญเสีย และการปรับปรุงงาน 7 ขั้นตอน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอนการลดความสูญเสีย และการปรับปรุงงาน 7 ขั้นตอน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดเป้าหมาย KPI');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดเป้าหมาย KPI');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การพัฒนาสำนักงาน');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การพัฒนาสำนักงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การพัฒนาสำนักงานให้เป็น Showroom ตามแนวทาง 4 ขั้นตอน (AM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การพัฒนาสำนักงานให้เป็น Showroom ตามแนวทาง 4 ขั้นตอน (AM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การส่งเสริมและพัฒนาความรู้ ทักษะ (ET) ในสำนักงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การส่งเสริมและพัฒนาความรู้ ทักษะ (ET) ในสำนักงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเชื่อมโยงกับ Pillar อื่นๆ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเชื่อมโยงกับ Pillar อื่นๆ');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความรู้และความเข้าใจเกี่ยวกับ TPM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความรู้และความเข้าใจเกี่ยวกับ TPM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความสูญเสียและสูญเปล่าในสำนักงาน (FI)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความสูญเสียและสูญเปล่าในสำนักงาน (FI)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เครื่องมือวิเคราะห์และลดความสูญเสีย');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เครื่องมือวิเคราะห์และลดความสูญเสีย');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เครื่องมือวิเคราะห์งาน Makigami');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เครื่องมือวิเคราะห์งาน Makigami');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอนการลดความสูญเสีย 7 ขั้นตอน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอนการลดความสูญเสีย 7 ขั้นตอน');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การพัฒนาสำนักงานให้เป็น Showroom 4 ขั้นตอน (AM)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การพัฒนาสำนักงานให้เป็น Showroom 4 ขั้นตอน (AM)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การส่งเสริมและพัฒนาความรู้ ทักษะ (ET)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การส่งเสริมและพัฒนาความรู้ ทักษะ (ET)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: Exclude VAT');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course TPM009
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('TPM009', 'education-and-training', 'TPM', '2 วัน', '25 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การอบรมพัฒนาและเสริมสร้างทักษะด้านเทคนิค', 'หลักสูตร 2 วัน สำหรับสร้างระบบการอบรมและพัฒนาบุคลากรภายในองค์กร รวมถึงการสร้างวิทยากรภายใน (Train The Trainer) และจัดตั้งศูนย์อบรมพัฒนาทางเทคนิค', '"คน" คือปัจจัยสำคัญต่อกำไร ความอยู่รอด และความสามารถในการแข่งขัน เสาหลักด้านการศึกษาและอบรม (Education and Training – ET) ใน TPM ช่วยพัฒนาทักษะและศักยภาพของบุคลากรให้พร้อมรับมือกับการเปลี่ยนแปลง การอบรมนี้มุ่งเน้นการจัดระบบอบรมและพัฒนาอย่างเป็นขั้นตอน มีโครงสร้างชัดเจน เน้นการลงมือทำจริงตามหลัก TPM', '2 วัน', '25 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Education and Training Practice (ET)', 'หลักสูตร 2 วัน สำหรับสร้างระบบการอบรมและพัฒนาบุคลากรภายในองค์กร รวมถึงการสร้างวิทยากรภายใน (Train The Trainer) และจัดตั้งศูนย์อบรมพัฒนาทางเทคนิค', '"คน" คือปัจจัยสำคัญต่อกำไร ความอยู่รอด และความสามารถในการแข่งขัน เสาหลักด้านการศึกษาและอบรม (Education and Training – ET) ใน TPM ช่วยพัฒนาทักษะและศักยภาพของบุคลากรให้พร้อมรับมือกับการเปลี่ยนแปลง การอบรมนี้มุ่งเน้นการจัดระบบอบรมและพัฒนาอย่างเป็นขั้นตอน มีโครงสร้างชัดเจน เน้นการลงมือทำจริงตามหลัก TPM', '2 Days', '25 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สร้างความเข้าใจในระบบการศึกษาและอบรมของ TPM');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สร้างความเข้าใจในระบบการศึกษาและอบรมของ TPM');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'วิเคราะห์ความต้องการในการฝึกอบรมและพัฒนาทักษะของบุคลากรได้อย่างถูกต้อง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'วิเคราะห์ความต้องการในการฝึกอบรมและพัฒนาทักษะของบุคลากรได้อย่างถูกต้อง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เรียนรู้วิธีการกำหนดระดับความรู้และทักษะของพนักงาน (Skill Level)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เรียนรู้วิธีการกำหนดระดับความรู้และทักษะของพนักงาน (Skill Level)');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ความรู้พื้นฐาน 6 Basic Maintenance');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ความรู้พื้นฐาน 6 Basic Maintenance');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 4);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เตรียมความพร้อมในการสร้างและพัฒนาวิทยากรภายในองค์กร');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เตรียมความพร้อมในการสร้างและพัฒนาวิทยากรภายในองค์กร');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้บริหาร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้บริหาร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'คณะทำงานการอบรมพัฒนา (Education and Training)');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'คณะทำงานการอบรมพัฒนา (Education and Training)');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานระดับหัวหน้า หรือผู้นำฝ่ายผลิต/ฝ่ายซ่อม/ฝ่าย QA');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานระดับหัวหน้า หรือผู้นำฝ่ายผลิต/ฝ่ายซ่อม/ฝ่าย QA');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'วันที่ 1: ระบบการอบรมและพัฒนา');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'วันที่ 1: ระบบการอบรมและพัฒนา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'บทบาทสำคัญของการจัดการศึกษาและอบรมพัฒนา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'บทบาทสำคัญของการจัดการศึกษาและอบรมพัฒนา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วงจรการสร้างระบบอบรมพัฒนา (Training Circle)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วงจรการสร้างระบบอบรมพัฒนา (Training Circle)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอนการจัดทำระบบการอบรมพัฒนา (ET Step)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอนการจัดทำระบบการอบรมพัฒนา (ET Step)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประเภทการอบรมพัฒนา (Training Type)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประเภทการอบรมพัฒนา (Training Type)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การแบ่งระดับการเรียนรู้และอบรม 4 ระดับ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การแบ่งระดับการเรียนรู้และอบรม 4 ระดับ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การแบ่งระดับ Level ความรู้ ความสามารถ ทักษะ 5 Level');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การแบ่งระดับ Level ความรู้ ความสามารถ ทักษะ 5 Level');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'วันที่ 2: ทักษะพื้นฐานและการสร้างวิทยากร');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'วันที่ 2: ทักษะพื้นฐานและการสร้างวิทยากร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้ ทักษะพื้นฐานงานบำรุงรักษาเครื่องจักร (6 Basic Maintenance): Bolt & Nut, Lubrication, Transmission, Basic Pneumatic, Basic Hydraulic, Basic Electric');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้ ทักษะพื้นฐานงานบำรุงรักษาเครื่องจักร (6 Basic Maintenance): Bolt & Nut, Lubrication, Transmission, Basic Pneumatic, Basic Hydraulic, Basic Electric');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำหลักสูตรและชุดแบบจำลอง (Model) เครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำหลักสูตรและชุดแบบจำลอง (Model) เครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดตั้งศูนย์อบรมพัฒนาทางเทคนิค (Technical Training Center)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดตั้งศูนย์อบรมพัฒนาทางเทคนิค (Technical Training Center)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วางแผนการศึกษาและอบรม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วางแผนการศึกษาและอบรม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วิธีการสร้างวิทยากรภายใน (Train The Trainer)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วิธีการสร้างวิทยากรภายใน (Train The Trainer)');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 1: 09:00 - 16:30', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'บทบาทสำคัญของการจัดการศึกษาและอบรมพัฒนา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'บทบาทสำคัญของการจัดการศึกษาและอบรมพัฒนา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วงจรการสร้างระบบอบรมพัฒนา (Training Circle)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วงจรการสร้างระบบอบรมพัฒนา (Training Circle)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอนการจัดทำระบบการอบรมพัฒนา (ET Step)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอนการจัดทำระบบการอบรมพัฒนา (ET Step)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ประเภทการอบรมพัฒนา (Training Type)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ประเภทการอบรมพัฒนา (Training Type)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การแบ่งระดับการเรียนรู้และอบรม 4 ระดับ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การแบ่งระดับการเรียนรู้และอบรม 4 ระดับ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 5);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การแบ่งระดับ Level ความรู้ ความสามารถ ทักษะ 5 Level');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การแบ่งระดับ Level ความรู้ ความสามารถ ทักษะ 5 Level');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 2: 09:00 - 16:30', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', '6 Basic Maintenance');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', '6 Basic Maintenance');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจัดทำหลักสูตรและชุดแบบจำลองเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจัดทำหลักสูตรและชุดแบบจำลองเครื่องจักร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจัดตั้งศูนย์อบรมพัฒนาทางเทคนิค (Technical Training Center)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจัดตั้งศูนย์อบรมพัฒนาทางเทคนิค (Technical Training Center)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วางแผนการศึกษาและอบรม');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วางแผนการศึกษาและอบรม');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วิธีการสร้างวิทยากรภายใน (Train The Trainer)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วิธีการสร้างวิทยากรภายใน (Train The Trainer)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 5);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ และแลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ และแลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A บาท (Exclude VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course SYS001
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('SYS001', 'overall-equipment-effectiveness', 'SYS', '1 วัน', '15 คน/รุ่น', 'N/A', '', 'new', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การวัดประสิทธิผลโดยรวมของเครื่องจักร', 'หลักสูตรสำหรับวิเคราะห์และปรับปรุงประสิทธิผลโดยรวมของเครื่องจักร (OEE) เพื่อลดความสูญเสีย', 'หลักสูตรสำหรับวิเคราะห์และปรับปรุงประสิทธิผลโดยรวมของเครื่องจักร (OEE) เพื่อลดความสูญเสีย เพิ่มประสิทธิภาพ และลดต้นทุนการผลิต', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Overall Equipment Effectiveness (OEE)', 'หลักสูตรสำหรับวิเคราะห์และปรับปรุงประสิทธิผลโดยรวมของเครื่องจักร (OEE) เพื่อลดความสูญเสีย', 'หลักสูตรสำหรับวิเคราะห์และปรับปรุงประสิทธิผลโดยรวมของเครื่องจักร (OEE) เพื่อลดความสูญเสีย เพิ่มประสิทธิภาพ และลดต้นทุนการผลิต', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจแนวคิดของ OEE');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจแนวคิดของ OEE');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจความสูญเสียหลัก 6 ประการ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจความสูญเสียหลัก 6 ประการ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'นำ OEE ไปประยุกต์ใช้ในองค์กรได้');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'นำ OEE ไปประยุกต์ใช้ในองค์กรได้');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานปฏิบัติการ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานปฏิบัติการ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้ใช้เครื่องจักร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้ใช้เครื่องจักร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการ');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'OEE Basics');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'OEE Basics');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความสูญเสีย 6 ประการของเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความสูญเสีย 6 ประการของเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'หลักการ OEE');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'หลักการ OEE');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวัดประสิทธิผลเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวัดประสิทธิผลเครื่องจักร');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'OEE Improvement');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'OEE Improvement');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วิเคราะห์และปรับปรุง OEE');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วิเคราะห์และปรับปรุง OEE');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวทางลดความสูญเสีย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวทางลดความสูญเสีย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'กรณีศึกษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'กรณีศึกษา');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'TPM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'TPM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความสูญเสีย 6 ประการ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความสูญเสีย 6 ประการ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวัด OEE');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวัด OEE');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การประยุกต์ใช้ OEE');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การประยุกต์ใช้ OEE');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์และปรับปรุง OEE');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์และปรับปรุง OEE');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'กรณีศึกษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'กรณีศึกษา');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'บรรยาย');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'บรรยาย');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'Workshop');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'Workshop');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 2);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'นำเสนอผลงาน');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'นำเสนอผลงาน');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');
INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 1);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'Whiteboard');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'Whiteboard');
INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 2);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'Flip Chart');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'Flip Chart');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ไม่รวมค่าเดินทางและที่พัก');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course SYS002
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('SYS002', 'maintenance-management-for-executives', 'SYS', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การบริหารงานบำรุงรักษาสำหรับผู้บริหาร', 'หลักสูตรสำหรับพัฒนาระบบบริหารงานบำรุงรักษาในโรงงานอุตสาหกรรม เพื่อเพิ่มประสิทธิภาพการทำงานของเครื่องจักร', 'หลักสูตรสำหรับพัฒนาระบบบริหารงานบำรุงรักษาในโรงงานอุตสาหกรรม เพื่อเพิ่มประสิทธิภาพการทำงานของเครื่องจักร ลดความเสียหาย ลดต้นทุน และเพิ่มประสิทธิผลในการผลิต', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Maintenance Management for Executives', 'หลักสูตรสำหรับพัฒนาระบบบริหารงานบำรุงรักษาในโรงงานอุตสาหกรรม เพื่อเพิ่มประสิทธิภาพการทำงานของเครื่องจักร', 'หลักสูตรสำหรับพัฒนาระบบบริหารงานบำรุงรักษาในโรงงานอุตสาหกรรม เพื่อเพิ่มประสิทธิภาพการทำงานของเครื่องจักร ลดความเสียหาย ลดต้นทุน และเพิ่มประสิทธิผลในการผลิต', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'การพัฒนาระบบงานซ่อมบำรุง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'การพัฒนาระบบงานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'จัดทำระบบซ่อมบำรุงเชิงรุกและเชิงป้องกัน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'จัดทำระบบซ่อมบำรุงเชิงรุกและเชิงป้องกัน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'พัฒนาระบบประกันคุณภาพงานซ่อมบำรุง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'พัฒนาระบบประกันคุณภาพงานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ประยุกต์ใช้คอมพิวเตอร์ในงานซ่อมบำรุง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ประยุกต์ใช้คอมพิวเตอร์ในงานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 4);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'วัดและประเมินผลระบบซ่อมบำรุง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'วัดและประเมินผลระบบซ่อมบำรุง');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการโรงงาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการโรงงาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้สนใจทั่วไป');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้สนใจทั่วไป');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การพัฒนาระบบบำรุงรักษา');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การพัฒนาระบบบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Proactive Maintenance (PoM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Proactive Maintenance (PoM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Breakdown Maintenance (BM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Breakdown Maintenance (BM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Preventive Maintenance (PM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Preventive Maintenance (PM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Predictive Maintenance (PdM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Predictive Maintenance (PdM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Corrective Maintenance (CM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Corrective Maintenance (CM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Reliability Centered Maintenance (RCM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Reliability Centered Maintenance (RCM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Total Productive Maintenance (TPM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Total Productive Maintenance (TPM)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'วิธีการเลือกระบบบำรุงรักษา');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'วิธีการเลือกระบบบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เลือกระบบบำรุงรักษาให้เหมาะสมกับเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เลือกระบบบำรุงรักษาให้เหมาะสมกับเครื่องจักร');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 2);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ระบบ Predictive Maintenance');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ระบบ Predictive Maintenance');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ตรวจวัดสุขภาพเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ตรวจวัดสุขภาพเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ทำนายอายุการใช้งานเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ทำนายอายุการใช้งานเครื่องจักร');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 3);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'Computerized Maintenance');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'Computerized Maintenance');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'โปรแกรมออกใบแจ้งงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'โปรแกรมออกใบแจ้งงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'โปรแกรมวางแผนบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'โปรแกรมวางแผนบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'โปรแกรมติดตามประวัติการซ่อม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'โปรแกรมติดตามประวัติการซ่อม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'โปรแกรมบริหารอะไหล่');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'โปรแกรมบริหารอะไหล่');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การพัฒนาระบบบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การพัฒนาระบบบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วิธีการเลือกระบบบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วิธีการเลือกระบบบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Predictive Maintenance');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Predictive Maintenance');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Skill Development');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Skill Development');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'TPM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'TPM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การใช้คอมพิวเตอร์บริหารงานซ่อมบำรุง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การใช้คอมพิวเตอร์บริหารงานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'KPI งานซ่อมบำรุง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'KPI งานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ถามตอบและแลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ถามตอบและแลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยาย');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยาย');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'Workshop');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'Workshop');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 2);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'ให้คำปรึกษาโดยผู้เชี่ยวชาญ');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'ให้คำปรึกษาโดยผู้เชี่ยวชาญ');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: Exclude VAT');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course SYS003
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('SYS003', 'maintenance-planning-kpi-evaluation', 'SYS', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การวางแผนและการประเมินผลบำรุงรักษาด้วย KPI', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะการวางแผนบำรุงรักษาและการวัดผลความสำเร็จด้วย KPI ในโรงงานอุตสาหกรรม', 'การวางแผนบำรุงรักษาและการวัดผลความสำเร็จอย่างต่อเนื่องเป็นสิ่งจำเป็น ครอบคลุมตั้งแต่การบริหารจัดการเครื่องจักร การจัดการข้อมูล มาตรฐานการบำรุงรักษา การวางแผนปฏิทินงาน ไปจนถึงการวัดและประเมินผล (KPI)', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Maintenance Planning and KPI Evaluation', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะการวางแผนบำรุงรักษาและการวัดผลความสำเร็จด้วย KPI ในโรงงานอุตสาหกรรม', 'การวางแผนบำรุงรักษาและการวัดผลความสำเร็จอย่างต่อเนื่องเป็นสิ่งจำเป็น ครอบคลุมตั้งแต่การบริหารจัดการเครื่องจักร การจัดการข้อมูล มาตรฐานการบำรุงรักษา การวางแผนปฏิทินงาน ไปจนถึงการวัดและประเมินผล (KPI)', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้และความเข้าใจในระบบบำรุงรักษา พร้อมสามารถวางแผนบำรุงรักษาตามปฏิทิน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้และความเข้าใจในระบบบำรุงรักษา พร้อมสามารถวางแผนบำรุงรักษาตามปฏิทิน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจและสามารถกำหนดหัวข้อการวัดและประเมินความสำเร็จ (KPI)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจและสามารถกำหนดหัวข้อการวัดและประเมินความสำเร็จ (KPI)');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'พัฒนาระบบบำรุงรักษาให้มีประสิทธิภาพสูงขึ้นอย่างต่อเนื่อง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'พัฒนาระบบบำรุงรักษาให้มีประสิทธิภาพสูงขึ้นอย่างต่อเนื่อง');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การวางแผนและมาตรฐานบำรุงรักษา');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การวางแผนและมาตรฐานบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'โครงสร้างและปัจจัยสำคัญของการทำระบบบำรุงรักษา (PM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'โครงสร้างและปัจจัยสำคัญของการทำระบบบำรุงรักษา (PM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำข้อมูลเครื่องจักรและการจัดลำดับความสำคัญ (A, B, C)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำข้อมูลเครื่องจักรและการจัดลำดับความสำคัญ (A, B, C)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำข้อมูลอุปกรณ์เครื่องจักรโรงงาน (Plant Data)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำข้อมูลอุปกรณ์เครื่องจักรโรงงาน (Plant Data)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำรายการมาตรฐานการบำรุงรักษาเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำรายการมาตรฐานการบำรุงรักษาเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เทคนิคการวางแผนปฏิทินการบำรุงรักษา (รายวัน รายสัปดาห์ รายเดือน รายปี)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เทคนิคการวางแผนปฏิทินการบำรุงรักษา (รายวัน รายสัปดาห์ รายเดือน รายปี)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ตัวอย่างการออกแบบเอกสารมาตรฐาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ตัวอย่างการออกแบบเอกสารมาตรฐาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การประยุกต์ใช้โปรแกรมวางแผนระบบบำรุงรักษา (สาธิตโปรแกรม PMTECH)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การประยุกต์ใช้โปรแกรมวางแผนระบบบำรุงรักษา (สาธิตโปรแกรม PMTECH)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การวัดและประเมินผล (KPI)');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การวัดและประเมินผล (KPI)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความพร้อมเดินเครื่องจักร (MAF: Machine Availability Factor)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความพร้อมเดินเครื่องจักร (MAF: Machine Availability Factor)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประสิทธิภาพการเดินเครื่องจักร (RF: Run Factor)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประสิทธิภาพการเดินเครื่องจักร (RF: Run Factor)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การสูญเสียจากเครื่องจักรฉุกเฉิน (Breakdown: BD)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การสูญเสียจากเครื่องจักรฉุกเฉิน (Breakdown: BD)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เวลาเฉลี่ยระหว่างการขัดข้อง (MTBF: Mean Time Between Failure)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เวลาเฉลี่ยระหว่างการขัดข้อง (MTBF: Mean Time Between Failure)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เวลาเฉลี่ยการซ่อม (MTTR: Mean Time to Repair)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เวลาเฉลี่ยการซ่อม (MTTR: Mean Time to Repair)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'งบประมาณและการควบคุมค่าใช้จ่าย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'งบประมาณและการควบคุมค่าใช้จ่าย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประสิทธิภาพโดยรวม (OEE: Overall Equipment Effectiveness)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประสิทธิภาพโดยรวม (OEE: Overall Equipment Effectiveness)');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'โครงสร้างและปัจจัยสำคัญของการทำระบบบำรุงรักษา (PM)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'โครงสร้างและปัจจัยสำคัญของการทำระบบบำรุงรักษา (PM)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจัดทำข้อมูลเครื่องจักรและการจัดลำดับความสำคัญ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจัดทำข้อมูลเครื่องจักรและการจัดลำดับความสำคัญ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจัดทำรายการมาตรฐานการบำรุงรักษาเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจัดทำรายการมาตรฐานการบำรุงรักษาเครื่องจักร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เทคนิคการวางแผนปฏิทินการบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เทคนิคการวางแผนปฏิทินการบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ตัวอย่างการออกแบบเอกสารมาตรฐาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ตัวอย่างการออกแบบเอกสารมาตรฐาน');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การประยุกต์ใช้โปรแกรมวางแผนระบบบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การประยุกต์ใช้โปรแกรมวางแผนระบบบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวัดและประเมินผลความสำเร็จ (KPI)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวัดและประเมินผลความสำเร็จ (KPI)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'งบประมาณและการควบคุมค่าใช้จ่าย');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'งบประมาณและการควบคุมค่าใช้จ่าย');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ประสิทธิภาพโดยรวม (OEE)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ประสิทธิภาพโดยรวม (OEE)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การทำและวิเคราะห์รายงานกราฟประสิทธิภาพเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การทำและวิเคราะห์รายงานกราฟประสิทธิภาพเครื่องจักร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 5);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'ภาคปฏิบัติ');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'ภาคปฏิบัติ');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course SYS004
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('SYS004', 'spare-parts-management-maintenance', 'SYS', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การจัดการระบบคลังอะไหล่สำหรับงานซ่อมบำรุง', 'หลักสูตรเพื่อพัฒนาทักษะการบริหารจัดการวัสดุและอะไหล่ซ่อมบำรุง ควบคุมปริมาณสต๊อก Min-Max และลดต้นทุนค่าใช้จ่าย', 'ในโรงงานอุตสาหกรรม มักเสียเวลามากกับการจัดหาอะไหล่มากกว่าการซ่อมจริง ปัญหาเบิกอะไหล่แล้วไม่มี หรือมีแต่ไม่ตรงความต้องการ สามารถลดลงได้ด้วยระบบบริหารอะไหล่ที่มีประสิทธิภาพ ควบคุมปริมาณ MAX-MIN พร้อมใช้งานได้ทันที', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Spare Parts Management for Maintenance', 'หลักสูตรเพื่อพัฒนาทักษะการบริหารจัดการวัสดุและอะไหล่ซ่อมบำรุง ควบคุมปริมาณสต๊อก Min-Max และลดต้นทุนค่าใช้จ่าย', 'ในโรงงานอุตสาหกรรม มักเสียเวลามากกับการจัดหาอะไหล่มากกว่าการซ่อมจริง ปัญหาเบิกอะไหล่แล้วไม่มี หรือมีแต่ไม่ตรงความต้องการ สามารถลดลงได้ด้วยระบบบริหารอะไหล่ที่มีประสิทธิภาพ ควบคุมปริมาณ MAX-MIN พร้อมใช้งานได้ทันที', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ความรู้และความเข้าใจในการพัฒนาระบบบริหารจัดการวัสดุและอะไหล่');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ความรู้และความเข้าใจในการพัฒนาระบบบริหารจัดการวัสดุและอะไหล่');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ครอบคลุมวิธีการคำนวณและกำหนดปริมาณ Min-Max');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ครอบคลุมวิธีการคำนวณและกำหนดปริมาณ Min-Max');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'รวมถึงการตั้งเป้าหมายและวางระบบการจัดการวัสดุอะไหล่อย่างมีประสิทธิภาพ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'รวมถึงการตั้งเป้าหมายและวางระบบการจัดการวัสดุอะไหล่อย่างมีประสิทธิภาพ');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายวางแผนบำรุงรักษา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายวางแผนบำรุงรักษา');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานบำรุงรักษา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานบำรุงรักษา');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้รับผิดชอบการจัดหา จัดซื้อ การบริหารการจัดเก็บวัสดุอะไหล่');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้รับผิดชอบการจัดหา จัดซื้อ การบริหารการจัดเก็บวัสดุอะไหล่');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ระบบบำรุงรักษาและการบริหารอะไหล่');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ระบบบำรุงรักษาและการบริหารอะไหล่');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประเภทงานของระบบบำรุงรักษา (Maintenance System)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประเภทงานของระบบบำรุงรักษา (Maintenance System)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความสัมพันธ์กับระบบบริหารวัสดุและอะไหล่ซ่อม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความสัมพันธ์กับระบบบริหารวัสดุและอะไหล่ซ่อม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความสำคัญของการบริหารวัสดุและอะไหล่ซ่อม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความสำคัญของการบริหารวัสดุและอะไหล่ซ่อม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดนโยบายการบริหารจัดการอะไหล่');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดนโยบายการบริหารจัดการอะไหล่');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำระบบบริหารจัดการวัสดุและอะไหล่');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำระบบบริหารจัดการวัสดุและอะไหล่');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ระบบการจัดการอะไหล่และ Min-Max');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ระบบการจัดการอะไหล่และ Min-Max');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจำแนกประเภทวัสดุและอะไหล่ด้วย ABC Analysis');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจำแนกประเภทวัสดุและอะไหล่ด้วย ABC Analysis');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประเภทวัสดุและอะไหล่วิกฤต (Insurance Item)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประเภทวัสดุและอะไหล่วิกฤต (Insurance Item)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประเภทอะไหล่ซ่อมฉุกเฉิน (Breakdown) และซ่อมตามแผน (MRP)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประเภทอะไหล่ซ่อมฉุกเฉิน (Breakdown) และซ่อมตามแผน (MRP)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระดับสั่งซื้อและจำนวนคุ้มค่าที่สุด (EOQ: Economic Order Quantity)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระดับสั่งซื้อและจำนวนคุ้มค่าที่สุด (EOQ: Economic Order Quantity)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดจุดสั่งซื้อ (ROP: Reorder Point)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดจุดสั่งซื้อ (ROP: Reorder Point)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดจำนวนสต๊อก Min-Max');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดจำนวนสต๊อก Min-Max');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'โปรแกรมสาธิตการบริหารจัดการวัสดุและอะไหล่ (SPMM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'โปรแกรมสาธิตการบริหารจัดการวัสดุและอะไหล่ (SPMM)');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ประเภทงานของระบบบำรุงรักษา (Maintenance System)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ประเภทงานของระบบบำรุงรักษา (Maintenance System)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความสำคัญของการบริหารวัสดุและอะไหล่ซ่อม');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความสำคัญของการบริหารวัสดุและอะไหล่ซ่อม');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การกำหนดนโยบายการบริหารจัดการอะไหล่');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การกำหนดนโยบายการบริหารจัดการอะไหล่');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจัดทำระบบบริหารจัดการวัสดุและอะไหล่');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจัดทำระบบบริหารจัดการวัสดุและอะไหล่');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ระบบการจัดการอะไหล่งานซ่อมบำรุง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ระบบการจัดการอะไหล่งานซ่อมบำรุง');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ระดับสั่งซื้อและจำนวนคุ้มค่าที่สุด (EOQ)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ระดับสั่งซื้อและจำนวนคุ้มค่าที่สุด (EOQ)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การกำหนดจุดสั่งซื้อ (ROP)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การกำหนดจุดสั่งซื้อ (ROP)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การกำหนดจำนวนสต๊อก Min-Max');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การกำหนดจำนวนสต๊อก Min-Max');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ตัวอย่างและรูปแบบการจัดการที่ประยุกต์ใช้ได้จริง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ตัวอย่างและรูปแบบการจัดการที่ประยุกต์ใช้ได้จริง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'โปรแกรมสาธิตการบริหารจัดการวัสดุและอะไหล่ (SPMM)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'โปรแกรมสาธิตการบริหารจัดการวัสดุและอะไหล่ (SPMM)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 5);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ และแลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ และแลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'ภาคปฏิบัติ');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'ภาคปฏิบัติ');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course SYS005
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('SYS005', 'machine-maintenance-standard-system', 'SYS', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การจัดทำระบบมาตรฐานงานบำรุงรักษาเครื่องจักร อุปกรณ์การผลิต', 'หลักสูตรเพื่อพัฒนาทักษะการเขียนและจัดทำรายการมาตรฐานการบำรุงรักษาเครื่องจักร ช่วยลดการหยุดผลิต และเพิ่มประสิทธิภาพการผลิตระยะยาว', 'หลายองค์กรยังขาดมาตรฐานในการบำรุงรักษาที่ชัดเจน ส่งผลให้เครื่องจักรขัดข้องบ่อย ซ่อมล่าช้า และสิ้นเปลืองต้นทุน การจัดทำ ''รายการมาตรฐานบำรุงรักษาเครื่องจักร'' เป็นพื้นฐานที่ช่วยให้การบำรุงรักษาทั้ง Autonomous Maintenance และ Planned Maintenance มีทิศทางเดียวกัน', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Machine Maintenance Standard System Development', 'หลักสูตรเพื่อพัฒนาทักษะการเขียนและจัดทำรายการมาตรฐานการบำรุงรักษาเครื่องจักร ช่วยลดการหยุดผลิต และเพิ่มประสิทธิภาพการผลิตระยะยาว', 'หลายองค์กรยังขาดมาตรฐานในการบำรุงรักษาที่ชัดเจน ส่งผลให้เครื่องจักรขัดข้องบ่อย ซ่อมล่าช้า และสิ้นเปลืองต้นทุน การจัดทำ ''รายการมาตรฐานบำรุงรักษาเครื่องจักร'' เป็นพื้นฐานที่ช่วยให้การบำรุงรักษาทั้ง Autonomous Maintenance และ Planned Maintenance มีทิศทางเดียวกัน', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้ ความเข้าใจเกี่ยวกับระบบและแนวทางการบำรุงรักษาตามแผน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้ ความเข้าใจเกี่ยวกับระบบและแนวทางการบำรุงรักษาตามแผน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ฝึกทักษะการเขียนและจัดทำรายการมาตรฐานการบำรุงรักษาเครื่องจักรประเภทต่างๆ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ฝึกทักษะการเขียนและจัดทำรายการมาตรฐานการบำรุงรักษาเครื่องจักรประเภทต่างๆ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สามารถแยกแยะขอบเขตความรับผิดชอบระหว่างฝ่ายผลิตและฝ่ายซ่อมบำรุงได้อย่างชัดเจน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สามารถแยกแยะขอบเขตความรับผิดชอบระหว่างฝ่ายผลิตและฝ่ายซ่อมบำรุงได้อย่างชัดเจน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สามารถนำข้อมูลจากการอบรมไปใช้เป็นคู่มือหรือแนวทางในงานบำรุงรักษาจริงได้ทันที');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สามารถนำข้อมูลจากการอบรมไปใช้เป็นคู่มือหรือแนวทางในงานบำรุงรักษาจริงได้ทันที');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ระบบบำรุงรักษาเชิงป้องกันและเทคนิค');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ระบบบำรุงรักษาเชิงป้องกันและเทคนิค');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประเภทงานของระบบการบำรุงรักษาเชิงป้องกัน (PM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประเภทงานของระบบการบำรุงรักษาเชิงป้องกัน (PM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เทคนิคการบำรุงรักษาเครื่องจักรกล: สายพานส่งกำลัง, โซ่ส่งกำลัง, ปั๊มน้ำ, การติดตั้งเครื่องจักร, ไฮดรอลิก / นิวเมติกส์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เทคนิคการบำรุงรักษาเครื่องจักรกล: สายพานส่งกำลัง, โซ่ส่งกำลัง, ปั๊มน้ำ, การติดตั้งเครื่องจักร, ไฮดรอลิก / นิวเมติกส์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วิธีการเขียนรายการมาตรฐานบำรุงรักษาเครื่องจักร อุปกรณ์การผลิต');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วิธีการเขียนรายการมาตรฐานบำรุงรักษาเครื่องจักร อุปกรณ์การผลิต');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบำรุงรักษาด้วยตนเอง (Autonomous Maintenance)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบำรุงรักษาด้วยตนเอง (Autonomous Maintenance)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบำรุงรักษาตามแผน (Planned Maintenance: PM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบำรุงรักษาตามแผน (Planned Maintenance: PM)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ปฏิบัติการจัดทำมาตรฐาน');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ปฏิบัติการจัดทำมาตรฐาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ปฏิบัติการจัดทำรายการมาตรฐานบำรุงรักษาเครื่องจักร อุปกรณ์การผลิตประเภทต่างๆ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ปฏิบัติการจัดทำรายการมาตรฐานบำรุงรักษาเครื่องจักร อุปกรณ์การผลิตประเภทต่างๆ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดหมายเลขรหัสงานบำรุงรักษา เพื่อขยายผลนำไปใช้เครื่องจักรอื่น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดหมายเลขรหัสงานบำรุงรักษา เพื่อขยายผลนำไปใช้เครื่องจักรอื่น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ตัวอย่างแบบฟอร์มการจัดทำรายการและการใช้งานแบบต่างๆ นำไปใช้งานได้ทันที');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ตัวอย่างแบบฟอร์มการจัดทำรายการและการใช้งานแบบต่างๆ นำไปใช้งานได้ทันที');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ประเภทงานของระบบการบำรุงรักษาเชิงป้องกัน (PM)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ประเภทงานของระบบการบำรุงรักษาเชิงป้องกัน (PM)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เทคนิคการบำรุงรักษาเครื่องจักรกล');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เทคนิคการบำรุงรักษาเครื่องจักรกล');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วิธีการเขียนรายการมาตรฐานบำรุงรักษาเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วิธีการเขียนรายการมาตรฐานบำรุงรักษาเครื่องจักร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การบำรุงรักษาด้วยตนเอง (AM) และการบำรุงรักษาตามแผน (PM)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การบำรุงรักษาด้วยตนเอง (AM) และการบำรุงรักษาตามแผน (PM)');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ปฏิบัติการจัดทำรายการมาตรฐานบำรุงรักษาเครื่องจักร อุปกรณ์การผลิตประเภทต่างๆ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ปฏิบัติการจัดทำรายการมาตรฐานบำรุงรักษาเครื่องจักร อุปกรณ์การผลิตประเภทต่างๆ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การกำหนดหมายเลขรหัสงานบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การกำหนดหมายเลขรหัสงานบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ตัวอย่างแบบฟอร์มและการใช้งาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ตัวอย่างแบบฟอร์มและการใช้งาน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ และแลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ และแลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การจัดทำรายการมาตรฐานบำรุงรักษาเครื่องจักร');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การจัดทำรายการมาตรฐานบำรุงรักษาเครื่องจักร');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course SYS006
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('SYS006', 'strategic-maintenance-planning', 'SYS', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การวางแผนระบบบำรุงรักษาเชิงกลยุทธ์เพื่อเป้าหมายองค์กร', 'หลักสูตรเพื่อพัฒนาทักษะการวางระบบบำรุงรักษาเชิงกลยุทธ์ มุ่งสู่เป้าหมาย Zero Breakdown เพิ่ม OEE และลดค่าใช้จ่ายองค์กร', 'ยุคใหม่ได้พัฒนาระบบให้เครื่องจักรเสียฉุกเฉินเป็นศูนย์ (Zero Breakdown) โดยผู้บริหารกำหนดนโยบายให้พนักงานฝ่ายผลิตมีส่วนร่วมดูแลบำรุงรักษาเบื้องต้น ขณะที่ฝ่ายซ่อมพัฒนาระบบตั้งแต่ Proactive ไปจนถึง Predictive Maintenance หลักสูตรนี้เน้นประสบการณ์ภาคปฏิบัติจริง', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Strategic Maintenance Planning for Organizational Goals', 'หลักสูตรเพื่อพัฒนาทักษะการวางระบบบำรุงรักษาเชิงกลยุทธ์ มุ่งสู่เป้าหมาย Zero Breakdown เพิ่ม OEE และลดค่าใช้จ่ายองค์กร', 'ยุคใหม่ได้พัฒนาระบบให้เครื่องจักรเสียฉุกเฉินเป็นศูนย์ (Zero Breakdown) โดยผู้บริหารกำหนดนโยบายให้พนักงานฝ่ายผลิตมีส่วนร่วมดูแลบำรุงรักษาเบื้องต้น ขณะที่ฝ่ายซ่อมพัฒนาระบบตั้งแต่ Proactive ไปจนถึง Predictive Maintenance หลักสูตรนี้เน้นประสบการณ์ภาคปฏิบัติจริง', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้และความเข้าใจเกี่ยวกับการพัฒนาระบบบำรุงรักษา');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้และความเข้าใจเกี่ยวกับการพัฒนาระบบบำรุงรักษา');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เรียนรู้วิธีการกำหนดเป้าหมายมุ่งสู่การบรรลุ Zero Breakdown');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เรียนรู้วิธีการกำหนดเป้าหมายมุ่งสู่การบรรลุ Zero Breakdown');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'พัฒนาทักษะของผู้เข้าอบรมและพนักงานในการดูแลและบำรุงรักษาเครื่องจักร');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'พัฒนาทักษะของผู้เข้าอบรมและพนักงานในการดูแลและบำรุงรักษาเครื่องจักร');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายสนับสนุนและส่งเสริมพัฒนาระบบงาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายสนับสนุนและส่งเสริมพัฒนาระบบงาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การเตรียมการสู่ Zero Breakdown');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การเตรียมการสู่ Zero Breakdown');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอนการเตรียมการสู่ระบบ Zero Breakdown Maintenance');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอนการเตรียมการสู่ระบบ Zero Breakdown Maintenance');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเลือกเครื่องจักรนำร่อง (Machine Model)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเลือกเครื่องจักรนำร่อง (Machine Model)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดนิยามและเป้าหมายของ Zero Breakdown');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดนิยามและเป้าหมายของ Zero Breakdown');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การสร้างระบบบำรุงรักษาเพื่อมุ่งสู่เป้าหมาย Zero Breakdown');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การสร้างระบบบำรุงรักษาเพื่อมุ่งสู่เป้าหมาย Zero Breakdown');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การมีส่วนร่วมของฝ่ายผลิตในการบำรุงรักษาเบื้องต้น (Autonomous Maintenance)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การมีส่วนร่วมของฝ่ายผลิตในการบำรุงรักษาเบื้องต้น (Autonomous Maintenance)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การพัฒนาระบบบำรุงรักษาเชิงรุก (Proactive Maintenance) โดยฝ่ายซ่อม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การพัฒนาระบบบำรุงรักษาเชิงรุก (Proactive Maintenance) โดยฝ่ายซ่อม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การพัฒนาระบบบำรุงรักษาตามแผน (Preventive Maintenance: PM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การพัฒนาระบบบำรุงรักษาตามแผน (Preventive Maintenance: PM)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'Predictive Maintenance และดิจิทัล');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'Predictive Maintenance และดิจิทัล');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การสร้างระบบตรวจวัดสภาพและทำนายอายุการใช้งาน (Predictive Maintenance)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การสร้างระบบตรวจวัดสภาพและทำนายอายุการใช้งาน (Predictive Maintenance)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เทคนิคการทำนายอายุการใช้งานเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เทคนิคการทำนายอายุการใช้งานเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การสาธิตเครื่องมือและอุปกรณ์สำหรับตรวจวัดและบำรุงรักษาเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การสาธิตเครื่องมือและอุปกรณ์สำหรับตรวจวัดและบำรุงรักษาเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระบบบำรุงรักษาดิจิทัล (Digital Maintenance)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระบบบำรุงรักษาดิจิทัล (Digital Maintenance)');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอนการเตรียมการสู่ระบบ Zero Breakdown Maintenance');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอนการเตรียมการสู่ระบบ Zero Breakdown Maintenance');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การเลือกเครื่องจักรนำร่อง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การเลือกเครื่องจักรนำร่อง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การกำหนดนิยามและเป้าหมายของ Zero Breakdown');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การกำหนดนิยามและเป้าหมายของ Zero Breakdown');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การสร้างระบบบำรุงรักษาเพื่อมุ่งสู่เป้าหมาย Zero Breakdown');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การสร้างระบบบำรุงรักษาเพื่อมุ่งสู่เป้าหมาย Zero Breakdown');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Autonomous Maintenance และ Proactive Maintenance และ PM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Autonomous Maintenance และ Proactive Maintenance และ PM');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การสร้างระบบตรวจวัดสภาพและทำนายอายุการใช้งาน (Predictive Maintenance)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การสร้างระบบตรวจวัดสภาพและทำนายอายุการใช้งาน (Predictive Maintenance)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ระบบบำรุงรักษาดิจิทัล (Digital Maintenance)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ระบบบำรุงรักษาดิจิทัล (Digital Maintenance)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกทักษะเชิงปฏิบัติ');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกทักษะเชิงปฏิบัติ');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course SYS007
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('SYS007', 'effective-maintenance-budget-management', 'SYS', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การบริหารงบประมาณงานบำรุงรักษาอย่างมีประสิทธิภาพ', 'หลักสูตรเพื่อพัฒนาทักษะการบริหารงบประมาณและลดค่าใช้จ่ายงานซ่อมบำรุง โดยไม่ลดคุณภาพและยังคงเพิ่มประสิทธิภาพการผลิต', 'ยุคที่วิกฤตเศรษฐกิจขึ้น ทุกองค์กรต้องแสวงหาโอกาสลดความสูญเสียและค่าใช้จ่ายในการซ่อมแซม โดยไม่ลดคุณภาพ และยังคงเพิ่มประสิทธิภาพการทำงานและการผลิตให้สูงขึ้น หลักสูตรนี้เน้นประสบการณ์จริงจากการวางระบบที่ประสบความสำเร็จในโรงงานอุตสาหกรรม', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Effective Maintenance Budget Management', 'หลักสูตรเพื่อพัฒนาทักษะการบริหารงบประมาณและลดค่าใช้จ่ายงานซ่อมบำรุง โดยไม่ลดคุณภาพและยังคงเพิ่มประสิทธิภาพการผลิต', 'ยุคที่วิกฤตเศรษฐกิจขึ้น ทุกองค์กรต้องแสวงหาโอกาสลดความสูญเสียและค่าใช้จ่ายในการซ่อมแซม โดยไม่ลดคุณภาพ และยังคงเพิ่มประสิทธิภาพการทำงานและการผลิตให้สูงขึ้น หลักสูตรนี้เน้นประสบการณ์จริงจากการวางระบบที่ประสบความสำเร็จในโรงงานอุตสาหกรรม', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจประเภทและวิธีการตั้งงบประมาณค่าใช้จ่ายงานซ่อมบำรุง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจประเภทและวิธีการตั้งงบประมาณค่าใช้จ่ายงานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'พัฒนาระบบบำรุงรักษาที่มุ่งลดค่าใช้จ่ายงานซ่อมบำรุง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'พัฒนาระบบบำรุงรักษาที่มุ่งลดค่าใช้จ่ายงานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สร้างระบบมาตรฐานที่ช่วยเพิ่มประสิทธิภาพและผลผลิต');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สร้างระบบมาตรฐานที่ช่วยเพิ่มประสิทธิภาพและผลผลิต');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'วางแนวทางพัฒนาทักษะช่างซ่อมบำรุงให้มีความเชี่ยวชาญ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'วางแนวทางพัฒนาทักษะช่างซ่อมบำรุงให้มีความเชี่ยวชาญ');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 6);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานควบคุม-เดินเครื่องจักร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานควบคุม-เดินเครื่องจักร');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ต้นทุนและการลดค่าใช้จ่ายงานซ่อม');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ต้นทุนและการลดค่าใช้จ่ายงานซ่อม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้และความเข้าใจเกี่ยวกับต้นทุนตลอดชีพ (Life Cycle Cost: LCC)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้และความเข้าใจเกี่ยวกับต้นทุนตลอดชีพ (Life Cycle Cost: LCC)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วิธีการลดค่าใช้จ่ายด้านการซ่อมบำรุง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วิธีการลดค่าใช้จ่ายด้านการซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำงบประมาณบำรุงรักษา และวิธีตั้งงบประมาณค่าซ่อมบำรุง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำงบประมาณบำรุงรักษา และวิธีตั้งงบประมาณค่าซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'พัฒนาทักษะพนักงานฝ่ายผลิตให้สามารถดูแลบำรุงรักษาเบื้องต้นได้');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'พัฒนาทักษะพนักงานฝ่ายผลิตให้สามารถดูแลบำรุงรักษาเบื้องต้นได้');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ระบบบำรุงรักษาและเครื่องมือบริหาร');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ระบบบำรุงรักษาและเครื่องมือบริหาร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระบบบำรุงรักษาเชิงรุก (Proactive Maintenance) เพื่อขจัดปัญหาและลดค่าใช้จ่าย (ภาคปฏิบัติ)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระบบบำรุงรักษาเชิงรุก (Proactive Maintenance) เพื่อขจัดปัญหาและลดค่าใช้จ่าย (ภาคปฏิบัติ)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระบบบำรุงรักษาตามแผน (PM) และการจัดทำงบประมาณค่าใช้จ่าย (ภาคปฏิบัติ)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระบบบำรุงรักษาตามแผน (PM) และการจัดทำงบประมาณค่าใช้จ่าย (ภาคปฏิบัติ)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระบบตรวจวัดสภาพและทำนายอายุการใช้งาน (Predictive Maintenance) เพื่อเพิ่มผลผลิตและลดค่าใช้จ่าย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระบบตรวจวัดสภาพและทำนายอายุการใช้งาน (Predictive Maintenance) เพื่อเพิ่มผลผลิตและลดค่าใช้จ่าย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบริหารวัสดุและอะไหล่ ทั้งประเภทฉุกเฉินและประเภท MRP เพื่อลดค่าใช้จ่าย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบริหารวัสดุและอะไหล่ ทั้งประเภทฉุกเฉินและประเภท MRP เพื่อลดค่าใช้จ่าย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'สาธิตการใช้โปรแกรมคอมพิวเตอร์บำรุงรักษา PMTECH');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'สาธิตการใช้โปรแกรมคอมพิวเตอร์บำรุงรักษา PMTECH');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความรู้เกี่ยวกับต้นทุนตลอดชีพ (Life Cycle Cost: LCC)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความรู้เกี่ยวกับต้นทุนตลอดชีพ (Life Cycle Cost: LCC)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วิธีการลดค่าใช้จ่ายด้านการซ่อมบำรุง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วิธีการลดค่าใช้จ่ายด้านการซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ระบบซ่อมบำรุงเพื่อลดค่าใช้จ่ายงานซ่อม');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ระบบซ่อมบำรุงเพื่อลดค่าใช้จ่ายงานซ่อม');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การบริหารวัสดุและอะไหล่ ทั้งประเภทฉุกเฉินและประเภท MRP เพื่อลดค่าใช้จ่าย');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การบริหารวัสดุและอะไหล่ ทั้งประเภทฉุกเฉินและประเภท MRP เพื่อลดค่าใช้จ่าย');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'สาธิตการใช้โปรแกรมคอมพิวเตอร์บำรุงรักษา PMTECH');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'สาธิตการใช้โปรแกรมคอมพิวเตอร์บำรุงรักษา PMTECH');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'ภาคปฏิบัติ');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'ภาคปฏิบัติ');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course SYS008
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('SYS008', 'safety-management-maintenance', 'SYS', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การบริหารความปลอดภัยในงานซ่อมบำรุง', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะการบริหารความปลอดภัยในงานซ่อมบำรุง มุ่งสู่เป้าหมายให้อุบัติเหตุเป็น ''ศูนย์''', 'อุบัติเหตุแต่ละครั้งก่อให้เกิดความเสียหายทั้งกำลังใจ ประสิทธิภาพ และคุณภาพสินค้า อุบัติเหตุรุนแรงไม่เพียงส่งผลต่อพนักงาน แต่ยังกระทบภาพลักษณ์องค์กร หลักสูตรนี้มุ่งให้ความรู้จากประสบการณ์จริง เพื่อบริหารความปลอดภัยให้อุบัติเหตุเป็น ''ศูนย์''', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Safety Management in Maintenance', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะการบริหารความปลอดภัยในงานซ่อมบำรุง มุ่งสู่เป้าหมายให้อุบัติเหตุเป็น ''ศูนย์''', 'อุบัติเหตุแต่ละครั้งก่อให้เกิดความเสียหายทั้งกำลังใจ ประสิทธิภาพ และคุณภาพสินค้า อุบัติเหตุรุนแรงไม่เพียงส่งผลต่อพนักงาน แต่ยังกระทบภาพลักษณ์องค์กร หลักสูตรนี้มุ่งให้ความรู้จากประสบการณ์จริง เพื่อบริหารความปลอดภัยให้อุบัติเหตุเป็น ''ศูนย์''', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้และความเข้าใจพื้นฐานเกี่ยวกับงานต่างๆ ที่เป็นสาเหตุของอุบัติเหตุ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้และความเข้าใจพื้นฐานเกี่ยวกับงานต่างๆ ที่เป็นสาเหตุของอุบัติเหตุ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เสริมสร้างการบริหารความปลอดภัย โดยมุ่งสู่เป้าหมายให้อุบัติเหตุเป็นศูนย์ (0)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เสริมสร้างการบริหารความปลอดภัย โดยมุ่งสู่เป้าหมายให้อุบัติเหตุเป็นศูนย์ (0)');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างานฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างานฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้สนใจทั่วไป');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้สนใจทั่วไป');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'หลักการและจิตสำนึกความปลอดภัย');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'หลักการและจิตสำนึกความปลอดภัย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้และความเข้าใจเรื่องความปลอดภัยในการทำงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้และความเข้าใจเรื่องความปลอดภัยในการทำงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'จิตสำนึกด้านความปลอดภัยคืออะไร และวิธีการสร้างจิตสำนึกนี้');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'จิตสำนึกด้านความปลอดภัยคืออะไร และวิธีการสร้างจิตสำนึกนี้');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ลักษณะงานประเภทต่างๆ ที่ก่อให้เกิดอุบัติเหตุ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ลักษณะงานประเภทต่างๆ ที่ก่อให้เกิดอุบัติเหตุ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบริหารจัดการด้านความปลอดภัย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบริหารจัดการด้านความปลอดภัย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วิธีการสร้างความปลอดภัยให้กับเครื่องจักรและอุปกรณ์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วิธีการสร้างความปลอดภัยให้กับเครื่องจักรและอุปกรณ์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การสร้างวัฒนธรรมความปลอดภัย (BBS)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การสร้างวัฒนธรรมความปลอดภัย (BBS)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การบริหารและนโยบายความปลอดภัย');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การบริหารและนโยบายความปลอดภัย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความปลอดภัยในงานซ่อมบำรุง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความปลอดภัยในงานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การค้นหา ตรวจสอบ และวิเคราะห์ความเสี่ยงในการเกิดอุบัติเหตุ (JSA: Job Safety Analysis)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การค้นหา ตรวจสอบ และวิเคราะห์ความเสี่ยงในการเกิดอุบัติเหตุ (JSA: Job Safety Analysis)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การประเมินความเสี่ยง ระดับความรุนแรง และมาตรการป้องกันอุบัติเหตุ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การประเมินความเสี่ยง ระดับความรุนแรง และมาตรการป้องกันอุบัติเหตุ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดนโยบายบริหารความปลอดภัยและมาตรการป้องกัน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดนโยบายบริหารความปลอดภัยและมาตรการป้องกัน');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 10:30', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความรู้และความเข้าใจเรื่องความปลอดภัยในการทำงาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความรู้และความเข้าใจเรื่องความปลอดภัยในการทำงาน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'จิตสำนึกด้านความปลอดภัย');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'จิตสำนึกด้านความปลอดภัย');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ลักษณะงานประเภทต่างๆ ที่ก่อให้เกิดอุบัติเหตุ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ลักษณะงานประเภทต่างๆ ที่ก่อให้เกิดอุบัติเหตุ');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '10:45 - 12:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การบริหารจัดการด้านความปลอดภัย');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การบริหารจัดการด้านความปลอดภัย');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความปลอดภัยไม่มีข้อยกเว้นและไม่มีการประนีประนอม');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความปลอดภัยไม่มีข้อยกเว้นและไม่มีการประนีประนอม');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 14:30', 2);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความปลอดภัยในงานซ่อมบำรุง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความปลอดภัยในงานซ่อมบำรุง');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '14:45 - 16:00', 3);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การกำหนดนโยบายบริหารความปลอดภัยและมาตรการป้องกัน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การกำหนดนโยบายบริหารความปลอดภัยและมาตรการป้องกัน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การจัดทำรายการมาตรฐานบำรุงรักษาเครื่องจักร');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การจัดทำรายการมาตรฐานบำรุงรักษาเครื่องจักร');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course SYS009
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('SYS009', 'maintenance-system-performance-audit', 'SYS', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การตรวจประเมินประสิทธิภาพระบบบำรุงรักษา', 'หลักสูตรเพื่อพัฒนาทักษะการตรวจประเมินประสิทธิภาพระบบบำรุงรักษา ช่วยผู้บริหารและวิศวกรวิเคราะห์จุดแข็ง-จุดอ่อน และวางแผนปรับปรุงระบบ', 'การตรวจประเมินประสิทธิภาพระบบบำรุงรักษาเป็นเรื่องจำเป็น เพื่อช่วยให้ผู้บริหาร วิศวกร และหัวหน้างานได้ประเมินความสำเร็จของระบบ ติดตามผล และวิเคราะห์หาจุดแข็งจุดอ่อน เพื่อกำหนดนโยบาย วางแผน และปรับปรุงระบบให้สอดคล้องกับเป้าหมายองค์กร', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Maintenance System Performance Audit', 'หลักสูตรเพื่อพัฒนาทักษะการตรวจประเมินประสิทธิภาพระบบบำรุงรักษา ช่วยผู้บริหารและวิศวกรวิเคราะห์จุดแข็ง-จุดอ่อน และวางแผนปรับปรุงระบบ', 'การตรวจประเมินประสิทธิภาพระบบบำรุงรักษาเป็นเรื่องจำเป็น เพื่อช่วยให้ผู้บริหาร วิศวกร และหัวหน้างานได้ประเมินความสำเร็จของระบบ ติดตามผล และวิเคราะห์หาจุดแข็งจุดอ่อน เพื่อกำหนดนโยบาย วางแผน และปรับปรุงระบบให้สอดคล้องกับเป้าหมายองค์กร', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'กำหนดนโยบายและถ่ายทอดสู่การวางแผนปฏิบัติได้อย่างมีประสิทธิภาพ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'กำหนดนโยบายและถ่ายทอดสู่การวางแผนปฏิบัติได้อย่างมีประสิทธิภาพ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'พัฒนาระบบบำรุงรักษาที่สอดคล้องกับองค์กร บริษัท และทักษะความสามารถของบุคลากร');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'พัฒนาระบบบำรุงรักษาที่สอดคล้องกับองค์กร บริษัท และทักษะความสามารถของบุคลากร');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'รายงานผลลัพธ์ จุดเด่น และจุดด้อย เพื่อใช้เป็นข้อมูลในการกำหนดนโยบายบริหาร');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'รายงานผลลัพธ์ จุดเด่น และจุดด้อย เพื่อใช้เป็นข้อมูลในการกำหนดนโยบายบริหาร');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้บริหารระดับกำหนดนโยบาย');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้บริหารระดับกำหนดนโยบาย');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายตรวจสอบคุณภาพ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายตรวจสอบคุณภาพ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'Leadership and Empowerment');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'Leadership and Empowerment');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Plant Yearly Policy');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Plant Yearly Policy');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Empowerment Matrix');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Empowerment Matrix');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Maintenance Vision and Strategy');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Maintenance Vision and Strategy');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Performance Measures (KPI)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Performance Measures (KPI)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Organization Structure');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Organization Structure');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Human Resources');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Human Resources');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Knowledge Base');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Knowledge Base');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'Systems and Processes');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'Systems and Processes');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Asset Maintenance and Strategy');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Asset Maintenance and Strategy');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Maintenance System: Proactive Maintenance, Preventive Maintenance, Predictive Maintenance, Insurance Maintenance');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Maintenance System: Proactive Maintenance, Preventive Maintenance, Predictive Maintenance, Insurance Maintenance');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Planning and Scheduling');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Planning and Scheduling');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Materials Management');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Materials Management');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Contractor Management');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Contractor Management');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Reliability Engineering');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Reliability Engineering');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Safety and Environment');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Safety and Environment');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 7);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การปิดการตรวจประเมิน (Close Meeting)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การปิดการตรวจประเมิน (Close Meeting)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 8);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำรายงานผลการตรวจประเมิน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำรายงานผลการตรวจประเมิน');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'หัวข้อการตรวจประเมิน Leadership and Empowerment');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'หัวข้อการตรวจประเมิน Leadership and Empowerment');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การตั้งประเด็น หัวข้อ ข้อแนะนำ การตรวจประเมิน และการลงดูหน้างานจริง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การตั้งประเด็น หัวข้อ ข้อแนะนำ การตรวจประเมิน และการลงดูหน้างานจริง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'หัวข้อการตรวจประเมิน Systems and Processes');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'หัวข้อการตรวจประเมิน Systems and Processes');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การปิดการตรวจประเมิน (Close Meeting)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การปิดการตรวจประเมิน (Close Meeting)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจัดทำรายงานผลการตรวจประเมิน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจัดทำรายงานผลการตรวจประเมิน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'ภาคปฏิบัติ Workshop');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'ภาคปฏิบัติ Workshop');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course SYS010
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('SYS010', 'zero-waste-production-8-techniques', 'SYS', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'เทคนิคการผลิตแบบไร้ของเสียด้วยแนวคิดเลข 8 (Zero Waste by 8 Techniques)', 'หลักสูตรเพื่อพัฒนาทักษะการควบคุมคุณภาพการผลิต ลดของเสียให้เป็นศูนย์ ด้วยเทคนิคเลข 8 (Infinite Loop) และเครื่องมือ QA Matrix / QM Matrix', 'เป้าหมายสูงสุดของการผลิตคือการลดของเสียให้เป็นศูนย์ (Zero Defect) โดยใช้เทคนิคเลข 8 (Infinity Loop) เป็นเครื่องมือในการวิเคราะห์ ควบคุม และพัฒนาปัจจัยที่ส่งผลต่อคุณภาพ เพื่อป้องกันการเกิดของเสียตั้งแต่ต้นทาง ผ่าน QA Matrix และ QM Matrix', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Zero Waste Production by 8 Techniques', 'หลักสูตรเพื่อพัฒนาทักษะการควบคุมคุณภาพการผลิต ลดของเสียให้เป็นศูนย์ ด้วยเทคนิคเลข 8 (Infinite Loop) และเครื่องมือ QA Matrix / QM Matrix', 'เป้าหมายสูงสุดของการผลิตคือการลดของเสียให้เป็นศูนย์ (Zero Defect) โดยใช้เทคนิคเลข 8 (Infinity Loop) เป็นเครื่องมือในการวิเคราะห์ ควบคุม และพัฒนาปัจจัยที่ส่งผลต่อคุณภาพ เพื่อป้องกันการเกิดของเสียตั้งแต่ต้นทาง ผ่าน QA Matrix และ QM Matrix', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'แนวคิด วิธีการ การพัฒนาระบบบำรุงรักษาคุณภาพ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'แนวคิด วิธีการ การพัฒนาระบบบำรุงรักษาคุณภาพ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ความรู้ความเข้าใจ การใช้เทคนิคเลข 8 (Infinite Loop)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ความรู้ความเข้าใจ การใช้เทคนิคเลข 8 (Infinite Loop)');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ความรู้ ความเข้าใจ การสร้าง QA Matrix และ QM Matrix');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ความรู้ ความเข้าใจ การสร้าง QA Matrix และ QM Matrix');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายประกันคุณภาพ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายประกันคุณภาพ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายสนับสนุนส่งเสริมพัฒนาระบบงาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายสนับสนุนส่งเสริมพัฒนาระบบงาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 6);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'แนวคิดและขั้นตอนเทคนิคเลข 8');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'แนวคิดและขั้นตอนเทคนิคเลข 8');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวคิด ลักษณะและจุดประสงค์ของการบำรุงรักษาคุณภาพ (QM: Quality Maintenance)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวคิด ลักษณะและจุดประสงค์ของการบำรุงรักษาคุณภาพ (QM: Quality Maintenance)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'หัวข้อเป้าหมายความสำเร็จ KPI Quality Maintenance');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'หัวข้อเป้าหมายความสำเร็จ KPI Quality Maintenance');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอนดำเนินการ 7 ขั้นตอน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอนดำเนินการ 7 ขั้นตอน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วงกลมบำรุงรักษาคุณภาพ (Maintenance Loop) ขั้นตอน 0, 1, 2, 6 และ 7');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วงกลมบำรุงรักษาคุณภาพ (Maintenance Loop) ขั้นตอน 0, 1, 2, 6 และ 7');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การวิเคราะห์และการสร้างมาตรฐาน');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การวิเคราะห์และการสร้างมาตรฐาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอน 1: กำหนดเงื่อนไขของของเสีย (Defect) และการสร้างความสัมพันธ์ QA Defect Matrix');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอน 1: กำหนดเงื่อนไขของของเสีย (Defect) และการสร้างความสัมพันธ์ QA Defect Matrix');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอน 2: ตรวจสอบและฟื้นฟู 4M ให้ได้มาตรฐาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอน 2: ตรวจสอบและฟื้นฟู 4M ให้ได้มาตรฐาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอน 3: วิเคราะห์สาเหตุที่ทำให้เกิดของเสีย (Defect) ด้วย Why-Why Analysis และ PM Analysis');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอน 3: วิเคราะห์สาเหตุที่ทำให้เกิดของเสีย (Defect) ด้วย Why-Why Analysis และ PM Analysis');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอน 4: กำจัดสาเหตุที่ทำให้เกิดของเสีย (Defect)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอน 4: กำจัดสาเหตุที่ทำให้เกิดของเสีย (Defect)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอน 5: สร้างมาตรฐาน และ QM Matrix');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอน 5: สร้างมาตรฐาน และ QM Matrix');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอน 6: ปรับปรุง แก้ไขการทำงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอน 6: ปรับปรุง แก้ไขการทำงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอน 7: รักษาสภาวะที่ไม่ทำให้เกิดของเสีย (Defect)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอน 7: รักษาสภาวะที่ไม่ทำให้เกิดของเสีย (Defect)');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวคิดลักษณะและจุดประสงค์ของการบำรุงรักษาคุณภาพ (QM)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวคิดลักษณะและจุดประสงค์ของการบำรุงรักษาคุณภาพ (QM)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การผลิตของเสียเป็นศูนย์ด้วยเทคนิคเลข 8 (Infinite Loop)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การผลิตของเสียเป็นศูนย์ด้วยเทคนิคเลข 8 (Infinite Loop)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'หัวข้อเป้าหมายความสำเร็จ KPI Quality Maintenance');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'หัวข้อเป้าหมายความสำเร็จ KPI Quality Maintenance');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอนดำเนินการ 7 ขั้นตอน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอนดำเนินการ 7 ขั้นตอน');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วงกลมบำรุงรักษาคุณภาพ (Maintenance Loop)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วงกลมบำรุงรักษาคุณภาพ (Maintenance Loop)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'กำหนดจุด ตำแหน่งที่ต้องควบคุม (Q-Component)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'กำหนดจุด ตำแหน่งที่ต้องควบคุม (Q-Component)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอน 3, 4, 5: วิเคราะห์สาเหตุ กำจัดสาเหตุ และสร้างมาตรฐาน QM Matrix');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอน 3, 4, 5: วิเคราะห์สาเหตุ กำจัดสาเหตุ และสร้างมาตรฐาน QM Matrix');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การจัดทำรายการมาตรฐานบำรุงรักษาเครื่องจักร');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การจัดทำรายการมาตรฐานบำรุงรักษาเครื่องจักร');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course SYS011
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('SYS011', 'maintenance-cost-budget-management', 'SYS', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การบริหารต้นทุนและงบประมาณในงานซ่อมบำรุง', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะการวัดความเชื่อมั่น (Reliability) ของเครื่องจักร และเลือกระบบบำรุงรักษาที่เหมาะสมเพื่อควบคุมต้นทุน', 'ความมั่นใจว่าเครื่องจักรจะไม่เสียหรือขัดข้องก่อนถึงรอบบำรุงรักษาครั้งถัดไปคือสิ่งสำคัญ ระบบบำรุงรักษาจึงเป็นกระบวนการตัดสินใจเลือกรูปแบบ วิธีการ และระยะเวลาที่เหมาะสม เพื่อสร้าง ''ความเชื่อมั่น'' (Reliability) ที่วัดได้เป็นเปอร์เซ็นต์', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Maintenance Cost and Budget Management (RCM)', 'หลักสูตรเพื่อพัฒนาความรู้และทักษะการวัดความเชื่อมั่น (Reliability) ของเครื่องจักร และเลือกระบบบำรุงรักษาที่เหมาะสมเพื่อควบคุมต้นทุน', 'ความมั่นใจว่าเครื่องจักรจะไม่เสียหรือขัดข้องก่อนถึงรอบบำรุงรักษาครั้งถัดไปคือสิ่งสำคัญ ระบบบำรุงรักษาจึงเป็นกระบวนการตัดสินใจเลือกรูปแบบ วิธีการ และระยะเวลาที่เหมาะสม เพื่อสร้าง ''ความเชื่อมั่น'' (Reliability) ที่วัดได้เป็นเปอร์เซ็นต์', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้ ความเข้าใจ การวัดความเชื่อมั่นการบำรุงรักษาเครื่องจักร');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้ ความเข้าใจ การวัดความเชื่อมั่นการบำรุงรักษาเครื่องจักร');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ความเข้าใจ การวิเคราะห์หน้าที่ การทำงาน ประเภทการเสียหายขัดข้องเครื่องจักร');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ความเข้าใจ การวิเคราะห์หน้าที่ การทำงาน ประเภทการเสียหายขัดข้องเครื่องจักร');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'การเลือกใช้ระบบบำรุงรักษาที่เหมาะสมกับความเชื่อมั่นที่ต้องการ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'การเลือกใช้ระบบบำรุงรักษาที่เหมาะสมกับความเชื่อมั่นที่ต้องการ');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อม');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อม');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายพัฒนาระบบ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายพัฒนาระบบ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ความเชื่อมั่น (Reliability) และ RCM');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ความเชื่อมั่น (Reliability) และ RCM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระบบความเชื่อมั่นการบำรุงรักษาเครื่องจักร (RCM) คืออะไร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระบบความเชื่อมั่นการบำรุงรักษาเครื่องจักร (RCM) คืออะไร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การคำนวณความเชื่อมั่น R=');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การคำนวณความเชื่อมั่น R=');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ปัจจัยที่เป็นตัวแปรความเชื่อมั่น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ปัจจัยที่เป็นตัวแปรความเชื่อมั่น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความแตกต่างระหว่าง Availability กับ Reliability');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความแตกต่างระหว่าง Availability กับ Reliability');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การดำเนินการ RCM 8 Step (Step by Step)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การดำเนินการ RCM 8 Step (Step by Step)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ระบบบำรุงรักษาเพื่อความเชื่อมั่น');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ระบบบำรุงรักษาเพื่อความเชื่อมั่น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระบบเชิงรุกบำรุงรักษา (Proactive Maintenance: PoM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระบบเชิงรุกบำรุงรักษา (Proactive Maintenance: PoM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระบบบำรุงรักษาเชิงป้องกัน (Preventive Maintenance: PM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระบบบำรุงรักษาเชิงป้องกัน (Preventive Maintenance: PM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระบบบำรุงรักษาพยากรณ์ (Predictive Maintenance: PdM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระบบบำรุงรักษาพยากรณ์ (Predictive Maintenance: PdM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Real Time Maintenance');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Real Time Maintenance');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ระบบความเชื่อมั่นการบำรุงรักษาเครื่องจักร (RCM) คืออะไร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ระบบความเชื่อมั่นการบำรุงรักษาเครื่องจักร (RCM) คืออะไร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การคำนวณความเชื่อมั่น R=');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การคำนวณความเชื่อมั่น R=');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ปัจจัยที่เป็นตัวแปรความเชื่อมั่น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ปัจจัยที่เป็นตัวแปรความเชื่อมั่น');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความแตกต่างระหว่าง Availability กับ Reliability');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความแตกต่างระหว่าง Availability กับ Reliability');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ระบบบำรุงรักษาเพื่อความเชื่อมั่น (Reliability)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ระบบบำรุงรักษาเพื่อความเชื่อมั่น (Reliability)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Proactive Maintenance, Preventive Maintenance, Predictive Maintenance, Real Time Maintenance');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Proactive Maintenance, Preventive Maintenance, Predictive Maintenance, Real Time Maintenance');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'ภาคปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'ภาคปฏิบัติ (Workshop)');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมภาษีมูลค่าเพิ่ม (VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course MST001
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('MST001', 'cmm-maintenance-management', 'MST', '2 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'โปรแกรม CMM สำหรับบริหารระบบงานบำรุงรักษา (Computerized Maintenance Management System)', 'หลักสูตร 2 วัน เรียนรู้การใช้โปรแกรม CMMS บนแอปพลิเคชันมือถือ วางแผนบำรุงรักษา จัดการวัสดุอะไหล่ ติดตามประวัติการซ่อม แจ้งเตือนอัตโนมัติ และออกใบแจ้งงานอัตโนมัติ (Auto Work Requests) รองรับ Digital Transformation และ AI สำหรับงานซ่อมบำรุง', 'ในโรงงานอุตสาหกรรม เทคโนโลยีดิจิทัลได้พลิกโฉมการทำงานอย่างรวดเร็ว การใช้โปรแกรมบริหารจัดการระบบบำรุงรักษาเครื่องจักร (CMMS) ช่วยปรับปรุงประสิทธิภาพทั้งด้านการทำงาน การผลิต และการซ่อมบำรุงเครื่องจักร ทำให้ผลผลิตเพิ่มขึ้น ลดต้นทุน และสร้างกำไรให้กับองค์กร', '2 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'CMM Program for Maintenance Management System', 'หลักสูตร 2 วัน เรียนรู้การใช้โปรแกรม CMMS บนแอปพลิเคชันมือถือ วางแผนบำรุงรักษา จัดการวัสดุอะไหล่ ติดตามประวัติการซ่อม แจ้งเตือนอัตโนมัติ และออกใบแจ้งงานอัตโนมัติ (Auto Work Requests) รองรับ Digital Transformation และ AI สำหรับงานซ่อมบำรุง', 'ในโรงงานอุตสาหกรรม เทคโนโลยีดิจิทัลได้พลิกโฉมการทำงานอย่างรวดเร็ว การใช้โปรแกรมบริหารจัดการระบบบำรุงรักษาเครื่องจักร (CMMS) ช่วยปรับปรุงประสิทธิภาพทั้งด้านการทำงาน การผลิต และการซ่อมบำรุงเครื่องจักร ทำให้ผลผลิตเพิ่มขึ้น ลดต้นทุน และสร้างกำไรให้กับองค์กร', '2 Days', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'โปรแกรม CMMS สำหรับบริหารจัดการระบบบำรุงรักษา ตามความต้องการและเหมาะสมกับองค์กรหรือบริษัท');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'โปรแกรม CMMS สำหรับบริหารจัดการระบบบำรุงรักษา ตามความต้องการและเหมาะสมกับองค์กรหรือบริษัท');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ความรู้ในการพัฒนาและปรับปรุงโปรแกรมให้มีประสิทธิภาพตามกาลเวลา');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ความรู้ในการพัฒนาและปรับปรุงโปรแกรมให้มีประสิทธิภาพตามกาลเวลา');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'การใช้งานแบบ Real-Time ทุกที่ ทุกเวลา โดยเชื่อมต่อผ่าน Wi-Fi');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'การใช้งานแบบ Real-Time ทุกที่ ทุกเวลา โดยเชื่อมต่อผ่าน Wi-Fi');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ความรู้และทักษะในการพัฒนาแอปพลิเคชันมือถือสำหรับงานบำรุงรักษา');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ความรู้และทักษะในการพัฒนาแอปพลิเคชันมือถือสำหรับงานบำรุงรักษา');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 4);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'การพัฒนาระบบบำรุงรักษาเครื่องจักรและอุปกรณ์สู่ระบบดิจิทัลและการประยุกต์ใช้ AI');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'การพัฒนาระบบบำรุงรักษาเครื่องจักรและอุปกรณ์สู่ระบบดิจิทัลและการประยุกต์ใช้ AI');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต ฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต ฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายสนับสนุน ส่งเสริมพัฒนาระบบงาน ดิจิทัล');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายสนับสนุน ส่งเสริมพัฒนาระบบงาน ดิจิทัล');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร หัวหน้า ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร หัวหน้า ช่างเทคนิค');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ความรู้พื้นฐานและ Digital Transformation');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ความรู้พื้นฐานและ Digital Transformation');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเปรียบเทียบระบบบำรุงรักษาก่อนและหลังการใช้ Digital Transformation');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเปรียบเทียบระบบบำรุงรักษาก่อนและหลังการใช้ Digital Transformation');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบำรุงรักษาเครื่องจักรระบบ PM (Preventive Maintenance)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบำรุงรักษาเครื่องจักรระบบ PM (Preventive Maintenance)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบำรุงรักษาเครื่องจักรระบบตรวจวัดสุขภาพและทำนายอายุการใช้งาน PdM (Predictive Maintenance)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบำรุงรักษาเครื่องจักรระบบตรวจวัดสุขภาพและทำนายอายุการใช้งาน PdM (Predictive Maintenance)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การติดตามประวัติการซ่อม ค่าใช้จ่าย งบประมาณ และประเมินประสิทธิภาพงานซ่อม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การติดตามประวัติการซ่อม ค่าใช้จ่าย งบประมาณ และประเมินประสิทธิภาพงานซ่อม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบริหารจัดการวัสดุและอะไหล่สำหรับงานซ่อม (Inventory)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบริหารจัดการวัสดุและอะไหล่สำหรับงานซ่อม (Inventory)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเตรียมงานซ่อมตามแผน PM ประจำสัปดาห์ รายเดือน หรือรายปี');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเตรียมงานซ่อมตามแผน PM ประจำสัปดาห์ รายเดือน หรือรายปี');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การประยุกต์ใช้ Digital & AI กับงานซ่อมบำรุง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การประยุกต์ใช้ Digital & AI กับงานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 7);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Digital Transformation สำหรับ SMART Maintenance');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Digital Transformation สำหรับ SMART Maintenance');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การดำเนินการ (Implementation)');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การดำเนินการ (Implementation)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเลือกเครื่องจักรเข้าระบบและแบ่งระดับความสำคัญของเครื่องจักร (Class A, B, C)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเลือกเครื่องจักรเข้าระบบและแบ่งระดับความสำคัญของเครื่องจักร (Class A, B, C)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การตรวจวัดสุขภาพเครื่องจักร (ขณะเดินเครื่องและขณะหยุดเครื่องสำหรับ PM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การตรวจวัดสุขภาพเครื่องจักร (ขณะเดินเครื่องและขณะหยุดเครื่องสำหรับ PM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดสถานะสุขภาพเครื่องจักร: ดี (A) / แย่ (B) / ต้องแก้ไข (C)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดสถานะสุขภาพเครื่องจักร: ดี (A) / แย่ (B) / ต้องแก้ไข (C)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดอายุการใช้งาน การเปลี่ยนสารหล่อลื่น และการเปลี่ยนชิ้นส่วนอะไหล่');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดอายุการใช้งาน การเปลี่ยนสารหล่อลื่น และการเปลี่ยนชิ้นส่วนอะไหล่');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวางแผนตรวจวัดสุขภาพเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวางแผนตรวจวัดสุขภาพเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเชื่อมต่อ Sensor กับโปรแกรม Online Machine');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเชื่อมต่อ Sensor กับโปรแกรม Online Machine');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ช่วงถาม–ตอบ แลกเปลี่ยนประสบการณ์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ช่วงถาม–ตอบ แลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 1  09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การเปรียบเทียบระบบบำรุงรักษาก่อนและหลังการใช้ Digital Transformation');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การเปรียบเทียบระบบบำรุงรักษาก่อนและหลังการใช้ Digital Transformation');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การบำรุงรักษาเครื่องจักรระบบ PM (Preventive Maintenance)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การบำรุงรักษาเครื่องจักรระบบ PM (Preventive Maintenance)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การบำรุงรักษาเครื่องจักรระบบตรวจวัดสุขภาพและทำนายอายุการใช้งาน PdM (Predictive Maintenance)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การบำรุงรักษาเครื่องจักรระบบตรวจวัดสุขภาพและทำนายอายุการใช้งาน PdM (Predictive Maintenance)');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 1  13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การติดตามประวัติการซ่อม ค่าใช้จ่าย งบประมาณ และประเมินประสิทธิภาพงานซ่อม');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การติดตามประวัติการซ่อม ค่าใช้จ่าย งบประมาณ และประเมินประสิทธิภาพงานซ่อม');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การบริหารจัดการวัสดุและอะไหล่สำหรับงานซ่อม (Inventory)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การบริหารจัดการวัสดุและอะไหล่สำหรับงานซ่อม (Inventory)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การเตรียมงานซ่อมตามแผน PM ประจำสัปดาห์ รายเดือน หรือรายปี');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การเตรียมงานซ่อมตามแผน PM ประจำสัปดาห์ รายเดือน หรือรายปี');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม–ตอบ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม–ตอบ');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 2  09:00 - 12:00', 2);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การประยุกต์ใช้ Digital & AI กับงานซ่อมบำรุง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การประยุกต์ใช้ Digital & AI กับงานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Digital Transformation สำหรับ SMART Maintenance');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Digital Transformation สำหรับ SMART Maintenance');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Digital Transformation ช่วยเพิ่มประสิทธิภาพงานซ่อมบำรุง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Digital Transformation ช่วยเพิ่มประสิทธิภาพงานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การดำเนินการ (Implementation)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การดำเนินการ (Implementation)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การเลือกเครื่องจักรเข้าระบบและแบ่งระดับความสำคัญ (Class A, B, C)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การเลือกเครื่องจักรเข้าระบบและแบ่งระดับความสำคัญ (Class A, B, C)');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 2  13:00 - 16:00', 3);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การตรวจวัดสุขภาพเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การตรวจวัดสุขภาพเครื่องจักร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การกำหนดสถานะสุขภาพเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การกำหนดสถานะสุขภาพเครื่องจักร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การกำหนดอายุการใช้งาน การเปลี่ยนสารหล่อลื่น และการเปลี่ยนชิ้นส่วนอะไหล่');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การกำหนดอายุการใช้งาน การเปลี่ยนสารหล่อลื่น และการเปลี่ยนชิ้นส่วนอะไหล่');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวางแผนตรวจวัดสุขภาพเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวางแผนตรวจวัดสุขภาพเครื่องจักร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การเชื่อมต่อ Sensor กับโปรแกรม Online Machine');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การเชื่อมต่อ Sensor กับโปรแกรม Online Machine');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 5);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม–ตอบ แลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม–ตอบ แลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'อธิบาย สาธิต ให้การปรึกษาแนะนำ การพัฒนาโปรแกรม ตามความต้องการ');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'อธิบาย สาธิต ให้การปรึกษาแนะนำ การพัฒนาโปรแกรม ตามความต้องการ');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course MST002
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('MST002', 'work-order-maintenance', 'MST', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'โปรแกรม Work Order สำหรับแจ้งงานซ่อมและติดตามงาน', 'หลักสูตร 1 วัน เรียนรู้การใช้โปรแกรมสำเร็จรูป Work Order บน Microsoft 365 Access สำหรับบริหารจัดการระบบแจ้งงานซ่อม ตั้งแต่การแจ้งงาน รับงาน ซ่อมงาน ติดตามงาน จนถึงการปิดงาน อย่างเป็นระบบ (1 ท่าน ต่อ 1 เครื่องคอมพิวเตอร์)', 'ในโรงงานอุตสาหกรรม หากยังใช้วิธีเดิมในการแจ้งงานซ่อมด้วยกระดาษ การสื่อสารเพื่อติดตามงาน ตรวจสอบสถานะ ย่อมยุ่งยากและสิ้นเปลืองเวลา โปรแกรม Work Order ช่วยให้ทุกขั้นตอนเป็นระบบ ติดตามสถานะได้ทันที รายงานได้รวดเร็ว และเพิ่มประสิทธิภาพการทำงานอย่างชัดเจน', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Work Order Program for Maintenance Job Request and Tracking', 'หลักสูตร 1 วัน เรียนรู้การใช้โปรแกรมสำเร็จรูป Work Order บน Microsoft 365 Access สำหรับบริหารจัดการระบบแจ้งงานซ่อม ตั้งแต่การแจ้งงาน รับงาน ซ่อมงาน ติดตามงาน จนถึงการปิดงาน อย่างเป็นระบบ (1 ท่าน ต่อ 1 เครื่องคอมพิวเตอร์)', 'ในโรงงานอุตสาหกรรม หากยังใช้วิธีเดิมในการแจ้งงานซ่อมด้วยกระดาษ การสื่อสารเพื่อติดตามงาน ตรวจสอบสถานะ ย่อมยุ่งยากและสิ้นเปลืองเวลา โปรแกรม Work Order ช่วยให้ทุกขั้นตอนเป็นระบบ ติดตามสถานะได้ทันที รายงานได้รวดเร็ว และเพิ่มประสิทธิภาพการทำงานอย่างชัดเจน', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'โปรแกรมสำเร็จ "Work Order" ท่านละ 1 ชุด พร้อมคู่มือการใช้โปรแกรม');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'โปรแกรมสำเร็จ "Work Order" ท่านละ 1 ชุด พร้อมคู่มือการใช้โปรแกรม');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'การจัดทำระบบการแจ้งงาน ติดตาม ปิดงาน อย่างเป็นระบบ และมีประสิทธิภาพ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'การจัดทำระบบการแจ้งงาน ติดตาม ปิดงาน อย่างเป็นระบบ และมีประสิทธิภาพ');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้ที่ต้องการพัฒนาและนำโปรแกรมระบบคอมพิวเตอร์มาใช้บริหารจัดการระบบแจ้งงาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้ที่ต้องการพัฒนาและนำโปรแกรมระบบคอมพิวเตอร์มาใช้บริหารจัดการระบบแจ้งงาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้ที่มีความรู้พื้นฐานด้านการใช้งานคอมพิวเตอร์ในระดับที่เพียงพอต่อการปฏิบัติงาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้ที่มีความรู้พื้นฐานด้านการใช้งานคอมพิวเตอร์ในระดับที่เพียงพอต่อการปฏิบัติงาน');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ความรู้ระบบการแจ้งงาน (Work Order System)');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ความรู้ระบบการแจ้งงาน (Work Order System)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้ ความเข้าใจ โครงสร้างสำคัญของระบบการแจ้งงาน (Work Order System)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้ ความเข้าใจ โครงสร้างสำคัญของระบบการแจ้งงาน (Work Order System)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอนการจัดทำระบบแจ้งงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอนการจัดทำระบบแจ้งงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ข้อมูลที่จำเป็นที่ใช้ในงานแจ้งงาน งานซ่อม และปิดงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ข้อมูลที่จำเป็นที่ใช้ในงานแจ้งงาน งานซ่อม และปิดงาน');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ภาคปฏิบัติการใช้โปรแกรม Work Order');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ภาคปฏิบัติการใช้โปรแกรม Work Order');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วิธีติดตั้งโปรแกรมสำเร็จรูปบนคอมพิวเตอร์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วิธีติดตั้งโปรแกรมสำเร็จรูปบนคอมพิวเตอร์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเข้าสู่ระบบ (Log In) สำหรับหัวหน้าและพนักงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเข้าสู่ระบบ (Log In) สำหรับหัวหน้าและพนักงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้และความเข้าใจเกี่ยวกับสิทธิและความรับผิดชอบ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้และความเข้าใจเกี่ยวกับสิทธิและความรับผิดชอบ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ภาพรวมและโครงสร้างการทำงานของโปรแกรม (Work Order : WO)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ภาพรวมและโครงสร้างการทำงานของโปรแกรม (Work Order : WO)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบันทึกรายละเอียดในใบแจ้งงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบันทึกรายละเอียดในใบแจ้งงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การพิจารณาใบแจ้งงาน — อนุมัติหรือยกเลิก พร้อมเหตุผล');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การพิจารณาใบแจ้งงาน — อนุมัติหรือยกเลิก พร้อมเหตุผล');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การพิจารณารับแจ้งงาน — อนุมัติหรือยกเลิก พร้อมเหตุผล');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การพิจารณารับแจ้งงาน — อนุมัติหรือยกเลิก พร้อมเหตุผล');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 7);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การติดตามสถานะงาน — ตั้งแต่การแจ้งงาน การดำเนินงาน จนถึงการทำงานเสร็จ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การติดตามสถานะงาน — ตั้งแต่การแจ้งงาน การดำเนินงาน จนถึงการทำงานเสร็จ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 8);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การตรวจรับและปิดงานแจ้งซ่อม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การตรวจรับและปิดงานแจ้งซ่อม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 9);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การออกรายงานสรุประบบแจ้งงานทั้งหมด');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การออกรายงานสรุประบบแจ้งงานทั้งหมด');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 10);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความรู้ ความเข้าใจ โครงสร้างสำคัญของระบบการแจ้งงาน (Work Order System)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความรู้ ความเข้าใจ โครงสร้างสำคัญของระบบการแจ้งงาน (Work Order System)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอนการจัดทำระบบแจ้งงาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอนการจัดทำระบบแจ้งงาน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ข้อมูลที่จำเป็นที่ใช้ในงานแจ้งงาน งานซ่อม และปิดงาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ข้อมูลที่จำเป็นที่ใช้ในงานแจ้งงาน งานซ่อม และปิดงาน');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:30', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ภาคปฏิบัติ – การใช้โปรแกรม Work Order (1 ท่าน ต่อ 1 เครื่องคอมพิวเตอร์)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ภาคปฏิบัติ – การใช้โปรแกรม Work Order (1 ท่าน ต่อ 1 เครื่องคอมพิวเตอร์)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'บรรยายพร้อมภาคปฏิบัติหลักการใช้งานโปรแกรม 1 ท่านต่อ 1 คอมพิวเตอร์ หรือ Notebook ที่ติดตั้ง Microsoft 365 Access');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'บรรยายพร้อมภาคปฏิบัติหลักการใช้งานโปรแกรม 1 ท่านต่อ 1 คอมพิวเตอร์ หรือ Notebook ที่ติดตั้ง Microsoft 365 Access');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');
INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 1);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ผู้เข้าอบรมต้องนำ Notebook ที่ติดตั้ง Microsoft 365 Access มาด้วย');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course MST003
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('MST003', 'pmtech-maintenance-planning', 'MST', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'โปรแกรม PMTECH สำหรับวางแผนงานบำรุงรักษา', 'หลักสูตร 1 วัน เรียนรู้การใช้โปรแกรม PMTECH จัดทำระบบบำรุงรักษาเชิงป้องกัน (PM) ฐานข้อมูลเครื่องจักร มาตรฐานการบำรุงรักษา (WI) การวางแผนปฏิทินบำรุงรักษา และการจัดการวัสดุอะไหล่ (1 ท่าน ต่อ 1 เครื่องคอมพิวเตอร์)', 'ในโรงงานอุตสาหกรรม การใช้คอมพิวเตอร์บริหารจัดการระบบบำรุงรักษาเครื่องจักร (CMMS) ช่วยให้การบำรุงรักษามีความเป็นระบบ ใช้งานได้ง่าย สะดวก และรวดเร็ว สนับสนุนการจัดทำฐานข้อมูลเครื่องจักร มาตรฐานการบำรุงรักษา การวางแผนและควบคุมงานซ่อมบำรุงอย่างมีประสิทธิภาพ', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'PMTECH Program for Preventive Maintenance Planning', 'หลักสูตร 1 วัน เรียนรู้การใช้โปรแกรม PMTECH จัดทำระบบบำรุงรักษาเชิงป้องกัน (PM) ฐานข้อมูลเครื่องจักร มาตรฐานการบำรุงรักษา (WI) การวางแผนปฏิทินบำรุงรักษา และการจัดการวัสดุอะไหล่ (1 ท่าน ต่อ 1 เครื่องคอมพิวเตอร์)', 'ในโรงงานอุตสาหกรรม การใช้คอมพิวเตอร์บริหารจัดการระบบบำรุงรักษาเครื่องจักร (CMMS) ช่วยให้การบำรุงรักษามีความเป็นระบบ ใช้งานได้ง่าย สะดวก และรวดเร็ว สนับสนุนการจัดทำฐานข้อมูลเครื่องจักร มาตรฐานการบำรุงรักษา การวางแผนและควบคุมงานซ่อมบำรุงอย่างมีประสิทธิภาพ', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'โปรแกรม PMTECH จัดให้ผู้เข้าอบรมท่านละ 1 ชุด สำหรับใช้บริหารจัดการและวางแผนงานซ่อมบำรุง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'โปรแกรม PMTECH จัดให้ผู้เข้าอบรมท่านละ 1 ชุด สำหรับใช้บริหารจัดการและวางแผนงานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ผู้เข้าอบรมสามารถจัดทำระบบบำรุงรักษาเชิงป้องกัน (PM) ที่มีประสิทธิภาพได้');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ผู้เข้าอบรมสามารถจัดทำระบบบำรุงรักษาเชิงป้องกัน (PM) ที่มีประสิทธิภาพได้');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เรียนรู้เทคนิคการจัดทำฐานข้อมูลเครื่องจักร การเขียนรายงานบำรุงรักษา และการกำหนดหมายเลขงาน รวมถึงหมายเลขวัสดุ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เรียนรู้เทคนิคการจัดทำฐานข้อมูลเครื่องจักร การเขียนรายงานบำรุงรักษา และการกำหนดหมายเลขงาน รวมถึงหมายเลขวัสดุ');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร ช่างซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร ช่างซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้ที่มีความรู้พื้นฐานด้านการใช้งานคอมพิวเตอร์');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้ที่มีความรู้พื้นฐานด้านการใช้งานคอมพิวเตอร์');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ระบบบำรุงรักษาเชิงป้องกันและการจัดทำข้อมูล');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ระบบบำรุงรักษาเชิงป้องกันและการจัดทำข้อมูล');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'โครงสร้างสำคัญของระบบบำรุงรักษาเชิงป้องกัน (Preventive Maintenance System)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'โครงสร้างสำคัญของระบบบำรุงรักษาเชิงป้องกัน (Preventive Maintenance System)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอนการจัดทำระบบบำรุงรักษาเชิงป้องกัน (PM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอนการจัดทำระบบบำรุงรักษาเชิงป้องกัน (PM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การพิจารณาเลือกเครื่องจักรเข้าสู่ระบบ การจัดทำทะเบียนเครื่องจักรและอุปกรณ์ และการจัดลำดับความสำคัญเครื่องจักร (A, B, C)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การพิจารณาเลือกเครื่องจักรเข้าสู่ระบบ การจัดทำทะเบียนเครื่องจักรและอุปกรณ์ และการจัดลำดับความสำคัญเครื่องจักร (A, B, C)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำและเขียนมาตรฐานงานบำรุงรักษา (Work Instruction : WI) รวมถึงการกำหนดหมายเลขงาน วัสดุ อะไหล่ และเครื่องมือบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำและเขียนมาตรฐานงานบำรุงรักษา (Work Instruction : WI) รวมถึงการกำหนดหมายเลขงาน วัสดุ อะไหล่ และเครื่องมือบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เทคนิคการวางแผนปฏิทินบำรุงรักษาอย่างมีประสิทธิภาพ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เทคนิคการวางแผนปฏิทินบำรุงรักษาอย่างมีประสิทธิภาพ');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ภาคปฏิบัติการใช้โปรแกรม PMTECH');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ภาคปฏิบัติการใช้โปรแกรม PMTECH');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบันทึกข้อมูลเครื่องจักรและอุปกรณ์ (Plant Data)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบันทึกข้อมูลเครื่องจักรและอุปกรณ์ (Plant Data)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบันทึกข้อมูลมาตรฐานบำรุงรักษา (Work Instruction : WI)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบันทึกข้อมูลมาตรฐานบำรุงรักษา (Work Instruction : WI)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบันทึกข้อมูลวัสดุ อะไหล่ และเครื่องมือบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบันทึกข้อมูลวัสดุ อะไหล่ และเครื่องมือบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำคู่มือแม่แบบบำรุงรักษาโรงงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำคู่มือแม่แบบบำรุงรักษาโรงงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวางแผนปฏิทินบำรุงรักษา กำหนดความถี่เป็นรายวัน รายสัปดาห์ รายเดือน ชั่วโมงการทำงาน หรือระยะทางกิโลเมตร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวางแผนปฏิทินบำรุงรักษา กำหนดความถี่เป็นรายวัน รายสัปดาห์ รายเดือน ชั่วโมงการทำงาน หรือระยะทางกิโลเมตร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบำรุงรักษาตามแผนอิสระ – เลือกสายการผลิต กลุ่มงาน พื้นที่ ขอบเขต ความสำคัญของเครื่องจักร หน่วยงานหรือแผนกได้ตามต้องการ พร้อมความสามารถในการเลื่อนแผนเข้า-ออกตามแผนการผลิต');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบำรุงรักษาตามแผนอิสระ – เลือกสายการผลิต กลุ่มงาน พื้นที่ ขอบเขต ความสำคัญของเครื่องจักร หน่วยงานหรือแผนกได้ตามต้องการ พร้อมความสามารถในการเลื่อนแผนเข้า-ออกตามแผนการผลิต');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำใบงานบำรุงรักษา (PM List)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำใบงานบำรุงรักษา (PM List)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 7);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบันทึกและเรียกดูรายการงานค้าง (Pending Jobs)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบันทึกและเรียกดูรายการงานค้าง (Pending Jobs)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 8);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'โครงสร้างสำคัญของระบบบำรุงรักษาเชิงป้องกัน (Preventive Maintenance System)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'โครงสร้างสำคัญของระบบบำรุงรักษาเชิงป้องกัน (Preventive Maintenance System)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอนการจัดทำระบบบำรุงรักษาเชิงป้องกัน (PM)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอนการจัดทำระบบบำรุงรักษาเชิงป้องกัน (PM)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การพิจารณาเลือกเครื่องจักร การจัดทำทะเบียนเครื่องจักร และการจัดลำดับความสำคัญ (A, B, C)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การพิจารณาเลือกเครื่องจักร การจัดทำทะเบียนเครื่องจักร และการจัดลำดับความสำคัญ (A, B, C)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจัดทำและเขียนมาตรฐานงานบำรุงรักษา (Work Instruction : WI)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจัดทำและเขียนมาตรฐานงานบำรุงรักษา (Work Instruction : WI)');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เทคนิคการวางแผนปฏิทินบำรุงรักษาอย่างมีประสิทธิภาพ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เทคนิคการวางแผนปฏิทินบำรุงรักษาอย่างมีประสิทธิภาพ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ภาคปฏิบัติ – การใช้โปรแกรม PMTECH (1 ท่าน ต่อ 1 เครื่องคอมพิวเตอร์)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ภาคปฏิบัติ – การใช้โปรแกรม PMTECH (1 ท่าน ต่อ 1 เครื่องคอมพิวเตอร์)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'บรรยายควบคู่กับภาคปฏิบัติ โดยใช้เครื่องคอมพิวเตอร์พร้อมโปรแกรมสำเร็จรูปที่สามารถใช้งานได้ทันที');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'บรรยายควบคู่กับภาคปฏิบัติ โดยใช้เครื่องคอมพิวเตอร์พร้อมโปรแกรมสำเร็จรูปที่สามารถใช้งานได้ทันที');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course MST004
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('MST004', 'kpi-maintenance-history-budget', 'MST', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'โปรแกรมสำหรับบันทึกประวัติซ่อม บริหารงบประมาณ และประเมินผล', 'หลักสูตร 1 วัน เรียนรู้การใช้โปรแกรม KPI''s Maintenance บันทึกประวัติซ่อม คำนวณ OEE, MTBF, MTTR, MAF, RF จัดทำรายงานค่าใช้จ่ายซ่อมบำรุง และงบประมาณซ่อมบำรุงแต่ละหน่วยงาน (1 ท่าน ต่อ 1 เครื่องคอมพิวเตอร์)', 'สิ่งจำเป็นอย่างยิ่งของการจัดทำระบบซ่อมบำรุงที่ขาดไม่ได้ คือ "ประวัติการซ่อม และการวัด–ประเมินระบบซ่อมบำรุง" เพื่อติดตามผล ประเมินความสำเร็จ ค้นหาจุดแข็งและจุดอ่อน รวมถึงใช้เป็นสถิติข้อมูลสำคัญในการวางแผนในอนาคต', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'KPI''s Maintenance Program for Repair History, Budget Management and Evaluation', 'หลักสูตร 1 วัน เรียนรู้การใช้โปรแกรม KPI''s Maintenance บันทึกประวัติซ่อม คำนวณ OEE, MTBF, MTTR, MAF, RF จัดทำรายงานค่าใช้จ่ายซ่อมบำรุง และงบประมาณซ่อมบำรุงแต่ละหน่วยงาน (1 ท่าน ต่อ 1 เครื่องคอมพิวเตอร์)', 'สิ่งจำเป็นอย่างยิ่งของการจัดทำระบบซ่อมบำรุงที่ขาดไม่ได้ คือ "ประวัติการซ่อม และการวัด–ประเมินระบบซ่อมบำรุง" เพื่อติดตามผล ประเมินความสำเร็จ ค้นหาจุดแข็งและจุดอ่อน รวมถึงใช้เป็นสถิติข้อมูลสำคัญในการวางแผนในอนาคต', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้และความเข้าใจในการจัดทำและประเมินระบบซ่อมบำรุงอย่างเป็นขั้นตอน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้และความเข้าใจในการจัดทำและประเมินระบบซ่อมบำรุงอย่างเป็นขั้นตอน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สามารถคำนวณและประเมินค่าประสิทธิภาพระบบซ่อมบำรุง รวมถึงค่าซ่อมบำรุงต่อหน่วยได้อย่างแม่นยำ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สามารถคำนวณและประเมินค่าประสิทธิภาพระบบซ่อมบำรุง รวมถึงค่าซ่อมบำรุงต่อหน่วยได้อย่างแม่นยำ');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร ช่างเทคนิค ช่างซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร ช่างเทคนิค ช่างซ่อมบำรุง');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ความรู้และขั้นตอนการจัดทำระบบ');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ความรู้และขั้นตอนการจัดทำระบบ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความเข้าใจในการจัดทำทะเบียนเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความเข้าใจในการจัดทำทะเบียนเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การแบ่งสายการผลิตและกลุ่มการผลิต');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การแบ่งสายการผลิตและกลุ่มการผลิต');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำผังงาน ประเภทงานซ่อม และการกำหนดหน่วยงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำผังงาน ประเภทงานซ่อม และการกำหนดหน่วยงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจำแนกประเภทงานบำรุงรักษาและค่าใช้จ่ายงานบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจำแนกประเภทงานบำรุงรักษาและค่าใช้จ่ายงานบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความเข้าใจและขั้นตอนการจัดทำประวัติและรายงานการวัดผลระบบซ่อมบำรุง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความเข้าใจและขั้นตอนการจัดทำประวัติและรายงานการวัดผลระบบซ่อมบำรุง');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ภาคปฏิบัติการใช้โปรแกรม (1 ท่าน ต่อ 1 เครื่องคอมพิวเตอร์)');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ภาคปฏิบัติการใช้โปรแกรม (1 ท่าน ต่อ 1 เครื่องคอมพิวเตอร์)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอนการใช้โปรแกรมบันทึกข้อมูล');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอนการใช้โปรแกรมบันทึกข้อมูล');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'สาเหตุการหยุดและการเดินเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'สาเหตุการหยุดและการเดินเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประวัติการซ่อมบำรุง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประวัติการซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ค่าใช้จ่ายการซ่อมบำรุง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ค่าใช้จ่ายการซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำงบประมาณการซ่อมบำรุงแต่ละหน่วยงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำงบประมาณการซ่อมบำรุงแต่ละหน่วยงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การคำนวณประสิทธิภาพเครื่องจักรโดยรวม (OEE)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การคำนวณประสิทธิภาพเครื่องจักรโดยรวม (OEE)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความพร้อมเดินเครื่องจักรเพื่อส่งให้ฝ่ายผลิต (MAF: Machine Availability Factor)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความพร้อมเดินเครื่องจักรเพื่อส่งให้ฝ่ายผลิต (MAF: Machine Availability Factor)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 7);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประสิทธิภาพการเดินเครื่องจักร (RF: Run Factor)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประสิทธิภาพการเดินเครื่องจักร (RF: Run Factor)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 8);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เวลาหยุดเครื่องฉุกเฉิน (Breakdown)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เวลาหยุดเครื่องฉุกเฉิน (Breakdown)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 9);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เวลาเฉลี่ยระหว่างการขัดข้องต่อครั้ง (MTBF: Mean Time Between Failure)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เวลาเฉลี่ยระหว่างการขัดข้องต่อครั้ง (MTBF: Mean Time Between Failure)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 10);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เวลาเฉลี่ยการซ่อมต่อครั้ง (MTTR: Mean Time To Repair)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เวลาเฉลี่ยการซ่อมต่อครั้ง (MTTR: Mean Time To Repair)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 11);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำรายงานและกราฟประสิทธิภาพเครื่องจักร (รายวัน, รายเดือน, รายเครื่องจักร, กลุ่มเครื่องจักร, รายหน่วยงาน)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำรายงานและกราฟประสิทธิภาพเครื่องจักร (รายวัน, รายเดือน, รายเครื่องจักร, กลุ่มเครื่องจักร, รายหน่วยงาน)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 12);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความเข้าใจในการจัดทำทะเบียนเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความเข้าใจในการจัดทำทะเบียนเครื่องจักร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจำแนกประเภทงานบำรุงรักษาและค่าใช้จ่ายงานบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจำแนกประเภทงานบำรุงรักษาและค่าใช้จ่ายงานบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความเข้าใจและขั้นตอนการจัดทำประวัติและรายงานการวัดผลระบบซ่อมบำรุง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความเข้าใจและขั้นตอนการจัดทำประวัติและรายงานการวัดผลระบบซ่อมบำรุง');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอนการใช้โปรแกรมบันทึกข้อมูล');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอนการใช้โปรแกรมบันทึกข้อมูล');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การคำนวณค่าประสิทธิภาพระบบ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การคำนวณค่าประสิทธิภาพระบบ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'สาธิตตัวอย่างการบันทึกข้อมูล พร้อมฝึกปฏิบัติวิธีการบันทึกอย่างถูกต้องและครบถ้วน');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'สาธิตตัวอย่างการบันทึกข้อมูล พร้อมฝึกปฏิบัติวิธีการบันทึกอย่างถูกต้องและครบถ้วน');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'บรรยายควบคู่กับภาคปฏิบัติ โดยใช้เครื่องคอมพิวเตอร์พร้อมโปรแกรมสำเร็จรูปที่สามารถใช้งานได้ทันที');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'บรรยายควบคู่กับภาคปฏิบัติ โดยใช้เครื่องคอมพิวเตอร์พร้อมโปรแกรมสำเร็จรูปที่สามารถใช้งานได้ทันที');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course MST005
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('MST005', 'spare-parts-management', 'MST', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'โปรแกรมคลังอะไหล่อัตโนมัติสำหรับงานซ่อมบำรุง', 'หลักสูตร 1 วัน เรียนรู้การใช้โปรแกรมคลังอะไหล่อัตโนมัติ (MS Access) บริหารจัดการวัสดุและอะไหล่ซ่อมบำรุงอย่างเป็นระบบ ควบคุมสต๊อก กำหนดจุดสั่งซื้อ (OP) และออกรายงานประสิทธิภาพการหมุนเวียน', 'ในโรงงานอุตสาหกรรม ปัจจัยสำคัญอย่างหนึ่งของการบริหารระบบซ่อมบำรุงให้มีประสิทธิภาพ คือ การจัดการระบบวัสดุและอะไหล่ซ่อมบำรุง การนำโปรแกรมคอมพิวเตอร์มาประยุกต์ใช้ช่วยให้การบริหารเป็นไปอย่างมีระบบ ลดค่าใช้จ่าย ลดจำนวนเงินจม และดอกเบี้ยจากวัสดุและอะไหล่คงคลัง', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Spare Parts Maintenance Management Program', 'หลักสูตร 1 วัน เรียนรู้การใช้โปรแกรมคลังอะไหล่อัตโนมัติ (MS Access) บริหารจัดการวัสดุและอะไหล่ซ่อมบำรุงอย่างเป็นระบบ ควบคุมสต๊อก กำหนดจุดสั่งซื้อ (OP) และออกรายงานประสิทธิภาพการหมุนเวียน', 'ในโรงงานอุตสาหกรรม ปัจจัยสำคัญอย่างหนึ่งของการบริหารระบบซ่อมบำรุงให้มีประสิทธิภาพ คือ การจัดการระบบวัสดุและอะไหล่ซ่อมบำรุง การนำโปรแกรมคอมพิวเตอร์มาประยุกต์ใช้ช่วยให้การบริหารเป็นไปอย่างมีระบบ ลดค่าใช้จ่าย ลดจำนวนเงินจม และดอกเบี้ยจากวัสดุและอะไหล่คงคลัง', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจหลักการและขั้นตอนการบริหารจัดการวัสดุอะไหล่อย่างเป็นระบบ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจหลักการและขั้นตอนการบริหารจัดการวัสดุอะไหล่อย่างเป็นระบบ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เรียนรู้การใช้โปรแกรมคอมพิวเตอร์เพิ่มประสิทธิภาพและลดต้นทุน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เรียนรู้การใช้โปรแกรมคอมพิวเตอร์เพิ่มประสิทธิภาพและลดต้นทุน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'พัฒนาทักษะการควบคุม ตรวจสอบ และติดตามวัสดุอะไหล่อย่างแม่นยำ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'พัฒนาทักษะการควบคุม ตรวจสอบ และติดตามวัสดุอะไหล่อย่างแม่นยำ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'วิเคราะห์ข้อมูลและจัดทำรายงานเพื่อการตัดสินใจอย่างมีประสิทธิผล');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'วิเคราะห์ข้อมูลและจัดทำรายงานเพื่อการตัดสินใจอย่างมีประสิทธิผล');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้า พนักงานการจัดการคลัง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้า พนักงานการจัดการคลัง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานควบคุมเครื่องจักรและซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานควบคุมเครื่องจักรและซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้สนใจทั่วไป');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้สนใจทั่วไป');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'โครงสร้างและการจัดทำระบบคลังอะไหล่');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'โครงสร้างและการจัดทำระบบคลังอะไหล่');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'โครงสร้างระบบบริหารวัสดุอะไหล่ซ่อมบำรุง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'โครงสร้างระบบบริหารวัสดุอะไหล่ซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอนการจัดทำระบบ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอนการจัดทำระบบ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดทะเบียน รหัส Part Number และชื่อวัสดุอะไหล่');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดทะเบียน รหัส Part Number และชื่อวัสดุอะไหล่');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดรหัสสต๊อก (Stock Number)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดรหัสสต๊อก (Stock Number)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดเลขที่คลังและตำแหน่งจัดเก็บ (Location)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดเลขที่คลังและตำแหน่งจัดเก็บ (Location)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การรับ–จ่ายวัสดุอะไหล่');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การรับ–จ่ายวัสดุอะไหล่');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การตรวจนับวัสดุอะไหล่');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การตรวจนับวัสดุอะไหล่');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 7);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ปัจจัยสำคัญในการควบคุมวัสดุอะไหล่ (วัสดุ/อะไหล่, ระบบควบคุม, บัญชีและการเงิน, การจัดทำข้อมูล)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ปัจจัยสำคัญในการควบคุมวัสดุอะไหล่ (วัสดุ/อะไหล่, ระบบควบคุม, บัญชีและการเงิน, การจัดทำข้อมูล)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 8);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'จัดกลุ่มวัสดุอะไหล่ตามความสำคัญ (A, B, C)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'จัดกลุ่มวัสดุอะไหล่ตามความสำคัญ (A, B, C)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 9);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดจุดสั่งซื้อ (OP) จำนวนสั่งซื้อที่ประหยัด (EOQ) ค่าคงคลังต่ำสุด (MIN) และสูงสุด (MAX)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดจุดสั่งซื้อ (OP) จำนวนสั่งซื้อที่ประหยัด (EOQ) ค่าคงคลังต่ำสุด (MIN) และสูงสุด (MAX)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 10);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'กลุ่มประเภทวัสดุ แหล่งผู้ขายและลำดับการเลือกซื้อ (Vendor) ข้อมูลพนักงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'กลุ่มประเภทวัสดุ แหล่งผู้ขายและลำดับการเลือกซื้อ (Vendor) ข้อมูลพนักงาน');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ภาคปฏิบัติการใช้โปรแกรม MS Access');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ภาคปฏิบัติการใช้โปรแกรม MS Access');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การบันทึกและจัดการข้อมูลคลังวัสดุอะไหล่');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การบันทึกและจัดการข้อมูลคลังวัสดุอะไหล่');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การรับวัสดุเข้าคลัง พร้อมบันทึกประวัติและรายงานรายวัน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การรับวัสดุเข้าคลัง พร้อมบันทึกประวัติและรายงานรายวัน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเบิกจ่ายวัสดุ พร้อมประวัติและรายงานรายวัน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเบิกจ่ายวัสดุ พร้อมประวัติและรายงานรายวัน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'รายงานคงเหลือในคลัง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'รายงานคงเหลือในคลัง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'รายงานการใช้วัสดุตามทะเบียน / เครื่องจักร / อุปกรณ์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'รายงานการใช้วัสดุตามทะเบียน / เครื่องจักร / อุปกรณ์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'รายงานวัสดุสำคัญประเภท A');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'รายงานวัสดุสำคัญประเภท A');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'รายงานพร้อมกราฟการรับ–จ่าย และคงเหลือ (ทั้งจำนวนและมูลค่า)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'รายงานพร้อมกราฟการรับ–จ่าย และคงเหลือ (ทั้งจำนวนและมูลค่า)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 7);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'รายงานประสิทธิภาพการหมุนเวียน (Turn Over)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'รายงานประสิทธิภาพการหมุนเวียน (Turn Over)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 8);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การรายงานระดับเตือนภัย (วัสดุไม่เคลื่อนไหว, วัสดุต่ำกว่า MIN, วัสดุถึง OP, วัสดุสูงกว่า MAX)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การรายงานระดับเตือนภัย (วัสดุไม่เคลื่อนไหว, วัสดุต่ำกว่า MIN, วัสดุถึง OP, วัสดุสูงกว่า MAX)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 9);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'โครงสร้างระบบบริหารวัสดุอะไหล่ซ่อมบำรุง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'โครงสร้างระบบบริหารวัสดุอะไหล่ซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอนการจัดทำระบบ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอนการจัดทำระบบ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ปัจจัยสำคัญในการควบคุมวัสดุอะไหล่');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ปัจจัยสำคัญในการควบคุมวัสดุอะไหล่');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจัดทำข้อมูล');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจัดทำข้อมูล');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจัดทำรายการคลังอะไหล่');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจัดทำรายการคลังอะไหล่');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ปฏิบัติการใช้โปรแกรมคอมพิวเตอร์สำเร็จรูป MS Access พร้อมตัวอย่างการบันทึกข้อมูล');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ปฏิบัติการใช้โปรแกรมคอมพิวเตอร์สำเร็จรูป MS Access พร้อมตัวอย่างการบันทึกข้อมูล');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การรายงานสถานะวัสดุอะไหล่');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การรายงานสถานะวัสดุอะไหล่');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม–ตอบ และแลกเปลี่ยนความคิดเห็น');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การใช้โปรแกรม Spare Parts Maintenance Management');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การใช้โปรแกรม Spare Parts Maintenance Management');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course ANA001
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('ANA001', 'root-cause-analysis', 'ANA', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การวิเคราะห์หาสาเหตุรากของปัญหา (Root Cause Analysis)', 'หลักสูตร 1 วัน เรียนรู้เทคนิคและเครื่องมือการวิเคราะห์สาเหตุที่แท้จริงของปัญหาหลากหลายรูปแบบ (Cause & Effect Diagram, Why-Why Analysis, PM Analysis, FMEA, VDO Analysis, AI Analysis) เพื่อป้องกันการเกิดซ้ำ', 'ในโรงงานอุตสาหกรรม ปัญหาที่เกิดขึ้นในกระบวนการผลิต การทำงาน และงานบำรุงรักษา หากไม่สามารถระบุและแก้ไขที่สาเหตุที่แท้จริงได้อย่างตรงจุด ปัญหาเดิมก็จะเกิดซ้ำ การเลือกใช้เทคนิคและเครื่องมือการวิเคราะห์สาเหตุอย่างเหมาะสมจะช่วยให้ค้นหาต้นตอได้รวดเร็วและแม่นยำ', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Root Cause Analysis', 'หลักสูตร 1 วัน เรียนรู้เทคนิคและเครื่องมือการวิเคราะห์สาเหตุที่แท้จริงของปัญหาหลากหลายรูปแบบ (Cause & Effect Diagram, Why-Why Analysis, PM Analysis, FMEA, VDO Analysis, AI Analysis) เพื่อป้องกันการเกิดซ้ำ', 'ในโรงงานอุตสาหกรรม ปัญหาที่เกิดขึ้นในกระบวนการผลิต การทำงาน และงานบำรุงรักษา หากไม่สามารถระบุและแก้ไขที่สาเหตุที่แท้จริงได้อย่างตรงจุด ปัญหาเดิมก็จะเกิดซ้ำ การเลือกใช้เทคนิคและเครื่องมือการวิเคราะห์สาเหตุอย่างเหมาะสมจะช่วยให้ค้นหาต้นตอได้รวดเร็วและแม่นยำ', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ความรู้และความเข้าใจในการค้นหาปัญหาและวิเคราะห์สาเหตุที่แท้จริง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ความรู้และความเข้าใจในการค้นหาปัญหาและวิเคราะห์สาเหตุที่แท้จริง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เทคนิคการเลือกใช้เครื่องมือวิเคราะห์สาเหตุให้เหมาะสมกับลักษณะของปัญหาและงาน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เทคนิคการเลือกใช้เครื่องมือวิเคราะห์สาเหตุให้เหมาะสมกับลักษณะของปัญหาและงาน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ตัวอย่างกรณีศึกษาการวิเคราะห์และการแก้ไขปัญหาที่สามารถนำไปประยุกต์ใช้ได้จริง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ตัวอย่างกรณีศึกษาการวิเคราะห์และการแก้ไขปัญหาที่สามารถนำไปประยุกต์ใช้ได้จริง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'การฝึกปฏิบัติค้นหาปัญหาและวิเคราะห์สาเหตุจากสถานการณ์จริง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'การฝึกปฏิบัติค้นหาปัญหาและวิเคราะห์สาเหตุจากสถานการณ์จริง');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกรและหัวหน้างานที่เกี่ยวข้องกับกระบวนการผลิตหรือบำรุงรักษา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกรและหัวหน้างานที่เกี่ยวข้องกับกระบวนการผลิตหรือบำรุงรักษา');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายออกแบบ ผลิต คุณภาพ ซ่อมบำรุง และจัดซื้อ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายออกแบบ ผลิต คุณภาพ ซ่อมบำรุง และจัดซื้อ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการพัฒนาระบบ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการพัฒนาระบบ');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การค้นหาและจัดลำดับปัญหา');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การค้นหาและจัดลำดับปัญหา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การค้นหาปัญหาและแหล่งที่มา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การค้นหาปัญหาและแหล่งที่มา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การตั้งหัวข้อสาเหตุของปัญหา และข้อที่ควรระวัง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การตั้งหัวข้อสาเหตุของปัญหา และข้อที่ควรระวัง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดลำดับความสำคัญในการวิเคราะห์และแก้ไขปัญหา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดลำดับความสำคัญในการวิเคราะห์และแก้ไขปัญหา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ภาคปฏิบัติการ #1 เพื่อค้นหาปัญหาจากสถานการณ์จริง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ภาคปฏิบัติการ #1 เพื่อค้นหาปัญหาจากสถานการณ์จริง');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'เทคนิคและเครื่องมือวิเคราะห์สาเหตุ');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'เทคนิคและเครื่องมือวิเคราะห์สาเหตุ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แผนผังแสดงเหตุและผล (Cause & Effect Diagram)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แผนผังแสดงเหตุและผล (Cause & Effect Diagram)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ปัญหา (Why-Why Analysis)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ปัญหา (Why-Why Analysis)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ปรากฏการณ์ (PM Analysis)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ปรากฏการณ์ (PM Analysis)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ข้อบกพร่องและผลกระทบ (FMEA)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ข้อบกพร่องและผลกระทบ (FMEA)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์จากวิดีโอ (VDO Analysis)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์จากวิดีโอ (VDO Analysis)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ด้วย AI และการตั้งโจทย์ (Prompting) อย่างมีประสิทธิภาพ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ด้วย AI และการตั้งโจทย์ (Prompting) อย่างมีประสิทธิภาพ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ภาคปฏิบัติ #2 การเลือกใช้เทคนิคเครื่องมือให้เหมาะกับปัญหา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ภาคปฏิบัติ #2 การเลือกใช้เทคนิคเครื่องมือให้เหมาะกับปัญหา');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การค้นหาปัญหาและแหล่งที่มา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การค้นหาปัญหาและแหล่งที่มา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การตั้งหัวข้อสาเหตุของปัญหา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การตั้งหัวข้อสาเหตุของปัญหา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจัดลำดับความสำคัญ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจัดลำดับความสำคัญ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ภาคปฏิบัติการ #1');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ภาคปฏิบัติการ #1');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เทคนิคและเครื่องมือวิเคราะห์สาเหตุ (Cause & Effect, Why-Why, PM Analysis, FMEA, VDO Analysis, AI)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เทคนิคและเครื่องมือวิเคราะห์สาเหตุ (Cause & Effect, Why-Why, PM Analysis, FMEA, VDO Analysis, AI)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ภาคปฏิบัติ #2');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ภาคปฏิบัติ #2');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ และแลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ และแลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course ANA002
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('ANA002', '5-why-analysis', 'ANA', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การวิเคราะห์ปัญหาแบบ 5 Why', 'หลักสูตร 1 วัน เรียนรู้เทคนิคการวิเคราะห์ปัญหาอย่างเป็นระบบด้วย Why-Why Analysis เพื่อค้นหาต้นตอของปัญหาที่แท้จริงจากเครื่องจักร อุปกรณ์ หรือกระบวนการผลิต พร้อมฝึกปฏิบัติจากสถานการณ์จริง', 'การวิเคราะห์ปัญหาจำเป็นต้องค้นหาต้นเหตุอย่างเป็นระบบ โดยใช้ประสบการณ์ ทักษะ และการตั้งคำถาม "ทำไม...ทำไม" (Why-Why Analysis) กับเหตุการณ์ที่เกิดขึ้น เพื่อสืบหาต้นตอของปัญหาที่แท้จริง', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', '5 Why Analysis', 'หลักสูตร 1 วัน เรียนรู้เทคนิคการวิเคราะห์ปัญหาอย่างเป็นระบบด้วย Why-Why Analysis เพื่อค้นหาต้นตอของปัญหาที่แท้จริงจากเครื่องจักร อุปกรณ์ หรือกระบวนการผลิต พร้อมฝึกปฏิบัติจากสถานการณ์จริง', 'การวิเคราะห์ปัญหาจำเป็นต้องค้นหาต้นเหตุอย่างเป็นระบบ โดยใช้ประสบการณ์ ทักษะ และการตั้งคำถาม "ทำไม...ทำไม" (Why-Why Analysis) กับเหตุการณ์ที่เกิดขึ้น เพื่อสืบหาต้นตอของปัญหาที่แท้จริง', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้ผู้เข้าอบรมมีความรู้ความเข้าใจในหลักการวิเคราะห์สาเหตุอย่างเป็นระบบ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้ผู้เข้าอบรมมีความรู้ความเข้าใจในหลักการวิเคราะห์สาเหตุอย่างเป็นระบบ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อฝึกทักษะการใช้ Why Why Analysis ในการแก้ปัญหาจริง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อฝึกทักษะการใช้ Why Why Analysis ในการแก้ปัญหาจริง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อเสริมสร้างความสามารถในการทำงานร่วมกัน วิเคราะห์ปัญหาโดยใช้ประสบการณ์และความรู้หน้างาน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อเสริมสร้างความสามารถในการทำงานร่วมกัน วิเคราะห์ปัญหาโดยใช้ประสบการณ์และความรู้หน้างาน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อเพิ่มประสิทธิภาพการทำงาน ลดข้อบกพร่องและความสูญเสีย');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อเพิ่มประสิทธิภาพการทำงาน ลดข้อบกพร่องและความสูญเสีย');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายคุณภาพ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายคุณภาพ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 6);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้สนใจทั่วไป');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้สนใจทั่วไป');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'หลักการ Why-Why Analysis');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'หลักการ Why-Why Analysis');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวทางและลักษณะของการวิเคราะห์ปัญหาแบบ Why-Why Analysis');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวทางและลักษณะของการวิเคราะห์ปัญหาแบบ Why-Why Analysis');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'คุณสมบัติที่จำเป็นของผู้วิเคราะห์ปัญหา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'คุณสมบัติที่จำเป็นของผู้วิเคราะห์ปัญหา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Know My Machine: ความรู้เกี่ยวกับหน้าที่ ส่วนประกอบ และหลักการทำงานของเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Know My Machine: ความรู้เกี่ยวกับหน้าที่ ส่วนประกอบ และหลักการทำงานของเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เทคนิคการวิเคราะห์ปัญหาอย่างเป็นระบบด้วย Why-Why Analysis');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เทคนิคการวิเคราะห์ปัญหาอย่างเป็นระบบด้วย Why-Why Analysis');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'หัวใจสำคัญในการวิเคราะห์ (Key Points)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'หัวใจสำคัญในการวิเคราะห์ (Key Points)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การปฏิบัติ');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การปฏิบัติ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอนการดำเนินการวิเคราะห์แบบ Why-Why Analysis');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอนการดำเนินการวิเคราะห์แบบ Why-Why Analysis');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'กรณีตัวอย่างการวิเคราะห์และการแก้ไขปัญหา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'กรณีตัวอย่างการวิเคราะห์และการแก้ไขปัญหา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Workshop ฝึกปฏิบัติ: วิเคราะห์ปัญหาจากสถานการณ์จริงในที่ทำงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Workshop ฝึกปฏิบัติ: วิเคราะห์ปัญหาจากสถานการณ์จริงในที่ทำงาน');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวทางและลักษณะของการวิเคราะห์แบบ Why-Why Analysis');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวทางและลักษณะของการวิเคราะห์แบบ Why-Why Analysis');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'คุณสมบัติของผู้วิเคราะห์ปัญหา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'คุณสมบัติของผู้วิเคราะห์ปัญหา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Know My Machine');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Know My Machine');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เทคนิคการวิเคราะห์ปัญหา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เทคนิคการวิเคราะห์ปัญหา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'หัวใจสำคัญในการวิเคราะห์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'หัวใจสำคัญในการวิเคราะห์');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอนการดำเนินการวิเคราะห์แบบ Why-Why Analysis');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอนการดำเนินการวิเคราะห์แบบ Why-Why Analysis');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'กรณีตัวอย่าง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'กรณีตัวอย่าง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Workshop ฝึกปฏิบัติ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Workshop ฝึกปฏิบัติ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'N/A');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course ANA003
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('ANA003', 'physical-mechanism-analysis', 'ANA', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การวิเคราะห์กลไกทางกายภาพ (Physical Mechanism Analysis)', 'หลักสูตร 1 วัน เรียนรู้การใช้ PM Analysis เพื่อวิเคราะห์เชิงลึกในด้านกลไก โครงสร้าง และส่วนประกอบของเครื่องจักร ด้วย 8 ขั้นตอน เพื่อขจัดปัญหาเรื้อรังอย่างยั่งยืน', 'ความสูญเสียและปัญหาที่เกิดขึ้นซ้ำซากเรื้อรัง แก้ไม่หายขาด มักเกิดจากการใช้เครื่องมือวิเคราะห์แบบเดิมที่ไม่สามารถเข้าถึงต้นตอของปัญหาได้ PM Analysis ช่วยวิเคราะห์เชิงวิศวกรรมเพื่อตรวจสอบสิ่งผิดปกติที่แฝงอยู่และนำไปสู่การแก้ไขอย่างตรงจุดและยั่งยืน', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Physical Mechanism Analysis (PM Analysis)', 'หลักสูตร 1 วัน เรียนรู้การใช้ PM Analysis เพื่อวิเคราะห์เชิงลึกในด้านกลไก โครงสร้าง และส่วนประกอบของเครื่องจักร ด้วย 8 ขั้นตอน เพื่อขจัดปัญหาเรื้อรังอย่างยั่งยืน', 'ความสูญเสียและปัญหาที่เกิดขึ้นซ้ำซากเรื้อรัง แก้ไม่หายขาด มักเกิดจากการใช้เครื่องมือวิเคราะห์แบบเดิมที่ไม่สามารถเข้าถึงต้นตอของปัญหาได้ PM Analysis ช่วยวิเคราะห์เชิงวิศวกรรมเพื่อตรวจสอบสิ่งผิดปกติที่แฝงอยู่และนำไปสู่การแก้ไขอย่างตรงจุดและยั่งยืน', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้มีความรู้ เข้าใจหลักการ วิเคราะห์หน้าที่ ส่วนประกอบ การทำงานเครื่องจักรและอุปกรณ์');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้มีความรู้ เข้าใจหลักการ วิเคราะห์หน้าที่ ส่วนประกอบ การทำงานเครื่องจักรและอุปกรณ์');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'การใช้เทคนิควิศวกรรมขจัดปัญหาเรื้อรัง (โรคประจำตัวเครื่องจักร อุปกรณ์)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'การใช้เทคนิควิศวกรรมขจัดปัญหาเรื้อรัง (โรคประจำตัวเครื่องจักร อุปกรณ์)');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ความรู้ ความเข้าใจ ขั้นตอนการวิเคราะห์แก้ไข PM Analysis');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ความรู้ ความเข้าใจ ขั้นตอนการวิเคราะห์แก้ไข PM Analysis');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายคุณภาพ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายคุณภาพ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายพัฒนาระบบ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายพัฒนาระบบ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 6);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'PM Analysis');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'PM Analysis');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'PM Analysis คืออะไร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'PM Analysis คืออะไร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Know My Machine วิเคราะห์หน้าที่ ส่วนประกอบการทำงาน เครื่องจักรและอุปกรณ์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Know My Machine วิเคราะห์หน้าที่ ส่วนประกอบการทำงาน เครื่องจักรและอุปกรณ์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เทคนิควิศวกรรมขจัดปัญหาเรื้อรัง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เทคนิควิศวกรรมขจัดปัญหาเรื้อรัง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวคิดพื้นฐานก่อนทำ PM Analysis');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวคิดพื้นฐานก่อนทำ PM Analysis');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', '8 ขั้นตอนการทำ PM Analysis');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', '8 ขั้นตอนการทำ PM Analysis');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ตัวอย่างการวิเคราะห์แก้ไขปัญหา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ตัวอย่างการวิเคราะห์แก้ไขปัญหา');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'PM Analysis คืออะไร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'PM Analysis คืออะไร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Know My Machine');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Know My Machine');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เทคนิควิศวกรรมขจัดปัญหาเรื้อรัง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เทคนิควิศวกรรมขจัดปัญหาเรื้อรัง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวคิดพื้นฐานก่อนทำ PM Analysis');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวคิดพื้นฐานก่อนทำ PM Analysis');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', '8 ขั้นตอน การทำ PM Analysis');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', '8 ขั้นตอน การทำ PM Analysis');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ตัวอย่างการวิเคราะห์แก้ไขปัญหา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ตัวอย่างการวิเคราะห์แก้ไขปัญหา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ภาคปฏิบัติ Workshop จากปัญหาในที่ทำงาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ภาคปฏิบัติ Workshop จากปัญหาในที่ทำงาน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course ANA004
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('ANA004', 'fmea', 'ANA', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การวิเคราะห์ข้อบกพร่อง สิ่งผิดปกติ และผลกระทบอย่างเป็นระบบ (FMEA)', 'หลักสูตร 1 วัน เรียนรู้การจัดทำ Process-FMEA การคำนวณ RPN (Risk Priority Number) และการใช้แบบฟอร์ม FMEA เพื่อป้องกันความผิดพลาดในกระบวนการผลิต การบริการ และงานบำรุงรักษา', 'FMEA (Failure Mode and Effect Analysis) เป็นเครื่องมือสำคัญที่ช่วยวิเคราะห์และประเมินความเสี่ยงที่อาจเกิดขึ้นจากข้อบกพร่องในกระบวนการต่างๆ สามารถนำมาประยุกต์ใช้ได้อย่างมีประสิทธิภาพในทุกประเภทของงาน', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Failure Mode and Effect Analysis (FMEA)', 'หลักสูตร 1 วัน เรียนรู้การจัดทำ Process-FMEA การคำนวณ RPN (Risk Priority Number) และการใช้แบบฟอร์ม FMEA เพื่อป้องกันความผิดพลาดในกระบวนการผลิต การบริการ และงานบำรุงรักษา', 'FMEA (Failure Mode and Effect Analysis) เป็นเครื่องมือสำคัญที่ช่วยวิเคราะห์และประเมินความเสี่ยงที่อาจเกิดขึ้นจากข้อบกพร่องในกระบวนการต่างๆ สามารถนำมาประยุกต์ใช้ได้อย่างมีประสิทธิภาพในทุกประเภทของงาน', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้ผู้เข้าร่วมมีความเข้าใจในหลักการและขั้นตอนการวิเคราะห์ข้อบกพร่องและผลกระทบ (FMEA)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้ผู้เข้าร่วมมีความเข้าใจในหลักการและขั้นตอนการวิเคราะห์ข้อบกพร่องและผลกระทบ (FMEA)');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้ผู้เข้าร่วมเข้าใจบทบาทและหน้าที่ของแต่ละหน่วยงานที่เกี่ยวข้องในการจัดทำ FMEA');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้ผู้เข้าร่วมเข้าใจบทบาทและหน้าที่ของแต่ละหน่วยงานที่เกี่ยวข้องในการจัดทำ FMEA');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้ผู้เข้าร่วมสามารถจัดทำ Process-FMEA ได้อย่างถูกต้อง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้ผู้เข้าร่วมสามารถจัดทำ Process-FMEA ได้อย่างถูกต้อง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อเสริมสร้างความมั่นใจในการบริหารจัดการงานผลิต บริการ และบำรุงรักษา');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อเสริมสร้างความมั่นใจในการบริหารจัดการงานผลิต บริการ และบำรุงรักษา');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกรและหัวหน้างานที่เกี่ยวข้องกับกระบวนการผลิตหรือบำรุงรักษา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกรและหัวหน้างานที่เกี่ยวข้องกับกระบวนการผลิตหรือบำรุงรักษา');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายออกแบบ ผลิต คุณภาพ ซ่อมบำรุง และจัดซื้อ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายออกแบบ ผลิต คุณภาพ ซ่อมบำรุง และจัดซื้อ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการพัฒนาระบบ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการพัฒนาระบบ');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'หลักการ FMEA');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'หลักการ FMEA');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความหมายและความสำคัญของ FMEA');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความหมายและความสำคัญของ FMEA');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ลักษณะและวัตถุประสงค์ของเครื่องมือ FMEA');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ลักษณะและวัตถุประสงค์ของเครื่องมือ FMEA');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวคิดพื้นฐานก่อนเริ่มการวิเคราะห์ FMEA');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวคิดพื้นฐานก่อนเริ่มการวิเคราะห์ FMEA');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การใช้ FMEA เพื่อป้องกันปัญหาซ้ำและปัญหาใหม่');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การใช้ FMEA เพื่อป้องกันปัญหาซ้ำและปัญหาใหม่');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประเภทของ FMEA');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประเภทของ FMEA');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'จะใช้ FMEA เมื่อใด เหมาะสำหรับบุคคลใด');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'จะใช้ FMEA เมื่อใด เหมาะสำหรับบุคคลใด');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การจัดทำ FMEA');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การจัดทำ FMEA');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'กลไกการทำงานและคำจำกัดความที่เกี่ยวข้องของ FMEA');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'กลไกการทำงานและคำจำกัดความที่เกี่ยวข้องของ FMEA');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'หลักการคำนวณ RPN (Risk Priority Number) และการจัดลำดับความสำคัญ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'หลักการคำนวณ RPN (Risk Priority Number) และการจัดลำดับความสำคัญ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การแบ่งบทบาทและความรับผิดชอบของทีมงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การแบ่งบทบาทและความรับผิดชอบของทีมงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การใช้แบบฟอร์ม พร้อมภาคปฏิบัติ FMEA');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การใช้แบบฟอร์ม พร้อมภาคปฏิบัติ FMEA');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความหมายและความสำคัญของ FMEA');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความหมายและความสำคัญของ FMEA');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ลักษณะและวัตถุประสงค์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ลักษณะและวัตถุประสงค์');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวคิดพื้นฐาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวคิดพื้นฐาน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การใช้ FMEA เพื่อป้องกันปัญหา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การใช้ FMEA เพื่อป้องกันปัญหา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ประเภทของ FMEA');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ประเภทของ FMEA');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 5);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'จะใช้ FMEA เมื่อใด');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'จะใช้ FMEA เมื่อใด');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'กลไกการทำงานและคำจำกัดความของ FMEA');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'กลไกการทำงานและคำจำกัดความของ FMEA');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การคำนวณ RPN และการจัดลำดับความสำคัญ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การคำนวณ RPN และการจัดลำดับความสำคัญ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การแบ่งบทบาทของทีมงาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การแบ่งบทบาทของทีมงาน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การใช้แบบฟอร์ม พร้อมภาคปฏิบัติ FMEA');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การใช้แบบฟอร์ม พร้อมภาคปฏิบัติ FMEA');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ และแลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ และแลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course ANA005
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('ANA005', 'component-failure-analysis', 'ANA', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การวิเคราะห์การเสียหายของชิ้นส่วนเครื่องจักร', 'หลักสูตร 1 วัน เรียนรู้การวิเคราะห์รูปแบบและสาเหตุความเสียหายของชิ้นส่วนเครื่องจักร (แบริ่ง เฟือง สายพาน โซ่ขับ ซีล สารหล่อลื่น ฯลฯ) พร้อมแนวทางแก้ไขและป้องกันปัญหาซ้ำซาก', 'การเสียหาย ขัดข้อง สึกหรอ แตกร้าว หรือหักขาดของชิ้นส่วนเครื่องจักร หากไม่วิเคราะห์หาสาเหตุที่แท้จริง กลับเลือกวิธีถอด-เปลี่ยน-ประกอบใหม่ ปัญหาก็จะเกิดซ้ำ ทำให้เครื่องจักรขัดข้องบ่อย ต้นทุนเพิ่ม และเวลาการผลิตสูญเสีย', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Machine Component Failure Analysis', 'หลักสูตร 1 วัน เรียนรู้การวิเคราะห์รูปแบบและสาเหตุความเสียหายของชิ้นส่วนเครื่องจักร (แบริ่ง เฟือง สายพาน โซ่ขับ ซีล สารหล่อลื่น ฯลฯ) พร้อมแนวทางแก้ไขและป้องกันปัญหาซ้ำซาก', 'การเสียหาย ขัดข้อง สึกหรอ แตกร้าว หรือหักขาดของชิ้นส่วนเครื่องจักร หากไม่วิเคราะห์หาสาเหตุที่แท้จริง กลับเลือกวิธีถอด-เปลี่ยน-ประกอบใหม่ ปัญหาก็จะเกิดซ้ำ ทำให้เครื่องจักรขัดข้องบ่อย ต้นทุนเพิ่ม และเวลาการผลิตสูญเสีย', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้เข้าใจรูปแบบและสาเหตุของการเสียหายของชิ้นส่วนเครื่องจักรในรูปแบบต่างๆ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้เข้าใจรูปแบบและสาเหตุของการเสียหายของชิ้นส่วนเครื่องจักรในรูปแบบต่างๆ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อพัฒนาทักษะในการวิเคราะห์ แก้ไข และป้องกันปัญหาความเสียหายอย่างตรงจุด');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อพัฒนาทักษะในการวิเคราะห์ แก้ไข และป้องกันปัญหาความเสียหายอย่างตรงจุด');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อส่งเสริมการคิดเชิงวิเคราะห์และการบำรุงรักษาเชิงป้องกัน (Preventive Maintenance)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อส่งเสริมการคิดเชิงวิเคราะห์และการบำรุงรักษาเชิงป้องกัน (Preventive Maintenance)');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้สามารถประยุกต์ใช้ความรู้กับหน้างานจริงได้ทันที');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้สามารถประยุกต์ใช้ความรู้กับหน้างานจริงได้ทันที');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 4);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อเพิ่มขีดความสามารถในการแข่งขันขององค์กร ผ่านการลดต้นทุนจากความเสียหายซ้ำซาก');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อเพิ่มขีดความสามารถในการแข่งขันขององค์กร ผ่านการลดต้นทุนจากความเสียหายซ้ำซาก');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานฝ่ายผลิตและฝ่ายบำรุงรักษา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานฝ่ายผลิตและฝ่ายบำรุงรักษา');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิคบำรุงรักษา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิคบำรุงรักษา');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'พื้นฐานความเสียหายชิ้นส่วนเครื่องจักร');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'พื้นฐานความเสียหายชิ้นส่วนเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้พื้นฐานเกี่ยวกับสาเหตุการเสียหายของชิ้นส่วนเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้พื้นฐานเกี่ยวกับสาเหตุการเสียหายของชิ้นส่วนเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประเภทของการเสียหายและแนวทางป้องกัน: การแตกหัก, การบิดงอ/เสียรูป, การสึกหรอ, การกัดกร่อน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประเภทของการเสียหายและแนวทางป้องกัน: การแตกหัก, การบิดงอ/เสียรูป, การสึกหรอ, การกัดกร่อน');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การวิเคราะห์เชิงปฏิบัติ');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การวิเคราะห์เชิงปฏิบัติ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การแตกร้าว หักขาด สกรู เพลา พร้อมแนวทางแก้ไขป้องกันและการบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การแตกร้าว หักขาด สกรู เพลา พร้อมแนวทางแก้ไขป้องกันและการบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ความเสียหายแบริ่ง พร้อมแนวทางแก้ไขป้องกัน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ความเสียหายแบริ่ง พร้อมแนวทางแก้ไขป้องกัน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ความเสียหายเฟือง เกียร์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ความเสียหายเฟือง เกียร์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ความเสียหายสายพานขับ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ความเสียหายสายพานขับ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ความเสียหายโซ่ขับ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ความเสียหายโซ่ขับ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ความเสียหายซีลโอริ่ง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ความเสียหายซีลโอริ่ง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ความเสียหายสารหล่อลื่น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ความเสียหายสารหล่อลื่น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 7);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวัดความเสียหายของแบริ่ง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวัดความเสียหายของแบริ่ง');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ทดสอบความรู้ก่อนการสัมมนา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ทดสอบความรู้ก่อนการสัมมนา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความรู้พื้นฐานเกี่ยวกับสาเหตุการเสียหายของชิ้นส่วนเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความรู้พื้นฐานเกี่ยวกับสาเหตุการเสียหายของชิ้นส่วนเครื่องจักร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ประเภทของการเสียหายและแนวทางป้องกัน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ประเภทของการเสียหายและแนวทางป้องกัน');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์เชิงปฏิบัติ พร้อมตัวอย่างชิ้นส่วน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์เชิงปฏิบัติ พร้อมตัวอย่างชิ้นส่วน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ทดสอบความรู้ก่อน-หลังการสัมมนา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ทดสอบความรู้ก่อน-หลังการสัมมนา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ และแลกเปลี่ยนความคิดเห็น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ และแลกเปลี่ยนความคิดเห็น');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 2);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'ทดสอบความรู้ก่อน-หลังการสัมมนา');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'ทดสอบความรู้ก่อน-หลังการสัมมนา');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course ANA006
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('ANA006', 'motor-problem-analysis', 'ANA', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การวิเคราะห์และป้องกันปัญหามอเตอร์', 'หลักสูตร 1 วัน เรียนรู้การวิเคราะห์สาเหตุปัญหาของมอเตอร์ไฟฟ้าด้วย Why-Why Analysis และการฝึกภาคปฏิบัติตรวจวัดสุขภาพมอเตอร์ (เสียง อุณหภูมิ การสั่นสะเทือน ความเสียหายแบริ่ง)', 'มอเตอร์เป็นเครื่องต้นกำลังที่สำคัญในโรงงานอุตสาหกรรม หากมีความรู้และความเข้าใจในการวิเคราะห์และแก้ไขปัญหาที่เกิดจากมอเตอร์ จะช่วยวางแผนบำรุงรักษาได้เหมาะสม ลดความเสี่ยง Breakdown ยืดอายุการใช้งาน และลดต้นทุน', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Motor Problem Analysis and Prevention', 'หลักสูตร 1 วัน เรียนรู้การวิเคราะห์สาเหตุปัญหาของมอเตอร์ไฟฟ้าด้วย Why-Why Analysis และการฝึกภาคปฏิบัติตรวจวัดสุขภาพมอเตอร์ (เสียง อุณหภูมิ การสั่นสะเทือน ความเสียหายแบริ่ง)', 'มอเตอร์เป็นเครื่องต้นกำลังที่สำคัญในโรงงานอุตสาหกรรม หากมีความรู้และความเข้าใจในการวิเคราะห์และแก้ไขปัญหาที่เกิดจากมอเตอร์ จะช่วยวางแผนบำรุงรักษาได้เหมาะสม ลดความเสี่ยง Breakdown ยืดอายุการใช้งาน และลดต้นทุน', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ทักษะในการวิเคราะห์ แก้ไข และป้องกันปัญหาที่เกิดจากมอเตอร์');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ทักษะในการวิเคราะห์ แก้ไข และป้องกันปัญหาที่เกิดจากมอเตอร์');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สามารถเรียนรู้การใช้หลักการวิเคราะห์ด้วยการตั้งคำถาม (Why-Why Analysis) เพื่อค้นหาต้นตอของปัญหา');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สามารถเรียนรู้การใช้หลักการวิเคราะห์ด้วยการตั้งคำถาม (Why-Why Analysis) เพื่อค้นหาต้นตอของปัญหา');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อเป็นแนวทางการพัฒนาระบบบำรุงรักษาที่หลากหลาย ไม่จำกัดเพียงการทำ PM');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อเป็นแนวทางการพัฒนาระบบบำรุงรักษาที่หลากหลาย ไม่จำกัดเพียงการทำ PM');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายการผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายการผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างไฟฟ้า');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างไฟฟ้า');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ความรู้เรื่องมอเตอร์และการวิเคราะห์ปัญหา');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ความรู้เรื่องมอเตอร์และการวิเคราะห์ปัญหา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเรียนรู้เรื่องมอเตอร์ไฟฟ้า (Know My Motor)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเรียนรู้เรื่องมอเตอร์ไฟฟ้า (Know My Motor)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ปัญหาที่พบบ่อยในการใช้งาน การเสียขัดข้อง และคุณภาพของมอเตอร์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ปัญหาที่พบบ่อยในการใช้งาน การเสียขัดข้อง และคุณภาพของมอเตอร์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'หลักการวิเคราะห์ปัญหา: ทำไมมอเตอร์ไหม้, แบริ่งมอเตอร์ร้อน, แบริ่งมอเตอร์แตก, เพลามอเตอร์สึก/คลอน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'หลักการวิเคราะห์ปัญหา: ทำไมมอเตอร์ไหม้, แบริ่งมอเตอร์ร้อน, แบริ่งมอเตอร์แตก, เพลามอเตอร์สึก/คลอน');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การพัฒนาระบบบำรุงรักษามอเตอร์');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การพัฒนาระบบบำรุงรักษามอเตอร์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระบบบำรุงรักษาเชิงรุก (PoM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระบบบำรุงรักษาเชิงรุก (PoM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระบบบำรุงรักษาเชิงป้องกัน (PM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระบบบำรุงรักษาเชิงป้องกัน (PM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระบบตรวจวัดสุขภาพและทำนายอายุการใช้งาน (PdM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระบบตรวจวัดสุขภาพและทำนายอายุการใช้งาน (PdM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ภาคปฏิบัติ: การสาธิตตรวจวัดสุขภาพมอเตอร์ (เสียง, อุณหภูมิ, การสั่นสะเทือน, ความเสียหายแบริ่ง)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ภาคปฏิบัติ: การสาธิตตรวจวัดสุขภาพมอเตอร์ (เสียง, อุณหภูมิ, การสั่นสะเทือน, ความเสียหายแบริ่ง)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การปรับตั้ง Overload ให้ถูกต้องเพื่อป้องกันมอเตอร์ไหม้');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การปรับตั้ง Overload ให้ถูกต้องเพื่อป้องกันมอเตอร์ไหม้');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'มาตรฐานการบำรุงรักษามอเตอร์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'มาตรฐานการบำรุงรักษามอเตอร์');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Know My Motor');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Know My Motor');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ปัญหาที่พบบ่อยในการใช้งาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ปัญหาที่พบบ่อยในการใช้งาน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Why-Why Analysis สำหรับมอเตอร์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Why-Why Analysis สำหรับมอเตอร์');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การพัฒนาระบบบำรุงรักษา (PoM, PM, PdM)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การพัฒนาระบบบำรุงรักษา (PoM, PM, PdM)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ภาคปฏิบัติ: การสาธิตตรวจวัดสุขภาพมอเตอร์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ภาคปฏิบัติ: การสาธิตตรวจวัดสุขภาพมอเตอร์');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'มาตรฐานการบำรุงรักษามอเตอร์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'มาตรฐานการบำรุงรักษามอเตอร์');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ และแลกเปลี่ยนความคิดเห็น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ และแลกเปลี่ยนความคิดเห็น');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course ANA007
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('ANA007', 'bearing-problem-analysis', 'ANA', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การวิเคราะห์และป้องกันปัญหาแบริ่ง', 'หลักสูตร 1 วัน เรียนรู้โครงสร้างและประเภทของตลับลูกปืน การถอดและประกอบอย่างถูกต้อง การวิเคราะห์สาเหตุความเสียหาย และการวัดการสั่นสะเทือนเพื่อประเมินความเสียหายของแบริ่ง', 'แบริ่งหรือตลับลูกปืนเป็นชิ้นส่วนสำคัญของเครื่องจักรที่มีการหมุนเคลื่อนที่ หากเลือกใช้ไม่เหมาะสม ประกอบไม่ถูกต้อง หรือขาดการบำรุงรักษา ย่อมนำไปสู่ปัญหา Breakdown สูญเสียประสิทธิภาพการผลิต และเกิดค่าใช้จ่ายสูงโดยไม่จำเป็น', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Bearing Problem Analysis and Prevention', 'หลักสูตร 1 วัน เรียนรู้โครงสร้างและประเภทของตลับลูกปืน การถอดและประกอบอย่างถูกต้อง การวิเคราะห์สาเหตุความเสียหาย และการวัดการสั่นสะเทือนเพื่อประเมินความเสียหายของแบริ่ง', 'แบริ่งหรือตลับลูกปืนเป็นชิ้นส่วนสำคัญของเครื่องจักรที่มีการหมุนเคลื่อนที่ หากเลือกใช้ไม่เหมาะสม ประกอบไม่ถูกต้อง หรือขาดการบำรุงรักษา ย่อมนำไปสู่ปัญหา Breakdown สูญเสียประสิทธิภาพการผลิต และเกิดค่าใช้จ่ายสูงโดยไม่จำเป็น', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อความเข้าใจหน้าที่ของส่วนประกอบตลับลูกปืน พร้อมสามารถเลือกใช้งานได้อย่างเหมาะสม');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อความเข้าใจหน้าที่ของส่วนประกอบตลับลูกปืน พร้อมสามารถเลือกใช้งานได้อย่างเหมาะสม');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สามารถระบุขนาดและพิกัดของตลับลูกปืนจากอนุกรมมาตรฐานได้อย่างแม่นยำ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สามารถระบุขนาดและพิกัดของตลับลูกปืนจากอนุกรมมาตรฐานได้อย่างแม่นยำ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อฝึกทักษะในการประกอบและติดตั้งตลับลูกปืนอย่างถูกวิธีเพื่อลดความเสี่ยง Breakdown');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อฝึกทักษะในการประกอบและติดตั้งตลับลูกปืนอย่างถูกวิธีเพื่อลดความเสี่ยง Breakdown');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'วิเคราะห์สาเหตุการเสียหาย เพื่อป้องกันการเกิดซ้ำ และวางแผนการบำรุงรักษาอย่างมีประสิทธิภาพ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'วิเคราะห์สาเหตุการเสียหาย เพื่อป้องกันการเกิดซ้ำ และวางแผนการบำรุงรักษาอย่างมีประสิทธิภาพ');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานควบคุมเครื่องจักร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานควบคุมเครื่องจักร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร/ช่างเทคนิคการซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร/ช่างเทคนิคการซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้สนใจทั่วไป');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้สนใจทั่วไป');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ความรู้เรื่องตลับลูกปืน');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ความรู้เรื่องตลับลูกปืน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'โครงสร้าง ชนิด และประเภทของตลับลูกปืน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'โครงสร้าง ชนิด และประเภทของตลับลูกปืน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'รูปแบบการจัดเรียงเลขรหัส และการอ่านรหัสตลับลูกปืน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'รูปแบบการจัดเรียงเลขรหัส และการอ่านรหัสตลับลูกปืน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'หลักการออกแบบและการเลือกใช้ตลับลูกปืนให้เหมาะสมกับการใช้งาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'หลักการออกแบบและการเลือกใช้ตลับลูกปืนให้เหมาะสมกับการใช้งาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เทคนิคการถอดและประกอบแบริ่งอย่างถูกต้อง เพื่อยืดอายุการใช้งานและลดต้นทุน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เทคนิคการถอดและประกอบแบริ่งอย่างถูกต้อง เพื่อยืดอายุการใช้งานและลดต้นทุน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวัดค่าช่องว่างภายใน ระยะเผื่อ และพิกัดงานสวมประกอบแบริ่ง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวัดค่าช่องว่างภายใน ระยะเผื่อ และพิกัดงานสวมประกอบแบริ่ง');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การบำรุงรักษาและวิเคราะห์แบริ่ง');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การบำรุงรักษาและวิเคราะห์แบริ่ง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเลือกใช้ชนิดน้ำมันและจาระบีสำหรับแบริ่ง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเลือกใช้ชนิดน้ำมันและจาระบีสำหรับแบริ่ง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'มาตรฐานระดับน้ำมันหล่อลื่นและปริมาณความถี่ในการอัดจาระบี');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'มาตรฐานระดับน้ำมันหล่อลื่นและปริมาณความถี่ในการอัดจาระบี');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์สาเหตุความเสียหายของแบริ่ง และแนวทางป้องกันปัญหาซ้ำ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์สาเหตุความเสียหายของแบริ่ง และแนวทางป้องกันปัญหาซ้ำ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การใช้โสตทัศนูปกรณ์ (Visual Inspection)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การใช้โสตทัศนูปกรณ์ (Visual Inspection)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวัดและวิเคราะห์การสั่นสะเทือนเพื่อประเมินความเสียหายของแบริ่ง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวัดและวิเคราะห์การสั่นสะเทือนเพื่อประเมินความเสียหายของแบริ่ง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ค่าพิกัดการสั่นและการประเมินความเสียหายของแบริ่งและเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ค่าพิกัดการสั่นและการประเมินความเสียหายของแบริ่งและเครื่องจักร');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'โครงสร้าง ชนิด และประเภทของตลับลูกปืน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'โครงสร้าง ชนิด และประเภทของตลับลูกปืน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การอ่านรหัสตลับลูกปืน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การอ่านรหัสตลับลูกปืน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การเลือกใช้ตลับลูกปืน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การเลือกใช้ตลับลูกปืน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เทคนิคการถอดและประกอบแบริ่ง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เทคนิคการถอดและประกอบแบริ่ง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวัดค่าช่องว่างและพิกัดงานสวม');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวัดค่าช่องว่างและพิกัดงานสวม');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การเลือกใช้น้ำมันและจาระบีสำหรับแบริ่ง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การเลือกใช้น้ำมันและจาระบีสำหรับแบริ่ง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์สาเหตุความเสียหายของแบริ่ง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์สาเหตุความเสียหายของแบริ่ง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวทางการบำรุงรักษาแบริ่ง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวทางการบำรุงรักษาแบริ่ง');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ค่าพิกัดการสั่นและการประเมินความเสียหาย');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ค่าพิกัดการสั่นและการประเมินความเสียหาย');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ภาคปฏิบัติ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ภาคปฏิบัติ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 5);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ และแลกเปลี่ยนความคิดเห็น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ และแลกเปลี่ยนความคิดเห็น');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course ANA008
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('ANA008', 'qc-7-tools', 'ANA', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'เทคนิคการใช้ QC 7 Tools เพื่อการปรับปรุงงาน', 'หลักสูตร 1 วัน เรียนรู้การใช้เครื่องมือ QC 7 Tools ได้แก่ Check Sheet, Bar Chart, Pareto Diagram, Cause and Effect Diagram, Histogram, Scatter Diagram และ Control Chart เพื่อวิเคราะห์และแก้ไขปัญหาอย่างเป็นระบบ', 'การเลือกใช้เครื่องมือวิเคราะห์และแก้ไขปัญหา QC 7 Tools อย่างเหมาะสมกับปัญหาจำเป็นต้องมีแนวคิดในการวางแผนจัดเก็บและจำแนกข้อมูลอย่างเหมาะสมตั้งแต่ต้น เพื่อป้องกันความผิดพลาดและลดการสูญเสียเวลา', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'QC 7 Tools for Work Improvement', 'หลักสูตร 1 วัน เรียนรู้การใช้เครื่องมือ QC 7 Tools ได้แก่ Check Sheet, Bar Chart, Pareto Diagram, Cause and Effect Diagram, Histogram, Scatter Diagram และ Control Chart เพื่อวิเคราะห์และแก้ไขปัญหาอย่างเป็นระบบ', 'การเลือกใช้เครื่องมือวิเคราะห์และแก้ไขปัญหา QC 7 Tools อย่างเหมาะสมกับปัญหาจำเป็นต้องมีแนวคิดในการวางแผนจัดเก็บและจำแนกข้อมูลอย่างเหมาะสมตั้งแต่ต้น เพื่อป้องกันความผิดพลาดและลดการสูญเสียเวลา', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อพัฒนาความรู้และทักษะในการเก็บและวิเคราะห์ข้อมูลให้เหมาะสมกับปัญหาที่พบ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อพัฒนาความรู้และทักษะในการเก็บและวิเคราะห์ข้อมูลให้เหมาะสมกับปัญหาที่พบ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้ผู้เข้าอบรมมีความรู้ ความเข้าใจ และสามารถเลือกใช้เครื่องมือ QC 7 Tools ได้อย่างเหมาะสม');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้ผู้เข้าอบรมมีความรู้ ความเข้าใจ และสามารถเลือกใช้เครื่องมือ QC 7 Tools ได้อย่างเหมาะสม');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อฝึกการวิเคราะห์และแก้ไขปัญหาอย่างเป็นระบบโดยอ้างอิงจากข้อมูลจริง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อฝึกการวิเคราะห์และแก้ไขปัญหาอย่างเป็นระบบโดยอ้างอิงจากข้อมูลจริง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อสามารถประยุกต์ใช้เครื่องมือต่างๆ ในกระบวนการทำงานจริงได้อย่างมีประสิทธิภาพ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อสามารถประยุกต์ใช้เครื่องมือต่างๆ ในกระบวนการทำงานจริงได้อย่างมีประสิทธิภาพ');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานระดับผู้นำ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานระดับผู้นำ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานควบคุมเครื่องจักรและซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานควบคุมเครื่องจักรและซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้สนใจทั่วไป');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้สนใจทั่วไป');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'หลักการแก้ไขปัญหาอย่างเป็นระบบ');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'หลักการแก้ไขปัญหาอย่างเป็นระบบ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การระบุปัญหา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การระบุปัญหา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวคิดและหลักการในการแก้ไขปัญหาอย่างเป็นระบบ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวคิดและหลักการในการแก้ไขปัญหาอย่างเป็นระบบ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์สาเหตุและที่มาของปัญหา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์สาเหตุและที่มาของปัญหา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดเกณฑ์ประเมินและการเปรียบเทียบก่อน-หลังการแก้ไขปัญหา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดเกณฑ์ประเมินและการเปรียบเทียบก่อน-หลังการแก้ไขปัญหา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอนและกระบวนการในการแก้ไขปัญหา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอนและกระบวนการในการแก้ไขปัญหา');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'QC 7 Tools');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'QC 7 Tools');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ใบตรวจสอบ (Check Sheet)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ใบตรวจสอบ (Check Sheet)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แผนภูมิแท่ง (Bar Chart/Box Chart)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แผนภูมิแท่ง (Bar Chart/Box Chart)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แผนภาพพาเรโต (Pareto Diagram)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แผนภาพพาเรโต (Pareto Diagram)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แผนภูมิก้างปลา (Cause and Effect Diagram)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แผนภูมิก้างปลา (Cause and Effect Diagram)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ฮีสโตแกรม (Histogram)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ฮีสโตแกรม (Histogram)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แผนภูมิการกระจาย (Scatter Diagram)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แผนภูมิการกระจาย (Scatter Diagram)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'กราฟควบคุม (Control Chart)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'กราฟควบคุม (Control Chart)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 7);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'กราฟเส้น (Line Graph) และกราฟวงกลม (Pie Chart)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'กราฟเส้น (Line Graph) และกราฟวงกลม (Pie Chart)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 8);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การประยุกต์ใช้ QC 7 Tools ในสถานการณ์จริงขององค์กร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การประยุกต์ใช้ QC 7 Tools ในสถานการณ์จริงขององค์กร');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การระบุปัญหา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การระบุปัญหา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวคิดและหลักการแก้ไขปัญหาอย่างเป็นระบบ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวคิดและหลักการแก้ไขปัญหาอย่างเป็นระบบ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์สาเหตุและที่มาของปัญหา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์สาเหตุและที่มาของปัญหา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การกำหนดเกณฑ์ประเมิน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การกำหนดเกณฑ์ประเมิน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การตั้งชื่อปัญหา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การตั้งชื่อปัญหา');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ภาคปฏิบัติ การประยุกต์ใช้ QC 7 Tools ในสถานการณ์จริงขององค์กร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ภาคปฏิบัติ การประยุกต์ใช้ QC 7 Tools ในสถานการณ์จริงขององค์กร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ และแลกเปลี่ยนความคิดเห็น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ และแลกเปลี่ยนความคิดเห็น');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรและเจ้าหน้าที่ปรึกษาแนะนำที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติ (Workshop)');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติ (Workshop)');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course IMP001
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('IMP001', '7-wastes-reduction', 'IMP', '1 วัน', '20 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การลดความสูญเสีย 7 ประการ (7 Wastes Reduction)', 'หลักสูตร 1 วัน เรียนรู้การระบุและขจัดความสูญเสีย 7 ประการในกระบวนการทำงาน เพื่อเพิ่มผลผลิต ลดต้นทุน และส่งมอบได้ทันเวลา', 'การเพิ่มผลผลิต ลดต้นทุน และส่งมอบได้ทันเวลา สามารถทำให้องค์การลดความสูญเสียทุกรูปแบบในกระบวนการทำงานทุกสายงาน หากไม่ให้ความสนใจสังเกตและพยายามปรับปรุงแก้ไข ความสูญเสียก็ยิ่งเพิ่มขึ้น การลดความสูญเสียถือเป็นหน้าที่ของพนักงานและผู้บริหารทุกคน', '1 วัน', '20 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', '7 Wastes Reduction', 'หลักสูตร 1 วัน เรียนรู้การระบุและขจัดความสูญเสีย 7 ประการในกระบวนการทำงาน เพื่อเพิ่มผลผลิต ลดต้นทุน และส่งมอบได้ทันเวลา', 'การเพิ่มผลผลิต ลดต้นทุน และส่งมอบได้ทันเวลา สามารถทำให้องค์การลดความสูญเสียทุกรูปแบบในกระบวนการทำงานทุกสายงาน หากไม่ให้ความสนใจสังเกตและพยายามปรับปรุงแก้ไข ความสูญเสียก็ยิ่งเพิ่มขึ้น การลดความสูญเสียถือเป็นหน้าที่ของพนักงานและผู้บริหารทุกคน', '1 Day', '20 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้ผู้เข้าอบรมได้เรียนรู้และตระหนักถึงความสูญเสียที่เกิดขึ้นในการทำงาน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้ผู้เข้าอบรมได้เรียนรู้และตระหนักถึงความสูญเสียที่เกิดขึ้นในการทำงาน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้เกิดความรู้และความเข้าใจเทคนิคการสังเกตความสูญเสีย 7 ประการ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้เกิดความรู้และความเข้าใจเทคนิคการสังเกตความสูญเสีย 7 ประการ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้สามารถนำความรู้ไปใช้ในทางปฏิบัติเพื่อปรับปรุงสภาพแวดล้อมและกระบวนการทำงานได้อย่างมีประสิทธิผล');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้สามารถนำความรู้ไปใช้ในทางปฏิบัติเพื่อปรับปรุงสภาพแวดล้อมและกระบวนการทำงานได้อย่างมีประสิทธิผล');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้บริหาร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้บริหาร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้สนใจทั่วไป');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้สนใจทั่วไป');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ความสูญเสียและการปรับปรุง');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ความสูญเสียและการปรับปรุง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประเภทของความสูญเสีย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประเภทของความสูญเสีย');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวทางการปรับปรุงเพื่อลดและขจัดความสูญเสีย');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวทางการปรับปรุงเพื่อลดและขจัดความสูญเสีย');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวคิดด้านผลิตภาพ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวคิดด้านผลิตภาพ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวคิดกิจกรรมที่ก่อให้เกิดคุณค่าในงาน (Value Added)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวคิดกิจกรรมที่ก่อให้เกิดคุณค่าในงาน (Value Added)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'หลักการความสูญเสีย 7 ประการ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'หลักการความสูญเสีย 7 ประการ');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวทางการปรับปรุงเพื่อลดและขจัดความสูญเสีย');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวทางการปรับปรุงเพื่อลดและขจัดความสูญเสีย');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แบ่งกลุ่มฝึกปฏิบัติ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แบ่งกลุ่มฝึกปฏิบัติ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ค้นหาและวางแผนการลดความสูญเสีย');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ค้นหาและวางแผนการลดความสูญเสีย');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เสนอผลงานกลุ่ม สรุป');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เสนอผลงานกลุ่ม สรุป');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรที่ปรึกษาที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรที่ปรึกษาที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติโดยใช้กรณีศึกษาและนำเสนอผลงาน');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติโดยใช้กรณีศึกษาและนำเสนอผลงาน');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');
INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 1);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมค่าเดินทาง ค่าที่พัก (ถ้ามี)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course IMP002
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('IMP002', 'cost-reduction', 'IMP', '1 วัน', '20 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'เทคนิคการลดต้นทุน (Cost Reduction)', 'หลักสูตร 1 วัน เรียนรู้เทคนิคและเครื่องมือในการวิเคราะห์และลดต้นทุนอย่างเป็นระบบ เพื่อเพิ่มผลกำไรและความสามารถในการแข่งขันขององค์กร', 'ปัจจุบันต้นทุนคือสิ่งสำคัญในการดำเนินกิจกรรมทางธุรกิจ เนื่องจากการแข่งขันที่สูงและสภาวะเปลี่ยนแปลงรวดเร็ว องค์กรควรให้ความสำคัญในการปรับปรุงต้นทุนอย่างต่อเนื่องโดยมุ่งค้นหาและขจัดความสูญเสีย โดยคุณภาพของสินค้าและบริการต้องไม่ลดลง', '1 วัน', '20 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Cost Reduction Techniques', 'หลักสูตร 1 วัน เรียนรู้เทคนิคและเครื่องมือในการวิเคราะห์และลดต้นทุนอย่างเป็นระบบ เพื่อเพิ่มผลกำไรและความสามารถในการแข่งขันขององค์กร', 'ปัจจุบันต้นทุนคือสิ่งสำคัญในการดำเนินกิจกรรมทางธุรกิจ เนื่องจากการแข่งขันที่สูงและสภาวะเปลี่ยนแปลงรวดเร็ว องค์กรควรให้ความสำคัญในการปรับปรุงต้นทุนอย่างต่อเนื่องโดยมุ่งค้นหาและขจัดความสูญเสีย โดยคุณภาพของสินค้าและบริการต้องไม่ลดลง', '1 Day', '20 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้ผู้เข้าอบรมได้เรียนรู้และตระหนักถึงความสำคัญของต้นทุน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้ผู้เข้าอบรมได้เรียนรู้และตระหนักถึงความสำคัญของต้นทุน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจความสัมพันธ์ของการลดต้นทุนและสร้างความได้เปรียบในการแข่งขัน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจความสัมพันธ์ของการลดต้นทุนและสร้างความได้เปรียบในการแข่งขัน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สามารถระบุปัจจัยที่เกี่ยวข้องกับโครงสร้างต้นทุนและการจำแนกต้นทุน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สามารถระบุปัจจัยที่เกี่ยวข้องกับโครงสร้างต้นทุนและการจำแนกต้นทุน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สามารถวิเคราะห์ต้นทุนได้อย่างเป็นระบบ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สามารถวิเคราะห์ต้นทุนได้อย่างเป็นระบบ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 4);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจขั้นตอนและเครื่องมือในการลดต้นทุนเพื่อยกระดับผลิตภาพขององค์กร');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจขั้นตอนและเครื่องมือในการลดต้นทุนเพื่อยกระดับผลิตภาพขององค์กร');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 5);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สามารถประยุกต์ใช้เทคนิคการลดต้นทุนในการปรับปรุงงานประจำของตนเองได้');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สามารถประยุกต์ใช้เทคนิคการลดต้นทุนในการปรับปรุงงานประจำของตนเองได้');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานระดับปฏิบัติการ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานระดับปฏิบัติการ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานผู้ใช้เครื่องจักร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานผู้ใช้เครื่องจักร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการ');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'พื้นฐานการลดต้นทุน');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'พื้นฐานการลดต้นทุน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความสำคัญของการลดต้นทุน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความสำคัญของการลดต้นทุน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความสัมพันธ์ของการลดต้นทุนกับการเพิ่มผลิตภาพ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความสัมพันธ์ของการลดต้นทุนกับการเพิ่มผลิตภาพ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'หลักการโครงสร้างต้นทุน ต้นทุนผันแปร ต้นทุนมาตรฐาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'หลักการโครงสร้างต้นทุน ต้นทุนผันแปร ต้นทุนมาตรฐาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวคิดกิจกรรมที่ก่อให้เกิดคุณค่าในงาน (Value Added)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวคิดกิจกรรมที่ก่อให้เกิดคุณค่าในงาน (Value Added)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'หลักการความสูญเสีย 7 ประการ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'หลักการความสูญเสีย 7 ประการ');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'เครื่องมือลดต้นทุน');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'เครื่องมือลดต้นทุน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เทคนิคการลดต้นทุนอย่างมีประสิทธิภาพ (ทีละขั้นตอน)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เทคนิคการลดต้นทุนอย่างมีประสิทธิภาพ (ทีละขั้นตอน)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เครื่องมือในการเพิ่มผลิตภาพที่สำคัญสำหรับการลดต้นทุน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เครื่องมือในการเพิ่มผลิตภาพที่สำคัญสำหรับการลดต้นทุน');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความสำคัญของการลดต้นทุน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความสำคัญของการลดต้นทุน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'หลักการโครงสร้างต้นทุน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'หลักการโครงสร้างต้นทุน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวคิด Value Added');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวคิด Value Added');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'หลักการความสูญเสีย 7 ประการ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'หลักการความสูญเสีย 7 ประการ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เทคนิคการลดต้นทุนอย่างมีประสิทธิภาพ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เทคนิคการลดต้นทุนอย่างมีประสิทธิภาพ');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เครื่องมือในการเพิ่มผลิตภาพสำหรับการลดต้นทุน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เครื่องมือในการเพิ่มผลิตภาพสำหรับการลดต้นทุน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แบ่งกลุ่มฝึกปฏิบัติ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แบ่งกลุ่มฝึกปฏิบัติ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เสนอผลงานกลุ่ม สรุป');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เสนอผลงานกลุ่ม สรุป');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรที่ปรึกษา');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรที่ปรึกษา');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกปฏิบัติโดยใช้กรณีศึกษาและนำเสนอผลงาน');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกปฏิบัติโดยใช้กรณีศึกษาและนำเสนอผลงาน');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');
INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 1);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมค่าเดินทาง ค่าที่พัก (ถ้ามี)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course IMP003
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('IMP003', 'lean-manufacturing', 'IMP', '1 วัน', '20 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'ระบบการผลิตแบบลีน (Lean Manufacturing)', 'หลักสูตร 1 วัน เรียนรู้แนวคิดและหลักการของการผลิตแบบลีน รวมถึงการใช้ Value Stream Mapping เพื่อวิเคราะห์และปรับปรุงกระบวนการสร้างคุณค่าให้แก่ลูกค้าอย่างต่อเนื่อง', 'การดำเนินธุรกิจในปัจจุบันต้องเผชิญกับการแข่งขันที่รุนแรง ต้นทุนการผลิตปรับตัวสูงขึ้น ระบบการผลิตแบบลีนช่วยลดต้นทุน รองรับการเปลี่ยนแปลง และลดความสูญเสียตลอดกระบวนการทำงาน ตั้งแต่การออกแบบจนถึงการจัดจำหน่าย', '1 วัน', '20 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Lean Manufacturing', 'หลักสูตร 1 วัน เรียนรู้แนวคิดและหลักการของการผลิตแบบลีน รวมถึงการใช้ Value Stream Mapping เพื่อวิเคราะห์และปรับปรุงกระบวนการสร้างคุณค่าให้แก่ลูกค้าอย่างต่อเนื่อง', 'การดำเนินธุรกิจในปัจจุบันต้องเผชิญกับการแข่งขันที่รุนแรง ต้นทุนการผลิตปรับตัวสูงขึ้น ระบบการผลิตแบบลีนช่วยลดต้นทุน รองรับการเปลี่ยนแปลง และลดความสูญเสียตลอดกระบวนการทำงาน ตั้งแต่การออกแบบจนถึงการจัดจำหน่าย', '1 Day', '20 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้บุคลากรในระดับต่างๆ เข้าใจถึงแนวคิดและหลักการของการผลิตแบบลีน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้บุคลากรในระดับต่างๆ เข้าใจถึงแนวคิดและหลักการของการผลิตแบบลีน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้บุคลากรสามารถวิเคราะห์ สรุปปัญหา กำหนดจุดปรับปรุง และวางแผนปรับปรุงเพื่อสร้างคุณค่าให้แก่ลูกค้าอย่างต่อเนื่อง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้บุคลากรสามารถวิเคราะห์ สรุปปัญหา กำหนดจุดปรับปรุง และวางแผนปรับปรุงเพื่อสร้างคุณค่าให้แก่ลูกค้าอย่างต่อเนื่อง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้บุคลากรสามารถกำหนดตัวชี้วัดและค่าเป้าหมายในการปรับปรุงได้อย่างเหมาะสม');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้บุคลากรสามารถกำหนดตัวชี้วัดและค่าเป้าหมายในการปรับปรุงได้อย่างเหมาะสม');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้บริหาร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้บริหาร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้สนใจทั่วไป');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้สนใจทั่วไป');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'พื้นฐานการผลิตแบบลีน');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'พื้นฐานการผลิตแบบลีน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วิวัฒนาการและแนวคิดพื้นฐานของการผลิตแบบลีน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วิวัฒนาการและแนวคิดพื้นฐานของการผลิตแบบลีน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'คุณค่าและความสูญเปล่า');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'คุณค่าและความสูญเปล่า');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การสำรวจกระบวนการสร้างคุณค่าในปัจจุบันด้วย Current State VSM');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การสำรวจกระบวนการสร้างคุณค่าในปัจจุบันด้วย Current State VSM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เครื่องมือและเทคนิคต่างๆ ของลีน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เครื่องมือและเทคนิคต่างๆ ของลีน');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การพัฒนากระบวนการ');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การพัฒนากระบวนการ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวางแผนพัฒนากระบวนการสร้างคุณค่าด้วย Future State VSM');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวางแผนพัฒนากระบวนการสร้างคุณค่าด้วย Future State VSM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การสร้างคุณค่าและกำจัดความสูญเปล่าอย่างต่อเนื่อง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การสร้างคุณค่าและกำจัดความสูญเปล่าอย่างต่อเนื่อง');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วิวัฒนาการและแนวคิดพื้นฐานของการผลิตแบบลีน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วิวัฒนาการและแนวคิดพื้นฐานของการผลิตแบบลีน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'คุณค่าและความสูญเปล่า');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'คุณค่าและความสูญเปล่า');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Current State VSM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Current State VSM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เครื่องมือและเทคนิคของลีน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เครื่องมือและเทคนิคของลีน');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Future State VSM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Future State VSM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การสร้างคุณค่าและกำจัดความสูญเปล่า');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การสร้างคุณค่าและกำจัดความสูญเปล่า');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แบ่งกลุ่มฝึกปฏิบัติ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แบ่งกลุ่มฝึกปฏิบัติ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เสนอผลงานกลุ่ม สรุป');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เสนอผลงานกลุ่ม สรุป');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรที่ปรึกษาที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรที่ปรึกษาที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายเทคนิคต่างๆ การฝึกภาคปฏิบัติ และกรณีศึกษา');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายเทคนิคต่างๆ การฝึกภาคปฏิบัติ และกรณีศึกษา');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');
INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 1);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมค่าเดินทาง ค่าที่พัก (ถ้ามี)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course IMP004
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('IMP004', 'proactive-maintenance', 'IMP', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'ระบบบำรุงรักษาเชิงรุกเพื่อป้องกันปัญหาเครื่องจักร', 'หลักสูตร 1 วัน เรียนรู้การวิเคราะห์จากประสบการณ์จริง เพื่อเข้าใจสาเหตุการเสียซ้ำและแนวทางการบำรุงรักษาเชิงรุก (Proactive Maintenance) สำหรับยืดอายุเครื่องจักรและลดการหยุดเครื่อง', 'ในโรงงานอุตสาหกรรม เครื่องจักรและอุปกรณ์เปรียบเสมือนร่างกายของคน หากสามารถวิเคราะห์ หยั่งรู้ รู้ทันปัญหาตั้งแต่ต้นตอของความเสียหาย แล้วบำรุงรักษาเชิงรุกก่อนการใช้งาน จะช่วยยืดอายุการใช้งาน เพิ่มความน่าเชื่อถือ ลดการขัดข้องซ้ำซาก และลดต้นทุน', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Proactive Maintenance System', 'หลักสูตร 1 วัน เรียนรู้การวิเคราะห์จากประสบการณ์จริง เพื่อเข้าใจสาเหตุการเสียซ้ำและแนวทางการบำรุงรักษาเชิงรุก (Proactive Maintenance) สำหรับยืดอายุเครื่องจักรและลดการหยุดเครื่อง', 'ในโรงงานอุตสาหกรรม เครื่องจักรและอุปกรณ์เปรียบเสมือนร่างกายของคน หากสามารถวิเคราะห์ หยั่งรู้ รู้ทันปัญหาตั้งแต่ต้นตอของความเสียหาย แล้วบำรุงรักษาเชิงรุกก่อนการใช้งาน จะช่วยยืดอายุการใช้งาน เพิ่มความน่าเชื่อถือ ลดการขัดข้องซ้ำซาก และลดต้นทุน', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจแนวทางและหลักการจัดทำระบบบำรุงรักษาเชิงรุก (Proactive Maintenance)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจแนวทางและหลักการจัดทำระบบบำรุงรักษาเชิงรุก (Proactive Maintenance)');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สามารถประเมินความพร้อมของโรงงานในการพัฒนาสู่ระบบบำรุงรักษาเชิงรุกได้');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สามารถประเมินความพร้อมของโรงงานในการพัฒนาสู่ระบบบำรุงรักษาเชิงรุกได้');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ทราบค่าพิกัดสุขภาพเครื่องจักรว่าในระดับใดถือว่า "ดี / แย่ / ต้องแก้ไข"');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ทราบค่าพิกัดสุขภาพเครื่องจักรว่าในระดับใดถือว่า "ดี / แย่ / ต้องแก้ไข"');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจเทคนิคการตัดสินใจซ่อม และการทำนายอายุการใช้งานของเครื่องจักร');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจเทคนิคการตัดสินใจซ่อม และการทำนายอายุการใช้งานของเครื่องจักร');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้บริหาร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้บริหาร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อม');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อม');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิคซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิคซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้สนใจทั่วไป');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้สนใจทั่วไป');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ระบบบำรุงรักษาเชิงรุก');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ระบบบำรุงรักษาเชิงรุก');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้พื้นฐานระบบบำรุงรักษาสมัยใหม่');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้พื้นฐานระบบบำรุงรักษาสมัยใหม่');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความหมายของ Proactive Maintenance (PoM) และ Predictive Maintenance (PdM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความหมายของ Proactive Maintenance (PoM) และ Predictive Maintenance (PdM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เหตุผลและช่วงเวลาที่ควรใช้ PoM และ PdM');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เหตุผลและช่วงเวลาที่ควรใช้ PoM และ PdM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ต้นตอสาเหตุการขัดข้องซ้ำซากของเครื่องจักร (Bearing, Motor, Gearbox, Pump, Blower/Fan, Hydraulic, Pneumatic, Air Compressor, Shaft)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ต้นตอสาเหตุการขัดข้องซ้ำซากของเครื่องจักร (Bearing, Motor, Gearbox, Pump, Blower/Fan, Hydraulic, Pneumatic, Air Compressor, Shaft)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'กลยุทธ์การขจัดปัญหา');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'กลยุทธ์การขจัดปัญหา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'กลยุทธ์เชิงรุกในการขจัดปัญหาก่อนเกิดขึ้นจริง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'กลยุทธ์เชิงรุกในการขจัดปัญหาก่อนเกิดขึ้นจริง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การติดตั้งที่ถูกต้อง การตั้งแนวศูนย์กลางเพลา การวิเคราะห์การสั่นสะเทือน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การติดตั้งที่ถูกต้อง การตั้งแนวศูนย์กลางเพลา การวิเคราะห์การสั่นสะเทือน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์อุณหภูมิ เสียง รอยแตกร้าว น้ำมันหล่อลื่น และระบบไฟฟ้า');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์อุณหภูมิ เสียง รอยแตกร้าว น้ำมันหล่อลื่น และระบบไฟฟ้า');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การใช้ค่าพิกัดในการตัดสินใจ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การใช้ค่าพิกัดในการตัดสินใจ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวทางการเริ่มต้นพัฒนาระบบบำรุงรักษาในองค์กร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวทางการเริ่มต้นพัฒนาระบบบำรุงรักษาในองค์กร');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความรู้พื้นฐานระบบบำรุงรักษาสมัยใหม่');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความรู้พื้นฐานระบบบำรุงรักษาสมัยใหม่');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เหตุผลและช่วงเวลาที่ควรใช้ PoM และ PdM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เหตุผลและช่วงเวลาที่ควรใช้ PoM และ PdM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์ต้นตอสาเหตุการขัดข้องซ้ำซากของเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์ต้นตอสาเหตุการขัดข้องซ้ำซากของเครื่องจักร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'กลยุทธ์เชิงรุกในการขจัดปัญหาก่อนเกิดขึ้นจริง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'กลยุทธ์เชิงรุกในการขจัดปัญหาก่อนเกิดขึ้นจริง');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์ชิ้นส่วนเพื่อค้นหาสาเหตุปัญหา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์ชิ้นส่วนเพื่อค้นหาสาเหตุปัญหา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอนการดำเนินการ จะเริ่มต้นอย่างไร และเลือกอุปกรณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอนการดำเนินการ จะเริ่มต้นอย่างไร และเลือกอุปกรณ์');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ตัวชี้วัดความสำเร็จของระบบ (KPI)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ตัวชี้วัดความสำเร็จของระบบ (KPI)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ และแลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ และแลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'บรรยายเชิงปฏิบัติ');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'บรรยายเชิงปฏิบัติ');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'คลิปวีดีโอประกอบการบรรยาย');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'คลิปวีดีโอประกอบการบรรยาย');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');
INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 1);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมค่าเดินทาง ค่าที่พัก (ถ้ามี)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course IMP005
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('IMP005', 'predictive-maintenance-practice', 'IMP', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การพยากรณ์งานบำรุงรักษาเชิงปฏิบัติ', 'หลักสูตร 1 วัน เรียนรู้หลักการและขั้นตอนการจัดทำระบบบำรุงรักษาเชิงพยากรณ์ (Predictive Maintenance) เครื่องมือตรวจวัดสุขภาพเครื่องจักร และเกณฑ์ตัดสินสถานะสุขภาพ', 'ในโรงงานอุตสาหกรรม การรู้สุขภาพของเครื่องจักรล่วงหน้าเป็นสิ่งสำคัญ ระบบบำรุงรักษาเชิงพยากรณ์ (PdM) ช่วยติดตามสุขภาพเครื่องจักร ทำให้วางแผนซ่อมก่อนเกิดปัญหา ลดการหยุดงาน ลดค่าใช้จ่าย และเพิ่มประสิทธิภาพ', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Predictive Maintenance in Practice', 'หลักสูตร 1 วัน เรียนรู้หลักการและขั้นตอนการจัดทำระบบบำรุงรักษาเชิงพยากรณ์ (Predictive Maintenance) เครื่องมือตรวจวัดสุขภาพเครื่องจักร และเกณฑ์ตัดสินสถานะสุขภาพ', 'ในโรงงานอุตสาหกรรม การรู้สุขภาพของเครื่องจักรล่วงหน้าเป็นสิ่งสำคัญ ระบบบำรุงรักษาเชิงพยากรณ์ (PdM) ช่วยติดตามสุขภาพเครื่องจักร ทำให้วางแผนซ่อมก่อนเกิดปัญหา ลดการหยุดงาน ลดค่าใช้จ่าย และเพิ่มประสิทธิภาพ', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ความรู้และความเข้าใจในการจัดทำระบบบำรุงรักษาเชิงพยากรณ์');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ความรู้และความเข้าใจในการจัดทำระบบบำรุงรักษาเชิงพยากรณ์');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'แนวทางการประเมินความพร้อมของโรงงานเพื่อพัฒนาสู่ระบบบำรุงรักษาเชิงพยากรณ์');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'แนวทางการประเมินความพร้อมของโรงงานเพื่อพัฒนาสู่ระบบบำรุงรักษาเชิงพยากรณ์');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'การพิจารณาเลือกเครื่องจักรเข้าระบบ การกำหนดการตรวจวัดสุขภาพ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'การพิจารณาเลือกเครื่องจักรเข้าระบบ การกำหนดการตรวจวัดสุขภาพ');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'หลักเกณฑ์ในการตัดสินสถานะสุขภาพของเครื่องจักร พร้อมเทคนิคการพยากรณ์อายุการใช้งาน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'หลักเกณฑ์ในการตัดสินสถานะสุขภาพของเครื่องจักร พร้อมเทคนิคการพยากรณ์อายุการใช้งาน');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้บริหาร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้บริหาร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อม');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อม');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิคซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิคซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานควบคุมเครื่องจักร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานควบคุมเครื่องจักร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 6);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้สนใจทั่วไป');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้สนใจทั่วไป');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ระบบบำรุงรักษาเชิงพยากรณ์');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ระบบบำรุงรักษาเชิงพยากรณ์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความแตกต่างของ PM, CBM และ PdM');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความแตกต่างของ PM, CBM และ PdM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระบบบำรุงรักษาเชิงพยากรณ์ (PdM) เชิงปฏิบัติ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระบบบำรุงรักษาเชิงพยากรณ์ (PdM) เชิงปฏิบัติ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วิธีการของระบบบำรุงรักษาพยากรณ์และเทคนิคการทำนายอายุการใช้งาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วิธีการของระบบบำรุงรักษาพยากรณ์และเทคนิคการทำนายอายุการใช้งาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ตัวชี้วัดที่เกี่ยวข้อง เช่น OEE, MTBF, MTTR');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ตัวชี้วัดที่เกี่ยวข้อง เช่น OEE, MTBF, MTTR');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'วิธีการตรวจวัดสุขภาพเครื่องจักร');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'วิธีการตรวจวัดสุขภาพเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์สารหล่อลื่น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์สารหล่อลื่น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การตรวจวัดอุณหภูมิ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การตรวจวัดอุณหภูมิ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวัดการสั่นสะเทือน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวัดการสั่นสะเทือน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ความเสียหายของแบริ่ง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ความเสียหายของแบริ่ง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การตรวจวัดระบบไฟฟ้าและเสียง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การตรวจวัดระบบไฟฟ้าและเสียง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การตรวจหารอยแตกร้าว การตรวจวัดความหนา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การตรวจหารอยแตกร้าว การตรวจวัดความหนา');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 2);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การจัดทำระบบ PdM');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การจัดทำระบบ PdM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนดค่าพิกัดสุขภาพ: ดี (a) / เริ่มผิดปกติ (b) / ต้องดำเนินการแก้ไข (c)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนดค่าพิกัดสุขภาพ: ดี (a) / เริ่มผิดปกติ (b) / ต้องดำเนินการแก้ไข (c)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอนการจัดทำระบบตั้งแต่จุดเริ่มต้นถึงการนำไปใช้จริง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอนการจัดทำระบบตั้งแต่จุดเริ่มต้นถึงการนำไปใช้จริง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การพิจารณาเลือกเครื่องจักรและการจัดลำดับความสำคัญ (ระดับ A, B, C)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การพิจารณาเลือกเครื่องจักรและการจัดลำดับความสำคัญ (ระดับ A, B, C)');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความแตกต่างของ PM, CBM และ PdM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความแตกต่างของ PM, CBM และ PdM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ระบบ PdM เชิงปฏิบัติ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ระบบ PdM เชิงปฏิบัติ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'วิธีการตรวจวัดสุขภาพเครื่องจักรและเครื่องมือที่ใช้ (พร้อมวิดีโอและกิจกรรมเชิงปฏิบัติ)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'วิธีการตรวจวัดสุขภาพเครื่องจักรและเครื่องมือที่ใช้ (พร้อมวิดีโอและกิจกรรมเชิงปฏิบัติ)');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การกำหนดค่าพิกัดสุขภาพเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การกำหนดค่าพิกัดสุขภาพเครื่องจักร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอนการจัดทำระบบ PdM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอนการจัดทำระบบ PdM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ตัวอย่างรายงานการเสื่อมสภาพของเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ตัวอย่างรายงานการเสื่อมสภาพของเครื่องจักร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ถาม-ตอบ และแลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ถาม-ตอบ และแลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายความรู้ประกอบวีดิโอและรูปตัวอย่าง');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายความรู้ประกอบวีดิโอและรูปตัวอย่าง');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกภาคปฏิบัติ');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกภาคปฏิบัติ');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');
INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 1);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมค่าเดินทาง ค่าที่พัก (ถ้ามี)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course IMP006
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('IMP006', 'corrective-maintenance', 'IMP', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การแก้ไขและปรับปรุงระบบบำรุงรักษาเครื่องจักร (Corrective Maintenance: CM)', 'หลักสูตร 1 วัน เรียนรู้ 10 ขั้นตอนของ Corrective Maintenance การวิเคราะห์สาเหตุความเสียหาย และเทคนิคการแก้ไขเพื่อป้องกันการขัดข้องซ้ำ มุ่งสู่เป้าหมาย Maintenance Free', 'Corrective Maintenance (CM) ไม่ใช่เพียงการซ่อมแซมเมื่ออุปกรณ์เสียหาย แต่คือการวิเคราะห์และขจัดสาเหตุของความเสียหาย เพื่อป้องกันการขัดข้องซ้ำ เพิ่มความน่าเชื่อถือ ยืดอายุการใช้งาน และลดต้นทุนโดยรวม', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Corrective Maintenance (CM)', 'หลักสูตร 1 วัน เรียนรู้ 10 ขั้นตอนของ Corrective Maintenance การวิเคราะห์สาเหตุความเสียหาย และเทคนิคการแก้ไขเพื่อป้องกันการขัดข้องซ้ำ มุ่งสู่เป้าหมาย Maintenance Free', 'Corrective Maintenance (CM) ไม่ใช่เพียงการซ่อมแซมเมื่ออุปกรณ์เสียหาย แต่คือการวิเคราะห์และขจัดสาเหตุของความเสียหาย เพื่อป้องกันการขัดข้องซ้ำ เพิ่มความน่าเชื่อถือ ยืดอายุการใช้งาน และลดต้นทุนโดยรวม', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้มีความรู้ ความเข้าใจ การพัฒนาระบบ ทำ CM ได้');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้มีความรู้ ความเข้าใจ การพัฒนาระบบ ทำ CM ได้');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สามารถทำขั้นตอน Corrective Maintenance 10 ขั้นตอน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สามารถทำขั้นตอน Corrective Maintenance 10 ขั้นตอน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ใช้เทคนิค เครื่องมือ การทำ CM');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ใช้เทคนิค เครื่องมือ การทำ CM');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีตัวอย่าง การเปรียบเทียบ ก่อน-หลัง การทำ CM');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีตัวอย่าง การเปรียบเทียบ ก่อน-หลัง การทำ CM');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้บริหาร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้บริหาร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อม');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อม');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิคซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิคซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานควบคุมเครื่องจักร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานควบคุมเครื่องจักร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 6);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้สนใจทั่วไป');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้สนใจทั่วไป');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'หลักการ Corrective Maintenance');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'หลักการ Corrective Maintenance');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้และความเข้าใจในการพัฒนาระบบบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้และความเข้าใจในการพัฒนาระบบบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระบบบำรุงรักษาเชิงแก้ไข (CM) คืออะไร เหตุใดจึงต้องดำเนินการ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระบบบำรุงรักษาเชิงแก้ไข (CM) คืออะไร เหตุใดจึงต้องดำเนินการ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวคิดหลักในการดำเนินงาน CM');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวคิดหลักในการดำเนินงาน CM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วิธีการปฏิบัติงาน CM ควรดำเนินการอย่างไร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วิธีการปฏิบัติงาน CM ควรดำเนินการอย่างไร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เป้าหมายสำคัญของ CM');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เป้าหมายสำคัญของ CM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดลำดับความสำคัญของงาน CM');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดลำดับความสำคัญของงาน CM');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การดำเนินงาน CM');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การดำเนินงาน CM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอนการดำเนินงานแก้ไขและปรับปรุง 10 ขั้นตอน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอนการดำเนินงานแก้ไขและปรับปรุง 10 ขั้นตอน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เทคนิคการวิเคราะห์ปัญหา (Failure Analysis, Why-Why Analysis, PM Analysis)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เทคนิคการวิเคราะห์ปัญหา (Failure Analysis, Why-Why Analysis, PM Analysis)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ตัวอย่างการดำเนินงาน CM เชิงปฏิบัติจากกรณีจริง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ตัวอย่างการดำเนินงาน CM เชิงปฏิบัติจากกรณีจริง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ตัวชี้วัด (KPI) ความสำเร็จของระบบ CM');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ตัวชี้วัด (KPI) ความสำเร็จของระบบ CM');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความรู้เกี่ยวกับการพัฒนาระบบบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความรู้เกี่ยวกับการพัฒนาระบบบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ระบบบำรุงรักษาเชิงแก้ไข CM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ระบบบำรุงรักษาเชิงแก้ไข CM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวคิดหลักและวิธีการปฏิบัติงาน CM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวคิดหลักและวิธีการปฏิบัติงาน CM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เป้าหมายและการจัดลำดับความสำคัญ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เป้าหมายและการจัดลำดับความสำคัญ');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอนการดำเนินงานแก้ไขและปรับปรุง 10 ขั้นตอน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอนการดำเนินงานแก้ไขและปรับปรุง 10 ขั้นตอน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เทคนิคการวิเคราะห์ปัญหา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เทคนิคการวิเคราะห์ปัญหา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ตัวอย่างการดำเนินงาน CM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ตัวอย่างการดำเนินงาน CM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ตัวชี้วัด (KPI)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ตัวชี้วัด (KPI)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ถาม-ตอบ และแลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ถาม-ตอบ และแลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายความรู้ประกอบวีดิโอและรูปตัวอย่าง');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายความรู้ประกอบวีดิโอและรูปตัวอย่าง');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกภาคปฏิบัติ');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกภาคปฏิบัติ');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');
INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 1);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมค่าเดินทาง ค่าที่พัก (ถ้ามี)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course IMP007
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('IMP007', 'visual-control-maintenance', 'IMP', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การบำรุงรักษาเชิงมองเห็น (Visual Control Maintenance)', 'หลักสูตร 1 วัน เรียนรู้การออกแบบและจัดทำระบบบำรุงรักษาเครื่องจักรด้วยวิธีมองเห็น (Visual Control) ทั้ง 6 ประเภทงาน เพื่อเพิ่มประสิทธิภาพการผลิตและลดการขัดข้องของเครื่องจักร', 'Visual Control เป็นเครื่องมือสำคัญในการสื่อสารและสร้างความเข้าใจร่วมกันผ่านสิ่งที่มองเห็นได้ทันที ช่วยให้ทุกคนสามารถตัดสินใจได้อย่างรวดเร็วว่ากระบวนการผลิตหรือสถานะของเครื่องจักรอยู่ในภาวะปกติหรือผิดปกติ', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Visual Control Maintenance', 'หลักสูตร 1 วัน เรียนรู้การออกแบบและจัดทำระบบบำรุงรักษาเครื่องจักรด้วยวิธีมองเห็น (Visual Control) ทั้ง 6 ประเภทงาน เพื่อเพิ่มประสิทธิภาพการผลิตและลดการขัดข้องของเครื่องจักร', 'Visual Control เป็นเครื่องมือสำคัญในการสื่อสารและสร้างความเข้าใจร่วมกันผ่านสิ่งที่มองเห็นได้ทันที ช่วยให้ทุกคนสามารถตัดสินใจได้อย่างรวดเร็วว่ากระบวนการผลิตหรือสถานะของเครื่องจักรอยู่ในภาวะปกติหรือผิดปกติ', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้ผู้เข้าอบรมมีความรู้ ความเข้าใจ และทักษะในการจัดทำระบบบำรุงรักษาเครื่องจักรด้วยวิธีมองเห็น');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้ผู้เข้าอบรมมีความรู้ ความเข้าใจ และทักษะในการจัดทำระบบบำรุงรักษาเครื่องจักรด้วยวิธีมองเห็น');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้มีข้อมูล ตัวอย่าง ขั้นตอน และวิธีการดำเนินการที่ช่วยให้เข้าใจง่ายและรวดเร็ว');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้มีข้อมูล ตัวอย่าง ขั้นตอน และวิธีการดำเนินการที่ช่วยให้เข้าใจง่ายและรวดเร็ว');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อฝึกทักษะในการนำไปประยุกต์ใช้และปรับปรุงเครื่องจักรในโรงงานได้อย่างมีประสิทธิภาพ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อฝึกทักษะในการนำไปประยุกต์ใช้และปรับปรุงเครื่องจักรในโรงงานได้อย่างมีประสิทธิภาพ');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้บริหาร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้บริหาร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อม');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อม');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิคซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิคซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'พนักงานควบคุมเครื่องจักร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'พนักงานควบคุมเครื่องจักร');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'Visual Control พื้นฐาน');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'Visual Control พื้นฐาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวคิดและหลักการของการควบคุมด้วยการมองเห็น (Visual Control)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวคิดและหลักการของการควบคุมด้วยการมองเห็น (Visual Control)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การประยุกต์ใช้ Visual Control ในกระบวนการผลิตและงานบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การประยุกต์ใช้ Visual Control ในกระบวนการผลิตและงานบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ขั้นตอนและกระบวนการจัดทำ Visual Control สำหรับเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ขั้นตอนและกระบวนการจัดทำ Visual Control สำหรับเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'โครงสร้างสำคัญของระบบบำรุงรักษาเชิงป้องกัน (PM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'โครงสร้างสำคัญของระบบบำรุงรักษาเชิงป้องกัน (PM)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การออกแบบ Visual Control 6 ประเภท');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การออกแบบ Visual Control 6 ประเภท');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'งานทำความสะอาด');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'งานทำความสะอาด');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'งานหล่อลื่น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'งานหล่อลื่น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'งานตรวจสอบ/ปรับแต่ง/ขันแน่น');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'งานตรวจสอบ/ปรับแต่ง/ขันแน่น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'งานตรวจวัดสุขภาพเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'งานตรวจวัดสุขภาพเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'งานทดสอบความถูกต้องของการทำงาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'งานทดสอบความถูกต้องของการทำงาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'งานซ่อมและการเปลี่ยนชิ้นส่วน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'งานซ่อมและการเปลี่ยนชิ้นส่วน');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 2);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การวัดผลและการจัดระเบียบ');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การวัดผลและการจัดระเบียบ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การแสดงผลแบบปฏิทินและแผนงานบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การแสดงผลแบบปฏิทินและแผนงานบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การแสดงผลสำหรับการวัดประสิทธิภาพของระบบซ่อมบำรุง (KPI)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การแสดงผลสำหรับการวัดประสิทธิภาพของระบบซ่อมบำรุง (KPI)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดระเบียบวัสดุ อะไหล่ เครื่องมือ และพื้นที่งานซ่อม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดระเบียบวัสดุ อะไหล่ เครื่องมือ และพื้นที่งานซ่อม');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวคิดและหลักการ Visual Control');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวคิดและหลักการ Visual Control');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การประยุกต์ใช้ Visual Control ในงานบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การประยุกต์ใช้ Visual Control ในงานบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ขั้นตอนการจัดทำ Visual Control');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ขั้นตอนการจัดทำ Visual Control');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'โครงสร้าง PM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'โครงสร้าง PM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การออกแบบ Visual Control 6 ประเภท');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การออกแบบ Visual Control 6 ประเภท');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การแสดงผลปฏิทินและแผนงานบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การแสดงผลปฏิทินและแผนงานบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวัดประสิทธิภาพของระบบซ่อมบำรุง (KPI)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวัดประสิทธิภาพของระบบซ่อมบำรุง (KPI)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจัดระเบียบวัสดุและพื้นที่งานซ่อม');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจัดระเบียบวัสดุและพื้นที่งานซ่อม');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ฝึกทักษะเชิงปฏิบัติในการสร้าง Visual Control');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ฝึกทักษะเชิงปฏิบัติในการสร้าง Visual Control');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ถาม-ตอบ และแลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ถาม-ตอบ และแลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายความรู้ประกอบวีดิโอและรูปตัวอย่าง');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายความรู้ประกอบวีดิโอและรูปตัวอย่าง');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกภาคปฏิบัติ');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกภาคปฏิบัติ');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');
INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 1);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมค่าเดินทาง ค่าที่พัก (ถ้ามี)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course IMP008
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('IMP008', 'maintenance-quality-warranty', 'IMP', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การควบคุมคุณภาพงานซ่อมด้วยระบบรับประกันงาน', 'หลักสูตร 1 วัน เรียนรู้ 6 มาตรการสู่ระบบประกันงานซ่อม ปัจจัยสำคัญของงานซ่อมที่มีคุณภาพ (4O) และการควบคุมคุณภาพงานซ่อมในแต่ละขั้นตอนเพื่อสร้างความมั่นใจในประสิทธิภาพเครื่องจักรหลังการซ่อม', 'เช่นเดียวกับสินค้าที่มีการประกันคุณภาพ งานซ่อมบำรุงก็สามารถจัดทำเป็นระบบประกันงานซ่อมได้ โดยมีขั้นตอนและกระบวนการที่ชัดเจนตั้งแต่เริ่มต้นจนถึงปลายทาง เพื่อสร้างความมั่นใจในประสิทธิภาพของเครื่องจักรหลังการซ่อม', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Maintenance Quality Control with Warranty System', 'หลักสูตร 1 วัน เรียนรู้ 6 มาตรการสู่ระบบประกันงานซ่อม ปัจจัยสำคัญของงานซ่อมที่มีคุณภาพ (4O) และการควบคุมคุณภาพงานซ่อมในแต่ละขั้นตอนเพื่อสร้างความมั่นใจในประสิทธิภาพเครื่องจักรหลังการซ่อม', 'เช่นเดียวกับสินค้าที่มีการประกันคุณภาพ งานซ่อมบำรุงก็สามารถจัดทำเป็นระบบประกันงานซ่อมได้ โดยมีขั้นตอนและกระบวนการที่ชัดเจนตั้งแต่เริ่มต้นจนถึงปลายทาง เพื่อสร้างความมั่นใจในประสิทธิภาพของเครื่องจักรหลังการซ่อม', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้มีความรู้ ความเข้าใจในการตัดสินใจจัดทำระบบประกันงานซ่อม');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้มีความรู้ ความเข้าใจในการตัดสินใจจัดทำระบบประกันงานซ่อม');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อให้เข้าใจแนวคิด วิธีการตั้งแต่จุดเริ่มต้นของกระบวนการไปจนถึงจุดสิ้นสุดของระบบประกันงานซ่อม');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อให้เข้าใจแนวคิด วิธีการตั้งแต่จุดเริ่มต้นของกระบวนการไปจนถึงจุดสิ้นสุดของระบบประกันงานซ่อม');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สร้างความมั่นใจในการวางระบบประกันงานซ่อมให้กับโรงงาน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สร้างความมั่นใจในการวางระบบประกันงานซ่อมให้กับโรงงาน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ส่งเสริมความพึงพอใจให้กับผู้ใช้งานเครื่องจักรและผู้ให้บริการงานซ่อม');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ส่งเสริมความพึงพอใจให้กับผู้ใช้งานเครื่องจักรและผู้ให้บริการงานซ่อม');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้า ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้า ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค พนักงานซ่อม');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค พนักงานซ่อม');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้เกี่ยวข้องในงานบำรุงรักษา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้เกี่ยวข้องในงานบำรุงรักษา');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ระบบประกันงานซ่อม');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ระบบประกันงานซ่อม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เหตุผลที่เครื่องจักรเสียหายเร็วกว่ากำหนด');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เหตุผลที่เครื่องจักรเสียหายเร็วกว่ากำหนด');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ผังกระบวนการและโครงสร้างของระบบประกันงานซ่อม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ผังกระบวนการและโครงสร้างของระบบประกันงานซ่อม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประเภทของการประกันงานซ่อม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประเภทของการประกันงานซ่อม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวทาง 6 มาตรการสู่ระบบประกันงานซ่อม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวทาง 6 มาตรการสู่ระบบประกันงานซ่อม');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'ปัจจัยคุณภาพงานซ่อม');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'ปัจจัยคุณภาพงานซ่อม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ปัจจัยสำคัญของระบบประกันงานซ่อม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ปัจจัยสำคัญของระบบประกันงานซ่อม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วิเคราะห์ความเสียหายของชิ้นส่วนเพื่อวิเคราะห์สาเหตุ แก้ไข และป้องกัน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วิเคราะห์ความเสียหายของชิ้นส่วนเพื่อวิเคราะห์สาเหตุ แก้ไข และป้องกัน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ข้อตกลงและเงื่อนไขของการประกันงานซ่อม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ข้อตกลงและเงื่อนไขของการประกันงานซ่อม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ปัจจัยสำคัญของงานซ่อมที่มีคุณภาพ (4O): Zero Accident, On Time, On Budget, QC');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ปัจจัยสำคัญของงานซ่อมที่มีคุณภาพ (4O): Zero Accident, On Time, On Budget, QC');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'จุดตรวจสอบคุณภาพงานซ่อมในแต่ละขั้นตอน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'จุดตรวจสอบคุณภาพงานซ่อมในแต่ละขั้นตอน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การประเมินคุณภาพงานและความพึงพอใจของลูกค้า');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การประเมินคุณภาพงานและความพึงพอใจของลูกค้า');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เหตุผลที่เครื่องจักรเสียเร็วกว่ากำหนด พร้อมกรณีศึกษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เหตุผลที่เครื่องจักรเสียเร็วกว่ากำหนด พร้อมกรณีศึกษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ผังกระบวนการระบบประกันงานซ่อม');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ผังกระบวนการระบบประกันงานซ่อม');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ปัจจัยสำคัญของระบบประกันงานซ่อม');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ปัจจัยสำคัญของระบบประกันงานซ่อม');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์ความเสียหายของชิ้นส่วน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์ความเสียหายของชิ้นส่วน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การประเมินและวางแผนวิธีการซ่อม');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การประเมินและวางแผนวิธีการซ่อม');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์หน้าที่ของชิ้นส่วนและจุดตรวจสอบ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์หน้าที่ของชิ้นส่วนและจุดตรวจสอบ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ข้อตกลงและเงื่อนไขการประกันงานซ่อม');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ข้อตกลงและเงื่อนไขการประกันงานซ่อม');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ปัจจัยสำคัญของงานซ่อมที่มีคุณภาพ (4O)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ปัจจัยสำคัญของงานซ่อมที่มีคุณภาพ (4O)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'จุดตรวจสอบคุณภาพงานซ่อม');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'จุดตรวจสอบคุณภาพงานซ่อม');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การประเมินคุณภาพและความพึงพอใจ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การประเมินคุณภาพและความพึงพอใจ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 5);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ถาม-ตอบ และแลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ถาม-ตอบ และแลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายความรู้ประกอบวีดิโอและรูปตัวอย่าง');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายความรู้ประกอบวีดิโอและรูปตัวอย่าง');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกภาคปฏิบัติ');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกภาคปฏิบัติ');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');
INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 1);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมค่าเดินทาง ค่าที่พัก (ถ้ามี)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course IMP009
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('IMP009', 'maintenance-kpi', 'IMP', '1 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การวัดประสิทธิภาพของระบบซ่อมบำรุง (Maintenance KPI)', 'หลักสูตร 1 วัน เรียนรู้การวางแผนบำรุงรักษาในรูปแบบปฏิทินงาน การกำหนดและประเมินผลตัวชี้วัด (KPI) เช่น MAF, RF, BD, MTBF, MTTR, OEE เพื่อพัฒนาระบบบำรุงรักษาอย่างต่อเนื่อง', 'การทำให้เครื่องจักรทำงานได้อย่างมีประสิทธิภาพต้องอาศัยการวางแผนการบำรุงรักษาอย่างเป็นระบบ รวมถึงการติดตามและวัดผลความสำเร็จอย่างต่อเนื่องด้วยตัวชี้วัด (KPI) เพื่อประเมินและพัฒนาให้ดียิ่งขึ้น', '1 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Maintenance KPI', 'หลักสูตร 1 วัน เรียนรู้การวางแผนบำรุงรักษาในรูปแบบปฏิทินงาน การกำหนดและประเมินผลตัวชี้วัด (KPI) เช่น MAF, RF, BD, MTBF, MTTR, OEE เพื่อพัฒนาระบบบำรุงรักษาอย่างต่อเนื่อง', 'การทำให้เครื่องจักรทำงานได้อย่างมีประสิทธิภาพต้องอาศัยการวางแผนการบำรุงรักษาอย่างเป็นระบบ รวมถึงการติดตามและวัดผลความสำเร็จอย่างต่อเนื่องด้วยตัวชี้วัด (KPI) เพื่อประเมินและพัฒนาให้ดียิ่งขึ้น', '1 Day', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'มีความรู้ความเข้าใจเกี่ยวกับระบบบำรุงรักษา และสามารถวางแผนบำรุงรักษาในรูปแบบปฏิทินงานได้อย่างเหมาะสม');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'มีความรู้ความเข้าใจเกี่ยวกับระบบบำรุงรักษา และสามารถวางแผนบำรุงรักษาในรูปแบบปฏิทินงานได้อย่างเหมาะสม');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจและสามารถกำหนดหัวข้อการวัดผล พร้อมประเมินความสำเร็จของการบำรุงรักษาด้วยตัวชี้วัด (KPI)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจและสามารถกำหนดหัวข้อการวัดผล พร้อมประเมินความสำเร็จของการบำรุงรักษาด้วยตัวชี้วัด (KPI)');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สามารถพัฒนาระบบบำรุงรักษาให้มีประสิทธิภาพมากยิ่งขึ้น รองรับการปรับปรุงและพัฒนาอย่างต่อเนื่อง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สามารถพัฒนาระบบบำรุงรักษาให้มีประสิทธิภาพมากยิ่งขึ้น รองรับการปรับปรุงและพัฒนาอย่างต่อเนื่อง');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้เกี่ยวข้องในงานบำรุงรักษา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้เกี่ยวข้องในงานบำรุงรักษา');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การวางแผนระบบบำรุงรักษา');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การวางแผนระบบบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'โครงสร้างและปัจจัยสำคัญของการทำระบบบำรุงรักษา (PM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'โครงสร้างและปัจจัยสำคัญของการทำระบบบำรุงรักษา (PM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำข้อมูลเครื่องจักร และการจัดลำดับความสำคัญ (A, B, C)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำข้อมูลเครื่องจักร และการจัดลำดับความสำคัญ (A, B, C)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำข้อมูลอุปกรณ์และเครื่องจักรโรงงาน (Plant Data)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำข้อมูลอุปกรณ์และเครื่องจักรโรงงาน (Plant Data)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำรายการมาตรฐานบำรุงรักษาเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำรายการมาตรฐานบำรุงรักษาเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เทคนิคการวางแผนปฏิทินการบำรุงรักษา (รายวัน, สัปดาห์, เดือน, ปี)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เทคนิคการวางแผนปฏิทินการบำรุงรักษา (รายวัน, สัปดาห์, เดือน, ปี)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การประยุกต์ใช้โปรแกรมวางแผนระบบบำรุงรักษา (PMTECH)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การประยุกต์ใช้โปรแกรมวางแผนระบบบำรุงรักษา (PMTECH)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การวัดและประเมินผล KPI');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การวัดและประเมินผล KPI');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'MAF: Machine Availability Factor');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'MAF: Machine Availability Factor');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'RF: Run Factor');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'RF: Run Factor');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'BD: Breakdown');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'BD: Breakdown');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'MTBF: Mean Time Between Failure');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'MTBF: Mean Time Between Failure');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'MTTR: Mean Time To Repair');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'MTTR: Mean Time To Repair');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'OEE: Overall Equipment Effectiveness');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'OEE: Overall Equipment Effectiveness');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'งบประมาณและการควบคุมค่าใช้จ่ายในการบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'งบประมาณและการควบคุมค่าใช้จ่ายในการบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 7);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การจัดทำและวิเคราะห์รายงานกราฟประสิทธิภาพเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การจัดทำและวิเคราะห์รายงานกราฟประสิทธิภาพเครื่องจักร');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'โครงสร้างและปัจจัยสำคัญของระบบบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'โครงสร้างและปัจจัยสำคัญของระบบบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจัดทำข้อมูลเครื่องจักรและการจัดลำดับความสำคัญ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจัดทำข้อมูลเครื่องจักรและการจัดลำดับความสำคัญ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจัดทำรายการมาตรฐานบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจัดทำรายการมาตรฐานบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เทคนิคการวางแผนปฏิทินการบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เทคนิคการวางแผนปฏิทินการบำรุงรักษา');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 16:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การประยุกต์ใช้โปรแกรมวางแผนระบบบำรุงรักษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การประยุกต์ใช้โปรแกรมวางแผนระบบบำรุงรักษา');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวัดและประเมินผล KPI');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวัดและประเมินผล KPI');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'งบประมาณและการควบคุมค่าใช้จ่าย');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'งบประมาณและการควบคุมค่าใช้จ่าย');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'OEE');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'OEE');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การจัดทำรายงานกราฟประสิทธิภาพเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การจัดทำรายงานกราฟประสิทธิภาพเครื่องจักร');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายความรู้ประกอบวีดิโอและรูปตัวอย่าง');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายความรู้ประกอบวีดิโอและรูปตัวอย่าง');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกภาคปฏิบัติ');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกภาคปฏิบัติ');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');
INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 1);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมค่าเดินทาง ค่าที่พัก (ถ้ามี)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course IMP010
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('IMP010', 'ram-analysis', 'IMP', '2 วัน', '15 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การวิเคราะห์ความน่าเชื่อถือ ความพร้อมใช้งาน และความสามารถในการซ่อมบำรุง', 'หลักสูตร 2 วัน เรียนรู้หลักการ RAM (Reliability, Availability, Maintainability) การวิเคราะห์และประเมินผลอย่างเป็นระบบ รวมถึงการพัฒนาเครื่องจักรเพื่อลดต้นทุนและเพิ่มผลผลิต', 'การวิเคราะห์และพัฒนาเครื่องจักร อุปกรณ์ หรือการลงทุนในโครงการใหม่ โดยอาศัยหลักความน่าเชื่อถือ ความพร้อมใช้งาน และความสามารถในการบำรุงรักษา จะช่วยให้เครื่องจักรมีประสิทธิภาพมากขึ้น ทั้งการลดค่าใช้จ่าย ลดต้นทุน และเพิ่มผลผลิต', '2 วัน', '15 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Reliability Availability Maintainability (RAM Analysis)', 'หลักสูตร 2 วัน เรียนรู้หลักการ RAM (Reliability, Availability, Maintainability) การวิเคราะห์และประเมินผลอย่างเป็นระบบ รวมถึงการพัฒนาเครื่องจักรเพื่อลดต้นทุนและเพิ่มผลผลิต', 'การวิเคราะห์และพัฒนาเครื่องจักร อุปกรณ์ หรือการลงทุนในโครงการใหม่ โดยอาศัยหลักความน่าเชื่อถือ ความพร้อมใช้งาน และความสามารถในการบำรุงรักษา จะช่วยให้เครื่องจักรมีประสิทธิภาพมากขึ้น ทั้งการลดค่าใช้จ่าย ลดต้นทุน และเพิ่มผลผลิต', '2 Days', '15 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อเพิ่มทักษะในการจัดการและวิเคราะห์ความสำคัญของเครื่องจักรและอุปกรณ์');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อเพิ่มทักษะในการจัดการและวิเคราะห์ความสำคัญของเครื่องจักรและอุปกรณ์');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เพื่อมีความรู้ ความเข้าใจ และทักษะด้าน Reliability, Availability, Maintainability (RAM)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เพื่อมีความรู้ ความเข้าใจ และทักษะด้าน Reliability, Availability, Maintainability (RAM)');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'แนวทางการวิเคราะห์และประเมินผลด้าน RAM อย่างเป็นระบบ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'แนวทางการวิเคราะห์และประเมินผลด้าน RAM อย่างเป็นระบบ');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายผลิต');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายผลิต');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายควบคุมคุณภาพ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายควบคุมคุณภาพ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ฝ่ายพัฒนาระบบ');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ฝ่ายพัฒนาระบบ');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 5);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'หัวหน้างาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'หัวหน้างาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 6);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 7);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้สนใจทั่วไป');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้สนใจทั่วไป');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'พื้นฐาน RAM');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'พื้นฐาน RAM');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวทางการจัดการและการจัดลำดับความสำคัญของเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวทางการจัดการและการจัดลำดับความสำคัญของเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความหมายของ Reliability, Availability, Maintainability (RAM)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความหมายของ Reliability, Availability, Maintainability (RAM)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'วัตถุประสงค์ของ RAM และการประยุกต์ใช้ในภาคอุตสาหกรรม');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'วัตถุประสงค์ของ RAM และการประยุกต์ใช้ในภาคอุตสาหกรรม');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความหมาย หน่วยนับ และวิธีการคำนวณตัวชี้วัด RAM');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความหมาย หน่วยนับ และวิธีการคำนวณตัวชี้วัด RAM');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'เทคนิคการวิเคราะห์');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'เทคนิคการวิเคราะห์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'FMEA');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'FMEA');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Why-Why Analysis');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Why-Why Analysis');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Phenomenon Analysis (PM Analysis)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Phenomenon Analysis (PM Analysis)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'VDO Analysis');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'VDO Analysis');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 2);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'Workshop');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'Workshop');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Workshop #1: เทคนิคการสร้าง Reliability');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Workshop #1: เทคนิคการสร้าง Reliability');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Workshop #2: เทคนิคการสร้าง Availability');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Workshop #2: เทคนิคการสร้าง Availability');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Workshop #3: การประยุกต์ใช้แนวคิด Maintainability');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Workshop #3: การประยุกต์ใช้แนวคิด Maintainability');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนวทางการจัดการและประเมินค่า RAM อย่างเป็นระบบ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนวทางการจัดการและประเมินค่า RAM อย่างเป็นระบบ');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 1  09:00 - 16:30', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวทางการจัดการและการจัดลำดับความสำคัญของเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวทางการจัดการและการจัดลำดับความสำคัญของเครื่องจักร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความหมายและวัตถุประสงค์ของ RAM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความหมายและวัตถุประสงค์ของ RAM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ความหมาย หน่วยนับ และการคำนวณตัวชี้วัด RAM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ความหมาย หน่วยนับ และการคำนวณตัวชี้วัด RAM');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เทคนิคและเครื่องมือสำหรับการวิเคราะห์และแก้ไขปัญหา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เทคนิคและเครื่องมือสำหรับการวิเคราะห์และแก้ไขปัญหา');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 2  09:00 - 16:30', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวคิดและวิธีการสร้าง Reliability, Availability, Maintainability');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวคิดและวิธีการสร้าง Reliability, Availability, Maintainability');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวคิดและวิธีการพัฒนา Maintainability');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวคิดและวิธีการพัฒนา Maintainability');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนวทางการจัดการและประเมินค่า RAM อย่างเป็นระบบ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนวทางการจัดการและประเมินค่า RAM อย่างเป็นระบบ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ถาม-ตอบ และแลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ถาม-ตอบ และแลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายความรู้ประกอบวีดิโอและรูปตัวอย่าง');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายความรู้ประกอบวีดิโอและรูปตัวอย่าง');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การฝึกภาคปฏิบัติ พร้อมกรณีศึกษา');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การฝึกภาคปฏิบัติ พร้อมกรณีศึกษา');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');
INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 1);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'กระดานไวท์บอร์ด หรือ Flip Chart และปากกาเคมี');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'ราคานี้ไม่รวมค่าเดินทาง ค่าที่พัก (ถ้ามี)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course MRM001
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('MRM001', 'condition-monitoring-predictive-maintenance', 'MRM', '2 วัน', '20 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'พื้นฐานการบำรุงรักษาเครื่องจักรด้วยเทคโนโลยีการบำรุงรักษาเชิงคาดการณ์', 'หลักสูตร 2 วัน สำหรับการตรวจสภาพเครื่องจักรด้วยเทคโนโลยี Predictive Maintenance ได้แก่ การวิเคราะห์การสั่นสะเทือน Thermography และการวิเคราะห์น้ำมัน เพื่อลดการหยุดเครื่องที่ไม่พึงประสงค์', 'โรงงานอุตสาหกรรมต่างเผชิญกับความท้าทายในการรักษาความพร้อมใช้งานของเครื่องจักร การบำรุงรักษาเชิงคาดการณ์ (Predictive Maintenance) และการตรวจสภาพเชิงเงื่อนไข (Condition-Based Maintenance: CBM) เป็นแนวทางสำคัญในการบริหารจัดการเครื่องจักรให้เกิดความเชื่อมั่น โดยอาศัยข้อมูลจากการวิเคราะห์การสั่นสะเทือน การถ่ายภาพความร้อน และการวิเคราะห์คุณภาพน้ำมัน', '2 วัน', '20 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Basic Condition Based Maintenance', 'หลักสูตร 2 วัน สำหรับการตรวจสภาพเครื่องจักรด้วยเทคโนโลยี Predictive Maintenance ได้แก่ การวิเคราะห์การสั่นสะเทือน Thermography และการวิเคราะห์น้ำมัน เพื่อลดการหยุดเครื่องที่ไม่พึงประสงค์', 'โรงงานอุตสาหกรรมต่างเผชิญกับความท้าทายในการรักษาความพร้อมใช้งานของเครื่องจักร การบำรุงรักษาเชิงคาดการณ์ (Predictive Maintenance) และการตรวจสภาพเชิงเงื่อนไข (Condition-Based Maintenance: CBM) เป็นแนวทางสำคัญในการบริหารจัดการเครื่องจักรให้เกิดความเชื่อมั่น โดยอาศัยข้อมูลจากการวิเคราะห์การสั่นสะเทือน การถ่ายภาพความร้อน และการวิเคราะห์คุณภาพน้ำมัน', '2 Days', '20 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจ สามารถวางแผนบำรุงรักษาเชิงคาดการณ์สำหรับเครื่องจักรวิกฤตด้วยวิธีการและเทคโนโลยีที่เหมาะสม');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจ สามารถวางแผนบำรุงรักษาเชิงคาดการณ์สำหรับเครื่องจักรวิกฤตด้วยวิธีการและเทคโนโลยีที่เหมาะสม');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'สามารถดำเนินการเบื้องต้นในการตรวจติดตามสภาพเครื่องจักร โดยใช้การวิเคราะห์การสั่นสะเทือน การถ่ายภาพความร้อน และการวิเคราะห์น้ำมัน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'สามารถดำเนินการเบื้องต้นในการตรวจติดตามสภาพเครื่องจักร โดยใช้การวิเคราะห์การสั่นสะเทือน การถ่ายภาพความร้อน และการวิเคราะห์น้ำมัน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'นำไปปรับปรุงแผนบำรุงรักษาโดยรวม เพื่อต้นทุนการบำรุงรักษาโดยรวมที่ต่ำที่สุด');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'นำไปปรับปรุงแผนบำรุงรักษาโดยรวม เพื่อต้นทุนการบำรุงรักษาโดยรวมที่ต่ำที่สุด');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการโรงงาน');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการโรงงาน');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการฝ่ายซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการฝ่ายซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกรซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกรซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ช่างเทคนิค');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ช่างเทคนิค');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 4);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้ที่เกี่ยวข้องกับงานบำรุงรักษา');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้ที่เกี่ยวข้องกับงานบำรุงรักษา');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'กลยุทธ์การบำรุงรักษา');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'กลยุทธ์การบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'กลยุทธ์การบำรุงรักษา VS ความสำคัญของเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'กลยุทธ์การบำรุงรักษา VS ความสำคัญของเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Breakdown Maintenance');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Breakdown Maintenance');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Preventive Maintenance');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Preventive Maintenance');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Predictive Maintenance');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Predictive Maintenance');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Proactive Maintenance');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Proactive Maintenance');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การบำรุงรักษาตามสภาพด้วยการวิเคราะห์การสั่นสะเทือน');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การบำรุงรักษาตามสภาพด้วยการวิเคราะห์การสั่นสะเทือน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์การสั่นสะเทือนร่วมกับเทคนิคอื่นๆ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์การสั่นสะเทือนร่วมกับเทคนิคอื่นๆ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การวิเคราะห์ความผิดปกติพื้นฐาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การวิเคราะห์ความผิดปกติพื้นฐาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การเกิดเรโซแนนซ์และการตรวจจับ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การเกิดเรโซแนนซ์และการตรวจจับ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'กรณีศึกษาและแนวทางการประยุกต์ใช้จริง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'กรณีศึกษาและแนวทางการประยุกต์ใช้จริง');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 2);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การใช้กล้องถ่ายภาพความร้อน (Thermograph)');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การใช้กล้องถ่ายภาพความร้อน (Thermograph)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'บทนำเรื่องกล้องถ่ายภาพความร้อน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'บทนำเรื่องกล้องถ่ายภาพความร้อน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การถ่ายเทความร้อนพื้นฐาน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การถ่ายเทความร้อนพื้นฐาน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'กรณีศึกษาและตัวอย่างการประยุกต์ใช้');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'กรณีศึกษาและตัวอย่างการประยุกต์ใช้');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 3);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'การวิเคราะห์น้ำมันหล่อลื่น');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'การวิเคราะห์น้ำมันหล่อลื่น');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ความรู้เบื้องต้นเกี่ยวกับการวิเคราะห์น้ำมัน');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ความรู้เบื้องต้นเกี่ยวกับการวิเคราะห์น้ำมัน');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การประยุกต์ใช้ผลการวิเคราะห์น้ำมันเพื่อการบำรุงรักษา');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การประยุกต์ใช้ผลการวิเคราะห์น้ำมันเพื่อการบำรุงรักษา');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เทคนิคอื่นๆ ในการตรวจสภาพเครื่องจักร (Condition Monitoring) เพื่อ CBM');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เทคนิคอื่นๆ ในการตรวจสภาพเครื่องจักร (Condition Monitoring) เพื่อ CBM');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '09:00 - 10:30', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'กลยุทธ์การบำรุงรักษา VS ความสำคัญของเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'กลยุทธ์การบำรุงรักษา VS ความสำคัญของเครื่องจักร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Breakdown Maintenance');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Breakdown Maintenance');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Preventive Maintenance');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Preventive Maintenance');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Predictive Maintenance');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Predictive Maintenance');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Proactive Maintenance');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Proactive Maintenance');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '10:45 - 12:00', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การบำรุงรักษาตามสภาพด้วยการวิเคราะห์การสั่นสะเทือน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การบำรุงรักษาตามสภาพด้วยการวิเคราะห์การสั่นสะเทือน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์ความผิดปกติพื้นฐาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์ความผิดปกติพื้นฐาน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การเกิดเรโซแนนซ์และการตรวจจับ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การเกิดเรโซแนนซ์และการตรวจจับ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'กรณีศึกษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'กรณีศึกษา');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '13:00 - 14:30', 2);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การใช้กล้องถ่ายภาพความร้อน (Thermograph)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การใช้กล้องถ่ายภาพความร้อน (Thermograph)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'บทนำเรื่องกล้องถ่ายภาพความร้อน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'บทนำเรื่องกล้องถ่ายภาพความร้อน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การถ่ายเทความร้อนพื้นฐาน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การถ่ายเทความร้อนพื้นฐาน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'กรณีศึกษา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'กรณีศึกษา');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, '14:45 - 16:00', 3);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การวิเคราะห์น้ำมันหล่อลื่น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การวิเคราะห์น้ำมันหล่อลื่น');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เทคนิคอื่นๆ ในการตรวจสภาพเครื่องจักร (Condition Monitoring) เพื่อ CBM');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เทคนิคอื่นๆ ในการตรวจสภาพเครื่องจักร (Condition Monitoring) เพื่อ CBM');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรที่มีประสบการณ์');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: N/A บาท (Exclude VAT)');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course MRM004
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('MRM004', 'machine-shaft-alignment', 'MRM', '2 วัน', '20 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การแก้ไขปัญหาการเยื้องศูนย์', 'หลักสูตร 2 วัน เน้นภาคปฏิบัติสำหรับการตั้งศูนย์เครื่องจักร ครอบคลุมตั้งแต่ Dial Indicators, Reverse Dial จนถึง Laser Alignment เพื่อลดการสั่นสะเทือนและเพิ่มอายุการใช้งานเครื่องจักร', 'การเยื้องศูนย์ของเพลาเครื่องจักร (Shaft Misalignment) เป็นหนึ่งในปัจจัยหลักที่ทำให้เกิดความสั่นสะเทือน ความเสียหายของชิ้นส่วน และการหยุดทำงานที่ไม่พึงประสงค์ หลักสูตรนี้จัดขึ้นเพื่อให้ผู้ปฏิบัติงานด้านซ่อมบำรุงได้เข้าใจถึงหลักการตั้งศูนย์เครื่องจักรอย่างถูกต้อง พร้อมการอบรมเชิงปฏิบัติ', '2 วัน', '20 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Machine Shaft Alignment and Workshop', 'หลักสูตร 2 วัน เน้นภาคปฏิบัติสำหรับการตั้งศูนย์เครื่องจักร ครอบคลุมตั้งแต่ Dial Indicators, Reverse Dial จนถึง Laser Alignment เพื่อลดการสั่นสะเทือนและเพิ่มอายุการใช้งานเครื่องจักร', 'การเยื้องศูนย์ของเพลาเครื่องจักร (Shaft Misalignment) เป็นหนึ่งในปัจจัยหลักที่ทำให้เกิดความสั่นสะเทือน ความเสียหายของชิ้นส่วน และการหยุดทำงานที่ไม่พึงประสงค์ หลักสูตรนี้จัดขึ้นเพื่อให้ผู้ปฏิบัติงานด้านซ่อมบำรุงได้เข้าใจถึงหลักการตั้งศูนย์เครื่องจักรอย่างถูกต้อง พร้อมการอบรมเชิงปฏิบัติ', '2 Days', '20 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจหลักการตั้งศูนย์เครื่องจักรอย่างถูกต้อง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจหลักการตั้งศูนย์เครื่องจักรอย่างถูกต้อง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'หาแนวทางแก้ไขปัญหาการที่เครื่องยังมีการเยื้องศูนย์ที่เกิดขึ้น');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'หาแนวทางแก้ไขปัญหาการที่เครื่องยังมีการเยื้องศูนย์ที่เกิดขึ้น');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ลดอุบัติเหตุจากการเสียและการหยุดทำงานของเครื่องจักร เพิ่มอายุการใช้งาน');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ลดอุบัติเหตุจากการเสียและการหยุดทำงานของเครื่องจักร เพิ่มอายุการใช้งาน');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 3);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เน้นการปฏิบัติจริง เพื่อให้เกิดความเข้าใจเชิงลึกเกี่ยวกับการประยุกต์ใช้งานจริง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เน้นการปฏิบัติจริง เพื่อให้เกิดความเข้าใจเชิงลึกเกี่ยวกับการประยุกต์ใช้งานจริง');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร/ช่างเทคนิคการซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร/ช่างเทคนิคการซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้เกี่ยวข้องงานซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้เกี่ยวข้องงานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้สนใจทั่วไป');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้สนใจทั่วไป');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'วันที่ 1: พื้นฐาน Shaft Alignment');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'วันที่ 1: พื้นฐาน Shaft Alignment');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'สาเหตุของความเสียหายของเครื่องจักร ผลที่ตามมาของการจัดตำแหน่งที่ไม่ถูกต้อง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'สาเหตุของความเสียหายของเครื่องจักร ผลที่ตามมาของการจัดตำแหน่งที่ไม่ถูกต้อง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'แนะนำการจัดตำแหน่งเพลาในงานตั้งศูนย์เครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'แนะนำการจัดตำแหน่งเพลาในงานตั้งศูนย์เครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประเภทของการเยื้องศูนย์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประเภทของการเยื้องศูนย์');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ระดับความรุนแรงของการเยื้องศูนย์ที่เกิดขึ้นกับเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ระดับความรุนแรงของการเยื้องศูนย์ที่เกิดขึ้นกับเครื่องจักร');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'วันที่ 2: เทคนิคและภาคปฏิบัติ');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'วันที่ 2: เทคนิคและภาคปฏิบัติ');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'หลักการใช้ Dial Indicators');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'หลักการใช้ Dial Indicators');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประเภทของการเชื่อมต่อส่งกำลัง');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประเภทของการเชื่อมต่อส่งกำลัง');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Pre-Alignment checks and Corrections');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Pre-Alignment checks and Corrections');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Soft Foot and Corrections');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Soft Foot and Corrections');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Thermal growth');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Thermal growth');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'The Rim-Face Dial indicator method');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'The Rim-Face Dial indicator method');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'The Reverse-Dial method');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'The Reverse-Dial method');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 7);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Laser Alignment');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Laser Alignment');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 8);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'Work Shop');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'Work Shop');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 9);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 1: 09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'สาเหตุของความเสียหายของเครื่องจักร');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'สาเหตุของความเสียหายของเครื่องจักร');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การประหยัดต้นทุน');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การประหยัดต้นทุน');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'แนะนำการจัดตำแหน่งเพลา');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'แนะนำการจัดตำแหน่งเพลา');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 1: 13:00 - 16:30', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ประเภทของการเยื้องศูนย์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ประเภทของการเยื้องศูนย์');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ระดับความรุนแรงของการเยื้องศูนย์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ระดับความรุนแรงของการเยื้องศูนย์');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 2: 09:00 - 12:00', 2);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'หลักการใช้ Dial Indicators');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'หลักการใช้ Dial Indicators');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ประเภทของการเชื่อมต่อส่งกำลัง');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ประเภทของการเชื่อมต่อส่งกำลัง');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 2: 13:00 - 16:30', 3);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Pre-Alignment checks and Corrections');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Pre-Alignment checks and Corrections');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Soft Foot and Corrections');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Soft Foot and Corrections');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Thermal growth');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Thermal growth');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Rim-Face / Reverse-Dial / Laser Alignment');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Rim-Face / Reverse-Dial / Laser Alignment');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Work Shop');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Work Shop');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 5);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรที่มีประสบการณ์');  -- TODO: translate
INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 1);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การเรียนรู้ภาคปฏิบัติ');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การเรียนรู้ภาคปฏิบัติ');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: Exclude VAT');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- Course MRM005
INSERT INTO courses (course_code, slug, category_code, duration, capacity, price, badge, badge_class, image) VALUES ('MRM005', 'balancing-rotating-machine', 'MRM', '1 วัน', '20 คน/รุ่น', 'N/A', '', '', NULL);
SET @course_id = LAST_INSERT_ID();
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'th', 'การปรับสมดุลเครื่องจักรหมุน', 'หลักสูตรเพื่อทำความเข้าใจสาเหตุการเกิดความไม่สมดุลของเครื่องจักร และฝึกเทคนิคการถ่วงสมดุลแบบภาคสนาม (Field Balancing) เพื่อลดการสั่นสะเทือนและเพิ่มอายุการใช้งานเครื่องจักร', 'การไม่สมดุล (Unbalance) เป็นสาเหตุสำคัญที่ทำให้เครื่องจักรหมุนเกิดการสั่นสะเทือน สูญเสียประสิทธิภาพ และลดอายุการใช้งาน หลักสูตรนี้จัดทำขึ้นเพื่อให้ผู้เข้าร่วมเข้าใจสาเหตุและผลกระทบของการไม่สมดุล รวมถึงเรียนรู้เทคนิคการถ่วงสมดุลแบบภาคสนาม (Field Balancing) ที่สามารถนำไปประยุกต์ใช้กับเครื่องจักรในโรงงานได้จริง', '1 วัน', '20 คน/รุ่น');
INSERT INTO course_translations (course_id, lang, title, short_desc, description, duration_label, capacity_label) VALUES (@course_id, 'en', 'Balancing of Rotating Machine and Workshop', 'หลักสูตรเพื่อทำความเข้าใจสาเหตุการเกิดความไม่สมดุลของเครื่องจักร และฝึกเทคนิคการถ่วงสมดุลแบบภาคสนาม (Field Balancing) เพื่อลดการสั่นสะเทือนและเพิ่มอายุการใช้งานเครื่องจักร', 'การไม่สมดุล (Unbalance) เป็นสาเหตุสำคัญที่ทำให้เครื่องจักรหมุนเกิดการสั่นสะเทือน สูญเสียประสิทธิภาพ และลดอายุการใช้งาน หลักสูตรนี้จัดทำขึ้นเพื่อให้ผู้เข้าร่วมเข้าใจสาเหตุและผลกระทบของการไม่สมดุล รวมถึงเรียนรู้เทคนิคการถ่วงสมดุลแบบภาคสนาม (Field Balancing) ที่สามารถนำไปประยุกต์ใช้กับเครื่องจักรในโรงงานได้จริง', '1 Day', '20 persons/class');

INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 0);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'ทราบถึงสาเหตุการเกิดความไม่สมดุลของเครื่องจักร (Machine Unbalance)');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'ทราบถึงสาเหตุการเกิดความไม่สมดุลของเครื่องจักร (Machine Unbalance)');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 1);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'เข้าใจหลักการ Balance เครื่องจักรอย่างถูกต้อง');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'เข้าใจหลักการ Balance เครื่องจักรอย่างถูกต้อง');  -- TODO: translate
INSERT INTO course_objectives (course_id, sort_order) VALUES (@course_id, 2);
SET @obj_id = LAST_INSERT_ID();
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'th', 'หาวิธีแก้ไขปัญหาที่เกิดจากข้อจำกัดต่างๆ ในการ Balance เครื่องจักรในรูปแบบต่างๆ');
INSERT INTO course_objective_translations (objective_id, lang, objective) VALUES (@obj_id, 'en', 'หาวิธีแก้ไขปัญหาที่เกิดจากข้อจำกัดต่างๆ ในการ Balance เครื่องจักรในรูปแบบต่างๆ');  -- TODO: translate

INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 0);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้จัดการซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้จัดการซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 1);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'วิศวกร/ช่างเทคนิคการซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'วิศวกร/ช่างเทคนิคการซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 2);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้เกี่ยวข้องงานซ่อมบำรุง');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้เกี่ยวข้องงานซ่อมบำรุง');  -- TODO: translate
INSERT INTO course_target_groups (course_id, sort_order) VALUES (@course_id, 3);
SET @tg_id = LAST_INSERT_ID();
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'th', 'ผู้สนใจทั่วไป');
INSERT INTO course_target_group_translations (target_group_id, lang, target_group) VALUES (@tg_id, 'en', 'ผู้สนใจทั่วไป');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 0);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'พื้นฐาน Balancing');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'พื้นฐาน Balancing');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'สาเหตุการเกิดความไม่สมดุลของเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'สาเหตุการเกิดความไม่สมดุลของเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ผลกระทบที่เกิดขึ้นจากความไม่สมดุลต่อเครื่องจักร');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ผลกระทบที่เกิดขึ้นจากความไม่สมดุลต่อเครื่องจักร');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ปัจจัยที่ทำให้เกิดความไม่สมดุล');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ปัจจัยที่ทำให้เกิดความไม่สมดุล');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประเภทของการเสียสมดุล');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประเภทของการเสียสมดุล');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'ประเภทของการถ่วงสมดุล (Field Balance VS Shop Balance)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'ประเภทของการถ่วงสมดุล (Field Balance VS Shop Balance)');  -- TODO: translate

INSERT INTO course_topics (course_id, sort_order) VALUES (@course_id, 1);
SET @topic_id = LAST_INSERT_ID();
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'th', 'เทคนิคการถ่วงสมดุล');
INSERT INTO course_topic_translations (topic_id, lang, title) VALUES (@topic_id, 'en', 'เทคนิคการถ่วงสมดุล');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 0);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การถ่วงสมดุลด้วยแท่นถ่วงสมดุล (Shop Balancing)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การถ่วงสมดุลด้วยแท่นถ่วงสมดุล (Shop Balancing)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 1);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การถ่วงสมดุลภาคสนาม (Field Balancing)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การถ่วงสมดุลภาคสนาม (Field Balancing)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 2);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'One-Plane Balancing');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'One-Plane Balancing');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 3);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', '4 Runs method');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', '4 Runs method');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 4);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การ Balance ด้วยเครื่องมือและโปรแกรมสำเร็จรูป');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การ Balance ด้วยเครื่องมือและโปรแกรมสำเร็จรูป');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 5);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การทำ Balance ด้วยกราฟ Polar');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การทำ Balance ด้วยกราฟ Polar');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 6);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'การกำหนด Specification ของการทำ Field Balance');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'การกำหนด Specification ของการทำ Field Balance');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 7);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'เปรียบเทียบกับ ISO 2372 / ISO-10816 และ ISO-1940 (1973)');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'เปรียบเทียบกับ ISO 2372 / ISO-10816 และ ISO-1940 (1973)');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 8);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'กรณีพิเศษที่เกิดขึ้นขณะวัดค่าและการแก้ไข');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'กรณีพิเศษที่เกิดขึ้นขณะวัดค่าและการแก้ไข');  -- TODO: translate
INSERT INTO course_topic_items (topic_id, sort_order) VALUES (@topic_id, 9);
SET @item_id = LAST_INSERT_ID();
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'th', 'สาเหตุที่การถ่วงสมดุลไม่ประสบผลสำเร็จ');
INSERT INTO course_topic_item_translations (item_id, lang, item) VALUES (@item_id, 'en', 'สาเหตุที่การถ่วงสมดุลไม่ประสบผลสำเร็จ');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 1: 09:00 - 12:00', 0);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'สาเหตุการเกิดความไม่สมดุล');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'สาเหตุการเกิดความไม่สมดุล');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ผลกระทบที่เกิดขึ้น');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ผลกระทบที่เกิดขึ้น');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ปัจจัยที่ทำให้เกิดความไม่สมดุล');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ปัจจัยที่ทำให้เกิดความไม่สมดุล');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ประเภทของการเสียสมดุล');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ประเภทของการเสียสมดุล');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 1: 13:00 - 16:30', 1);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ประเภทของการถ่วงสมดุล (Field Balance VS Shop Balance)');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ประเภทของการถ่วงสมดุล (Field Balance VS Shop Balance)');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Shop Balancing');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Shop Balancing');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'Field Balancing');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'Field Balancing');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 2: 09:00 - 12:00', 2);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การ Balance ด้วยเครื่องมือและโปรแกรมสำเร็จรูป');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การ Balance ด้วยเครื่องมือและโปรแกรมสำเร็จรูป');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การทำ Balance ด้วยกราฟ Polar');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การทำ Balance ด้วยกราฟ Polar');  -- TODO: translate

INSERT INTO course_schedules (course_id, time_range, sort_order) VALUES (@course_id, 'วันที่ 2: 13:00 - 16:30', 3);
SET @schedule_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 0);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'การกำหนด Specification ของการทำ Field Balance');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'การกำหนด Specification ของการทำ Field Balance');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 1);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'เปรียบเทียบกับ ISO 2372/ISO-10816 และ ISO-1940');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'เปรียบเทียบกับ ISO 2372/ISO-10816 และ ISO-1940');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 2);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'กรณีพิเศษและการแก้ไข');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'กรณีพิเศษและการแก้ไข');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 3);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'สาเหตุที่การถ่วงสมดุลไม่ประสบผลสำเร็จ');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'สาเหตุที่การถ่วงสมดุลไม่ประสบผลสำเร็จ');  -- TODO: translate
INSERT INTO course_schedule_activities (schedule_id, sort_order) VALUES (@schedule_id, 4);
SET @act_id = LAST_INSERT_ID();
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'th', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');
INSERT INTO course_schedule_activity_translations (activity_id, lang, activity) VALUES (@act_id, 'en', 'ช่วงถาม-ตอบ แลกเปลี่ยนประสบการณ์');  -- TODO: translate

INSERT INTO course_training_methods (course_id, sort_order) VALUES (@course_id, 0);
SET @method_id = LAST_INSERT_ID();
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'th', 'การบรรยายจากวิทยากรที่มีประสบการณ์');
INSERT INTO course_training_method_translations (method_id, lang, method) VALUES (@method_id, 'en', 'การบรรยายจากวิทยากรที่มีประสบการณ์');  -- TODO: translate

INSERT INTO course_equipments (course_id, sort_order) VALUES (@course_id, 0);
SET @equip_id = LAST_INSERT_ID();
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'th', 'LCD Projector');
INSERT INTO course_equipment_translations (equipment_id, lang, equipment) VALUES (@equip_id, 'en', 'LCD Projector');

INSERT INTO course_notes (course_id, sort_order) VALUES (@course_id, 0);
SET @note_id = LAST_INSERT_ID();
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'th', 'Training fee: Exclude VAT');
INSERT INTO course_note_translations (note_id, lang, note) VALUES (@note_id, 'en', 'Price excludes VAT 7%');


-- ─────────────────────────────────────────────────────
-- news
-- ─────────────────────────────────────────────────────
INSERT INTO news (cover_image) VALUES ('/images/training/Training_MRchoi_July2025/Brochur1.jpg');
SET @news_id = LAST_INSERT_ID();
INSERT INTO news_translations (news_id, lang, title, short_desc, event_date_text, location, full_description) VALUES (@news_id, 'th', 'CATEGORY II VIBRATION ANALYST', 'อบรม CATEGORY II VIBRATION ANALYST เรียนรู้การตรวจวัดและวิเคราะห์การสั่นสะเทือน พร้อมสอบรับ Certificate มาตรฐาน ISO 18436-2 จาก Vibration Institute, USA', '21-26 กรกฎาคม 2025', 'Holiday Inn & Suites ศรีราชา แหลมฉบัง จังหวัดชลบุรี', '
            <h2>หลักสูตร CATEGORY II VIBRATION ANALYST</h2>
            <p>หลักสูตรมาตรฐานสากล ได้รับการรับรองจาก Vibration Institute, USA</p>
            
            <h3>วิทยากร:</h3>
            <p><strong>Mr. Sooyong Choi</strong> - ผู้เชี่ยวชาญระดับนานาชาติ</p>
            
            <h3>เนื้อหาหลักสูตร:</h3>
            <ul>
                <li>Vibration Analysis เบื้องต้นถึงขั้นสูง</li>
                <li>Machine Diagnostics</li>
                <li>Bearing Analysis</li>
                <li>Balancing Techniques</li>
                <li>Condition Evaluation</li>
            </ul>
            
            <h3>ใบรับรอง:</h3>
            <p>ผู้ผ่านการสอบจะได้รับ Certificate ISO 18436-2 Category II</p>
            
            <h3>สอบถามเพิ่มเติม:</h3>
            <p>Tel: 096-1879595</p>
        ');
INSERT INTO news_translations (news_id, lang, title, short_desc, event_date_text, location, full_description) VALUES (@news_id, 'en', 'CATEGORY II VIBRATION ANALYST', 'อบรม CATEGORY II VIBRATION ANALYST เรียนรู้การตรวจวัดและวิเคราะห์การสั่นสะเทือน พร้อมสอบรับ Certificate มาตรฐาน ISO 18436-2 จาก Vibration Institute, USA', '21-26 กรกฎาคม 2025', 'Holiday Inn & Suites ศรีราชา แหลมฉบัง จังหวัดชลบุรี', '
            <h2>หลักสูตร CATEGORY II VIBRATION ANALYST</h2>
            <p>หลักสูตรมาตรฐานสากล ได้รับการรับรองจาก Vibration Institute, USA</p>
            
            <h3>วิทยากร:</h3>
            <p><strong>Mr. Sooyong Choi</strong> - ผู้เชี่ยวชาญระดับนานาชาติ</p>
            
            <h3>เนื้อหาหลักสูตร:</h3>
            <ul>
                <li>Vibration Analysis เบื้องต้นถึงขั้นสูง</li>
                <li>Machine Diagnostics</li>
                <li>Bearing Analysis</li>
                <li>Balancing Techniques</li>
                <li>Condition Evaluation</li>
            </ul>
            
            <h3>ใบรับรอง:</h3>
            <p>ผู้ผ่านการสอบจะได้รับ Certificate ISO 18436-2 Category II</p>
            
            <h3>สอบถามเพิ่มเติม:</h3>
            <p>Tel: 096-1879595</p>
        ');  -- TODO: translate
INSERT INTO news_images (news_id, image_url, sort_order) VALUES (@news_id, '/images/training/Training_MRchoi_July2025/Brochur1.jpg', 0);
INSERT INTO news_images (news_id, image_url, sort_order) VALUES (@news_id, '/images/training/Training_MRchoi_July2025/Brochur2.jpg', 1);
INSERT INTO news_tags (news_id) VALUES (@news_id);
SET @tag_id = LAST_INSERT_ID();
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'th', 'อบรม');
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'en', 'อบรม');  -- TODO: translate
INSERT INTO news_tags (news_id) VALUES (@news_id);
SET @tag_id = LAST_INSERT_ID();
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'th', 'Category II');
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'en', 'Category II');  -- TODO: translate
INSERT INTO news_tags (news_id) VALUES (@news_id);
SET @tag_id = LAST_INSERT_ID();
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'th', 'ISO 18436-2');
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'en', 'ISO 18436-2');  -- TODO: translate
INSERT INTO news_tags (news_id) VALUES (@news_id);
SET @tag_id = LAST_INSERT_ID();
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'th', 'International');
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'en', 'International');  -- TODO: translate

INSERT INTO news (cover_image) VALUES ('/images/training/Training_MRchoi_Dec2025/Brochur1.jpg');
SET @news_id = LAST_INSERT_ID();
INSERT INTO news_translations (news_id, lang, title, short_desc, event_date_text, location, full_description) VALUES (@news_id, 'th', 'อบรม CATEGORY II VIBRATION ANALYST', 'อบรม Basic Machinery Vibration (BMV) & Certification Exam พร้อมรับ Certificate ISO 18436-2 จาก Vibration Institute, USA วันที่ 15-20 ธันวาคม 2568 ณ Holiday Inn & Suites ศรีราชา แหลมฉบัง', '15-20 ธันวาคม 2568', 'Holiday Inn & Suites ศรีราชา แหลมฉบัง จังหวัดชลบุรี', '
            <h2>รายละเอียดหลักสูตร CATEGORY II VIBRATION ANALYST</h2>
            <p>หลักสูตรอบรม Basic Machinery Vibration (BMV) สำหรับผู้ปฏิบัติงานที่ต้องการยกระดับความรู้การวิเคราะห์การสั่นสะเทือน พร้อมสอบรับรองคุณวุฒิจากสถาบันสากล Vibration Institute, USA</p>

            <h3>สิ่งที่จะได้เรียนรู้:</h3>
            <ul>
                <li>หลักการวิเคราะห์การสั่นสะเทือนเชิงลึกสำหรับเครื่องจักรกลหมุน</li>
                <li>เทคนิคการตรวจวัดและวิเคราะห์สัญญาณสั่นสะเทือนในระดับ Category II</li>
                <li>การวินิจฉัยปัญหาเครื่องจักร เช่น Imbalance, Misalignment, Bearing Fault และ Looseness</li>
                <li>Workshop ภาคปฏิบัติจริงกับเครื่องจักรและอุปกรณ์วัดจริง</li>
            </ul>

            <h3>ข้อมูลการอบรม:</h3>
            <ul>
                <li>ระยะเวลาอบรม: 15–20 ธันวาคม 2568</li>
                <li>วันสอบ: 20 ธันวาคม 2568</li>
                <li>สถานที่: Holiday Inn & Suites Siracha Laemchabang, Chonburi</li>
                <li>ภาษาที่ใช้ในการสอบ: ภาษาอังกฤษ</li>
                <li>ผู้สอน: <strong>Mr. Sooyong Choi</strong> (Instructor จาก Vibration Institute)</li>
            </ul>

            <h3>ติดต่อสอบถาม:</h3>
            <p>Ms. Patcharawadee P.<br>
            Patineer Corporation Ltd.<br>
            Tel: 081-392-7447<br>
            Email: patineer@outlook.com / patcharawadee@patineer.co.th</p>
        ');
INSERT INTO news_translations (news_id, lang, title, short_desc, event_date_text, location, full_description) VALUES (@news_id, 'en', 'อบรม CATEGORY II VIBRATION ANALYST', 'อบรม Basic Machinery Vibration (BMV) & Certification Exam พร้อมรับ Certificate ISO 18436-2 จาก Vibration Institute, USA วันที่ 15-20 ธันวาคม 2568 ณ Holiday Inn & Suites ศรีราชา แหลมฉบัง', '15-20 ธันวาคม 2568', 'Holiday Inn & Suites ศรีราชา แหลมฉบัง จังหวัดชลบุรี', '
            <h2>รายละเอียดหลักสูตร CATEGORY II VIBRATION ANALYST</h2>
            <p>หลักสูตรอบรม Basic Machinery Vibration (BMV) สำหรับผู้ปฏิบัติงานที่ต้องการยกระดับความรู้การวิเคราะห์การสั่นสะเทือน พร้อมสอบรับรองคุณวุฒิจากสถาบันสากล Vibration Institute, USA</p>

            <h3>สิ่งที่จะได้เรียนรู้:</h3>
            <ul>
                <li>หลักการวิเคราะห์การสั่นสะเทือนเชิงลึกสำหรับเครื่องจักรกลหมุน</li>
                <li>เทคนิคการตรวจวัดและวิเคราะห์สัญญาณสั่นสะเทือนในระดับ Category II</li>
                <li>การวินิจฉัยปัญหาเครื่องจักร เช่น Imbalance, Misalignment, Bearing Fault และ Looseness</li>
                <li>Workshop ภาคปฏิบัติจริงกับเครื่องจักรและอุปกรณ์วัดจริง</li>
            </ul>

            <h3>ข้อมูลการอบรม:</h3>
            <ul>
                <li>ระยะเวลาอบรม: 15–20 ธันวาคม 2568</li>
                <li>วันสอบ: 20 ธันวาคม 2568</li>
                <li>สถานที่: Holiday Inn & Suites Siracha Laemchabang, Chonburi</li>
                <li>ภาษาที่ใช้ในการสอบ: ภาษาอังกฤษ</li>
                <li>ผู้สอน: <strong>Mr. Sooyong Choi</strong> (Instructor จาก Vibration Institute)</li>
            </ul>

            <h3>ติดต่อสอบถาม:</h3>
            <p>Ms. Patcharawadee P.<br>
            Patineer Corporation Ltd.<br>
            Tel: 081-392-7447<br>
            Email: patineer@outlook.com / patcharawadee@patineer.co.th</p>
        ');  -- TODO: translate
INSERT INTO news_images (news_id, image_url, sort_order) VALUES (@news_id, '/images/training/Training_MRchoi_Dec2025/Brochur1.jpg', 0);
INSERT INTO news_tags (news_id) VALUES (@news_id);
SET @tag_id = LAST_INSERT_ID();
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'th', 'อบรม');
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'en', 'อบรม');  -- TODO: translate
INSERT INTO news_tags (news_id) VALUES (@news_id);
SET @tag_id = LAST_INSERT_ID();
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'th', 'Category II');
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'en', 'Category II');  -- TODO: translate

INSERT INTO news (cover_image) VALUES ('/images/training/Training_MRchoi_Mar2026/Brochur1.png');
SET @news_id = LAST_INSERT_ID();
INSERT INTO news_translations (news_id, lang, title, short_desc, event_date_text, location, full_description) VALUES (@news_id, 'th', 'อบรม CATEGORY II VIBRATION ANALYST', 'อบรม Basic Machinery Vibration (BMV) & Certification Exam พร้อมรับ Certificate ISO 18436-2 จาก Vibration Institute, USA วันที่ 30 มีนาคม - 4 เมษายน 2569 ณ Holiday Inn & Suites ศรีราชา แหลมฉบัง', '30 มีนาคม - 4 เมษายน 2569', 'Holiday Inn & Suites ศรีราชา แหลมฉบัง จังหวัดชลบุรี', '
            <h2>รายละเอียดหลักสูตร CATEGORY II VIBRATION ANALYST</h2>
            <p>หลักสูตรอบรม Basic Machinery Vibration (BMV) สำหรับผู้ปฏิบัติงานที่ต้องการยกระดับความรู้การวิเคราะห์การสั่นสะเทือน พร้อมสอบรับรองคุณวุฒิจากสถาบันสากล Vibration Institute, USA</p>

            <h3>สิ่งที่จะได้เรียนรู้:</h3>
            <ul>
                <li>หลักการวิเคราะห์การสั่นสะเทือนเชิงลึกสำหรับเครื่องจักรกลหมุน</li>
                <li>เทคนิคการตรวจวัดและวิเคราะห์สัญญาณสั่นสะเทือนในระดับ Category II</li>
                <li>การวินิจฉัยปัญหาเครื่องจักร เช่น Imbalance, Misalignment, Bearing Fault และ Looseness</li>
                <li>Workshop ภาคปฏิบัติจริงกับเครื่องจักรและอุปกรณ์วัดจริง</li>
            </ul>

            <h3>ข้อมูลการอบรม:</h3>
            <ul>
                <li>ระยะเวลาอบรม: 30 มีนาคม - 4 เมษายน 2569</li>
                <li>วันสอบ: 4 เมษายน 2569</li>
                <li>สถานที่: Holiday Inn & Suites Siracha Laemchabang, Chonburi</li>
                <li>ภาษาที่ใช้ในการสอบ: ภาษาอังกฤษ</li>
                <li>ผู้สอน: <strong>Mr. Sooyong Choi</strong> (Instructor จาก Vibration Institute)</li>
            </ul>

            <h3>ติดต่อสอบถาม:</h3>
            <p>Ms. Patcharawadee P.<br>
            Patineer Corporation Ltd.<br>
            Tel: 081-392-7447<br>
            Email: patineer@outlook.com / patcharawadee@patineer.co.th</p>
        ');
INSERT INTO news_translations (news_id, lang, title, short_desc, event_date_text, location, full_description) VALUES (@news_id, 'en', 'อบรม CATEGORY II VIBRATION ANALYST', 'อบรม Basic Machinery Vibration (BMV) & Certification Exam พร้อมรับ Certificate ISO 18436-2 จาก Vibration Institute, USA วันที่ 30 มีนาคม - 4 เมษายน 2569 ณ Holiday Inn & Suites ศรีราชา แหลมฉบัง', '30 มีนาคม - 4 เมษายน 2569', 'Holiday Inn & Suites ศรีราชา แหลมฉบัง จังหวัดชลบุรี', '
            <h2>รายละเอียดหลักสูตร CATEGORY II VIBRATION ANALYST</h2>
            <p>หลักสูตรอบรม Basic Machinery Vibration (BMV) สำหรับผู้ปฏิบัติงานที่ต้องการยกระดับความรู้การวิเคราะห์การสั่นสะเทือน พร้อมสอบรับรองคุณวุฒิจากสถาบันสากล Vibration Institute, USA</p>

            <h3>สิ่งที่จะได้เรียนรู้:</h3>
            <ul>
                <li>หลักการวิเคราะห์การสั่นสะเทือนเชิงลึกสำหรับเครื่องจักรกลหมุน</li>
                <li>เทคนิคการตรวจวัดและวิเคราะห์สัญญาณสั่นสะเทือนในระดับ Category II</li>
                <li>การวินิจฉัยปัญหาเครื่องจักร เช่น Imbalance, Misalignment, Bearing Fault และ Looseness</li>
                <li>Workshop ภาคปฏิบัติจริงกับเครื่องจักรและอุปกรณ์วัดจริง</li>
            </ul>

            <h3>ข้อมูลการอบรม:</h3>
            <ul>
                <li>ระยะเวลาอบรม: 30 มีนาคม - 4 เมษายน 2569</li>
                <li>วันสอบ: 4 เมษายน 2569</li>
                <li>สถานที่: Holiday Inn & Suites Siracha Laemchabang, Chonburi</li>
                <li>ภาษาที่ใช้ในการสอบ: ภาษาอังกฤษ</li>
                <li>ผู้สอน: <strong>Mr. Sooyong Choi</strong> (Instructor จาก Vibration Institute)</li>
            </ul>

            <h3>ติดต่อสอบถาม:</h3>
            <p>Ms. Patcharawadee P.<br>
            Patineer Corporation Ltd.<br>
            Tel: 081-392-7447<br>
            Email: patineer@outlook.com / patcharawadee@patineer.co.th</p>
        ');  -- TODO: translate
INSERT INTO news_images (news_id, image_url, sort_order) VALUES (@news_id, '/images/training/Training_MRchoi_Mar2026/Brochur1.png', 0);
INSERT INTO news_images (news_id, image_url, sort_order) VALUES (@news_id, '/images/training/Training_MRchoi_Mar2026/Brochur2.png', 1);
INSERT INTO news_tags (news_id) VALUES (@news_id);
SET @tag_id = LAST_INSERT_ID();
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'th', 'อบรม');
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'en', 'อบรม');  -- TODO: translate
INSERT INTO news_tags (news_id) VALUES (@news_id);
SET @tag_id = LAST_INSERT_ID();
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'th', 'Category II');
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'en', 'Category II');  -- TODO: translate

INSERT INTO news (cover_image) VALUES ('/images/training/VB_21-24July2026/VB_Session_4(july21-24)_1.jpg');
SET @news_id = LAST_INSERT_ID();
INSERT INTO news_translations (news_id, lang, title, short_desc, event_date_text, location, full_description) VALUES (@news_id, 'th', 'อบรม Vibration Analysis & Workshop', 'อบรม Vibration Analysis & Workshop พร้อมรับ Certificate ISO 18436-2 (Level 2)', '21 - 24 กรกฎาคม 2569', 'Holiday Inn & Suites ศรีราชา แหลมฉบัง จังหวัดชลบุรี', '
            <h2>รายละเอียดหลักสูตร Vibration Analysis & Workshop</h2>
            <p>หลักสูตรการวิเคราะห์การสั่นสะเทือนแบบเจาะลึก พร้อม Workshop ภาคปฏิบัติจริง</p>
            
            <h3>สิ่งที่จะได้เรียนรู้:</h3>
            <ul>
                <li>ทฤษฎีพื้นฐานการสั่นสะเทือนและการประยุกต์ใช้</li>
                <li>เทคนิคการตรวจวัดและวิเคราะห์ Vibration</li>
                <li>การวินิจฉัยปัญหาเครื่องจักรจากสัญญาณสั่นสะเทือน</li>
                <li>Workshop ภาคปฏิบัติกับเครื่องจักรจริง</li>
            </ul>
            <h3>ค่าใช้จ่าย:</h3>
            <p>ราคา: 18,000 บาท/ท่าน</p>
            
            <h3>ติดต่อสอบถาม:</h3>
            <p>Tel: 096-1879595, 081-3927447</p>
            <p>Email: patineer@outlook.com</p>
        ');
INSERT INTO news_translations (news_id, lang, title, short_desc, event_date_text, location, full_description) VALUES (@news_id, 'en', 'อบรม Vibration Analysis & Workshop', 'อบรม Vibration Analysis & Workshop พร้อมรับ Certificate ISO 18436-2 (Level 2)', '21 - 24 กรกฎาคม 2569', 'Holiday Inn & Suites ศรีราชา แหลมฉบัง จังหวัดชลบุรี', '
            <h2>รายละเอียดหลักสูตร Vibration Analysis & Workshop</h2>
            <p>หลักสูตรการวิเคราะห์การสั่นสะเทือนแบบเจาะลึก พร้อม Workshop ภาคปฏิบัติจริง</p>
            
            <h3>สิ่งที่จะได้เรียนรู้:</h3>
            <ul>
                <li>ทฤษฎีพื้นฐานการสั่นสะเทือนและการประยุกต์ใช้</li>
                <li>เทคนิคการตรวจวัดและวิเคราะห์ Vibration</li>
                <li>การวินิจฉัยปัญหาเครื่องจักรจากสัญญาณสั่นสะเทือน</li>
                <li>Workshop ภาคปฏิบัติกับเครื่องจักรจริง</li>
            </ul>
            <h3>ค่าใช้จ่าย:</h3>
            <p>ราคา: 18,000 บาท/ท่าน</p>
            
            <h3>ติดต่อสอบถาม:</h3>
            <p>Tel: 096-1879595, 081-3927447</p>
            <p>Email: patineer@outlook.com</p>
        ');  -- TODO: translate
INSERT INTO news_images (news_id, image_url, sort_order) VALUES (@news_id, '/images/training/VB_21-24July2026/VB_Session_4(july21-24)_1.jpg', 0);
INSERT INTO news_images (news_id, image_url, sort_order) VALUES (@news_id, '/images/training/VB_21-24July2026/VB_Session_4(july21-24)_2.jpg', 1);
INSERT INTO news_images (news_id, image_url, sort_order) VALUES (@news_id, '/images/training/VB_21-24July2026/VB_Session_4(july21-24)_3.jpg', 2);
INSERT INTO news_images (news_id, image_url, sort_order) VALUES (@news_id, '/images/training/VB_21-24July2026/VB_Session_4(july21-24)_4.jpg', 3);
INSERT INTO news_tags (news_id) VALUES (@news_id);
SET @tag_id = LAST_INSERT_ID();
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'th', 'อบรม');
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'en', 'อบรม');  -- TODO: translate
INSERT INTO news_tags (news_id) VALUES (@news_id);
SET @tag_id = LAST_INSERT_ID();
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'th', 'Category II');
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'en', 'Category II');  -- TODO: translate

INSERT INTO news (cover_image) VALUES ('/images/training/PVP_13-14aug2026/PVP_brochure.png');
SET @news_id = LAST_INSERT_ID();
INSERT INTO news_translations (news_id, lang, title, short_desc, event_date_text, location, full_description) VALUES (@news_id, 'th', 'อบรม Vibration Analysis & Workshop', 'อบรม Vibration Analysis & Workshop หลักสูตรการวิเคราะห์การสั่นสะเทือนเพื่อการบำรุงรักษาเชิงพยากรณ์ พร้อม Workshop ภาคปฏิบัติจริง วันที่ 13-14 สิงหาคม 2569 ณ ฮอลิเดย์ อินน์ แอนด์ สวีท ศรีราชา แหลมฉบัง', '13-14 สิงหาคม 2569', 'Holiday Inn & Suites ศรีราชา แหลมฉบัง จังหวัดชลบุรี', '
            <h2>รายละเอียดหลักสูตร Vibration Analysis & Workshop</h2>
            <p>หลักสูตรการวิเคราะห์การสั่นสะเทือน เพื่อการบำรุงรักษาเชิงพยากรณ์ พร้อม Workshop ภาคปฏิบัติจริง</p>

            <h3>สิ่งที่จะได้เรียนรู้:</h3>
            <ul>
                <li>เข้าใจหลักการของ Condition-based maintenance (CBM)</li>
                <li>เรียนรู้พื้นฐานการวิเคราะห์การสั่นสะเทือนของเครื่องจักรหมุน</li>
                <li>สามารถวิเคราะห์สาเหตุของปัญหาพื้นฐานและแนวโน้มการสั่นสะเทือนเพื่อเฝ้าระวังสภาพเครื่องจักรได้</li>
                <li>Workshop ภาคปฏิบัติกับเครื่องจักรจริง</li>
            </ul>

            <h3>ค่าใช้จ่าย:</h3>
            <p>ราคา: 8,000 บาท/ท่าน</p>
            <p>พิเศษโปรโมชั่น: สมัครพร้อมกัน 2 ท่าน เหลือ 14,400 บาท</p>

            <h3>ติดต่อสอบถาม:</h3>
            <p>Tel: 096-1879595, 081-3927447</p>
            <p>Email: patineer@outlook.com</p>
        ');
INSERT INTO news_translations (news_id, lang, title, short_desc, event_date_text, location, full_description) VALUES (@news_id, 'en', 'Practical Vibration Analysis for Predictive Maintenance', 'Practical Vibration Analysis for Predictive Maintenance - a hands-on workshop on vibration analysis for predictive maintenance, August 13-14, 2026 at Holiday Inn & Suites Siracha Laemchabang, Chonburi', 'August 13-14, 2026', 'Holiday Inn & Suites Siracha Laemchabang, Chonburi', '
            <h2>Course Details: Practical Vibration Analysis for Predictive Maintenance</h2>
            <p>A vibration analysis course for predictive maintenance, including a hands-on workshop.</p>

            <h3>What You Will Learn:</h3>
            <ul>
                <li>Understand the principles of Condition-Based Maintenance (CBM)</li>
                <li>Learn the fundamentals of vibration analysis for rotating machinery</li>
                <li>Analyze the root causes of basic problems and vibration trends to monitor machine condition</li>
                <li>Hands-on workshop with real machinery</li>
            </ul>

            <h3>Fee:</h3>
            <p>Price: 8,000 THB/person</p>
            <p>Special promotion: Register 2 people together for 14,400 THB</p>

            <h3>Contact:</h3>
            <p>Tel: 096-1879595, 081-3927447</p>
            <p>Email: patineer@outlook.com</p>
        ');
INSERT INTO news_images (news_id, image_url, sort_order) VALUES (@news_id, '/images/training/PVP_13-14aug2026/PVP_brochure.png', 0);
INSERT INTO news_tags (news_id) VALUES (@news_id);
SET @tag_id = LAST_INSERT_ID();
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'th', 'อบรม');
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'en', 'Training');
INSERT INTO news_tags (news_id) VALUES (@news_id);
SET @tag_id = LAST_INSERT_ID();
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'th', 'Vibration');
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'en', 'Vibration');
INSERT INTO news_tags (news_id) VALUES (@news_id);
SET @tag_id = LAST_INSERT_ID();
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'th', 'CBM');
INSERT INTO news_tag_translations (tag_id, lang, tag) VALUES (@tag_id, 'en', 'CBM');

-- ─────────────────────────────────────────────────────
-- members (not translatable)
-- ─────────────────────────────────────────────────────
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (1, 'SiraCATt', 'Amphaisri', 'patineer.co.th', 'Pat_eng2@patineer.com', 'ยังมีรายชื่ออยู่ใน CAT | CATII', '103655');
INSERT INTO member_certifications (member_id, cert_code) VALUES (1, 'CATII');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (2, 'Chotiwit', 'Kunathananon', 'Rayong Engineering & Plant SerCATce Co., Ltd. (REPCO)', 'repconex@scg.com', 'ยังมีรายชื่ออยู่ใน CAT | CATII', '103651');
INSERT INTO member_certifications (member_id, cert_code) VALUES (2, 'CATII');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (3, 'Khemapat', 'Tontiwattanakul', 'KMUTNB', 'khemapat.t@eng.kmutnb.ac.th', 'ยังมีรายชื่ออยู่ใน CAT | CATII', '103654');
INSERT INTO member_certifications (member_id, cert_code) VALUES (3, 'CATII');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (6, 'Pisit', 'Sirisoponwattana', 'Rayong Engineering and Plant SerCATce Co., Ltd.', 'Pisitsirisoponwattana@gmail.com', 'ยังมีรายชื่ออยู่ใน CAT | CATII', '104328');
INSERT INTO member_certifications (member_id, cert_code) VALUES (6, 'CATII');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (8, 'Kolawach', 'Chalermpong', 'KMITL', 'kolawach.ch@kmitl.ac.th', 'ยังมีรายชื่ออยู่ใน CAT | CATII', '104327');
INSERT INTO member_certifications (member_id, cert_code) VALUES (8, 'CATII');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (9, 'Nguyen', 'Phuong Hung', 'NARIME', 'hungnp@narime.gov.vn', 'ยังมีรายชื่ออยู่ใน CAT | CATIII', '16630');
INSERT INTO member_certifications (member_id, cert_code) VALUES (9, 'CATIII');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (29, 'Tran', 'Duy Hoai', 'Au CATet Technical Equipment JSC', 'hoai.tran@aCATtek.vn', 'ยังมีรายชื่ออยู่ใน CAT | CATII, CATIII', '13123');
INSERT INTO member_certifications (member_id, cert_code) VALUES (29, 'CATII');
INSERT INTO member_certifications (member_id, cert_code) VALUES (29, 'CATIII');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (33, 'Danai', 'Nantasup', 'Eastern Water', 'danai_nan@eastwater.com', 'ยังมีรายชื่ออยู่ใน CAT | CATII', '99237');
INSERT INTO member_certifications (member_id, cert_code) VALUES (33, 'CATII');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (34, 'Anuthida', 'Palarit', 'Eastern Water', 'anuthida_pal@eastwater.com', 'ยังมีรายชื่ออยู่ใน CAT | CATII', '99232');
INSERT INTO member_certifications (member_id, cert_code) VALUES (34, 'CATII');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (36, 'Kamolwan', 'Weerachatsakul', 'REPCO', 'hrtech2@scg.com', 'ยังมีรายชื่ออยู่ใน CAT | CATII, CATIII', '99368');
INSERT INTO member_certifications (member_id, cert_code) VALUES (36, 'CATII');
INSERT INTO member_certifications (member_id, cert_code) VALUES (36, 'CATIII');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (37, 'Metee', 'Meerabeab', 'GC Maintenance & Engineering', 'metee.m@pttgcgroup.com', 'ยังมีรายชื่ออยู่ใน CAT | CATII', '99369');
INSERT INTO member_certifications (member_id, cert_code) VALUES (37, 'CATII');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (38, 'Nitigorn', 'Eakchay', 'GC Maintenance & Engineering', 'nitigorn.e@pttgcgroup.com', 'ยังมีรายชื่ออยู่ใน CAT | CATII', '99239');
INSERT INTO member_certifications (member_id, cert_code) VALUES (38, 'CATII');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (45, 'Jakkarin', 'Sumethasorn', 'SKF Thailand', 'jakkarin.sumethasorn@skf.com', 'ยังมีรายชื่ออยู่ใน CAT | CATII', '101152');
INSERT INTO member_certifications (member_id, cert_code) VALUES (45, 'CATII');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (57, 'Anutr', 'Ratipann', 'Bridgestone Asia Pacific', 'anutr.ratipann1@bridgestone.com', 'ยังมีรายชื่ออยู่ใน CAT | CATII', '102464');
INSERT INTO member_certifications (member_id, cert_code) VALUES (57, 'CATII');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (58, 'Karn', 'Deeying', 'Rayong Engineering & Plant SerCATce Co., Ltd. (REPCO)', 'repconex@scg.com', 'ยังมีรายชื่ออยู่ใน CAT | CATII', '103653');
INSERT INTO member_certifications (member_id, cert_code) VALUES (58, 'CATII');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (59, 'Sirawat', 'Channam', 'SOTUS Corporation Co., Ltd.', '', 'Currently listed in CAT | BMV', 'PAT-BMV-25001');
INSERT INTO member_certifications (member_id, cert_code) VALUES (59, 'BMV');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (60, 'Jaroensak', 'Pachdsood', 'SOTUS Corporation Co., Ltd.', '', 'Currently listed in CAT | BMV', 'PAT-BMV-25002');
INSERT INTO member_certifications (member_id, cert_code) VALUES (60, 'BMV');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (61, 'Pongsakon', 'Budmanee', 'U-Services Thailand Co.,Ltd. (Surat Thani)', 'b.pongsakon1999@gmail.com', 'Currently listed in CAT | BMV', 'PAT-BMV-25003');
INSERT INTO member_certifications (member_id, cert_code) VALUES (61, 'BMV');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (62, 'Khajorn', 'Mitaowan', 'U-Services Thailand Co.,Ltd. (Khon Kaen)', 'khajorn@uservices-thailand.com', 'Currently listed in CAT | BMV', 'PAT-BMV-25004');
INSERT INTO member_certifications (member_id, cert_code) VALUES (62, 'BMV');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (63, 'Thanaphat', 'Inchan', 'U-Services Thailand Co.,Ltd. (Rayong)', 'phatkung810@gmail.com', 'Currently listed in CAT | BMV', 'PAT-BMV-25005');
INSERT INTO member_certifications (member_id, cert_code) VALUES (63, 'BMV');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (64, 'Wanchai', 'Sripun', 'U-Services Thailand Co.,Ltd. (Rayong)', 'wchwanchai@gmail.com', 'Currently listed in CAT | BMV', 'PAT-BMV-25006');
INSERT INTO member_certifications (member_id, cert_code) VALUES (64, 'BMV');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (65, 'Benjapol', 'Diswath', 'FASTEN OIL CO., LTD.', '1ggxdggoorr.258@gmail.com', 'Currently listed in CAT | BMV', 'PAT-BMV-26001');
INSERT INTO member_certifications (member_id, cert_code) VALUES (65, 'BMV');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (66, 'Akkarapol', 'Areepom', 'ADS SALES AND SERVICE CO., LTD.', 'akkarapol.a@ads-service.co.th', 'Currently listed in CAT | BMV', 'PAT-BMV-26002');
INSERT INTO member_certifications (member_id, cert_code) VALUES (66, 'BMV');
INSERT INTO members (id, first_name, last_name, company, email, level_text, member_no) VALUES (67, 'Panuwat', 'Adunyasak', 'Individual', 'Panuwat_072@hotmail.com', 'Currently listed in CAT | BMV', 'PAT-BMV-26003');
INSERT INTO member_certifications (member_id, cert_code) VALUES (67, 'BMV');