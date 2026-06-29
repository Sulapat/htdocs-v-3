-- =====================================================
-- Database schema (i18n version) — TH + EN bilingual
-- Strategy: translation tables pattern
--   • Non-translatable data stays in the main table (code, slug, image, price, sort_order …)
--   • All translatable text lives in a companion *_translations table
--     with a `lang` column ('th' | 'en')
--   • API query: JOIN … WHERE lang = ?  →  single-language response
-- Import order: this file FIRST, then seed_data_i18n.sql
-- =====================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ─────────────────────────────────────────────────────
-- categories
-- ─────────────────────────────────────────────────────
DROP TABLE IF EXISTS category_translations;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
  code   VARCHAR(10)  NOT NULL PRIMARY KEY,
  icon   VARCHAR(100),
  color  VARCHAR(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE category_translations (
  id      INT AUTO_INCREMENT PRIMARY KEY,
  code    VARCHAR(10)  NOT NULL,
  lang    VARCHAR(5)   NOT NULL,          -- 'th' | 'en'
  label   VARCHAR(100) NOT NULL,
  UNIQUE KEY uq_cat_lang (code, lang),
  CONSTRAINT fk_cattrans_code FOREIGN KEY (code) REFERENCES categories(code) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ─────────────────────────────────────────────────────
-- courses
-- ─────────────────────────────────────────────────────
DROP TABLE IF EXISTS course_note_translations;
DROP TABLE IF EXISTS course_notes;
DROP TABLE IF EXISTS course_equipment_translations;
DROP TABLE IF EXISTS course_equipments;
DROP TABLE IF EXISTS course_training_method_translations;
DROP TABLE IF EXISTS course_training_methods;
DROP TABLE IF EXISTS course_schedule_activity_translations;
DROP TABLE IF EXISTS course_schedule_activities;
DROP TABLE IF EXISTS course_schedules;           -- time_range is not translatable
DROP TABLE IF EXISTS course_topic_item_translations;
DROP TABLE IF EXISTS course_topic_items;
DROP TABLE IF EXISTS course_topic_translations;
DROP TABLE IF EXISTS course_topics;
DROP TABLE IF EXISTS course_target_group_translations;
DROP TABLE IF EXISTS course_target_groups;
DROP TABLE IF EXISTS course_objective_translations;
DROP TABLE IF EXISTS course_objectives;
DROP TABLE IF EXISTS course_translations;
DROP TABLE IF EXISTS courses;

CREATE TABLE courses (
  id             INT AUTO_INCREMENT PRIMARY KEY,
  course_code    VARCHAR(20)  NOT NULL UNIQUE,
  slug           VARCHAR(255) NOT NULL UNIQUE,   -- URL slug, language-neutral
  category_code  VARCHAR(10),
  duration       VARCHAR(50),                    -- '1 day' / could be translated via app layer
  capacity       VARCHAR(50),
  price          VARCHAR(50),
  badge          VARCHAR(100),
  badge_class    VARCHAR(100),
  image          VARCHAR(255),
  created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_courses_category FOREIGN KEY (category_code) REFERENCES categories(code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Translatable course fields
CREATE TABLE course_translations (
  id             INT AUTO_INCREMENT PRIMARY KEY,
  course_id      INT         NOT NULL,
  lang           VARCHAR(5)  NOT NULL,
  title          VARCHAR(500) NOT NULL,
  short_desc     TEXT,
  description    TEXT,
  duration_label VARCHAR(50),    -- translated "1 วัน" / "1 Day"
  capacity_label VARCHAR(50),    -- translated "15 คน/รุ่น" / "15 persons/class"
  UNIQUE KEY uq_course_lang (course_id, lang),
  CONSTRAINT fk_ct_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Objectives (translatable text only; row identity held in main table)
CREATE TABLE course_objectives (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  course_id   INT NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_obj_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE course_objective_translations (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  objective_id INT         NOT NULL,
  lang         VARCHAR(5)  NOT NULL,
  objective    TEXT NOT NULL,
  UNIQUE KEY uq_obj_lang (objective_id, lang),
  CONSTRAINT fk_objt_obj FOREIGN KEY (objective_id) REFERENCES course_objectives(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Target groups
CREATE TABLE course_target_groups (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  course_id   INT NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_tg_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE course_target_group_translations (
  id              INT AUTO_INCREMENT PRIMARY KEY,
  target_group_id INT         NOT NULL,
  lang            VARCHAR(5)  NOT NULL,
  target_group    VARCHAR(255) NOT NULL,
  UNIQUE KEY uq_tg_lang (target_group_id, lang),
  CONSTRAINT fk_tgt_tg FOREIGN KEY (target_group_id) REFERENCES course_target_groups(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Topics (chapter titles)
CREATE TABLE course_topics (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  course_id   INT NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_topic_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE course_topic_translations (
  id        INT AUTO_INCREMENT PRIMARY KEY,
  topic_id  INT         NOT NULL,
  lang      VARCHAR(5)  NOT NULL,
  title     VARCHAR(255) NOT NULL,
  UNIQUE KEY uq_topic_lang (topic_id, lang),
  CONSTRAINT fk_topict_topic FOREIGN KEY (topic_id) REFERENCES course_topics(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Topic items (bullet points inside each chapter)
CREATE TABLE course_topic_items (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  topic_id    INT NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_item_topic FOREIGN KEY (topic_id) REFERENCES course_topics(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE course_topic_item_translations (
  id       INT AUTO_INCREMENT PRIMARY KEY,
  item_id  INT         NOT NULL,
  lang     VARCHAR(5)  NOT NULL,
  item     TEXT NOT NULL,
  UNIQUE KEY uq_item_lang (item_id, lang),
  CONSTRAINT fk_itemt_item FOREIGN KEY (item_id) REFERENCES course_topic_items(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Schedules  (time_range is NOT translated — "09:00 – 12:00" is universal)
CREATE TABLE course_schedules (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  course_id   INT NOT NULL,
  time_range  VARCHAR(100) NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_sched_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Schedule activities (translatable)
CREATE TABLE course_schedule_activities (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  schedule_id  INT NOT NULL,
  sort_order   INT DEFAULT 0,
  CONSTRAINT fk_act_sched FOREIGN KEY (schedule_id) REFERENCES course_schedules(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE course_schedule_activity_translations (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  activity_id INT         NOT NULL,
  lang        VARCHAR(5)  NOT NULL,
  activity    TEXT NOT NULL,
  UNIQUE KEY uq_act_lang (activity_id, lang),
  CONSTRAINT fk_actt_act FOREIGN KEY (activity_id) REFERENCES course_schedule_activities(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Training methods
CREATE TABLE course_training_methods (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  course_id   INT NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_method_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE course_training_method_translations (
  id        INT AUTO_INCREMENT PRIMARY KEY,
  method_id INT         NOT NULL,
  lang      VARCHAR(5)  NOT NULL,
  method    TEXT NOT NULL,
  UNIQUE KEY uq_method_lang (method_id, lang),
  CONSTRAINT fk_methodt_method FOREIGN KEY (method_id) REFERENCES course_training_methods(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Equipment  (product names like "LCD Projector" need translation only if desired)
CREATE TABLE course_equipments (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  course_id   INT NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_equip_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE course_equipment_translations (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  equipment_id INT         NOT NULL,
  lang         VARCHAR(5)  NOT NULL,
  equipment    VARCHAR(255) NOT NULL,
  UNIQUE KEY uq_equip_lang (equipment_id, lang),
  CONSTRAINT fk_equipt_equip FOREIGN KEY (equipment_id) REFERENCES course_equipments(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Notes
CREATE TABLE course_notes (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  course_id   INT NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_note_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE course_note_translations (
  id       INT AUTO_INCREMENT PRIMARY KEY,
  note_id  INT         NOT NULL,
  lang     VARCHAR(5)  NOT NULL,
  note     TEXT NOT NULL,
  UNIQUE KEY uq_note_lang (note_id, lang),
  CONSTRAINT fk_notet_note FOREIGN KEY (note_id) REFERENCES course_notes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ─────────────────────────────────────────────────────
-- news
-- ─────────────────────────────────────────────────────
DROP TABLE IF EXISTS news_tag_translations;
DROP TABLE IF EXISTS news_tags;
DROP TABLE IF EXISTS news_images;
DROP TABLE IF EXISTS news_translations;
DROP TABLE IF EXISTS news;

CREATE TABLE news (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  cover_image  VARCHAR(255),
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE news_translations (
  id               INT AUTO_INCREMENT PRIMARY KEY,
  news_id          INT         NOT NULL,
  lang             VARCHAR(5)  NOT NULL,
  title            VARCHAR(500) NOT NULL,
  short_desc       TEXT,
  event_date_text  VARCHAR(100),
  location         VARCHAR(255),
  full_description LONGTEXT,
  UNIQUE KEY uq_news_lang (news_id, lang),
  CONSTRAINT fk_newst_news FOREIGN KEY (news_id) REFERENCES news(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Images are language-neutral
CREATE TABLE news_images (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  news_id     INT NOT NULL,
  image_url   VARCHAR(255) NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_img_news FOREIGN KEY (news_id) REFERENCES news(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tags — translatable (e.g. 'อบรม' → 'Training')
CREATE TABLE news_tags (
  id       INT AUTO_INCREMENT PRIMARY KEY,
  news_id  INT NOT NULL,
  CONSTRAINT fk_tag_news FOREIGN KEY (news_id) REFERENCES news(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE news_tag_translations (
  id      INT AUTO_INCREMENT PRIMARY KEY,
  tag_id  INT         NOT NULL,
  lang    VARCHAR(5)  NOT NULL,
  tag     VARCHAR(100) NOT NULL,
  UNIQUE KEY uq_tag_lang (tag_id, lang),
  CONSTRAINT fk_tagt_tag FOREIGN KEY (tag_id) REFERENCES news_tags(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ─────────────────────────────────────────────────────
-- members / certifications  (not translatable — proper names)
-- ─────────────────────────────────────────────────────
DROP TABLE IF EXISTS member_certifications;
DROP TABLE IF EXISTS members;

CREATE TABLE members (
  id          INT PRIMARY KEY,
  first_name  VARCHAR(100),
  last_name   VARCHAR(100),
  company     VARCHAR(255),
  email       VARCHAR(255),
  level_text  VARCHAR(255),
  member_no   VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE member_certifications (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  member_id   INT NOT NULL,
  cert_code   VARCHAR(20) NOT NULL,
  CONSTRAINT fk_cert_member FOREIGN KEY (member_id) REFERENCES members(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
