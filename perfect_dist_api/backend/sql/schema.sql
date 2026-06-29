-- =====================================================
-- Database schema for Vue + PHP + MySQL website
-- Import this file FIRST via phpMyAdmin (Import tab)
-- After this succeeds, import seed_data.sql to load existing data
-- =====================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- -----------------------------------------------------
-- categories  (used by Courses.vue / CourseDetail.vue badges & icons)
-- -----------------------------------------------------
DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
  code   VARCHAR(10)  NOT NULL PRIMARY KEY,
  label  VARCHAR(100) NOT NULL,
  icon   VARCHAR(100),
  color  VARCHAR(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------------------------------
-- courses (Courses.vue / CourseDetail.vue / detail.vue)
-- -----------------------------------------------------
DROP TABLE IF EXISTS courses;
CREATE TABLE courses (
  id             INT AUTO_INCREMENT PRIMARY KEY,
  course_code    VARCHAR(20)  NOT NULL UNIQUE,
  slug           VARCHAR(255) NOT NULL UNIQUE,
  title          VARCHAR(500) NOT NULL,
  english_title  VARCHAR(255),
  short_desc     TEXT,
  description    TEXT,
  category_code  VARCHAR(10),
  duration       VARCHAR(50),
  capacity       VARCHAR(50),
  price          VARCHAR(50),
  badge          VARCHAR(100),
  badge_class    VARCHAR(100),
  image          VARCHAR(255),
  created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_courses_category FOREIGN KEY (category_code) REFERENCES categories(code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS course_objectives;
CREATE TABLE course_objectives (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  course_id   INT NOT NULL,
  objective   TEXT NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_obj_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS course_target_groups;
CREATE TABLE course_target_groups (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  course_id     INT NOT NULL,
  target_group  VARCHAR(255) NOT NULL,
  sort_order    INT DEFAULT 0,
  CONSTRAINT fk_tg_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS course_topics;
CREATE TABLE course_topics (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  course_id   INT NOT NULL,
  title       VARCHAR(255) NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_topic_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS course_topic_items;
CREATE TABLE course_topic_items (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  topic_id    INT NOT NULL,
  item        TEXT NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_item_topic FOREIGN KEY (topic_id) REFERENCES course_topics(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS course_schedules;
CREATE TABLE course_schedules (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  course_id   INT NOT NULL,
  time_range  VARCHAR(100) NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_sched_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS course_schedule_activities;
CREATE TABLE course_schedule_activities (
  id           INT AUTO_INCREMENT PRIMARY KEY,
  schedule_id  INT NOT NULL,
  activity     TEXT NOT NULL,
  sort_order   INT DEFAULT 0,
  CONSTRAINT fk_act_sched FOREIGN KEY (schedule_id) REFERENCES course_schedules(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS course_training_methods;
CREATE TABLE course_training_methods (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  course_id   INT NOT NULL,
  method      TEXT NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_method_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS course_equipments;
CREATE TABLE course_equipments (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  course_id   INT NOT NULL,
  equipment   VARCHAR(255) NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_equip_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS course_notes;
CREATE TABLE course_notes (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  course_id   INT NOT NULL,
  note        TEXT NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_note_course FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------------------------------
-- news (used by news/seminar section)
-- -----------------------------------------------------
DROP TABLE IF EXISTS news;
CREATE TABLE news (
  id                INT AUTO_INCREMENT PRIMARY KEY,
  title             VARCHAR(500) NOT NULL,
  short_desc        TEXT,
  cover_image       VARCHAR(255),
  event_date_text   VARCHAR(100),
  location          VARCHAR(255),
  full_description  LONGTEXT,
  created_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS news_images;
CREATE TABLE news_images (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  news_id     INT NOT NULL,
  image_url   VARCHAR(255) NOT NULL,
  sort_order  INT DEFAULT 0,
  CONSTRAINT fk_img_news FOREIGN KEY (news_id) REFERENCES news(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS news_tags;
CREATE TABLE news_tags (
  id       INT AUTO_INCREMENT PRIMARY KEY,
  news_id  INT NOT NULL,
  tag      VARCHAR(100) NOT NULL,
  CONSTRAINT fk_tag_news FOREIGN KEY (news_id) REFERENCES news(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- -----------------------------------------------------
-- members (TestResult.vue / StatsIndex.vue - รายชื่อผู้ผ่านการสอบ)
-- -----------------------------------------------------
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
  cert_code   VARCHAR(20) NOT NULL,  -- CATII, CATIII, CATIV, BMV
  CONSTRAINT fk_cert_member FOREIGN KEY (member_id) REFERENCES members(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
