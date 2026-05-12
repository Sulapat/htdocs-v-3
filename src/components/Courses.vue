<template>
  <!-- Hero Section -->
  <section class="courses-hero">
    <div class="morphing-bg"></div>
    <div class="morphing-bg-2"></div>
    <div class="hero-content">
      <h1>หลักสูตร<span>อบรม</span></h1>
      <p>พัฒนาทักษะและความรู้ด้านการบำรุงรักษาเครื่องจักรอุตสาหกรรม<br>ด้วยหลักสูตรที่ออกแบบโดยผู้เชี่ยวชาญ</p>
    </div>
  </section>

  <!-- Courses Section -->
  <section class="courses-section">
    <h2 class="section-title">หลักสูตรที่เปิดสอน</h2>

    <div class="courses-layout">

      <!-- ─── Sidebar ─────────────────────────── -->
      <aside class="courses-sidebar">
        <div class="sidebar-header">
          <i class="fas fa-layer-group"></i>
          <span>หมวดหมู่หลักสูตร</span>
        </div>
        <div class="sidebar-search">
          <i class="fas fa-search"></i>
          <input
            v-model="searchQuery"
            type="text"
            placeholder="ค้นหาหลักสูตร..."
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
            ทั้งหมด
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
              <span class="cat-label">{{ cat.label }}</span>
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
            แสดง <strong>{{ filteredCourses.length }}</strong> หลักสูตร
            <template v-if="selectedCategory !== 'ALL'">
              ในหมวด
              <span class="filter-cat-chip" :style="{ background: activeCategoryColor + '18', color: activeCategoryColor }">
                {{ activeCategoryLabel }}
              </span>
            </template>
          </span>

          <!-- Mobile category dropdown -->
          <div class="mobile-filter">
            <select v-model="selectedCategory" class="mobile-cat-select">
              <option value="ALL">ทั้งหมด ({{ _courses.length }})</option>
              <option v-for="cat in categories" :key="cat.code" :value="cat.code">
                {{ cat.code }} – {{ cat.label }} ({{ getCategoryCount(cat.code) }})
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
                {{ course.badge }}
              </span>
              <!-- Category chip on card -->
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
              <h3>{{ course.title }}</h3>
              <p class="course-desc">{{ course.desc }}</p>
              <div class="course-details">
                <span><i class="far fa-clock"></i> {{ course.duration }}</span>
                <span><i class="far fa-user"></i> {{ course.capacity }}</span>
              </div>
              <div class="course-price">
                <span class="price">{{ course.price }}</span>
                <span class="per-person">/ คน</span>
              </div>
              <div class="card-actions">
                <button class="btn-book" @click.stop="openBookingModal(course.title, course.price)">
                  <i class="fas fa-calendar-check"></i> จองหลักสูตร
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- Empty state -->
        <div v-else class="no-courses">
          <div class="no-courses-icon"><i class="fas fa-folder-open"></i></div>
          <p>ยังไม่มีหลักสูตรในหมวดหมู่นี้</p>
          <button class="btn-show-all" @click="selectCategory('ALL')">ดูหลักสูตรทั้งหมด</button>
        </div>

      </div><!-- /courses-main -->
    </div><!-- /courses-layout -->
  </section>

  <!-- Why Choose Us Section -->
  <section class="why-us-section">
    <h2 class="section-title">ทำไมต้องเรียนกับเรา</h2>
    <div class="why-us-grid">
      <div v-for="item in whyUs" :key="item.title" class="why-us-card" ref="whyCardRefs">
        <div class="why-us-icon">
          <i :class="item.icon"></i>
        </div>
        <h3>{{ item.title }}</h3>
        <p>{{ item.desc }}</p>
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
        <h2><i class="fas fa-calendar-alt"></i> จองหลักสูตร</h2>
        <p class="selected-course">หลักสูตร: {{ selectedCourse }}</p>
        <p class="selected-price">ราคา: {{ selectedPrice }} / คน</p>
      </div>
      <form class="booking-form" @submit.prevent="submitBooking">
        <div class="form-group">
          <label><i class="fas fa-user"></i> ชื่อ-นามสกุล <span class="required">*</span></label>
          <input v-model="form.fullName" type="text" placeholder="กรอกชื่อ-นามสกุล" required>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label><i class="fas fa-phone"></i> เบอร์โทรศัพท์ <span class="required">*</span></label>
            <input v-model="form.phone" type="tel" placeholder="0XX-XXX-XXXX" @input="formatPhone" required>
          </div>
          <div class="form-group">
            <label><i class="fab fa-line"></i> LINE ID <span class="required">*</span></label>
            <input v-model="form.lineId" type="text" placeholder="กรอก LINE ID" required>
          </div>
        </div>
        <div class="form-group">
          <label><i class="fas fa-envelope"></i> อีเมล</label>
          <input v-model="form.email" type="email" placeholder="example@email.com">
        </div>
        <div class="form-group">
          <label><i class="fas fa-building"></i> บริษัท/องค์กร</label>
          <input v-model="form.company" type="text" placeholder="ชื่อบริษัท/องค์กร (ถ้ามี)">
        </div>
        <div class="form-group">
          <label><i class="fas fa-calendar"></i> วันที่ต้องการเข้าเรียน <span class="required">*</span></label>
          <input v-model="form.preferredDate" type="date" :min="minDate" required>
        </div>
        <div class="form-group">
          <label><i class="fas fa-users"></i> จำนวนผู้เข้าอบรม</label>
          <select v-model="form.participants">
            <option value="1">1 คน</option>
            <option value="2">2 คน</option>
            <option value="3">3 คน</option>
            <option value="4">4 คน</option>
            <option value="5">5 คน</option>
            <option value="more">มากกว่า 5 คน (ติดต่อสอบถาม)</option>
          </select>
        </div>
        <div class="form-group">
          <label><i class="fas fa-comment"></i> ข้อความเพิ่มเติม</label>
          <textarea v-model="form.message" rows="3" placeholder="หมายเหตุหรือคำถามเพิ่มเติม"></textarea>
        </div>
        <button type="submit" class="btn-submit" :disabled="submitting">
          <i :class="submitting ? 'fas fa-spinner fa-spin' : 'fas fa-paper-plane'"></i>
          {{ submitting ? 'กำลังส่งข้อมูล...' : 'ส่งข้อมูลการจอง' }}
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
      <h2>ส่งข้อมูลสำเร็จ!</h2>
      <p>ขอบคุณสำหรับการจองหลักสูตร<br>ทีมงานจะติดต่อกลับภายใน 24 ชั่วโมง</p>
      <button class="btn-close-success" @click="closeSuccessModal">ตกลง</button>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { useRouter } from 'vue-router'
