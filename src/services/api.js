// src/services/api.js
// Service กลางสำหรับเรียก backend PHP
// ใช้ api_i18n.php เป็น endpoint เดียวสำหรับทุก action ที่ frontend ใช้
//
// ────────────────────────────────────────────────────────────
// DB structure: ตารางหลัก (TH) + ตาราง _en คู่กันทุกตัว
//   courses  ←→  courses_en
//   news     ←→  news_en   ฯลฯ
//
// Logic ฝั่ง PHP:
//   lang=th → อ่านตารางหลักตรงๆ
//   lang=en → LEFT JOIN _en แล้ว COALESCE(en_col, th_col)
//             ถ้า row _en ยังไม่มี → fallback เป็น TH อัตโนมัติ
//
// Frontend ไม่ต้อง handle fallback เอง — ทำไว้ฝั่ง PHP แล้ว
// ────────────────────────────────────────────────────────────

// ปรับ BASE_URL ตาม deploy จริง
// - same-domain: '/backend/api'
// - cross-domain: 'https://api.patineer.co.th'
//const BASE_URL = '/backend/api'
const BASE_URL = 'http://localhost/backend/api'
const I18N = `${BASE_URL}/api_i18n.php`

// ────── internal helpers ──────────────────────────────────

/**
 * คืนค่าจำนวนสมาชิกแยกตาม cert_code
 * @returns {Promise<{CATII:number, CATIII:number, CATIV:number, BMV:number}|null>}
 */
export function getMemberStats() {
  return fetchJSON(i18nURL('members_stats', 'th'))
}

async function fetchJSON(url) {
  try {
    const res = await fetch(url)
    if (!res.ok) throw new Error(`HTTP ${res.status}`)
    const text = await res.text()
    console.log('[api] raw response:', text.slice(0, 200)) // ← เพิ่มบรรทัดนี้
    if (!text.startsWith('{') && !text.startsWith('[')) {
      throw new Error('Response is not JSON')
    }
    return JSON.parse(text)
  } catch (err) {
    console.warn(`[api] fetch failed: ${url}`, err.message)
    return null
  }
}

/**
 * i18nURL — สร้าง URL ไปยัง api_i18n.php พร้อม action + lang + params เพิ่มเติม
 * @param {string} action
 * @param {string} lang   'th' | 'en'
 * @param {Record<string,string>} [extra]
 * @returns {string}
 */
function i18nURL(action, lang = 'th', extra = {}) {
  const p = new URLSearchParams({ action, lang, ...extra })
  return `${I18N}?${p}`
}

// ────── Categories ────────────────────────────────────────
// DB: categories (th) + categories_en
// action=categories → [{ code, icon, color, label }]

/**
 * @param {'th'|'en'} lang
 * @returns {Promise<Array<{code:string, icon:string, color:string, label:string}>|null>}
 */
export function getCategories(lang = 'th') {
  return fetchJSON(i18nURL('categories', lang))
}

// ────── Courses ───────────────────────────────────────────
// DB: courses (th) + courses_en, course_objectives + _en, course_topics + _en, ...
// action=courses → list (card view)
// action=course  → single detail (slug required)

/**
 * @param {string|null} category  category_code เช่น 'MNT' (null = ทั้งหมด)
 * @param {'th'|'en'} lang
 */
export function getCourses(category = null, lang = 'th') {
  const extra = category ? { category } : {}
  return fetchJSON(i18nURL('courses', lang, extra))
}

/**
 * @param {string} slug
 * @param {'th'|'en'} lang
 */
export function getCourseBySlug(slug, lang = 'th') {
  return fetchJSON(i18nURL('course', lang, { slug }))
}

// ────── News ──────────────────────────────────────────────
// DB: news (th) + news_en, news_tags + news_tags_en, news_images (ไม่มี _en — รูปใช้ร่วมกัน)
// action=news        → list
// action=news_detail → single (id required)

/**
 * @param {'th'|'en'} lang
 */
export function getNewsList(lang = 'th') {
  return fetchJSON(i18nURL('news', lang))
}

/**
 * @param {number|string} id
 * @param {'th'|'en'} lang
 */
export function getNewsById(id, lang = 'th') {
  return fetchJSON(i18nURL('news_detail', lang, { id: String(id) }))
}

// ────── Articles ──────────────────────────────────────────
// DB: articles (th) + articles_en, article_sections + _en, article_tags + _en
// action=articles → list (card view)
// action=article  → single detail (slug required)

/**
 * @param {'th'|'en'} lang
 * @returns {Promise<Array<{id, slug, tag, title, desc, date, views, image}>|null>}
 */
export function getArticles(lang = 'th') {
  return fetchJSON(i18nURL('articles', lang))
}

/**
 * @param {string} slug
 * @param {'th'|'en'} lang
 * @returns {Promise<{id, slug, tag, title, desc, date, views, author, lead, summary, sections, tags, pdfUrl, pdfLabel}|null>}
 */
export function getArticleBySlug(slug, lang = 'th') {
  return fetchJSON(i18nURL('article', lang, { slug }))
}

// ────── Members ───────────────────────────────────────────
// DB: members, member_certifications (ไม่มี _en — ข้อมูลคนไม่ผันตามภาษา)
// action=members       → search (q, cert ไม่บังคับ)
// action=members_stats → { CATII:N, CATIII:N, CATIV:N, BMV:N }
//
// หมายเหตุ: lang ไม่มีผลต่อ members เพราะ PHP ไม่ JOIN _en
// แต่ส่งไปเพื่อ consistency ของ URL pattern

/**
 * @param {string} [q]    ค้นหาชื่อ/อีเมล/member_no
 * @param {string} [cert] กรอง cert_code เช่น 'CATII'
 */
export function getMembers({ q = '', cert = '' } = {}) {
  const extra = {}
  if (q)    extra.q    = q
  if (cert) extra.cert = cert
  // lang ไม่มีผล แต่ใส่ th ไปเพื่อ consistent
  return fetchJSON(i18nURL('members', 'th', extra))
}