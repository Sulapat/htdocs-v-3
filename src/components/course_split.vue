<template>
  <!-- Hero Section -->
  <section class="courses-hero">
    <div class="hero-content">
      <h1><span>{{ $t('courses.hero.title') }}</span><span>{{ $t('courses.hero.titleHighlight') }}</span></h1>
      <p v-html="$t('courses.hero.subtitle')"></p>
    </div>
  </section>

  <!-- Courses Section -->
  <section class="courses-section">

    <!-- Loading (ครั้งแรกเท่านั้น — ยังไม่มีข้อมูลเลย) -->
    <div v-if="loading" class="loading-state">
      <i class="fas fa-spinner fa-spin"></i> <span>{{ $t('courses.loading') }}</span>
    </div>

    <!-- Error -->
    <div v-else-if="loadError" class="error-state">
      <i class="fas fa-exclamation-circle"></i> {{ loadError }}
    </div>

    <template v-else>

      <!-- แถบบอกสถานะตอนสลับภาษา: ไม่ถอดเนื้อหาเดิม แค่ dim + แถบบาง ๆ ด้านบน -->
      <div class="cd-lang-switch-bar" :class="{ active: switchingLang }"></div>

      <div class="courses-layout" :class="{ 'cd-content-dimmed': switchingLang }">

      <!-- ─── Main content ────────────────────── -->
      <div class="courses-main">

        <!-- Filter bar -->
        <div class="filter-bar">
          <span class="filter-result">
            <span>{{ $t('courses.filterBar.showing') }}</span> <strong>{{ filteredCourses.length }}</strong> <span>{{ $t('courses.filterBar.coursesUnit') }}</span>
            <template v-if="selectedCategory !== 'ALL'">
              <span>{{ $t('courses.filterBar.inCategory') }}</span>
              <span class="filter-cat-chip" :style="{ background: activeCategoryColor + '18', color: activeCategoryColor }">
                {{ activeCategoryLabel }}
              </span>
            </template>
          </span>

          <!-- ค้นหา (ย้ายมาจาก sidebar เดิม) -->
          <div class="filter-search">
            <i class="fas fa-search"></i>
            <input
              v-model="searchQuery"
              type="text"
              :placeholder="$t('courses.sidebar.searchPlaceholder')"
              class="filter-search-input"
            />
            <button v-if="searchQuery" class="filter-search-clear" @click="searchQuery = ''">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>

        <!-- Cards grid -->
        <div v-if="filteredCourses.length > 0" class="courses-grid" ref="coursesGridRef">
          <div
            v-for="course in filteredCourses"
            :key="course.id"
            class="course-card"
            ref="cardRefs"
          >
            <div class="course-image">
              <img :src="course.image">
            </div>
            <div class="course-content">
              <!-- ✅ title และ desc จาก API → ใช้ lf() -->
              <h3>{{ lf(course.title) }}</h3>
              <p class="course-desc">{{ lf(course.desc) }}</p>
            </div>
            <div class="card-actions">
              <!-- ✅ ส่ง title ที่แปลแล้วเข้า modal -->
              <button class="btn-book" @click="openBookingModal(lf(course.title), course.price)">
                <i class="fas fa-calendar-check"></i> <span>{{ $t('courses.card.bookButton') }}</span>
              </button>
            </div>
          </div>
        </div>

        <!-- Empty state -->
        <div v-else class="no-courses">
          <div class="no-courses-icon"><i class="fas fa-folder-open"></i></div>
          <p>{{ $t('courses.emptyState.message') }}</p>
          <button class="btn-show-all" @click="selectCategory('ALL')">{{ $t('courses.emptyState.showAllButton') }}</button>
        </div>

      </div><!-- /courses-main -->
      </div><!-- /courses-layout -->

    </template>
  </section>

  <!-- Booking Modal -->
  <div class="modal-overlay" :class="{ active: showBookingModal }" @click.self="closeBookingModal">
    <div class="modal-container">
      <button class="modal-close" @click="closeBookingModal" aria-label="Close">
        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round">
          <line x1="4" y1="4" x2="20" y2="20"></line>
          <line x1="20" y1="4" x2="4" y2="20"></line>
        </svg>
      </button>
      <div class="modal-header">
        <h2><i class="fas fa-calendar-alt"></i> <span>{{ $t('courses.modal.bookingTitle') }}</span></h2>
        <p class="selected-course"><span>{{ $t('courses.modal.courseLabel') }}</span> {{ selectedCourse }}</p>
        <p class="selected-price"><span>{{ $t('courses.modal.priceLabel') }}</span> {{ selectedPrice }} <span>{{ $t('courses.modal.perPerson') }}</span></p>
      </div>
      <form class="booking-form" @submit.prevent="submitBooking">
        <div class="form-group">
          <label><i class="fas fa-user"></i> <span>{{ $t('courses.modal.fullNameLabel') }}</span> <span class="required">*</span></label>
          <input v-model="form.fullName" type="text" :placeholder="$t('courses.modal.fullNamePlaceholder')" required>
        </div>
        <div class="form-group">
          <label><i class="fas fa-phone"></i> <span>{{ $t('courses.modal.phoneLabel') }}</span> <span class="required">*</span></label>
          <input v-model="form.phone" type="tel" placeholder="0XX-XXX-XXXX" @input="formatPhone" required>
        </div>
        <div class="form-group">
          <label><i class="fas fa-envelope"></i> <span>{{ $t('courses.modal.emailLabel') }}</span> <span class="required">*</span></label>
          <input v-model="form.email" type="email" placeholder="example@email.com" required>
        </div>
        <p v-if="errorMsg" class="error-msg"><i class="fas fa-exclamation-circle"></i> {{ errorMsg }}</p>
        <button type="submit" class="btn-submit" :disabled="submitting">
          <i :class="submitting ? 'fas fa-spinner fa-spin' : 'fas fa-paper-plane'"></i>
          {{ submitting ? $t('courses.modal.submittingButton') : $t('courses.modal.submitButton') }}
        </button>
      </form>
    </div>
  </div>

  <!-- Success Modal -->
  <div class="modal-overlay" :class="{ active: showSuccessModal }" @click.self="closeSuccessModal">
    <div class="modal-container success-modal">
      <div class="success-icon">
        <i class="fas fa-check-circle"></i>
      </div>
      <h2>{{ $t('courses.successModal.title') }}</h2>
      <p v-html="$t('courses.successModal.message')"></p>
      <button class="btn-close-success" @click="closeSuccessModal">{{ $t('courses.successModal.closeButton') }}</button>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, watch, onMounted, onUnmounted, nextTick } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { getCourses, getCategories } from '@/services/api.js'
