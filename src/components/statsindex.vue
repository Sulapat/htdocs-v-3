<template>
  <div class="stats-page">

    <!-- ── Header ── -->
    <header class="stats-header">
      <div class="header-inner">
        <div class="header-brand">
          <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M18 21a8 8 0 0 0-16 0"/><circle cx="10" cy="8" r="5"/>
            <path d="M22 20c0-3.37-2-6.5-4-8a5 5 0 0 0-.45-8.3"/>
          </svg>
          <span>Patineer Training Center</span>
        </div>
        <nav class="header-nav">
          <a href="/result" class="nav-link">ตรวจสอบสิทธิ์</a>
          <span class="nav-active">ภาพรวม</span>
        </nav>
      </div>
    </header>

    <!-- ── Hero ── -->
    <section class="stats-hero">
      <div class="hero-eyebrow">
        <span class="dot dot-pulse"></span>
        Live Statistics
      </div>
      <h1 class="hero-title">VI Certified Analysts<br /><span class="hero-accent">ภาพรวมผู้ผ่านการรับรอง</span></h1>
      <p class="hero-sub">ข้อมูลสถิติจำนวน Certified Analysts แยกตามหลักสูตรและองค์กร อัปเดตล่าสุด</p>
    </section>

    <!-- ── KPI Cards ── -->
    <section class="kpi-section">
      <div class="kpi-grid">
        <div class="kpi-card kpi-total">
          <div class="kpi-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75">
              <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
              <circle cx="9" cy="7" r="4"/>
              <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
              <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
            </svg>
          </div>
          <div class="kpi-content">
            <div class="kpi-number">{{ totalCertified }}</div>
            <div class="kpi-label">ผู้ผ่านการรับรองทั้งหมด</div>
          </div>
        </div>

        <div class="kpi-card kpi-c2">
          <div class="kpi-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75">
              <circle cx="12" cy="8" r="6"/><path d="M15.477 12.89 17 22l-5-3-5 3 1.523-9.11"/>
            </svg>
          </div>
          <div class="kpi-content">
            <div class="kpi-number">{{ countByCourse.CATII }}</div>
            <div class="kpi-label">Category II VA</div>
          </div>
          <div class="kpi-badge badge-c2">VA-II</div>
        </div>

        <div class="kpi-card kpi-c3">
          <div class="kpi-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75">
              <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
            </svg>
          </div>
          <div class="kpi-content">
            <div class="kpi-number">{{ countByCourse.CATIII }}</div>
            <div class="kpi-label">Category III VA</div>
          </div>
          <div class="kpi-badge badge-c3">VA-III</div>
        </div>

        <div class="kpi-card kpi-org">
          <div class="kpi-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75">
              <rect x="2" y="7" width="20" height="14" rx="2"/><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"/>
            </svg>
          </div>
          <div class="kpi-content">
            <div class="kpi-number">{{ uniqueCompanies.length }}</div>
            <div class="kpi-label">องค์กร</div>
          </div>
        </div>
      </div>
    </section>

    <!-- ── Course Distribution Bar ── -->
    <section class="section-block">
      <div class="section-header">
        <h2 class="section-title">สัดส่วนตามหลักสูตร</h2>
      </div>
      <div class="dist-bars">
        <div v-for="course in courseDistribution" :key="course.key" class="dist-row">
          <div class="dist-label-col">
            <span class="dist-tag" :class="course.tagClass">{{ course.code }}</span>
            <span class="dist-name">{{ course.name }}</span>
          </div>
          <div class="dist-bar-col">
            <div class="dist-bar-track">
              <div
                class="dist-bar-fill"
                :class="course.fillClass"
                :style="{ width: barWidth(course.count) + '%' }"
              ></div>
            </div>
            <span class="dist-count">{{ course.count }} คน</span>
          </div>
        </div>
      </div>
    </section>

    <!-- ── Top Companies ── -->
    <section class="section-block">
      <div class="section-header">
        <h2 class="section-title">องค์กรที่มีผู้ผ่านการรับรองมากที่สุด</h2>
        <span class="section-sub">Top {{ topCompanies.length }}</span>
      </div>
      <div class="company-list">
        <div v-for="(co, i) in topCompanies" :key="co.name" class="company-row">
          <div class="company-rank" :class="rankClass(i)">{{ i + 1 }}</div>
          <div class="company-info">
            <div class="company-name">{{ co.name }}</div>
            <div class="company-bar-wrap">
              <div class="company-bar" :style="{ width: (co.count / topCompanies[0].count * 100) + '%' }"></div>
            </div>
          </div>
          <div class="company-count">{{ co.count }} <span>คน</span></div>
        </div>
      </div>
    </section>

    <!-- ── Recent Additions ── -->
    <section class="section-block">
      <div class="section-header">
        <h2 class="section-title">รายชื่อล่าสุด</h2>
        <a href="/result" class="section-link">ดูทั้งหมด →</a>
      </div>
      <div class="recent-table">
        <div class="table-head">
          <span>ชื่อ-นามสกุล</span>
          <span>องค์กร</span>
          <span>ระดับ</span>
        </div>
        <div v-for="item in recentItems" :key="item.ID" class="table-row">
          <div class="table-name">{{ item['First Name'] }} {{ item['Last Name'] }}</div>
          <div class="table-company">{{ item.Company }}</div>
          <div class="table-tags">
            <span v-for="tag in parseLevelTags(item.Level)" :key="tag.code" class="result-course-tag" :class="tag.class">
              {{ tag.code }}
            </span>
          </div>
        </div>
      </div>
    </section>

    <!-- ── CTA ── -->
    <section class="cta-section">
      <div class="cta-inner">
        <p class="cta-text">ต้องการตรวจสอบสิทธิ์ใบรับรอง?</p>
        <a href="/result" class="cta-btn">ค้นหาผู้ผ่านการรับรอง →</a>
      </div>
    </section>

  </div>
