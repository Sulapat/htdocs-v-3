<template>
  <div class="Knowledge">

    <!-- ─── Header ──────────────────────────────── -->
    <section class="knowledge-header">
      <p>{{ $t('knowledge.headerText') }}</p>
    </section>

    <!-- ─── Filter Section ──────────────────────── -->
    <div class="filter-section">
      <div class="search-box">
        <i class="fas fa-search"></i>
        <input
          type="text"
          v-model="searchQuery"
          :placeholder="$t('knowledge.searchPlaceholder')"
        >
      </div>
      <div class="filter-buttons">
        <button
          class="filter-btn"
          :class="{ active: activeCategory === 'all' }"
          @click="filterArticles('all')"
        >{{ $t('knowledge.filterAll') }}</button>

        <button
          class="filter-btn"
          :class="{ active: activeCategory === 'Category II' }"
          @click="filterArticles('Category II')"
        >{{ $t('knowledge.categoryLabel.category2') }}</button>

        <button
          class="filter-btn"
          :class="{ active: activeCategory === 'training' }"
          @click="filterArticles('training')"
        >{{ $t('knowledge.filterTraining') }}</button>

        <button
          class="filter-btn"
          :class="{ active: activeCategory === 'news' }"
          @click="filterArticles('news')"
        >{{ $t('knowledge.filterNews') }}</button>
      </div>
    </div>

    <!-- ─── Loading ──────────────────────────────── -->
    <div v-if="loading" class="loading-state">
      <i class="fas fa-spinner fa-spin"></i>
    </div>

    <!-- ─── Articles ─────────────────────────────── -->
    <div v-else class="articles-container">

      <!-- dim overlay เมื่อสลับภาษา (มีข้อมูลเดิมอยู่แล้ว) -->
      <div class="kn-lang-switch-bar" :class="{ active: switchingLang }"></div>

      <div class="articles-grid" :class="{ 'kn-content-dimmed': switchingLang }">

        <template v-if="paginatedArticles.length > 0">
          <div
            v-for="article in paginatedArticles"
            :key="article.id"
            class="article-card"
          >
            <img :src="article.image" :alt="article.title">
            <div class="article-info">
              <span class="article-category">{{ getCategoryLabel(article.category) }}</span>
              <h3>{{ article.title }}</h3>
              <p>{{ article.shortDesc }}</p>
              <div class="article-meta">
                <span><i class="far fa-calendar"></i> {{ article.date }}</span>
              </div>
              <router-link :to="`/detail?id=${article.id}`" class="btn-read-more">
                {{ $t('knowledge.readMore') }} <i class="fas fa-arrow-right"></i>
              </router-link>
            </div>
          </div>
        </template>

        <div v-else class="no-results">
          <p>{{ $t('knowledge.noResults') }}</p>
        </div>

      </div><!-- /articles-grid -->

      <!-- ─── Pagination ──────────────────────────── -->
      <div class="pagination">
        <button
          v-for="page in totalPages"
          :key="page"
          class="page-btn"
          :class="{ active: currentPage === page }"
          @click="goToPage(page)"
        >{{ page }}</button>
      </div>

    </div><!-- /articles-container -->

  </div>
</template>

<script setup>
import { ref, computed, watch } from 'vue'
import { useI18n } from 'vue-i18n'

const { t, locale } = useI18n()

// ── API base ────────────────────────────────────
const BASE_URL = '/backend/api/api_i18n.php'

// ── State ───────────────────────────────────────
const articlesRaw   = ref([])   // ข้อมูลจาก API ตามภาษาปัจจุบัน
const loading       = ref(true) // โหลดครั้งแรก → แสดง spinner เต็ม
const switchingLang = ref(false)// สลับภาษา → dim เบาๆ ไม่ถอดเนื้อหา

const searchQuery   = ref('')
const activeCategory = ref('all')
const currentPage   = ref(1)
const itemsPerPage  = 6

// ── Fetch news from API ──────────────────────────
async function loadData() {
  const hasData = articlesRaw.value.length > 0
  if (hasData) {
    switchingLang.value = true   // มีข้อมูลเดิม → dim แทน
  } else {
    loading.value = true
  }

  try {
    const url = `${BASE_URL}?action=news&lang=${locale.value}`
    const res  = await fetch(url)
    if (!res.ok) throw new Error(`HTTP ${res.status}`)
    const data = await res.json()
    articlesRaw.value = data
  } catch (e) {
    console.error('Portfolio: โหลดข่าวไม่สำเร็จ', e)
  } finally {
    loading.value       = false
    switchingLang.value = false
  }
}

// โหลดครั้งแรก
loadData()

// เมื่อสลับภาษา → re-fetch
watch(locale, () => {
  searchQuery.value    = ''
  activeCategory.value = 'all'
  currentPage.value    = 1
  loadData()
})

// ── Category mapping ─────────────────────────────
// tags[] จาก API → internal category key
function resolveCategory(tags = []) {
  if (!Array.isArray(tags)) return 'news'
  // ตรวจ tag ที่เป็น "category II" / "Category II" แบบ case-insensitive
  if (tags.some(tag => tag.toLowerCase().includes('category ii'))) return 'Category II'
  // ตรวจ tag ที่เป็น 'อบรม' หรือ 'training'
  if (tags.some(tag => ['อบรม', 'training'].includes(tag.toLowerCase()))) return 'training'
  return 'news'
}

// articles คำนวณจาก raw data
const articles = computed(() =>
  articlesRaw.value.map(n => ({
    id:       n.id,
    title:    n.title,
    shortDesc: n.shortDesc,
    image:    n.image,
    date:     n.date,
    category: resolveCategory(n.tags),
  }))
)

// ── Filter & Search ──────────────────────────────
const filteredArticles = computed(() => {
  let list = [...articles.value].sort((a, b) => b.id - a.id)

  // กรองหมวดหมู่
  if (activeCategory.value !== 'all') {
    list = list.filter(a => a.category === activeCategory.value)
  }

  // กรองคำค้นหา
  const q = searchQuery.value.trim().toLowerCase()
  if (q) {
    list = list.filter(a =>
      a.title.toLowerCase().includes(q) ||
      (a.shortDesc ?? '').toLowerCase().includes(q)
    )
  }

  return list
})

// ── Pagination ───────────────────────────────────
const totalPages = computed(() =>
  Math.ceil(filteredArticles.value.length / itemsPerPage)
)

const paginatedArticles = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage
  return filteredArticles.value.slice(start, start + itemsPerPage)
})

// ── Actions ──────────────────────────────────────
function filterArticles(category) {
  activeCategory.value = category
  searchQuery.value    = ''
  currentPage.value    = 1
}

// searchQuery เป็น v-model → watch คำนวณอัตโนมัติผ่าน computed
// รีเซต pagination เมื่อค้นหา
watch(searchQuery, () => {
  activeCategory.value = 'all'
  currentPage.value    = 1
})

function goToPage(page) {
  currentPage.value = page
  window.scrollTo({ top: 0, behavior: 'smooth' })
}

// ── i18n category labels ─────────────────────────
function getCategoryLabel(category) {
  const map = {
    'Category II': t('knowledge.categoryLabel.category2'),
    'training':    t('knowledge.categoryLabel.training'),
    'news':        t('knowledge.categoryLabel.news'),
  }
  return map[category] ?? t('knowledge.categoryLabel.default')
}
</script>


<style>
@import "@/assets/css/Portfolio.css";
</style>