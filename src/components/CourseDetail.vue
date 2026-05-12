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
          <div class="hero-badge" v-if="course.badge">
            <span :class="['badge-pill', course.badgeClass]">{{ course.badge }}</span>
          </div>
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

<style scoped>
.detail-page { padding-top: 64px; min-height: 100vh; background: #f8fafc; }

/* Not found */
.not-found { display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 100px 20px; gap: 20px; color: #64748b; }
.not-found i { font-size: 4rem; color: #cbd5e1; }
.not-found h2 { font-size: 1.8rem; color: #374151; }

/* Hero */
.detail-hero { position: relative; overflow: hidden; background: linear-gradient(135deg, #f8f9fa 0%, #ffffff 50%, #f0f4f8 100%); padding: 60px 20px 50px; }
.morphing-bg { position: absolute; right: -10%; top: 50%; width: 600px; height: 600px; pointer-events: none; z-index: 0; filter: blur(80px); background: radial-gradient(circle, rgba(99,102,241,0.15) 0%, rgba(139,92,246,0.12) 40%, transparent 70%); border-radius: 60% 40% 30% 70% / 60% 30% 70% 40%; animation: morph 15s ease-in-out infinite; }
@keyframes morph { 0%,100%{border-radius:60% 40% 30% 70%/60% 30% 70% 40%} 33%{border-radius:30% 60% 70% 40%/50% 60% 30% 60%} 66%{border-radius:70% 30% 50% 50%/30% 70% 50% 50%} }

.hero-inner { position: relative; z-index: 1; max-width: 800px; margin: 0 auto; }
.btn-back-top { background: none; border: 1px solid #e2e8f0; border-radius: 8px; padding: 8px 16px; cursor: pointer; font-size: 0.9rem; color: #64748b; display: inline-flex; align-items: center; gap: 8px; margin-bottom: 24px; transition: all 0.2s; font-family: 'Sarabun', sans-serif; }
.btn-back-top:hover { background: #f1f5f9; color: #1e293b; }
.course-code { font-size: 0.85rem; color: #6366f1; font-weight: 600; letter-spacing: 1px; text-transform: uppercase; margin-bottom: 8px; }
.detail-hero h1 { font-size: 2.8rem; font-weight: 700; color: #1e293b; margin-bottom: 8px; line-height: 1.2; }
.english-title { font-size: 1.1rem; color: #6366f1; margin-bottom: 24px; }
.hero-badge { margin-bottom: 12px; }
.badge-pill { display: inline-block; padding: 4px 14px; border-radius: 20px; font-size: 0.85rem; font-weight: 600; background: linear-gradient(135deg, #f59e0b, #d97706); color: white; }
.badge-pill.new { background: linear-gradient(135deg, #10b981, #059669); }
.hero-meta { display: flex; align-items: center; flex-wrap: wrap; gap: 20px; margin-bottom: 32px; color: #64748b; font-size: 0.95rem; }
.hero-meta i { color: #6366f1; margin-right: 6px; }
.price-tag { font-size: 1.6rem; font-weight: 700; color: #1a60ec; }
.btn-book-hero { padding: 14px 32px; background: linear-gradient(135deg, #2a0f69 0%, #070be9 100%); color: white; border: none; border-radius: 12px; font-size: 1rem; font-weight: 600; cursor: pointer; display: inline-flex; align-items: center; gap: 10px; transition: all 0.3s; font-family: 'Sarabun', sans-serif; }
.btn-book-hero:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(99,102,241,0.35); }

/* Content */
.detail-content { max-width: 900px; margin: 0 auto; padding: 40px 20px 80px; }
.detail-section { margin-bottom: 40px; }
.detail-section h2 { font-size: 1.4rem; font-weight: 700; color: #1e293b; margin-bottom: 16px; display: flex; align-items: center; gap: 10px; }
.detail-section h2 i { color: #6366f1; font-size: 1.2rem; }
.description { color: #475569; line-height: 1.8; font-size: 1rem; }

/* Card sections */
.detail-section.card { background: white; border-radius: 16px; padding: 28px; box-shadow: 0 2px 12px rgba(0,0,0,0.06); border: 1px solid #e2e8f0; margin-bottom: 0; }

/* Two col */
.two-col { display: grid; grid-template-columns: 1fr 1fr; gap: 24px; margin-bottom: 40px; }
.three-col { display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 24px; margin-bottom: 40px; }

/* Check list */
.check-list { list-style: none; display: flex; flex-direction: column; gap: 10px; }
.check-list li { display: flex; align-items: flex-start; gap: 10px; color: #475569; font-size: 0.95rem; }
.check-list li i { color: #6366f1; margin-top: 3px; flex-shrink: 0; }

/* Simple list */
.simple-list { list-style: none; display: flex; flex-direction: column; gap: 8px; }
.simple-list li { color: #475569; font-size: 0.95rem; padding-left: 12px; border-left: 3px solid #6366f1; }

/* Topics */
.topics-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 20px; }
.topic-card { background: white; border-radius: 12px; padding: 20px 24px; box-shadow: 0 2px 8px rgba(0,0,0,0.06); border: 1px solid #e2e8f0; }
.topic-card h3 { font-size: 1rem; font-weight: 700; color: #1e293b; margin-bottom: 12px; padding-bottom: 10px; border-bottom: 2px solid #e0e7ff; }
.topic-card ul { list-style: none; display: flex; flex-direction: column; gap: 6px; }
.topic-card ul li { color: #475569; font-size: 0.9rem; padding-left: 12px; position: relative; }
.topic-card ul li::before { content: '·'; position: absolute; left: 0; color: #6366f1; font-weight: 700; }

/* Schedule */
.schedule-list { display: flex; flex-direction: column; gap: 16px; }
.schedule-item { display: flex; gap: 20px; background: white; border-radius: 12px; padding: 20px 24px; box-shadow: 0 2px 8px rgba(0,0,0,0.06); border: 1px solid #e2e8f0; }
.schedule-time { min-width: 130px; font-weight: 700; color: #6366f1; font-size: 0.95rem; padding-top: 2px; }
.schedule-activities { list-style: none; display: flex; flex-direction: column; gap: 6px; }
.schedule-activities li { color: #475569; font-size: 0.9rem; }
.schedule-activities li::before { content: '▸ '; color: #6366f1; }

/* CTA bar */
.cta-bar { background: linear-gradient(135deg, #1e293b 0%, #2a0f69 100%); border-radius: 20px; padding: 32px 40px; display: flex; align-items: center; justify-content: space-between; gap: 20px; flex-wrap: wrap; }
.cta-price { font-size: 2rem; font-weight: 700; color: white; }
.cta-price span { font-size: 1rem; font-weight: 400; color: #94a3b8; }
.cta-sub { color: #94a3b8; font-size: 0.9rem; margin-top: 4px; }

/* Modal — same as Courses.vue */
.modal-overlay { position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.6); backdrop-filter: blur(5px); display: none; justify-content: center; align-items: center; z-index: 2000; padding: 20px; }
.modal-overlay.active { display: flex; }
.modal-container { background: white; border-radius: 24px; width: 100%; max-width: 560px; max-height: 90vh; overflow-y: auto; position: relative; box-shadow: 0 25px 60px rgba(0,0,0,0.15); }
.modal-close { position: absolute; top: 15px; right: 15px; background: #f1f5f9; border: none; border-radius: 50%; width: 36px; height: 36px; display: flex; align-items: center; justify-content: center; cursor: pointer; font-size: 1rem; color: #64748b; transition: all 0.2s; z-index: 1; }
.modal-close:hover { background: #e2e8f0; color: #1e293b; }
.modal-header { padding: 30px 30px 20px; border-bottom: 1px solid #e2e8f0; }
.modal-header h2 { font-size: 1.5rem; color: #1e293b; margin-bottom: 10px; display: flex; align-items: center; gap: 10px; }
.modal-header h2 i { color: #6366f1; }
.selected-course { color: #374151; font-weight: 600; font-size: 0.95rem; margin-bottom: 4px; }
.selected-price { color: #6366f1; font-weight: 700; font-size: 1rem; }
.booking-form { padding: 25px 30px 30px; }
.form-group { margin-bottom: 20px; }
.form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
.form-group label { display: flex; align-items: center; gap: 8px; font-size: 0.95rem; font-weight: 500; color: #374151; margin-bottom: 8px; }
.form-group label i { color: #6366f1; font-size: 0.9rem; }
.required { color: #ef4444; }
.form-group input, .form-group select, .form-group textarea { width: 100%; padding: 14px 16px; border: 2px solid #e2e8f0; border-radius: 12px; font-size: 1rem; font-family: 'Sarabun', sans-serif; transition: all 0.3s; background: #f8fafc; }
.form-group input:focus, .form-group select:focus, .form-group textarea:focus { outline: none; border-color: #6366f1; background: white; box-shadow: 0 0 0 4px rgba(99,102,241,0.1); }
.form-group textarea { resize: vertical; min-height: 100px; }
.btn-submit { width: 100%; padding: 16px 24px; background: linear-gradient(135deg, #2a0f69 0%, #070be9 100%); color: white; border: none; border-radius: 12px; font-size: 1.1rem; font-weight: 600; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 10px; transition: all 0.3s; font-family: 'Sarabun', sans-serif; margin-top: 10px; }
.btn-submit:hover:not(:disabled) { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(99,102,241,0.35); }
.btn-submit:disabled { opacity: 0.7; cursor: not-allowed; }
.success-modal { text-align: center; padding: 50px 40px; }
.success-icon { width: 100px; height: 100px; margin: 0 auto 25px; background: linear-gradient(135deg, #10b981 0%, #059669 100%); border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 3rem; color: white; animation: successPop 0.5s ease; }
@keyframes successPop { 0%{transform:scale(0)} 50%{transform:scale(1.2)} 100%{transform:scale(1)} }
.success-modal h2 { font-size: 1.8rem; color: #1e293b; margin-bottom: 15px; }
.success-modal p { color: #64748b; font-size: 1.05rem; line-height: 1.7; margin-bottom: 30px; }
.btn-close-success { padding: 14px 50px; background: linear-gradient(135deg, #10b981 0%, #059669 100%); color: white; border: none; border-radius: 12px; font-size: 1.1rem; font-weight: 600; cursor: pointer; transition: all 0.3s; font-family: 'Sarabun', sans-serif; }
.btn-close-success:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(16,185,129,0.35); }

/* Back button (not-found) */
.btn-back { padding: 12px 28px; background: #1e293b; color: white; border: none; border-radius: 10px; cursor: pointer; font-size: 1rem; display: inline-flex; align-items: center; gap: 8px; font-family: 'Sarabun', sans-serif; }

@media (max-width: 768px) {
  .detail-hero h1 { font-size: 2rem; }
  .two-col, .three-col { grid-template-columns: 1fr; }
  .schedule-item { flex-direction: column; gap: 10px; }
  .schedule-time { min-width: unset; }
  .cta-bar { flex-direction: column; text-align: center; padding: 24px; }
  .form-row { grid-template-columns: 1fr; }
}
</style>