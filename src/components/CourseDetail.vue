<template>
  <!-- Hero Section -->
  <section class="courses-hero">
    <div class="morphing-bg"></div>
    <div class="morphing-bg-2"></div>
    <div class="hero-content">
      <h1><span>{{ $t('courses.hero.title') }}</span><span>{{ $t('courses.hero.titleHighlight') }}</span></h1>
      <p v-html="$t('courses.hero.subtitle')"></p>
    </div>
  </section>

  <!-- Courses Section -->
  <section class="courses-section">
    <h2 class="section-title">{{ $t('courses.section.title') }}</h2>

    <!-- Loading -->
    <div v-if="loading" class="loading-state">
      <i class="fas fa-spinner fa-spin"></i> <span>{{ $t('courses.loading') }}</span>
    </div>

    <!-- Error -->
    <div v-else-if="loadError" class="error-state">
      <i class="fas fa-exclamation-circle"></i> {{ loadError }}
    </div>

    <div v-else class="courses-layout">

      <!-- ─── Sidebar ─────────────────────────── -->
      <aside class="courses-sidebar">
        <div class="sidebar-header">
          <i class="fas fa-layer-group"></i>
          <span>{{ $t('courses.sidebar.categoryHeader') }}</span>
        </div>
        <div class="sidebar-search">
          <i class="fas fa-search"></i>
          <input
            v-model="searchQuery"
            type="text"
            :placeholder="$t('courses.sidebar.searchPlaceholder')"
            class="sidebar-search-input"
          />
          <button v-if="searchQuery" class="sidebar-search-clear" @click="searchQuery = ''">
            <i class="fas fa-times"></i>
          </button>
        </div>

        <!-- All -->
        <button
          class="sidebar-all"
          :class="{ active: selectedCategory === 'ALL' }"
          @click="selectCategory('ALL')"
        >
          <span class="sidebar-all-left">
            <i class="fas fa-th-large"></i>
            <span>{{ $t('courses.sidebar.all') }}</span>
          </span>
          <span class="cat-count">{{ _courses.length }}</span>
        </button>

        <!-- Category list -->
        <ul class="sidebar-list">
          <li
            v-for="cat in categories"
            :key="cat.code"
            class="sidebar-item"
            :class="{ active: selectedCategory === cat.code }"
            @click="selectCategory(cat.code)"
          >
            <span class="cat-icon" :style="{ background: cat.color + '18', color: cat.color }">
              <i :class="cat.icon"></i>
            </span>
            <div class="cat-info">
              <span class="cat-code">{{ cat.code }}</span>
              <!-- ✅ cat.label อาจเป็น { th, en } จาก API -->
              <span class="cat-label">{{ lf(cat.label) }}</span>
            </div>
            <span class="cat-count" :class="{ 'count-zero': getCategoryCount(cat.code) === 0 }">
              {{ getCategoryCount(cat.code) }}
            </span>
          </li>
        </ul>
      </aside>

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

          <!-- Mobile category dropdown -->
          <div class="mobile-filter">
            <select v-model="selectedCategory" class="mobile-cat-select">
              <option value="ALL">{{ $t('courses.filterBar.all') }} ({{ _courses.length }})</option>
              <option v-for="cat in categories" :key="cat.code" :value="cat.code">
                <!-- ✅ lf() สำหรับ label ที่มาจาก API -->
                {{ cat.code }} – {{ lf(cat.label) }} ({{ getCategoryCount(cat.code) }})
              </option>
            </select>
          </div>
        </div>

        <!-- Cards grid -->
        <div v-if="filteredCourses.length > 0" class="courses-grid">
          <div
            v-for="course in filteredCourses"
            :key="course.id"
            class="course-card"
            ref="cardRefs"
            @click="goToDetail(course.slug)"
          >
            <div class="course-image">
              <img :src="course.image">
              <span v-if="course.badge" class="course-badge" :class="course.badgeClass">
                <!-- ✅ badge อาจมีหลายภาษา -->
                {{ lf(course.badge) }}
              </span>
              <span
                class="course-cat-chip"
                :style="{
                  background: (course.categoryColor || '#475569') + 'cc',
                  color: '#fff'
                }"
              >
                {{ course.category }}
              </span>
            </div>
            <div class="course-content">
              <!-- ✅ title และ desc จาก API → ใช้ lf() -->
              <h3>{{ lf(course.title) }}</h3>
              <p class="course-desc">{{ lf(course.desc) }}</p>
              <div class="course-details">
                <span><i class="far fa-clock"></i> {{ lf(course.duration) }}</span>
                <span><i class="far fa-user"></i> {{ lf(course.capacity) }}</span>
              </div>
              <div class="course-price">
                <span class="price">{{ course.price }}</span>
                <span class="per-person">{{ $t('courses.card.perPerson') }}</span>
              </div>
              <div class="card-actions">
                <!-- ✅ ส่ง title ที่แปลแล้วเข้า modal -->
                <button class="btn-book" @click.stop="openBookingModal(lf(course.title), course.price)">
                  <i class="fas fa-calendar-check"></i> <span>{{ $t('courses.card.bookButton') }}</span>
                </button>
              </div>
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
  </section>

  <!-- Why Choose Us Section -->
  <section class="why-us-section">
    <h2 class="section-title">{{ $t('courses.whyUs.sectionTitle') }}</h2>
    <div class="why-us-grid">
      <div v-for="item in whyUs" :key="item.titleKey" class="why-us-card" ref="whyCardRefs">
        <div class="why-us-icon">
          <i :class="item.icon"></i>
        </div>
        <h3>{{ $t(item.titleKey) }}</h3>
        <p style="text-wrap: balance;">{{ $t(item.descKey) }}</p>
      </div>
    </div>
  </section>

  <!-- Booking Modal -->
  <div class="modal-overlay" :class="{ active: showBookingModal }" @click.self="closeBookingModal">
    <div class="modal-container">
      <button class="modal-close" @click="closeBookingModal">
        <i class="fas fa-times"></i>
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
import { ref, computed, onMounted, onUnmounted, nextTick } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { getCourses, getCategories } from '@/services/api.js'
import emailjs from '@emailjs/browser'
// ✅ import composable
import { useLocaleField } from '@/composables/useLocaleField'

