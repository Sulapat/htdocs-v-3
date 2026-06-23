import { createI18n } from 'vue-i18n'
import th from '@/locales/th.json'
import en from '@/locales/en.json'

// อ่านภาษาที่ผู้ใช้เลือกไว้ก่อนหน้า (ถ้ามี) ไม่งั้น default เป็นไทย
const savedLang = localStorage.getItem('lang') || 'th'

const i18n = createI18n({
  legacy: false,        // ใช้ Composition API mode (จำเป็นสำหรับ <script setup>)
  locale: savedLang,    // ภาษาเริ่มต้น
  fallbackLocale: 'th', // ถ้าไม่มีคำแปล ให้ fallback กลับมาไทย
  messages: { th, en }
})

export default i18n