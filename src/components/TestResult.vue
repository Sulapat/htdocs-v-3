<template>
  <div class="tr-page">

    <!-- Hero Section -->
    <section class="hero">
      <div class="badge">
        <svg class="badge-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M18 21a8 8 0 0 0-16 0" />
          <circle cx="10" cy="8" r="5" />
          <path d="M22 20c0-3.37-2-6.5-4-8a5 5 0 0 0-.45-8.3" />
        </svg>
        <span>Patineer Training Center</span>
      </div>

      <h1 class="title">VI Certified<span class="highlight"> Analysts</span></h1>

      <p class="subtitle">
        กรอกรหัสผู้สอบ หรือชื่อ-นามสกุล เพื่อตรวจ VI Certified Analysts หลักสูตรด้าน<br />
        เทคโนโลยีการบำรุงรักษา
      </p>

      <form class="search-form" @submit.prevent="handleSearch">
        <!-- Custom Dropdown -->
        <div class="custom-dropdown" ref="dropdownRef">
          <button
            type="button"
            class="dropdown-trigger"
            :class="{ open: dropdownOpen }"
            @click="toggleDropdown"
            :aria-expanded="dropdownOpen"
            aria-haspopup="listbox"
          >
            <span>{{ courseOptions.find(c => c.value === selectedCourse)?.label }}</span>
            <svg class="dropdown-chevron" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <polyline points="6 9 12 15 18 9"/>
            </svg>
          </button>

          <!-- Teleport menu to body to escape any overflow:hidden parent -->
          <Teleport to="body">
            <div
              v-if="dropdownOpen"
              class="dropdown-menu-teleport"
              :style="menuStyle"
              role="listbox"
            >
              <div
                v-for="course in courseOptions"
                :key="course.value"
                class="dropdown-item"
                :class="{ selected: selectedCourse === course.value }"
                role="option"
                @click="onSelectCourse(course.value)"
              >
                <span class="dropdown-dot" :class="dotClass(course.value)"></span>
                {{ course.label }}
                <svg v-if="selectedCourse === course.value" class="dropdown-check" xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                  <polyline points="20 6 9 17 4 12"/>
                </svg>
              </div>
            </div>
          </Teleport>
        </div>
        <div class="search-input-wrapper">
          <svg class="search-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <circle cx="11" cy="11" r="8" />
            <path d="m21 21-4.3-4.3" />
          </svg>
          <input v-model="searchQuery" type="text" class="search-input"
            placeholder="ID, First Name, Last Name, Company หรือ Email" />
        </div>
        <button type="submit" class="search-button">ค้นหา</button>
      </form>
    </section>

    <!-- Results Section -->
    <section class="results-section">

      <!-- Empty course — no certified analysts yet -->
      <div v-if="isEmpty && activeData.length === 0" class="no-results">
        <svg class="no-results-icon" xmlns="http://www.w3.org/2000/svg" width="64" height="64"
          viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
          <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
          <circle cx="9" cy="7" r="4"/>
          <line x1="23" y1="11" x2="17" y2="11"/>
        </svg>
        <h3>ไม่มีข้อมูลผู้ที่เรียนคอร์สนี้</h3>
        <p>ยังไม่มีผู้ผ่านการรับรองในหลักสูตรนี้</p>
      </div>

      <!-- All Results (before search) -->
      <div v-else-if="isEmpty" class="results-container">
        <div class="results-grid">
          <div v-for="(result, index) in pagedData" :key="result.ID" class="result-card" :style="{ borderColor: cardBorderColor(index, pagedData.length) }">
            <div class="result-header">
              <div class="result-name">{{ result['First Name'] }} {{ result['Last Name'] }}</div>
            </div>
            <div class="result-details">
              <div class="result-detail-item">
                <span class="result-detail-label">Candidate ID</span>
                <span class="result-detail-value">{{ result.ID }}</span>
              </div>
              <div class="result-detail-item">
                <span class="result-detail-label">Company</span>
                <span class="result-detail-value">{{ result.Company }}</span>
              </div>
              <div class="result-detail-item">
                <span class="result-detail-label">Email</span>
                <span class="result-detail-value">{{ result.Mail }}</span>
              </div>
            </div>
            <div class="result-level-row">
              <span v-for="tag in parseLevelTags(result.Level)" :key="tag.code" class="result-course-tag" :class="tag.class">
                {{ tag.code }}
              </span>
            </div>
          </div>
        </div>
        <div class="pagination">
          <button class="page-btn" :disabled="currentPage === 1" @click="currentPage--">← ก่อนหน้า</button>
          <span class="page-info">{{ currentPage }} / {{ totalPages }}</span>
          <button class="page-btn" :disabled="currentPage === totalPages" @click="currentPage++">ถัดไป →</button>
        </div>
      </div>

      <!-- Error -->
      <div v-if="error" class="no-results">
        <p style="color:#dc2626">{{ error }}</p>
      </div>

      <!-- Loading -->
      <div v-else-if="loading" class="loading-state">
        <div class="spinner"></div>
        <p>กำลังค้นหา...</p>
      </div>

      <!-- No Results -->
      <div v-else-if="!isEmpty && results.length === 0" class="no-results">
        <svg class="no-results-icon" xmlns="http://www.w3.org/2000/svg" width="64" height="64"
          viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
          <circle cx="11" cy="11" r="8" /><path d="m21 21-4.3-4.3" />
          <line x1="8" y1="11" x2="14" y2="11" />
        </svg>
        <h3>ไม่พบผลการค้นหา</h3>
        <p>ไม่พบข้อมูลสำหรับ "{{ submittedQuery }}" กรุณาลองค้นหาด้วยคำค้นอื่น</p>
      </div>

      <!-- Search Results -->
      <div v-else-if="!isEmpty" class="results-container">
        <div class="results-grid">
          <div v-for="(result, index) in pagedSearchData" :key="result.ID" class="result-card" :style="{ borderColor: cardBorderColor(index, pagedSearchData.length) }">
            <div class="result-header">
              <div class="result-name">{{ result['First Name'] }} {{ result['Last Name'] }}</div>
            </div>
            <div class="result-details">
              <div class="result-detail-item">
                <span class="result-detail-label">Candidate ID</span>
                <span class="result-detail-value">{{ result.ID }}</span>
              </div>
              <div class="result-detail-item">
                <span class="result-detail-label">Company</span>
                <span class="result-detail-value">{{ result.Company }}</span>
              </div>
              <div class="result-detail-item">
                <span class="result-detail-label">Email</span>
                <span class="result-detail-value">{{ result.Mail }}</span>
              </div>
            </div>
            <div class="result-level-row">
              <span v-for="tag in parseLevelTags(result.Level)" :key="tag.code" class="result-course-tag" :class="tag.class">
                {{ tag.code }}
              </span>
            </div>
          </div>
        </div>
        <div class="pagination">
          <button class="page-btn" :disabled="searchPage === 1" @click="searchPage--">← ก่อนหน้า</button>
          <span class="page-info">{{ searchPage }} / {{ totalSearchPages }}</span>
          <button class="page-btn" :disabled="searchPage === totalSearchPages" @click="searchPage++">ถัดไป →</button>
        </div>
      </div>

    </section>
  </div>
