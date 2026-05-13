<template>
  <div class="detail-page">

    <!-- Not Found -->
    <div v-if="!course" class="not-found">
      <i class="fas fa-exclamation-circle"></i>
      <h2>ไม่พบหลักสูตรนี้</h2>
      <button class="btn-back" @click="router.push('/courses')">
        <i class="fas fa-arrow-left"></i> กลับไปหน้าหลักสูตร
      </button>
    </div>

    <template v-else>
      <!-- Hero -->
      <section class="detail-hero">
        <div class="morphing-bg"></div>
        <div class="hero-inner">
          <button class="btn-back-top" @click="router.push('/courses')">
            <i class="fas fa-arrow-left"></i> กลับ
          </button>
          <p class="course-code">{{ course.courseCode }}</p>
          <h1>{{ course.title }}</h1>
          <p class="english-title">{{ course.englishTitle }}</p>
          <div class="hero-meta">
            <span><i class="far fa-clock"></i> {{ course.duration }}</span>
            <span><i class="fas fa-users"></i> {{ course.capacity }}</span>
            <span class="price-tag">{{ course.price }} / คน</span>
          </div>
          <button class="btn-book-hero" @click="showBookingModal = true">
            <i class="fas fa-calendar-check"></i> จองหลักสูตรนี้
          </button>
        </div>
      </section>

      <!-- Content -->
      <div class="detail-content">

        <!-- Description -->
        <section class="detail-section">
          <h2><i class="fas fa-book-open"></i> เกี่ยวกับหลักสูตร</h2>
          <p class="description">{{ course.description }}</p>
        </section>

        <!-- Objectives + Target Groups side by side -->
        <div class="two-col">
          <section class="detail-section card">
            <h2><i class="fas fa-bullseye"></i> วัตถุประสงค์</h2>
            <ul class="check-list">
              <li v-for="obj in course.objectives" :key="obj">
                <i class="fas fa-check"></i> {{ obj }}
              </li>
            </ul>
          </section>
          <section class="detail-section card">
            <h2><i class="fas fa-user-tie"></i> กลุ่มเป้าหมาย</h2>
            <ul class="check-list">
              <li v-for="g in course.targetGroups" :key="g">
                <i class="fas fa-user"></i> {{ g }}
              </li>
            </ul>
          </section>
        </div>

        <!-- Topics -->
        <section class="detail-section">
          <h2><i class="fas fa-list-alt"></i> เนื้อหาหลักสูตร</h2>
          <div class="topics-grid">
            <div v-for="topic in course.topics" :key="topic.title" class="topic-card">
              <h3>{{ topic.title }}</h3>
              <ul>
                <li v-for="item in topic.items" :key="item">{{ item }}</li>
              </ul>
            </div>
          </div>
        </section>

        <!-- Schedule -->
        <section class="detail-section">
          <h2><i class="fas fa-calendar-alt"></i> กำหนดการ</h2>
          <div class="schedule-list">
            <div v-for="s in course.schedules" :key="s.time" class="schedule-item">
              <div class="schedule-time">{{ s.time }}</div>
              <ul class="schedule-activities">
                <li v-for="act in s.activities" :key="act">{{ act }}</li>
              </ul>
            </div>
          </div>
        </section>

        <!-- Training Method + Equipment + Notes -->
        <div class="three-col">
          <section class="detail-section card">
            <h2><i class="fas fa-chalkboard-teacher"></i> วิธีการฝึกอบรม</h2>
            <ul class="simple-list">
              <li v-for="m in course.trainingMethod" :key="m">{{ m }}</li>
            </ul>
          </section>
          <section class="detail-section card">
            <h2><i class="fas fa-tools"></i> อุปกรณ์</h2>
            <ul class="simple-list">
              <li v-for="e in course.equipments" :key="e">{{ e }}</li>
            </ul>
          </section>
          <section class="detail-section card">
            <h2><i class="fas fa-sticky-note"></i> หมายเหตุ</h2>
            <ul class="simple-list">
              <li v-for="n in course.notes" :key="n">{{ n }}</li>
            </ul>
          </section>
        </div>

        <!-- CTA -->
        <div class="cta-bar">
          <div>
            <p class="cta-price">{{ course.price }} <span>/ คน</span></p>
            <p class="cta-sub">{{ course.duration }} · {{ course.capacity }}</p>
          </div>
          <button class="btn-book-hero" @click="showBookingModal = true">
            <i class="fas fa-calendar-check"></i> จองหลักสูตรนี้
          </button>
        </div>

      </div>
    </template>

    <!-- Booking Modal -->
    <div v-if="course" class="modal-overlay" :class="{ active: showBookingModal }" @click.self="closeModal">
      <div class="modal-container">
        <button class="modal-close" @click="closeModal"><i class="fas fa-times"></i></button>
        <div class="modal-header">
          <h2><i class="fas fa-calendar-alt"></i> จองหลักสูตร</h2>
          <p class="selected-course">{{ course.title }}</p>
          <p class="selected-price">{{ course.price }} / คน</p>
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
            <input v-model="form.company" type="text" placeholder="ชื่อบริษัท/องค์กร">
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
              <option value="more">มากกว่า 5 คน</option>
            </select>
          </div>
          <div class="form-group">
            <label><i class="fas fa-comment"></i> ข้อความเพิ่มเติม</label>
            <textarea v-model="form.message" rows="3" placeholder="หมายเหตุเพิ่มเติม"></textarea>
          </div>
          <button type="submit" class="btn-submit" :disabled="submitting">
            <i :class="submitting ? 'fas fa-spinner fa-spin' : 'fas fa-paper-plane'"></i>
            {{ submitting ? 'กำลังส่งข้อมูล...' : 'ส่งข้อมูลการจอง' }}
          </button>
        </form>
      </div>
    </div>

    <!-- Success Modal -->
    <div class="modal-overlay" :class="{ active: showSuccessModal }" @click.self="showSuccessModal = false">
      <div class="modal-container success-modal">
        <div class="success-icon"><i class="fas fa-check-circle"></i></div>
        <h2>ส่งข้อมูลสำเร็จ!</h2>
        <p>ทีมงานจะติดต่อกลับภายใน 24 ชั่วโมง</p>
        <button class="btn-close-success" @click="showSuccessModal = false">ตกลง</button>
      </div>
    </div>

  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { getCourseBySlug } from '@/data/coursesdetail'

