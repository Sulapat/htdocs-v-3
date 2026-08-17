import { createI18n } from 'vue-i18n'
import th from '@/locales/th.json'
import en from '@/locales/en.json'

// อ่านภาษาที่เคยเลือกไว้จากรอบก่อน (ถ้ามี) ไม่งั้น default เป็นไทย
const savedLang = localStorage.getItem('lang')
const initialLang = savedLang === 'en' ? 'en' : 'th'

document.documentElement.setAttribute('lang', initialLang)
document.documentElement.setAttribute('data-theme', initialLang)

export default createI18n({
  legacy: false,          // ต้องเป็น false เพื่อใช้ useI18n() แบบ Composition API ได้ (Courses.vue ใช้แบบนี้)
  locale: initialLang,
  fallbackLocale: 'th',
  messages: { th, en }
})