</template>

<script setup>
import { ref, watch, computed, nextTick, onMounted, onUnmounted } from 'vue'
import { useRoute } from 'vue-router'
// ✅ เปลี่ยนมาใช้ getDataByFilter แทน dataByFilter (static object)
import { sampleData, getDataByFilter } from '@/data/sampleData.js'

const route = useRoute()
const dropdownRef  = ref(null)
const dropdownOpen = ref(false)
const menuStyle    = ref({})

// คำนวณความสูง navbar เพื่อไม่ให้ dropdown ทับ
const getNavbarHeight = () => {
  const navbar = document.querySelector('nav, header, .navbar, .nav-bar, [class*="navbar"], [class*="nav-bar"]')
  return navbar ? navbar.getBoundingClientRect().bottom : 0
}

const calcMenuStyle = (rect) => {
  const navbarBottom = getNavbarHeight()
  const top = Math.max(rect.bottom, navbarBottom)
  return {
    position: 'fixed',
    top:      `${top}px`,
    left:     `${rect.left}px`,
    width:    `${rect.width}px`,
    zIndex:   9999,
    // clip ไม่ให้ขึ้นเกิน navbar
    maxHeight: `calc(100vh - ${top}px - 8px)`,
    overflowY: 'auto',
  }
}

const toggleDropdown = async () => {
  dropdownOpen.value = !dropdownOpen.value
  if (dropdownOpen.value) {
    await nextTick()
    const rect = dropdownRef.value?.getBoundingClientRect()
    if (rect) menuStyle.value = calcMenuStyle(rect)
  }
}

const closeDropdown = () => { dropdownOpen.value = false }

// อัปเดต position ของ menu ให้ตาม trigger เมื่อ scroll
const updateMenuPosition = () => {
  if (!dropdownOpen.value) return
  const rect = dropdownRef.value?.getBoundingClientRect()
  if (rect) menuStyle.value = calcMenuStyle(rect)
}

// ปิดเมื่อคลิกนอก
const handleGlobalClick = (e) => {
  if (dropdownRef.value && !dropdownRef.value.contains(e.target)) {
    const menu = document.querySelector('.dropdown-menu-teleport')
    if (!menu || !menu.contains(e.target)) closeDropdown()
  }
}

onMounted(() => {
  document.addEventListener('click', handleGlobalClick)
  window.addEventListener('scroll', updateMenuPosition, true)
  const courseParam = route.query.course
  if (courseParam && ['BMV', 'C2VA', 'C3VA', 'C4VA'].includes(courseParam)) {
    selectedCourse.value = courseParam
  }
})
onUnmounted(() => {
  document.removeEventListener('click', handleGlobalClick)
  window.removeEventListener('scroll', updateMenuPosition, true)
})

// sync เมื่อ navigate ระหว่าง /result?course=xxx โดยไม่ reload
watch(() => route.query.course, (val) => {
  const newCourse = val && ['BMV', 'C2VA', 'C3VA', 'C4VA'].includes(val) ? val : 'ALL'
  selectCourse(newCourse)
})

