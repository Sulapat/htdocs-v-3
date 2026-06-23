// src/composables/useLocaleField.js
import { useI18n } from 'vue-i18n'

export function useLocaleField() {
  const { locale } = useI18n()   // locale เป็น Ref<string> reactive อยู่แล้ว

  function lf(field) {
    if (!field) return ''
    if (typeof field === 'string') return field
    return field[locale.value] ?? field['th'] ?? field['en'] ?? ''
  }

  function lfArray(field) {
    if (!field) return []
    if (Array.isArray(field)) return field
    return field[locale.value] ?? field['th'] ?? field['en'] ?? []
  }

  return { lf, lfArray }
}