import { courses } from '@/data/coursesdetail'
import { categoryConfig } from '@/data/categoryConfig'

// ── Router ───────────────────────────────
const router = useRouter()

// ── Courses data ──────────────────────────
const _courses = courses

// ── Category definitions ──────────────────

const categories = Object.entries(categoryConfig).map(([code, cfg]) => ({
  code,
  ...cfg
}))

const searchQuery = ref('')

// ── Sidebar filter state ──────────────────
const selectedCategory = ref('ALL')

function selectCategory(code) {
  selectedCategory.value = code
}

function getCategoryCount(code) {
  return _courses.filter(c => c.category === code).length
}

const filteredCourses = computed(() => {
  let list = selectedCategory.value === 'ALL'
    ? _courses
    : _courses.filter(c => c.category === selectedCategory.value)

  if (searchQuery.value.trim()) {
    const q = searchQuery.value.trim().toLowerCase()
    list = list.filter(c =>
      c.title.toLowerCase().includes(q) ||
      c.desc?.toLowerCase().includes(q) ||
      c.category?.toLowerCase().includes(q)
    )
  }
  return list
})

const activeCategoryLabel = computed(() => {
  if (selectedCategory.value === 'ALL') return 'ทั้งหมด'
  const cat = categories.find(c => c.code === selectedCategory.value)
  return cat ? `${cat.code} – ${cat.label}` : selectedCategory.value
})

const activeCategoryColor = computed(() => {
  const cat = categories.find(c => c.code === selectedCategory.value)
  return cat ? cat.color : '#6366f1'
})

// ── Why Us ────────────────────────────────
const whyUs = [
  { icon: 'fas fa-award',               title: 'ได้รับการรับรอง',      desc: 'ใบรับรองที่ได้รับการยอมรับในระดับสากล' },
  { icon: 'fas fa-chalkboard-teacher',  title: 'ผู้เชี่ยวชาญสอน',      desc: 'วิทยากรมีประสบการณ์มากกว่า 10 ปี' },
  { icon: 'fas fa-tools',               title: 'เรียนรู้จริง',          desc: 'ฝึกปฏิบัติกับเครื่องมือจริงในห้องปฏิบัติการ' },
  { icon: 'fas fa-headset',             title: 'ติดตามผลหลังอบรม',      desc: 'ให้คำปรึกษาและช่วยเหลือหลังจบหลักสูตร' },
]

// ── Modal state ───────────────────────────
const showBookingModal = ref(false)
const showSuccessModal = ref(false)
const selectedCourse   = ref('')
const selectedPrice    = ref('')
const submitting       = ref(false)

const form = ref({
  fullName: '', phone: '', lineId: '',
  email: '', company: '', preferredDate: '',
  participants: '1', message: ''
})

// ── Min date (3 days from today) ──────────
const minDate = (() => {
  const d = new Date()
  d.setDate(d.getDate() + 3)
  return d.toISOString().split('T')[0]
})()

// ── Navigation ───────────────────────────
function goToDetail(slug) {
  router.push('/courses/' + slug)
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
  form.value = { fullName: '', phone: '', lineId: '', email: '', company: '', preferredDate: '', participants: '1', message: '' }
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
function submitBooking() {
  const phoneClean = form.value.phone.replace(/-/g, '')
  if (!/^[0-9]{9,10}$/.test(phoneClean)) {
    alert('กรุณากรอกเบอร์โทรศัพท์ให้ถูกต้อง')
    return
  }
  submitting.value = true
  setTimeout(() => {
    submitting.value = false
    closeBookingModal()
    showSuccessModal.value = true
    document.body.style.overflow = 'hidden'
  }, 1500)
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
  initCardAnimations()
})

onUnmounted(() => {
  document.removeEventListener('keydown', onKeydown)
  document.body.style.overflow = ''
})
</script>

<style>
@import "@/assets/css/courses.css";
</style>