import emailjs from '@emailjs/browser'
// ✅ import composable
import { useLocaleField } from '@/composables/useLocaleField'

const { t, locale } = useI18n()
// ✅ ดึง lf และ lfArray
const { lf, lfArray } = useLocaleField()

const router = useRouter()
const route  = useRoute()

// ── API state ─────────────────────────────
const loading       = ref(true)   // โหลดครั้งแรก (ยังไม่มีข้อมูลเลย) → โชว์ full loading state ได้
const switchingLang  = ref(false) // โหลดเพราะสลับภาษา (มีข้อมูลเดิมอยู่แล้ว) → ไม่ถอดเนื้อหาเดิม กันกระพริบ
const loadError      = ref(null)

// ── Raw data from API ─────────────────────
const coursesRaw     = ref([])
const categoryConfig = ref({})

// ✅ แคชข้อมูลไว้ใน sessionStorage (แนวเดียวกับ coursesScrollY ที่มีอยู่แล้ว)
// เหตุผล: Courses.vue เป็น route component พอออกไปดู course detail แล้วกดกลับมา
// Vue Router จะ "สร้าง component ใหม่" ทุกครั้ง (unmount/remount) ทำให้ coursesRaw กลับไปเป็น []
// และ loading กลับไปเป็น true เหมือนเข้าเว็บครั้งแรก → เห็นหน้า loading กระพริบ + fetch API ซ้ำ
// ทั้งที่จริงมีข้อมูลอยู่แล้วเมื่อครู่นี้เอง ถ้ามี cache ที่ตรงภาษาปัจจุบัน ใช้ก่อนได้เลยไม่ต้องรอ fetch
const COURSES_CACHE_KEY = 'coursesDataCache'