</template>

<script setup>
import { computed } from 'vue'
import { sampleData, countByCourse, uniqueCompanies } from '@/data/sampleData.js'

// ── KPI ──
const totalCertified = sampleData.length

// ── Course Distribution ──
const courseDistribution = [
  { key: 'CATII',  code: 'VA-II',  name: 'Category II Vibration Analyst',  count: countByCourse.CATII,  tagClass: 'tag-va2', fillClass: 'fill-c2' },
  { key: 'CATIII', code: 'VA-III', name: 'Category III Vibration Analyst', count: countByCourse.CATIII, tagClass: 'tag-va3', fillClass: 'fill-c3' },
  { key: 'BMV',    code: 'BMV',    name: 'Basic Machinery Vibration',       count: countByCourse.BMV,    tagClass: 'tag-bmv', fillClass: 'fill-bmv' },
]

const maxCount = computed(() => Math.max(...courseDistribution.map(c => c.count), 1))
const barWidth = (count) => Math.round((count / maxCount.value) * 100)

// ── Top Companies ──
const topCompanies = computed(() => {
  const map = {}
  sampleData.forEach(d => {
    map[d.Company] = (map[d.Company] || 0) + 1
  })
  return Object.entries(map)
    .map(([name, count]) => ({ name, count }))
    .sort((a, b) => b.count - a.count)
    .slice(0, 7)
})

const rankClass = (i) => ({
  'rank-gold':   i === 0,
  'rank-silver': i === 1,
  'rank-bronze': i === 2,
  'rank-plain':  i >= 3,
})

// ── Recent Items (last 5 by ID desc) ──
const recentItems = computed(() =>
  [...sampleData].sort((a, b) => b.ID - a.ID).slice(0, 5)
)

// ✅ แก้ลำดับ: เช็ค CATIV → CATIII → CATII (ป้องกัน substring overlap)
const parseLevelTags = (level = '') => {
  const tags = []
  if (level.includes('CATIV') || level.includes('CAT IV'))
    tags.push({ code: 'VA-IV', label: 'Category IV', class: 'tag-va4' })
  if (level.includes('CATIII') || level.includes('CAT III'))
    tags.push({ code: 'VA-III', label: 'Category III', class: 'tag-va3' })
  if (/CATII(?![IV])/.test(level) || level.includes('CAT II'))
    tags.push({ code: 'VA-II', label: 'Category II', class: 'tag-va2' })
  if (level.includes('BMV'))
    tags.push({ code: 'BMV', label: 'BMV', class: 'tag-bmv' })
  return tags.length ? tags : [{ code: level, label: level, class: 'tag-default' }]
}
</script>

<style>
@import "@/assets/css/stats.css";
</style>