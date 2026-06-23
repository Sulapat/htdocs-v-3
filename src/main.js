import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import i18n from './i18n'

// ลบ CSS global import ทั้งหมดออก
// ให้แต่ละ component import CSS ของตัวเองใน <style> แทน

createApp(App).use(router).use(i18n).mount('#app')