const { t } = useI18n()
// ✅ ดึง lf และ lfArray
const { lf, lfArray } = useLocaleField()

const router = useRouter()

// ── API state ─────────────────────────────
const loading    = ref(true)
const loadError  = ref(null)

// ── Raw data from API ─────────────────────
const coursesRaw     = ref([])
const categoryConfig = ref({})

// ── Load data on mount ────────────────────
onMounted(async () => {
  try {
    const [coursesData, categoriesData] = await Promise.all([
      getCourses(),
      getCategories()
    ])
    coursesRaw.value = coursesData
    categoryConfig.value = Object.fromEntries(
      categoriesData.map(c => [c.code, c])
    )
  } catch (e) {
    loadError.value = t('courses.alerts.loadError') + e.message
  } finally {
    loading.value = false
    await nextTick()
    initCardAnimations()
  }
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

const selectedCategory = ref(sessionStorage.getItem('coursesCategory') || 'ALL')

function selectCategory(code) {
  selectedCategory.value = code
  sessionStorage.setItem('coursesCategory', code)
}

function getCategoryCount(code) {
  return _courses.value.filter(c => c.category === code).length
}

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

// ── Why Us (ใช้ i18n key ปกติ ไม่ต้องใช้ lf) ──
const whyUs = [
  { icon: 'fas fa-award',               titleKey: 'courses.whyUs.item1.title', descKey: 'courses.whyUs.item1.desc' },
  { icon: 'fas fa-chalkboard-teacher',  titleKey: 'courses.whyUs.item2.title', descKey: 'courses.whyUs.item2.desc' },
  { icon: 'fas fa-tools',               titleKey: 'courses.whyUs.item3.title', descKey: 'courses.whyUs.item3.desc' },
  { icon: 'fas fa-headset',             titleKey: 'courses.whyUs.item4.title', descKey: 'courses.whyUs.item4.desc' },
]

// ── Modal state ───────────────────────────
const showBookingModal = ref(false)
const showSuccessModal = ref(false)
const selectedCourse   = ref('')
const selectedPrice    = ref('')
const submitting       = ref(false)
const form = ref({ fullName: '', phone: '', email: '' })

// ── Navigation ────────────────────────────
function goToDetail(slug) {
  router.push({ path: '/courses/' + slug })
}

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
const cardRefs    = ref([])
const whyCardRefs = ref([])

function initCardAnimations() {
  const allCards = [...(cardRefs.value || []), ...(whyCardRefs.value || [])]
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
@import "@/assets/css/courses.css";
</style>