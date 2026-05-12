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

      <!-- All Results (before search) -->
      <div v-if="isEmpty" class="results-container">
        <div class="results-grid">
          <div v-for="result in pagedData" :key="result.ID" class="result-card">
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
              <span class="result-level-pill">Level</span>
              <span class="result-level-value">{{ result.Level }}</span>
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
        <p>ไม่พบข้อมูลสำหรับ "{{ searchQuery }}" กรุณาลองค้นหาด้วยคำค้นอื่น</p>
      </div>

      <!-- Search Results -->
      <div v-else-if="!isEmpty" class="results-container">
        <div class="results-grid">
          <div v-for="result in pagedSearchData" :key="result.ID" class="result-card">
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
              <span class="result-level-pill">Level</span>
              <span class="result-level-value">{{ result.Level }}</span>
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
import { ref, watch, computed } from 'vue'

const sampleData = [
  { ID: 1,  'First Name': 'Karn',      'Last Name': 'Deeying',          Company: 'Rayong Engineering & Plant Service Co., Ltd. (REPCO)', Mail: 'repconex@scg.com',                  Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 2,  'First Name': 'Chotiwit',  'Last Name': 'Kunathananon',      Company: 'Rayong Engineering & Plant Service Co., Ltd. (REPCO)', Mail: 'repconex@scg.com',                 Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 3,  'First Name': 'Khemapat', 'Last Name': 'Tontiwattanakul',   Company: 'KMUTNB',                                               Mail: 'khemapat.t@eng.kmutnb.ac.th',       Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 6,  'First Name': 'Pisit',    'Last Name': 'Sirisoponwattana',  Company: 'Rayong Engineering and Plant Service Co., Ltd.',       Mail: 'Pisitsirisoponwattana@gmail.com',   Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 8,  'First Name': 'Kolawach', 'Last Name': 'Chalermpong',       Company: 'KMITL',                                               Mail: 'kolawach.ch@kmitl.ac.th',            Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 9,  'First Name': 'Nguyen',   'Last Name': 'Phuong Hung',       Company: 'NARIME',                                              Mail: 'hungnp@narime.gov.vn',               Level: 'ยังมีรายชื่ออยู่ใน VI | CATIII' },
  { ID: 29, 'First Name': 'Tran',     'Last Name': 'Duy Hoai',          Company: 'Au Viet Technical Equipment JSC',                     Mail: 'hoai.tran@avitek.vn',                Level: 'ยังมีรายชื่ออยู่ใน VI | CATII, CATIII' },
  { ID: 33, 'First Name': 'Danai',    'Last Name': 'Nantasup',          Company: 'Eastern Water',                                       Mail: 'danai_nan@eastwater.com',            Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 34, 'First Name': 'Anuthida', 'Last Name': 'Palarit',           Company: 'Eastern Water',                                       Mail: 'anuthida_pal@eastwater.com',         Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 36, 'First Name': 'Kamolwan', 'Last Name': 'Weerachatsakul',    Company: 'REPCO',                                               Mail: 'hrtech2@scg.com',                    Level: 'ยังมีรายชื่ออยู่ใน VI | CATII, CATIII' },
  { ID: 37, 'First Name': 'Metee',    'Last Name': 'Meerabeab',         Company: 'GC Maintenance & Engineering',                        Mail: 'metee.m@pttgcgroup.com',             Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 38, 'First Name': 'Nitigorn', 'Last Name': 'Eakchay',           Company: 'GC Maintenance & Engineering',                        Mail: 'nitigorn.e@pttgcgroup.com',          Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 45, 'First Name': 'Jakkarin', 'Last Name': 'Sumethasorn',       Company: 'SKF Thailand',                                        Mail: 'jakkarin.sumethasorn@skf.com',       Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 57, 'First Name': 'Anutr',    'Last Name': 'Ratipann',          Company: 'Bridgestone Asia Pacific',                            Mail: 'anutr.ratipann1@bridgestone.com',    Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 58,  'First Name': 'Varn',      'Last Name': 'Feeying',          Company: 'Rayong Engineering & Plant Service Co., Ltd. (REPCO)', Mail: 'repconex@scg.com',                  Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 60,  'First Name': 'Thotiwit',  'Last Name': 'Kunathananon',      Company: 'Rayong Engineering & Plant Service Co., Ltd. (REPCO)', Mail: 'repconex@scg.com',                 Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 63,  'First Name': 'Yhemapat', 'Last Name': 'Tontiwattanakul',   Company: 'KMUTNB',                                               Mail: 'khemapat.t@eng.kmutnb.ac.th',       Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 66,  'First Name': 'Visit',    'Last Name': 'Sirisoponwattana',  Company: 'Rayong Engineering and Plant Service Co., Ltd.',       Mail: 'Pisitsirisoponwattana@gmail.com',   Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 78,  'First Name': 'Lolawach', 'Last Name': 'Chalermpong',       Company: 'KMITL',                                               Mail: 'kolawach.ch@kmitl.ac.th',            Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 89,  'First Name': 'Guyen',   'Last Name': 'Phuong Hung',       Company: 'NARIME',                                              Mail: 'hungnp@narime.gov.vn',               Level: 'ยังมีรายชื่ออยู่ใน VI | CATIII' },
  { ID: 129, 'First Name': 'Tran',     'Last Name': 'Duy Hoai',          Company: 'Au Viet Technical Equipment JSC',                     Mail: 'hoai.tran@avitek.vn',                Level: 'ยังมีรายชื่ออยู่ใน VI | CATII, CATIII' },
  { ID: 133, 'First Name': 'Danai',    'Last Name': 'Nantasup',          Company: 'Eastern Water',                                       Mail: 'danai_nan@eastwater.com',            Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 134, 'First Name': 'Anuthida', 'Last Name': 'Palarit',           Company: 'Eastern Water',                                       Mail: 'anuthida_pal@eastwater.com',         Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 136, 'First Name': 'Kamolwan', 'Last Name': 'Weerachatsakul',    Company: 'REPCO',                                               Mail: 'hrtech2@scg.com',                    Level: 'ยังมีรายชื่ออยู่ใน VI | CATII, CATIII' },
  { ID: 137, 'First Name': 'Metee',    'Last Name': 'Meerabeab',         Company: 'GC Maintenance & Engineering',                        Mail: 'metee.m@pttgcgroup.com',             Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 138, 'First Name': 'Nitigorn', 'Last Name': 'Eakchay',           Company: 'GC Maintenance & Engineering',                        Mail: 'nitigorn.e@pttgcgroup.com',          Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 145, 'First Name': 'Jakkarin', 'Last Name': 'Sumethasorn',       Company: 'SKF Thailand',                                        Mail: 'jakkarin.sumethasorn@skf.com',       Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
  { ID: 157, 'First Name': 'Anutr',    'Last Name': 'Ratipann',          Company: 'Bridgestone Asia Pacific',                            Mail: 'anutr.ratipann1@bridgestone.com',    Level: 'ยังมีรายชื่ออยู่ใน VI | CATII' },
]

const searchQuery = ref('')
const results     = ref([])
const loading     = ref(false)
const isEmpty     = ref(true)
const currentPage = ref(1)
const searchPage  = ref(1)
const perPage     = 10

const totalPages = computed(() => Math.ceil(sampleData.length / perPage))
const pagedData  = computed(() => {
  const start = (currentPage.value - 1) * perPage
  return sampleData.slice(start, start + perPage)
})

const totalSearchPages = computed(() => Math.max(1, Math.ceil(results.value.length / perPage)))
const pagedSearchData  = computed(() => {
  const start = (searchPage.value - 1) * perPage
  return results.value.slice(start, start + perPage)
})

const handleSearch = () => {
  const q = searchQuery.value.toLowerCase().trim()
  if (!q) { isEmpty.value = true; results.value = []; return }

  isEmpty.value = false
  loading.value = true
  searchPage.value = 1
  setTimeout(() => {
    results.value = sampleData.filter(item =>
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
  if (!val.trim()) { isEmpty.value = true; results.value = [] }
})
</script>

<style>
@import "@/assets/css/styles.css";
</style>

<style scoped>
/* ── Page wrapper ─────────────────────────── */
.tr-page {
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: stretch;
}

/* ── Hero ─────────────────────────────────── */
.hero {
  width: 100%;
  padding: 60px 20px;
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
  box-sizing: border-box;
  background: linear-gradient(180deg,
    rgba(199, 210, 254, 0.4) 0%,
    rgba(224, 231, 255, 0.3) 30%,
    rgba(255, 255, 255, 0) 100%
  );
}

.badge {
  display: inline-flex;
  align-items: center;
  gap: 8px;
  padding: 8px 20px;
  background: #fff;
  border: 1px solid #e5e7eb;
  border-radius: 50px;
  font-size: 14px;
  font-weight: 500;
  color: #3b82f6;
  margin-bottom: 24px;
  box-shadow: 0 1px 3px rgba(0,0,0,.05);
}
.badge-icon { width: 18px; height: 18px; }

.title {
  font-size: 42px;
  font-weight: 700;
  color: #1e293b;
  margin-bottom: 16px;
  line-height: 1.3;
}
.title .highlight { color: #3b82f6; }

.subtitle {
  font-size: 16px;
  color: #64748b;
  line-height: 1.7;
  margin-bottom: 32px;
}

/* ── Search form ──────────────────────────── */
.search-form {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 12px;
  width: 100%;
  max-width: 700px;
  flex-wrap: wrap;
}
.search-input-wrapper {
  position: relative;
  flex: 1;
  min-width: 280px;
}
.search-icon {
  position: absolute;
  left: 16px;
  top: 50%;
  transform: translateY(-50%);
  color: #9ca3af;
  pointer-events: none;
}
.search-input {
  width: 100%;
  padding: 14px 16px 14px 48px;
  font-size: 15px;
  font-family: 'Sarabun', sans-serif;
  border: 1px solid #e5e7eb;
  border-radius: 8px;
  outline: none;
  background: #fff;
  box-sizing: border-box;
  transition: border-color .2s, box-shadow .2s;
}
.search-input::placeholder { color: #9ca3af; }
.search-input:focus {
  border-color: #3b82f6;
  box-shadow: 0 0 0 3px rgba(59,130,246,.1);
}
.search-button {
  padding: 14px 32px;
  font-size: 15px;
  font-weight: 600;
  font-family: 'Sarabun', sans-serif;
  color: #fff;
  background: #1e293b;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  white-space: nowrap;
  transition: background .2s, transform .1s;
}
.search-button:hover  { background: #334155; }
.search-button:active { transform: scale(.98); }

/* ── Results section ──────────────────────── */
.results-section {
  width: 100%;
  padding: 40px 20px;
  box-sizing: border-box;
  /* ไม่มี min-height เพื่อไม่ให้ยืดดัน card ลงไป */
}

/* ── Empty / Loading / No-results ───────── */
.empty-state,
.loading-state,
.no-results {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 40px 20px;
  text-align: center;
}
.empty-icon,
.no-results-icon { color: #d1d5db; margin-bottom: 16px; }
.empty-text      { font-size: 16px; color: #9ca3af; }
.no-results h3   { font-size: 18px; color: #374151; margin-bottom: 8px; }
.no-results p    { font-size: 14px; color: #9ca3af; }

.spinner {
  width: 40px; height: 40px;
  border: 3px solid #e5e7eb;
  border-top-color: #3b82f6;
  border-radius: 50%;
  animation: spin 1s linear infinite;
  margin-bottom: 16px;
}
@keyframes spin { to { transform: rotate(360deg); } }
.loading-state p { color: #64748b; font-size: 14px; }

/* ── Result cards ─────────────────────────── */
.results-container {
  max-width: 800px;
  margin: 0 auto;
  width: 100%;
}
.result-card {
  background: #fff;
  border: 2px solid #9ca3af;
  border-radius: 12px;
  padding: 24px;
  margin-bottom: 16px;
  box-shadow: 0 1px 3px rgba(0,0,0,.05);
  transition: box-shadow .2s;
}
.result-card:hover { box-shadow: 0 4px 12px rgba(0,0,0,.12); }
.result-header {
  display: flex;
  align-items: flex-start;
  justify-content: space-between;
  margin-bottom: 16px;
  flex-wrap: wrap;
  gap: 12px;
}
.result-name { font-size: 20px; font-weight: 800; color: #111827; }
.result-status {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  padding: 6px 14px;
  border-radius: 50px;
  font-size: 13px;
  font-weight: 600;
}
.result-status.passed { background: #dcfce7; color: #16a34a; }
.result-status.failed { background: #fee2e2; color: #dc2626; }
.result-details {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
  gap: 12px;
  margin-bottom: 16px;
}
.result-detail-item  { display: flex; flex-direction: column; gap: 4px; }
.result-detail-label { font-size: 13px; font-weight: 700; color: #111827; }
.result-detail-value { font-size: 14px; color: #111827; font-weight: 700; }

/* Level row */
.result-level-row {
  display: flex;
  align-items: stretch;
}
.result-level-pill {
  background-color: #374151;
  color: #ffffff;
  font-size: 13px;
  font-weight: 700;
  padding: 8px 16px;
  border-radius: 6px 0 0 6px;
  white-space: nowrap;
  font-family: 'Sarabun', sans-serif;
  display: flex;
  align-items: center;
}
.result-level-value {
  flex: 1;
  padding: 8px 14px;
  font-size: 14px;
  font-family: 'Sarabun', sans-serif;
  font-weight: 600;
  color: #374151;
  background-color: #f9fafb;
  border: 1px solid #d1d5db;
  border-left: none;
  border-radius: 0 6px 6px 0;
  display: flex;
  align-items: center;
  justify-content: center;
}

/* ── Grid layout ─────────────────────────── */
.results-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
  margin-bottom: 24px;
}

/* ── Pagination ───────────────────────────── */
.pagination {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 16px;
  margin-top: 8px;
}
.page-btn {
  padding: 8px 20px;
  font-size: 14px;
  font-family: 'Sarabun', sans-serif;
  font-weight: 600;
  color: #fff;
  background: #1e293b;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: background .2s;
}
.page-btn:hover:not(:disabled) { background: #334155; }
.page-btn:disabled {
  background: #e5e7eb;
  color: #9ca3af;
  cursor: not-allowed;
}
.page-info {
  font-size: 14px;
  color: #64748b;
  font-weight: 600;
  min-width: 60px;
  text-align: center;
}

/* ── Responsive ───────────────────────────── */
@media (max-width: 640px) {
  .hero        { padding: 40px 16px; }
  .title       { font-size: 28px; }
  .subtitle    { font-size: 14px; }
  .subtitle br { display: none; }
  .search-form { flex-direction: column; }
  .search-input-wrapper { width: 100%; min-width: unset; }
  .search-button        { width: 100%; }
  .result-header        { flex-direction: column; }
  .results-grid         { grid-template-columns: 1fr; }
}
</style>  