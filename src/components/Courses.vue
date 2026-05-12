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
    <div class="courses-grid">
      <div
        v-for="course in courses"
        :key="course.id"
        class="course-card"
        ref="cardRefs"
      >
        <div class="course-image">
          <img :src="course.image" :alt="course.title">
          <span v-if="course.badge" class="course-badge" :class="course.badgeClass">
            {{ course.badge }}
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
          <button class="btn-book" @click="openBookingModal(course.title, course.price)">
            <i class="fas fa-calendar-check"></i> จองหลักสูตร
          </button>
        </div>
      </div>
    </div>
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
import { ref, onMounted, onUnmounted } from 'vue'

// ── Data ─────────────────────────────────
const courses = [
  {
    id: 'vi-analysis',
    title: 'Vibration Analysis (VA)',
    desc: 'หลักสูตรการวิเคราะห์การสั่นสะเทือนเพื่อการบำรุงรักษาเชิงพยากรณ์',
    duration: '3 วัน', capacity: '15 คน/รุ่น', price: '฿12,000',
    image: 'images/course-vi.jpg', badge: 'ยอดนิยม', badgeClass: ''
  },
  {
    id: 'thermography',
    title: 'Infrared Thermography',
    desc: 'หลักสูตรการตรวจสอบด้วยกล้องถ่ายภาพความร้อนสำหรับงานบำรุงรักษา',
    duration: '2 วัน', capacity: '20 คน/รุ่น', price: '฿9,000',
    image: 'images/course-thermo.jpg', badge: null
  },
  {
    id: 'oil-analysis',
    title: 'Oil Analysis',
    desc: 'หลักสูตรการวิเคราะห์น้ำมันหล่อลื่นเพื่อการบำรุงรักษาเครื่องจักร',
    duration: '2 วัน', capacity: '15 คน/รุ่น', price: '฿8,500',
    image: 'images/course-oil.jpg', badge: null
  },
  {
    id: 'ultrasound',
    title: 'Ultrasound Testing',
    desc: 'หลักสูตรการตรวจสอบด้วยคลื่นเสียงความถี่สูงสำหรับการตรวจจับการรั่วและข้อบกพร่อง',
    duration: '2 วัน', capacity: '12 คน/รุ่น', price: '฿10,000',
    image: 'images/course-ultrasound.jpg', badge: 'ใหม่', badgeClass: 'new'
  },
  {
    id: 'alignment',
    title: 'Laser Alignment',
    desc: 'หลักสูตรการตั้งศูนย์เครื่องจักรด้วยเลเซอร์เพื่อลดการสั่นสะเทือนและเพิ่มอายุการใช้งาน',
    duration: '1 วัน', capacity: '10 คน/รุ่น', price: '฿6,000',
    image: 'images/course-alignment.jpg', badge: null
  },
  {
    id: 'balancing',
    title: 'Dynamic Balancing',
    desc: 'หลักสูตรการปรับสมดุลเครื่องจักรแบบไดนามิกเพื่อลดการสึกหรอและเพิ่มประสิทธิภาพ',
    duration: '1 วัน', capacity: '10 คน/รุ่น', price: '฿6,500',
    image: 'images/course-balancing.jpg', badge: null
  },
]

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

