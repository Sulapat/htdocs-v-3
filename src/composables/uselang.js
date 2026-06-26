// src/composables/useLang.js
// Composable กลางสำหรับ reactive language state
// ใช้แทนการอ่าน this.$i18n.locale ตรงๆ ใน component
// ทุก component ที่ต้องการ re-fetch เมื่อเปลี่ยนภาษาให้ใช้ตัวนี้

import { ref, watch } from 'vue'
import { useI18n } from 'vue-i18n'

// Singleton state — share ข้ามทุก component ที่ call useLang()
const _lang = ref(localStorage.getItem('lang') || 'th')

export function useLang() {
  const { locale } = useI18n()

  // sync กับ vue-i18n locale ทิศทางเดียวกัน
  watch(_lang, (val) => {
    locale.value = val
    localStorage.setItem('lang', val)
    document.documentElement.setAttribute('lang', val)
    window.dispatchEvent(new CustomEvent('lang-changed', { detail: val }))
  })

  // sync ย้อนกลับเมื่อ Nav toggle (เช่น ถ้า Nav ยังใช้ this.$i18n.locale โดยตรง)
  watch(locale, (val) => {
    if (_lang.value !== val) _lang.value = val
  })

  function toggleLang() {
    _lang.value = _lang.value === 'th' ? 'en' : 'th'
  }

  function setLang(lang) {
    if (['th', 'en'].includes(lang)) _lang.value = lang
  }

  return {
    lang: _lang,     // readonly ref ใช้ใน template ได้เลย: {{ lang }}
    toggleLang,
    setLang,
  }
}   