const route  = useRoute()
const router = useRouter()

const course = ref(getCourseBySlug(route.params.slug))

// ── Modal ──────────────────────────────────
const showBookingModal  = ref(false)
const showSuccessModal  = ref(false)
const submitting        = ref(false)

const form = ref({ fullName: '', phone: '', lineId: '', email: '', company: '', preferredDate: '', participants: '1', message: '' })

const minDate = (() => {
  const d = new Date(); d.setDate(d.getDate() + 3); return d.toISOString().split('T')[0]
})()

function closeModal() {
  showBookingModal.value = false
  form.value = { fullName: '', phone: '', lineId: '', email: '', company: '', preferredDate: '', participants: '1', message: '' }
}

function formatPhone(e) {
  let v = e.target.value.replace(/\D/g, '').slice(0, 10)
  if (v.length >= 6)      v = v.slice(0,3) + '-' + v.slice(3,6) + '-' + v.slice(6)
  else if (v.length >= 3) v = v.slice(0,3) + '-' + v.slice(3)
  form.value.phone = v
}

function submitBooking() {
  const phoneClean = form.value.phone.replace(/-/g, '')
  if (!/^[0-9]{9,10}$/.test(phoneClean)) { alert('กรุณากรอกเบอร์โทรศัพท์ให้ถูกต้อง'); return }
  submitting.value = true
  setTimeout(() => {
    submitting.value = false
    closeModal()
    showSuccessModal.value = true
  }, 1500)
}

function onKeydown(e) { if (e.key === 'Escape') { closeModal(); showSuccessModal.value = false } }
onMounted(() => document.addEventListener('keydown', onKeydown))
onUnmounted(() => document.removeEventListener('keydown', onKeydown))
</script>

<style>
@import "@/assets/css/courseDetail.css";
</style>