// ── Modal functions ───────────────────────
function openBookingModal(name, price) {
  selectedCourse.value = name
  selectedPrice.value  = price
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

// ── Escape key to close modals ────────────
function onKeydown(e) {
  if (e.key === 'Escape') { closeBookingModal(); closeSuccessModal() }
}

// ── Card scroll animation ─────────────────
const cardRefs   = ref([])
const whyCardRefs = ref([])

function initCardAnimations() {
  const allCards = [...(cardRefs.value || []), ...(whyCardRefs.value || [])]
  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry, i) => {
      if (entry.isIntersecting) {
        setTimeout(() => {
          entry.target.style.opacity    = '1'
          entry.target.style.transform  = 'translateY(0)'
        }, i * 100)
        observer.unobserve(entry.target)
      }
    })
  }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' })

  allCards.forEach(card => {
    if (card) {
      card.style.opacity   = '0'
      card.style.transform = 'translateY(30px)'
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

<style scoped>
/* Hero */
.courses-hero {
  padding: 4rem 2rem;
  padding-top: calc(80px + 4rem);
  min-height: 50vh;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
  background: linear-gradient(135deg, #f8f9fa 0%, #ffffff 50%, #f0f4f8 100%);
  text-align: center;
}
.hero-content { position: relative; z-index: 1; }
.courses-hero h1 { font-size: 3.5rem; font-weight: 700; color: #1e293b; margin-bottom: 1.5rem; line-height: 1.2; }
.courses-hero h1 span { color: #1a60ec; }
.courses-hero p { font-size: 1.2rem; color: #64748b; line-height: 1.8; max-width: 600px; margin: 0 auto; }

.morphing-bg {
  position: absolute; right: -10%; top: 50%; width: 700px; height: 700px;
  pointer-events: none; z-index: 0; filter: blur(80px);
  background: radial-gradient(circle, rgba(99,102,241,0.15) 0%, rgba(139,92,246,0.12) 40%, transparent 70%);
  border-radius: 60% 40% 30% 70% / 60% 30% 70% 40%;
  animation: float 20s ease-in-out infinite, morph 15s ease-in-out infinite;
}
.morphing-bg-2 {
  position: absolute; left: -8%; bottom: 10%; width: 500px; height: 500px;
  pointer-events: none; z-index: 0; filter: blur(80px);
  background: radial-gradient(circle, rgba(56,189,248,0.12) 0%, rgba(14,165,233,0.10) 40%, transparent 70%);
  border-radius: 40% 60% 50% 50% / 60% 40% 60% 50%;
  animation: float-alt 18s ease-in-out infinite, morph2 12s ease-in-out infinite;
}
@keyframes morph     { 0%,100%{border-radius:60% 40% 30% 70%/60% 30% 70% 40%} 33%{border-radius:30% 60% 70% 40%/50% 60% 30% 60%} 66%{border-radius:70% 30% 50% 50%/30% 70% 50% 50%} }
@keyframes morph2    { 0%,100%{border-radius:40% 60% 50% 50%/60% 40% 60% 50%} 33%{border-radius:60% 40% 40% 60%/50% 70% 40% 60%} 66%{border-radius:50% 50% 60% 40%/40% 60% 50% 60%} }
@keyframes float     { 0%,100%{transform:translate(0,-50%) scale(1)} 33%{transform:translate(-150px,-40%) scale(1.05)} 66%{transform:translate(-200px,-60%) scale(1.08)} }
@keyframes float-alt { 0%,100%{transform:translate(0,0) scale(1)} 33%{transform:translate(120px,-50px) scale(1.08)} 66%{transform:translate(180px,30px) scale(1.05)} }

/* Courses */
.courses-section { padding: 80px 20px; max-width: 1400px; margin: 0 auto; }
.section-title { text-align: center; font-size: 2.5rem; color: #103d85; margin-bottom: 60px; font-weight: 700; }
.courses-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(350px, 1fr)); gap: 30px; }
.course-card { background: #fff; border-radius: 20px; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.06); transition: all 0.4s cubic-bezier(0.4,0,0.2,1); border: 1px solid rgba(226,232,240,0.5); }
.course-card:hover { transform: translateY(-10px); box-shadow: 0 20px 50px rgba(99,102,241,0.15); border-color: rgba(99,102,241,0.3); }
.course-image { position: relative; height: 200px; overflow: hidden; }
.course-image img { width: 100%; height: 100%; object-fit: cover; transition: transform 0.5s ease; }
.course-card:hover .course-image img { transform: scale(1.1); }
.course-badge { position: absolute; top: 15px; right: 15px; background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%); color: white; padding: 6px 14px; border-radius: 20px; font-size: 0.85rem; font-weight: 600; box-shadow: 0 4px 15px rgba(245,158,11,0.4); }
.course-badge.new { background: linear-gradient(135deg, #10b981 0%, #059669 100%); box-shadow: 0 4px 15px rgba(16,185,129,0.4); }
.course-content { padding: 25px; }
.course-content h3 { font-size: 1.4rem; color: #1e293b; margin-bottom: 10px; font-weight: 600; }
.course-desc { color: #64748b; font-size: 0.95rem; line-height: 1.6; margin-bottom: 15px; min-height: 48px; }
.course-details { display: flex; gap: 20px; margin-bottom: 15px; color: #64748b; font-size: 0.9rem; }
.course-details span { display: flex; align-items: center; gap: 6px; }
.course-details i { color: #6366f1; }
.course-price { margin-bottom: 20px; }
.course-price .price { font-size: 1.8rem; font-weight: 700; color: #1a60ec; }
.course-price .per-person { font-size: 0.95rem; color: #64748b; }
.btn-book { width: 100%; padding: 14px 24px; background: linear-gradient(135deg, #2a0f69 0%, #070be9 100%); color: white; border: none; border-radius: 12px; font-size: 1rem; font-weight: 600; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 10px; transition: all 0.3s ease; font-family: 'Prompt', sans-serif; }
.btn-book:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(99,102,241,0.35); }

/* Why Us */
.why-us-section { padding: 80px 20px; background: linear-gradient(135deg, #f8f9fa 0%, #fff 100%); }
.why-us-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 30px; max-width: 1200px; margin: 0 auto; }
.why-us-card { background: white; border-radius: 20px; padding: 40px 30px; text-align: center; box-shadow: 0 4px 20px rgba(0,0,0,0.06); transition: all 0.4s ease; border: 1px solid rgba(226,232,240,0.5); }
.why-us-card:hover { transform: translateY(-8px); box-shadow: 0 15px 40px rgba(99,102,241,0.12); }
.why-us-icon { width: 80px; height: 80px; margin: 0 auto 25px; background: linear-gradient(135deg, #eef2ff 0%, #e0e7ff 100%); border-radius: 20px; display: flex; align-items: center; justify-content: center; font-size: 2rem; color: #6366f1; transition: all 0.4s ease; }
.why-us-card:hover .why-us-icon { background: linear-gradient(135deg, #6366f1 0%, #4f46e5 100%); color: white; transform: scale(1.1) rotate(5deg); }
.why-us-card h3 { font-size: 1.3rem; color: #1e293b; margin-bottom: 12px; font-weight: 600; }
.why-us-card p { color: #64748b; line-height: 1.7; font-size: 0.95rem; }

/* Modal */
.modal-overlay { position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.6); backdrop-filter: blur(5px); display: none; justify-content: center; align-items: center; z-index: 2000; padding: 20px; }
.modal-overlay.active { display: flex; }
.modal-container { background: white; border-radius: 24px; width: 100%; max-width: 560px; max-height: 90vh; overflow-y: auto; position: relative; box-shadow: 0 25px 60px rgba(0,0,0,0.15); }
.modal-close { position: absolute; top: 15px; right: 15px; background: #f1f5f9; border: none; border-radius: 50%; width: 36px; height: 36px; display: flex; align-items: center; justify-content: center; cursor: pointer; font-size: 1rem; color: #64748b; transition: all 0.2s; z-index: 1; }
.modal-close:hover { background: #e2e8f0; color: #1e293b; }
.modal-header { padding: 30px 30px 20px; border-bottom: 1px solid #e2e8f0; }
.modal-header h2 { font-size: 1.5rem; color: #1e293b; margin-bottom: 10px; display: flex; align-items: center; gap: 10px; }
.modal-header h2 i { color: #6366f1; }
.selected-course { color: #374151; font-weight: 500; font-size: 0.95rem; margin-bottom: 4px; }
.selected-price { color: #6366f1; font-weight: 600; font-size: 1rem; }
.booking-form { padding: 25px 30px 30px; }
.form-group { margin-bottom: 20px; }
.form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
.form-group label { display: flex; align-items: center; gap: 8px; font-size: 0.95rem; font-weight: 500; color: #374151; margin-bottom: 8px; }
.form-group label i { color: #6366f1; font-size: 0.9rem; }
.required { color: #ef4444; }
.form-group input, .form-group select, .form-group textarea { width: 100%; padding: 14px 16px; border: 2px solid #e2e8f0; border-radius: 12px; font-size: 1rem; font-family: 'Prompt', sans-serif; transition: all 0.3s ease; background: #f8fafc; }
.form-group input:focus, .form-group select:focus, .form-group textarea:focus { outline: none; border-color: #6366f1; background: white; box-shadow: 0 0 0 4px rgba(99,102,241,0.1); }
.form-group textarea { resize: vertical; min-height: 100px; }
.btn-submit { width: 100%; padding: 16px 24px; background: linear-gradient(135deg, #2a0f69 0%, #070be9 100%); color: white; border: none; border-radius: 12px; font-size: 1.1rem; font-weight: 600; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 10px; transition: all 0.3s ease; font-family: 'Prompt', sans-serif; margin-top: 10px; }
.btn-submit:hover:not(:disabled) { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(99,102,241,0.35); }
.btn-submit:disabled { opacity: 0.7; cursor: not-allowed; }

/* Success Modal */
.success-modal { text-align: center; padding: 50px 40px; max-width: 420px; }
.success-icon { width: 100px; height: 100px; margin: 0 auto 25px; background: linear-gradient(135deg, #10b981 0%, #059669 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 3rem; color: white; animation: successPop 0.5s ease; }
@keyframes successPop { 0%{transform:scale(0)} 50%{transform:scale(1.2)} 100%{transform:scale(1)} }
.success-modal h2 { font-size: 1.8rem; color: #1e293b; margin-bottom: 15px; }
.success-modal p { color: #64748b; font-size: 1.05rem; line-height: 1.7; margin-bottom: 30px; }
.btn-close-success { padding: 14px 50px; background: linear-gradient(135deg, #10b981 0%, #059669 100%); color: white; border: none; border-radius: 12px; font-size: 1.1rem; font-weight: 600; cursor: pointer; transition: all 0.3s ease; font-family: 'Prompt', sans-serif; }
.btn-close-success:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(16,185,129,0.35); }

/* Responsive */
@media (max-width: 768px) {
  .courses-hero { padding: 2rem 1rem; padding-top: calc(70px + 2rem); min-height: 40vh; }
  .courses-hero h1 { font-size: 2.5rem; }
  .courses-section { padding: 50px 15px; }
  .section-title { font-size: 2rem; margin-bottom: 40px; }
  .courses-grid { grid-template-columns: 1fr; gap: 25px; }
  .why-us-section { padding: 50px 15px; }
  .why-us-grid { grid-template-columns: 1fr 1fr; gap: 20px; }
  .modal-container { max-height: 95vh; margin: 10px; }
  .booking-form { padding: 20px; }
  .form-row { grid-template-columns: 1fr; gap: 15px; }
}
@media (max-width: 480px) {
  .courses-hero h1 { font-size: 2rem; }
  .section-title { font-size: 1.6rem; }
  .why-us-grid { grid-template-columns: 1fr; }
  .course-content h3 { font-size: 1.2rem; }
  .course-price .price { font-size: 1.5rem; }
  .success-modal { padding: 40px 25px; }
  .success-icon { width: 80px; height: 80px; font-size: 2.5rem; }
}
</style>