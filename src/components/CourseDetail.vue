<template>
  <div class="detail-page">

    <!-- Loading -->
    <div v-if="loading" class="not-found">
      <i class="fas fa-spinner fa-spin"></i>
    </div>

    <!-- Not Found -->
    <div v-else-if="!course" class="not-found">
      <i class="fas fa-exclamation-circle"></i>
      <h2>{{ $t('courseDetail.notFound.title') }}</h2>
      <button class="btn-back" @click="router.push('/courses')">
        <i class="fas fa-arrow-left"></i> {{ $t('courseDetail.notFound.backButton') }}
      </button>
    </div>

    <template v-else>

      <!-- ── HERO ── -->
      <section class="cd-hero">
        <div class="cd-hero-inner">
          <button class="cd-back" @click="router.push('/courses')">
            <i class="fas fa-arrow-left"></i> {{ $t('courseDetail.hero.back') }}
          </button>
          <div class="cd-hero-body">
            <div class="cd-hero-left">
              <span class="cd-code">{{ course.courseCode }}</span>
              <h1 class="cd-title">{{ course.title }}</h1>
              <p class="cd-en">{{ course.englishTitle }}</p>
              <div class="cd-meta">
                <span><i class="far fa-clock"></i> {{ course.duration }}</span>
                <span><i class="fas fa-users"></i> {{ course.capacity }}</span>
              </div>
            </div>
            <div class="cd-hero-right">
              <div class="cd-price-box">
                <p class="cd-price-label">{{ $t('courseDetail.hero.priceLabel') }}</p>
                <p class="cd-price-value" :class="{ 'cd-price-inquiry': !hasPrice }">
                  {{ hasPrice ? course.price : $t('courseDetail.hero.priceInquiry') }}
                </p>
                <p v-if="hasPrice" class="cd-price-note">{{ $t('courseDetail.hero.vatNote') }}</p>
              </div>
              <button class="cd-btn-primary" @click="showBookingModal = true">
                <i class="fas fa-calendar-check"></i>
                {{ hasPrice ? $t('courseDetail.hero.bookButton') : $t('courseDetail.hero.quoteButton') }}
              </button>
            </div>
          </div>
        </div>
      </section>

      <!-- ── TAB NAV ── -->
      <nav class="cd-tabs">
        <div class="cd-tabs-inner">
          <button
            v-for="tab in tabs" :key="tab.id"
            class="cd-tab"
            :class="{ active: activeTab === tab.id }"
            @click="activeTab = tab.id"
          >{{ tab.label }}</button>
        </div>
      </nav>

      <!-- ── CONTENT ── -->
      <div class="cd-content">
        <div class="cd-main">

          <!-- TAB: รายละเอียด -->
          <template v-if="activeTab === 'detail'">
            <section class="cd-section">
              <h2 class="cd-section-title">{{ $t('courseDetail.detailTab.aboutTitle') }}</h2>
              <p class="cd-prose">{{ course.description }}</p>
            </section>
            <section class="cd-section">
              <h2 class="cd-section-title">{{ $t('courseDetail.detailTab.objectivesTitle') }}</h2>
              <ul class="cd-checklist">
                <li v-for="obj in course.objectives" :key="obj">
                  <i class="fas fa-check"></i><span>{{ obj }}</span>
                </li>
              </ul>
            </section>
            <section class="cd-section">
              <h2 class="cd-section-title">{{ $t('courseDetail.detailTab.targetGroupsTitle') }}</h2>
              <div class="cd-target-grid">
                <span v-for="g in course.targetGroups" :key="g" class="cd-target-pill">
                  <i class="fas fa-user"></i> {{ g }}
                </span>
              </div>
            </section>
          </template>

          <!-- TAB: เนื้อหา -->
          <template v-if="activeTab === 'topics'">
            <section class="cd-section">
              <h2 class="cd-section-title">{{ $t('courseDetail.topicsTab.title') }}</h2>
              <div
                v-for="(topic, idx) in course.topics"
                :key="topic.title"
                class="cd-topic-block"
              >
                <div class="cd-topic-header">
                  <span class="cd-topic-num">{{ String(idx + 1).padStart(2, '0') }}</span>
                  <h3 class="cd-topic-title">{{ topic.title }}</h3>
                </div>
                <ul class="cd-topic-list">
                  <li v-for="item in topic.items" :key="item">{{ item }}</li>
                </ul>
              </div>
            </section>
          </template>

          <!-- TAB: กำหนดการ -->
          <template v-if="activeTab === 'schedule'">
            <section class="cd-section">
              <h2 class="cd-section-title">{{ $t('courseDetail.scheduleTab.title') }}</h2>
              <div class="cd-timeline">
                <div
                  v-for="s in course.schedules"
                  :key="s.time"
                  class="cd-timeline-row"
                >
                  <div class="cd-tl-time">{{ s.time }}</div>
                  <div class="cd-tl-dot"></div>
                  <ul class="cd-tl-acts">
                    <li v-for="act in s.activities" :key="act">{{ act }}</li>
                  </ul>
                </div>
              </div>
            </section>
          </template>

          <!-- TAB: ผู้สอน -->
          <template v-if="activeTab === 'instructor'">
            <section class="cd-section">
              <h2 class="cd-section-title">{{ $t('courseDetail.instructorTab.title') }}</h2>
              <template v-if="course.instructor">
                <div class="cd-instructor-card">
                  <div class="cd-instructor-avatar">
                    <img v-if="course.instructor.photo" :src="course.instructor.photo" :alt="course.instructor.name">
                    <i v-else class="fas fa-user-tie"></i>
                  </div>
                  <div class="cd-instructor-info">
                    <p class="cd-instructor-name">{{ course.instructor.name }}</p>
                    <p class="cd-instructor-title">{{ course.instructor.title }}</p>
                    <p class="cd-instructor-bio">{{ course.instructor.bio }}</p>
                  </div>
                </div>
              </template>
              <div v-else class="cd-empty-state">
                <i class="fas fa-user-clock"></i>
                <p>{{ $t('courseDetail.instructorTab.pendingTitle') }}</p>
                <span>{{ $t('courseDetail.instructorTab.pendingSubtitle') }}</span>
              </div>
            </section>
          </template>

          <!-- TAB: อื่นๆ -->
          <template v-if="activeTab === 'other'">
            <section class="cd-section">
              <h2 class="cd-section-title">{{ $t('courseDetail.otherTab.methodTitle') }}</h2>
              <ul class="cd-simple-list">
                <li v-for="m in course.trainingMethod" :key="m">{{ m }}</li>
              </ul>
            </section>
            <section class="cd-section">
              <h2 class="cd-section-title">{{ $t('courseDetail.otherTab.equipmentTitle') }}</h2>
              <ul class="cd-simple-list">
                <li v-for="e in course.equipments" :key="e">{{ e }}</li>
              </ul>
            </section>
            <section class="cd-section">
              <h2 class="cd-section-title">{{ $t('courseDetail.otherTab.notesTitle') }}</h2>
              <ul class="cd-simple-list cd-note-list">
                <li v-for="n in course.notes" :key="n">{{ n }}</li>
              </ul>
            </section>
          </template>

        </div>

        <!-- ── SIDEBAR ── -->
        <aside class="cd-sidebar">

          <div class="cd-sidebar-card">
            <p class="cd-sb-price-label">{{ $t('courseDetail.sidebar.priceLabel') }}</p>
            <p class="cd-sb-price" :class="{ 'cd-price-inquiry': !hasPrice }">
              {{ hasPrice ? course.price : $t('courseDetail.hero.priceInquiry') }}
            </p>
            <p v-if="hasPrice" class="cd-sb-vat">{{ $t('courseDetail.sidebar.vatNote') }}</p>
            <button class="cd-btn-primary cd-btn-full" @click="showBookingModal = true">
              <i class="fas fa-calendar-check"></i>
              {{ hasPrice ? $t('courseDetail.hero.bookButton') : $t('courseDetail.hero.quoteButton') }}
            </button>
          </div>

          <div class="cd-sidebar-info">
            <div class="cd-info-row">
              <i class="far fa-clock"></i>
              <div>
                <p class="cd-info-label">{{ $t('courseDetail.sidebar.durationLabel') }}</p>
                <p class="cd-info-val">{{ course.duration }}</p>
              </div>
            </div>
            <div class="cd-info-row">
              <i class="fas fa-users"></i>
              <div>
                <p class="cd-info-label">{{ $t('courseDetail.sidebar.capacityLabel') }}</p>
                <p class="cd-info-val">{{ course.capacity }}</p>
              </div>
            </div>
            <div class="cd-info-row">
              <i class="fas fa-chalkboard-teacher"></i>
              <div>
                <p class="cd-info-label">{{ $t('courseDetail.sidebar.instructorLabel') }}</p>
                <p class="cd-info-val" v-if="course.instructor">{{ course.instructor.name }}</p>
                <p class="cd-info-val cd-info-pending" v-else>{{ $t('courseDetail.sidebar.instructorPending') }}</p>
              </div>
            </div>
            <div class="cd-info-row">
              <i class="fas fa-tools"></i>
              <div>
                <p class="cd-info-label">{{ $t('courseDetail.sidebar.equipmentLabel') }}</p>
                <p class="cd-info-val">{{ course.equipments?.join(', ') || '–' }}</p>
              </div>
            </div>
          </div>

        </aside>
      </div>

    </template>

    <!-- ── BOOKING MODAL ── -->
    <div v-if="course" class="modal-overlay" :class="{ active: showBookingModal }" @click.self="closeModal">
      <div class="modal-container">
        <button class="modal-close" @click="closeModal"><i class="fas fa-times"></i></button>
        <div class="modal-header">
          <h2>
            <i class="fas fa-calendar-alt"></i>
            {{ hasPrice ? $t('courseDetail.modal.bookingTitle') : $t('courseDetail.modal.quoteTitle') }}
          </h2>
          <p class="selected-course">{{ course.title }}</p>
          <p class="selected-price">
            {{ hasPrice ? course.price + ' ' + $t('courseDetail.modal.priceUnit') : $t('courseDetail.modal.priceInquiry') }}
          </p>
        </div>
        <form class="booking-form" @submit.prevent="submitBooking">
          <div class="form-group">
            <label><i class="fas fa-user"></i> {{ $t('courseDetail.modal.fullNameLabel') }} <span class="required">*</span></label>
            <input v-model="form.fullName" type="text" :placeholder="$t('courseDetail.modal.fullNamePlaceholder')" required>
          </div>
          <div class="form-group">
            <label><i class="fas fa-phone"></i> {{ $t('courseDetail.modal.phoneLabel') }} <span class="required">*</span></label>
            <input v-model="form.phone" type="tel" placeholder="0XX-XXX-XXXX" @input="formatPhone" required>
          </div>
          <div class="form-group">
            <label><i class="fas fa-envelope"></i> {{ $t('courseDetail.modal.emailLabel') }} <span class="required">*</span></label>
            <input v-model="form.email" type="email" placeholder="example@email.com" required>
          </div>
          <p v-if="errorMsg" class="booking-error">
            <i class="fas fa-exclamation-circle"></i> {{ errorMsg }}
          </p>
          <button type="submit" class="btn-submit" :disabled="submitting">
            <i :class="submitting ? 'fas fa-spinner fa-spin' : 'fas fa-paper-plane'"></i>
            {{ submitting ? $t('courseDetail.modal.submittingButton') : $t('courseDetail.modal.submitButton') }}
          </button>
        </form>
      </div>
    </div>

    <!-- ── SUCCESS MODAL ── -->
    <div class="modal-overlay" :class="{ active: showSuccessModal }" @click.self="showSuccessModal = false">
      <div class="modal-container success-modal">
        <div class="success-icon"><i class="fas fa-check-circle"></i></div>
        <h2>{{ $t('courseDetail.successModal.title') }}</h2>
        <p>{{ $t('courseDetail.successModal.message') }}</p>
        <button class="btn-close-success" @click="showSuccessModal = false">{{ $t('courseDetail.successModal.closeButton') }}</button>
      </div>
    </div>

  </div>