const searchQuery = ref('')
const submittedQuery = ref('')
const results     = ref([])
const loading     = ref(false)
const error       = ref('')
const isEmpty     = ref(true)
const currentPage = ref(1)
const searchPage  = ref(1)
const perPage     = 10

const dotClass = (val) => ({
  'dot-all': val === 'ALL',
  'dot-bmv': val === 'BMV',
  'dot-va2': val === 'C2VA',
  'dot-va3': val === 'C3VA',
  'dot-va4': val === 'C4VA',
})

const courseOptions = [
  { value: 'ALL',  label: 'ทั้งหมด' },
  { value: 'BMV',  label: 'Basic Machinery Vibration' },
  { value: 'C2VA', label: 'Category II Vibration Analyst' },
  { value: 'C3VA', label: 'Category III Vibration Analyst' },
  { value: 'C4VA', label: 'Category IV Vibration Analyst' },
]

const selectedCourse = ref('ALL')

// ✅ computed เรียก getDataByFilter(key) ทุกครั้ง → reactive ถูกต้อง
const activeData = computed(() => getDataByFilter(selectedCourse.value))

const totalPages = computed(() => Math.max(1, Math.ceil(activeData.value.length / perPage)))
const pagedData  = computed(() => {
  const start = (currentPage.value - 1) * perPage
  return activeData.value.slice(start, start + perPage)
})

const onSelectCourse = (val) => {
  dropdownOpen.value = false
  selectCourse(val)
}

const selectCourse = (val) => {
  selectedCourse.value = val
  currentPage.value = 1
  searchPage.value = 1

  const q = searchQuery.value.toLowerCase().trim()
  if (!q) {
    results.value = []
    isEmpty.value = true
    return
  }

  // re-run search ใน course ใหม่โดยไม่ล้าง query
  isEmpty.value = false
  loading.value = true
  setTimeout(() => {
    results.value = activeData.value.filter(item =>
      String(item.ID).includes(q) ||
      item['First Name'].toLowerCase().includes(q) ||
      item['Last Name'].toLowerCase().includes(q) ||
      `${item['First Name']} ${item['Last Name']}`.toLowerCase().includes(q) ||
      item.Company.toLowerCase().includes(q) ||
      item.Mail.toLowerCase().includes(q)
    )
    loading.value = false
  }, 300)
}

const totalSearchPages = computed(() => Math.max(1, Math.ceil(results.value.length / perPage)))
const pagedSearchData  = computed(() => {
  const start = (searchPage.value - 1) * perPage
  return results.value.slice(start, start + perPage)
})

// ✅ แก้ลำดับ: เช็ค CATIV → CATIII → CATII (ป้องกัน substring overlap)
const parseLevelTags = (level = '') => {
  const tags = []
  if (level.includes('CATIV') || level.includes('CAT IV'))
    tags.push({ code: 'VA-IV', label: 'Category IV Vibration Analyst', class: 'tag-va4' })
  if (level.includes('CATIII') || level.includes('CAT III'))
    tags.push({ code: 'VA-III', label: 'Category III Vibration Analyst', class: 'tag-va3' })
  if (/CATII(?![IV])/.test(level) || level.includes('CAT II'))
    tags.push({ code: 'VA-II', label: 'Category II Vibration Analyst', class: 'tag-va2' })
  if (level.includes('BMV'))
    tags.push({ code: 'BMV', label: 'Basic Machinery Vibration', class: 'tag-bmv' })
  return tags.length ? tags : [{ code: level, label: level, class: 'tag-default' }]
}

const cardBorderColor = (index, total) => {
  const dark  = [107, 114, 128]  // #6b7280
  const light = [229, 231, 235]  // #e5e7eb
  const t = total <= 1 ? 0 : index / (total - 1)
  const r = Math.round(dark[0] + (light[0] - dark[0]) * t)
  const g = Math.round(dark[1] + (light[1] - dark[1]) * t)
  const b = Math.round(dark[2] + (light[2] - dark[2]) * t)
  return `rgb(${r},${g},${b})`
}

const handleSearch = () => {
  const q = searchQuery.value.toLowerCase().trim()
  if (!q) { isEmpty.value = true; results.value = []; submittedQuery.value = ''; return }

  submittedQuery.value = searchQuery.value.trim()
  isEmpty.value = false
  loading.value = true
  searchPage.value = 1
  setTimeout(() => {
    results.value = activeData.value.filter(item =>
      String(item.ID).includes(q) ||
      item['First Name'].toLowerCase().includes(q) ||
      item['Last Name'].toLowerCase().includes(q) ||
      `${item['First Name']} ${item['Last Name']}`.toLowerCase().includes(q) ||
      item.Company.toLowerCase().includes(q) ||
      item.Mail.toLowerCase().includes(q)
    )
    loading.value = false
  }, 300)
}

watch(searchQuery, (val) => {
  if (!val.trim()) { isEmpty.value = true; results.value = []; submittedQuery.value = '' }
})
</script>

<style>
@import "@/assets/css/styles.css";
</style>