function readCoursesCache() {
  try {
    const raw = sessionStorage.getItem(COURSES_CACHE_KEY)
    if (!raw) return null
    const parsed = JSON.parse(raw)
    if (parsed.locale !== locale.value) return null // สลับภาษาไปแล้ว cache เดิมใช้ไม่ได้ ต้อง fetch ใหม่
    return parsed
  } catch {
    return null
  }
}

function writeCoursesCache() {
  try {
    sessionStorage.setItem(COURSES_CACHE_KEY, JSON.stringify({
      locale: locale.value,
      courses: coursesRaw.value,
      categories: categoryConfig.value
    }))
  } catch {
    // เผื่อ sessionStorage เต็ม/ถูกปิด (private mode) — ไม่ให้พังทั้งหน้าเพราะแคชไม่สำคัญขนาดนั้น
  }
}

// ── Load data (รับ lang ปัจจุบันจาก locale) ──
async function loadData() {
  // ถ้ามีข้อมูลเดิมอยู่แล้ว (กรณีสลับภาษา) ใช้ flag เบา ๆ
  // ไม่แตะ loading ตัวหลัก เพื่อไม่ให้ v-if="loading" เอาเนื้อหาเดิมออกจากจอ
  const hasData = coursesRaw.value.length > 0
  if (hasData) {
    switchingLang.value = true
  } else {
    loading.value = true
  }
  loadError.value = null
  try {
    const [coursesData, categoriesData] = await Promise.all([
      getCourses(null, locale.value),
      getCategories(locale.value)
    ])
    coursesRaw.value = coursesData
    categoryConfig.value = Object.fromEntries(
      categoriesData.map(c => [c.code, c])
    )
    writeCoursesCache()
  } catch (e) {
    loadError.value = t('courses.alerts.loadError') + e.message
  } finally {
    const wasFirstLoad = loading.value
    loading.value       = false
    switchingLang.value = false
    // ✅ รัน scroll-reveal animation (fade+slide) เฉพาะตอนโหลดครั้งแรกเท่านั้น
    // ถ้ารันซ้ำตอนสลับภาษา การ์ดจะถูกเซต opacity:0 แล้ว fade-in ใหม่ → ดูเหมือนกระพริบอีกแบบ
    if (wasFirstLoad) {
      await nextTick()
      initCardAnimations()
    }
  }
}

onMounted(async () => {
  // ✅ ถ้ามีข้อมูลแคชของภาษาปัจจุบันอยู่แล้ว (มาจากรอบก่อนในเซสชันนี้) ให้ใช้ก่อนเลย
  // วิธีนี้ทำให้ loadData() ด้านล่างเห็นว่า "มีข้อมูลเดิมอยู่แล้ว" (hasData = true)
  // จึงเดินเข้าทาง switchingLang (dim เบา ๆ) แทนทาง loading (จอโหลดเต็ม/กระพริบขาว)
  // และ wasFirstLoad จะกลายเป็น false ไปด้วย ทำให้ initCardAnimations() ไม่เล่นซ้ำ
  const cached = readCoursesCache()
  if (cached) {
    coursesRaw.value     = cached.courses
    categoryConfig.value = cached.categories
    loading.value        = false
  }

  await loadData()
})

// ✅ เมื่อสลับภาษา (locale ของ vue-i18n เปลี่ยน) ให้ fetch ข้อมูลคอร์ส/หมวดหมู่ใหม่ตามภาษานั้น
// (ไม่ต้องพึ่ง custom event 'lang-changed' จาก nav.vue เพราะ locale เป็น reactive ref อยู่แล้ว)
watch(locale, () => {
  loadData()
})

// ── Course images (Vite glob) ──────────────
const courseImages = import.meta.glob('@/assets/images/courses/*.png', { eager: true })

function getCourseImage(c) {
  const mod = courseImages[`/src/assets/images/courses/${c.courseCode}.png`]
  if (mod) return mod.default
  return new URL('@/assets/images/data/imagestate.png', import.meta.url).href
}