</template>

<script setup>
import { ref, computed, watch, onMounted, onUnmounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { getCourseBySlug } from '@/services/api.js'   // ← เปลี่ยนมาใช้ api.js เหมือน Courses.vue

const route  = useRoute()
const router = useRouter()
const { t, locale } = useI18n()

// ── Loading & data state ──────────────────────────────────
const loading = ref(true)
const course  = ref(null)

// ── โหลด course ตาม slug + locale ปัจจุบัน ───────────────
async function loadCourse() {
  loading.value = true
  course.value  = await getCourseBySlug(route.params.slug, locale.value)
  loading.value = false
}

onMounted(loadCourse)

// ── เมื่อสลับภาษา → fetch ใหม่ทันที (เหมือน Courses.vue) ──
watch(locale, loadCourse)

// ── ตรวจสอบราคา ──────────────────────────────────────────
const hasPrice = computed(() => {
  const p = course.value?.price
  return p && p !== 'N/A' && p !== '' && p !== '-'
})

// ── Tabs — computed เพื่อให้ label เปลี่ยนตาม locale ────
const tabs = computed(() => [
  { id: 'detail',     label: t('courseDetail.tabs.detail') },
  { id: 'topics',     label: t('courseDetail.tabs.topics') },
  { id: 'schedule',   label: t('courseDetail.tabs.schedule') },
  { id: 'instructor', label: t('courseDetail.tabs.instructor') },
  { id: 'other',      label: t('courseDetail.tabs.other') },
])
const activeTab = ref('detail')

// ── Modal ─────────────────────────────────────────────────
const showBookingModal = ref(false)
const showSuccessModal = ref(false)
const submitting       = ref(false)
const errorMsg         = ref('')
const form = ref({ fullName: '', phone: '', email: '' })

const API_URL = 'https://patineer.co.th/api/booking.php'

function closeModal() {
  showBookingModal.value = false
  errorMsg.value = ''
  form.value = { fullName: '', phone: '', email: '' }
}

function formatPhone(e) {
  let v = e.target.value.replace(/\D/g, '').slice(0, 10)
  if (v.length >= 6)      v = v.slice(0,3) + '-' + v.slice(3,6) + '-' + v.slice(6)
  else if (v.length >= 3) v = v.slice(0,3) + '-' + v.slice(3)
  form.value.phone = v
}

async function submitBooking() {
  const phoneClean = form.value.phone.replace(/-/g, '')
  if (!/^[0-9]{9,10}$/.test(phoneClean)) {
    alert(t('courseDetail.alerts.invalidPhone'))
    return
  }
  submitting.value = true
  errorMsg.value   = ''
  try {
    const res = await fetch(API_URL, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        fullName: form.value.fullName,
        phone:    form.value.phone,
        email:    form.value.email,
        course:   course.value.title,
        price:    hasPrice.value ? course.value.price : t('courseDetail.hero.priceInquiry')
      })
    })
    const data = await res.json()
    if (data.success) {
      closeModal()
      showSuccessModal.value = true
    } else {
      errorMsg.value = data.message || t('courseDetail.alerts.submitError')
    }
  } catch {
    errorMsg.value = t('courseDetail.alerts.submitError')
  } finally {
    submitting.value = false
  }
}

function onKeydown(e) {
  if (e.key === 'Escape') { closeModal(); showSuccessModal.value = false }
}
onMounted(() => document.addEventListener('keydown', onKeydown))
onUnmounted(() => document.removeEventListener('keydown', onKeydown))
</script>

<style>
@import "@/assets/css/courseDetail.css";
</style>