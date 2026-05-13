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

// ไล่สี border จากเข้ม (#6b7280) → อ่อน (#e5e7eb) ตามลำดับการ์ด
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