// ── Computed courses (with image + categoryColor) ──
const _courses = computed(() =>
  coursesRaw.value.map(c => ({
    ...c,
    image: getCourseImage(c),
    categoryColor: categoryConfig.value[c.category]?.color ?? '#475569'
  }))
)

// ── Category list (derived from API data) ──
const categories = computed(() =>
  Object.entries(categoryConfig.value).map(([code, cfg]) => ({ code, ...cfg }))
)

// ── Search & filter ───────────────────────
const searchQuery = ref('')

// ✅ selectedCategory ผูกกับ route.query.category โดยตรง (แทน sessionStorage เดิม)
// เหตุผล: อยาก "1 URL ต่อ 1 หมวดหมู่" เช่น /course-split?category=mnt
// การอ่าน/เขียนผ่าน query ทำให้ URL เป็น source of truth เดียว รีเฟรช/แชร์ลิงก์ได้ตรงหมวด
const selectedCategory = computed({
  get() {
    const q = (route.query.category || '').toString().toUpperCase()
    return q || 'ALL'
  },
  set(code) {
    selectCategory(code)
  }
})

// ── กันไม่ให้เห็น footer เวลาสลับหมวดหมู่แล้วเนื้อหาสั้นลง ──
// เปลี่ยนหมวดผ่าน URL query (router.push) โดย component ไม่ remount ตำแหน่ง scroll เดิมจึงถูกคงไว้ (ไม่เด้งกลับขึ้นบนสุด)
// แต่ละหมวดหมู่มีจำนวนคอร์สไม่เท่ากัน ถ้าหมวดใหม่สั้นกว่าตำแหน่ง scroll เดิม ผู้ใช้จะเห็น
// footer แทนเนื้อหาที่เพิ่งเปลี่ยน ฟังก์ชันนี้เลื่อนจอขึ้นแค่พอให้ขอบล่างของเนื้อหาชุดใหม่
// ชนขอบล่างจอพอดี (ไม่เด้งกลับขึ้นบนสุด)
const coursesGridRef = ref(null)
const adjustScrollToNewContentBottom = async () => {
  await nextTick()
  requestAnimationFrame(() => {
    const el = coursesGridRef.value
    if (!el) return
    const rect = el.getBoundingClientRect()
    // ปรับเฉพาะตอนที่ผู้ใช้เลื่อนลงมาเลยจุดเริ่มต้นของเนื้อหาไปแล้ว (rect.top < 0)
    // และเนื้อหาชุดใหม่จบเหนือขอบล่างจอ (เห็นพื้นที่ว่าง/footer แทนที่)
    if (rect.top < 0 && rect.bottom < window.innerHeight) {
      const delta = window.innerHeight - rect.bottom
      window.scrollTo({ top: window.scrollY - delta, behavior: 'smooth' })
    }
  })
}

// ✅ selectCategory เปลี่ยน URL query แทนการเซ็ต ref ตรงๆ
// code === 'ALL' → ลบ query.category ออก (กลับไปเป็น path ปัจจุบันเฉยๆ ไม่มี query)
// ใช้ route.path (ไม่ hardcode '/') เพื่อให้ component นี้ mount ที่ path ไหนก็ได้โดยไม่พัง
function selectCategory(code) {
  const query = { ...route.query }
  if (code === 'ALL') {
    delete query.category
  } else {
    query.category = code.toLowerCase()
  }
  router.push({ path: route.path, query })
}

// ปรับ scroll ทุกครั้งที่ query.category เปลี่ยน (มาจาก tab, mobile dropdown, ปุ่ม back/forward ก็ได้)
watch(() => route.query.category, () => {
  adjustScrollToNewContentBottom()
})

const filteredCourses = computed(() => {
  let list = selectedCategory.value === 'ALL'
    ? _courses.value
    : _courses.value.filter(c => c.category === selectedCategory.value)

  if (searchQuery.value.trim()) {
    const q = searchQuery.value.trim().toLowerCase()
    list = list.filter(c =>
      // ✅ ค้นหาจาก lf() เพื่อให้ search ตรงกับภาษาที่แสดง
      lf(c.title).toLowerCase().includes(q) ||
      lf(c.desc)?.toLowerCase().includes(q) ||
      c.category?.toLowerCase().includes(q)
    )
  }
  return list
})

const activeCategoryLabel = computed(() => {
  if (selectedCategory.value === 'ALL') return t('courses.filterBar.all')
  const cat = categories.value.find(c => c.code === selectedCategory.value)
  // ✅ lf() สำหรับ label ของ category
  return cat ? `${cat.code} – ${lf(cat.label)}` : selectedCategory.value
})

const activeCategoryColor = computed(() => {
  const cat = categories.value.find(c => c.code === selectedCategory.value)
  return cat ? cat.color : '#6366f1'
})

// ── Modal state ───────────────────────────
const showBookingModal = ref(false)
const showSuccessModal = ref(false)
const selectedCourse   = ref('')
const selectedPrice    = ref('')
const submitting       = ref(false)
const form = ref({ fullName: '', phone: '', email: '' })

// ── Modal functions ───────────────────────
function openBookingModal(name, price) {
  selectedCourse.value   = name
  selectedPrice.value    = price
  showBookingModal.value = true
  document.body.style.overflow = 'hidden'
}

function closeBookingModal() {
  showBookingModal.value = false
  document.body.style.overflow = ''
  form.value = { fullName: '', phone: '', email: '' }
}

function closeSuccessModal() {
  showSuccessModal.value = false
  document.body.style.overflow = ''
}

// ── Phone formatter ───────────────────────
function formatPhone(e) {
  let v = e.target.value.replace(/\D/g, '').slice(0, 10)
  if (v.length >= 6)      v = v.slice(0,3) + '-' + v.slice(3,6) + '-' + v.slice(6)
  else if (v.length >= 3) v = v.slice(0,3) + '-' + v.slice(3)
  form.value.phone = v
}

// ── Form submit ───────────────────────────
const errorMsg = ref('')

async function submitBooking() {
  const phoneClean = form.value.phone.replace(/-/g, '')
  if (!/^[0-9]{9,10}$/.test(phoneClean)) {
    alert(t('courses.alerts.invalidPhone'))
    return
  }

  submitting.value = true
  errorMsg.value   = ''

  const templateParams = {
    fullName: form.value.fullName,
    phone:    form.value.phone,
    email:    form.value.email,
    course:   selectedCourse.value,
    price:    selectedPrice.value
  }

  try {
    await emailjs.send(
      'service_r1g3hlq',
      'template_yihwf5c',
      templateParams,
      'jFrquSpMoGPiPa_t-'
    )
    closeBookingModal()
    showSuccessModal.value = true
    document.body.style.overflow = 'hidden'
  } catch (error) {
    console.error('EmailJS error:', error)
    errorMsg.value = t('courses.alerts.submitError')
  } finally {
    submitting.value = false
  }
}

// ── Escape key ────────────────────────────
function onKeydown(e) {
  if (e.key === 'Escape') { closeBookingModal(); closeSuccessModal() }
}

// ── Card scroll animation ─────────────────
const cardRefs = ref([])

function initCardAnimations() {
  const allCards = [...(cardRefs.value || [])]
  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry, i) => {
      if (entry.isIntersecting) {
        setTimeout(() => {
          entry.target.style.opacity   = '1'
          entry.target.style.transform = 'translateY(0)'
        }, i * 100)
        observer.unobserve(entry.target)
      }
    })
  }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' })

  allCards.forEach(card => {
    if (card) {
      card.style.opacity    = '0'
      card.style.transform  = 'translateY(30px)'
      card.style.transition = 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)'
      observer.observe(card)
    }
  })
}

onMounted(() => {
  document.addEventListener('keydown', onKeydown)
})

onUnmounted(() => {
  document.removeEventListener('keydown', onKeydown)
  document.body.style.overflow = ''
})
</script>

<style>
@import "@/assets/css/course_split-shared.css";
</style>

<style scoped>
@import "@/assets/css/course_split.css";
</style>