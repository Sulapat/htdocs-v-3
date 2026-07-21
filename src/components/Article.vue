<template>
  <!-- Hero Section: การ์ดบทความเลื่อนอัตโนมัติ (ซ้าย) + ข้อความประชาสัมพันธ์ (ขวา)
       โครงเดียวกับ hero ของ Knowledge.vue แต่ดึงเนื้อหาจากบทความ (Article) เอง -->
  <section class="articles-hero">
    <div class="hero-image" :style="{ backgroundImage: `url(${heroImage})` }"></div>
    <div class="hero-overlay"></div>
    <div class="hero-content">
      <div class="al-hero-left">
        <h1>{{ $t('articles.hero.title') }}</h1>
        <p v-html="$t('articles.hero.subtitle')"></p>
      </div>

      <div class="al-hero-right">
        <div class="al-hero-carousel" @mouseenter="stopHeroAutoplay" @mouseleave="startHeroAutoplay">
          <button class="al-hero-nav-btn" @click="goPrevHero" aria-label="Previous">
            <i class="fas fa-chevron-left"></i>
          </button>

          <transition name="al-hero-slide" mode="out-in">
            <div
              v-if="currentHeroArticle"
              :key="currentHeroArticle.id"
              class="al-hero-card"
              @click="goToDetail(currentHeroArticle.slug)"
            >
              <img :src="currentHeroArticle.image" :alt="currentHeroArticle.title" class="al-hero-card-image">
              <div class="al-hero-card-content">
                <span class="al-hero-tag">{{ currentHeroArticle.tag }}</span>
                <h3>{{ currentHeroArticle.title }}</h3>
                <p>{{ currentHeroArticle.desc }}</p>
                <span class="al-hero-readmore">{{ heroReadMoreLabel }} <i class="fas fa-arrow-right"></i></span>
              </div>
            </div>
          </transition>

          <button class="al-hero-nav-btn" @click="goNextHero" aria-label="Next">
            <i class="fas fa-chevron-right"></i>
          </button>
        </div>
      </div>
    </div>
  </section>

  <!-- Articles Section -->
  <section class="articles-section">
    <h2 class="section-title">{{ $t('articles.section.title') }}</h2>

    <!-- Loading (ครั้งแรกเท่านั้น — ยังไม่มีข้อมูลเลย) -->
    <div v-if="loading" class="loading-state">
      <i class="fas fa-spinner fa-spin"></i> <span>{{ $t('articles.loading') }}</span>
    </div>

    <!-- Error -->
    <div v-else-if="loadError" class="error-state">
      <i class="fas fa-exclamation-circle"></i> {{ loadError }}
    </div>

    <template v-else>

      <!-- แถบบอกสถานะตอนสลับภาษา: ไม่ถอดเนื้อหาเดิม แค่ dim + แถบบาง ๆ ด้านบน -->
      <div class="al-lang-switch-bar" :class="{ active: switchingLang }"></div>

      <div class="articles-grid-wrap" :class="{ 'al-content-dimmed': switchingLang }">

        <div class="articles-layout">

          <!-- Main column -->
          <div class="articles-main">
            <!-- Cards grid -->
            <div v-if="filteredArticles.length > 0" class="articles-grid">
              <div
                v-for="article in filteredArticles"
                :key="article.id"
                class="article-card"
                ref="cardRefs"
                @click="goToDetail(article.slug)"
              >
                <div class="article-image">
                  <img :src="article.image" :alt="article.title">
                  <span class="article-tag">{{ article.tag }}</span>
                </div>
                <div class="article-content">
                  <h3>{{ article.title }}</h3>
                  <p class="article-desc">{{ article.desc }}</p>
                  <div class="article-meta">
                    <span><i class="far fa-calendar"></i> {{ formatDate(article.date) }}</span>
                    <span><i class="far fa-eye"></i> {{ article.views }}</span>
                  </div>
                </div>
              </div>
            </div>

            <!-- Empty state -->
            <div v-else class="no-articles">
              <div class="no-articles-icon"><i class="fas fa-newspaper"></i></div>
              <p>{{ $t('articles.emptyState.message') }}</p>
            </div>
          </div>

          <!-- ── Sidebar ── -->
          <aside class="articles-sidebar">

            <!-- ค้นหาบทความ -->
            <div class="as-card">
              <h3 class="as-card-title">{{ $t('articles.sidebar.searchTitle') }}</h3>
              <div class="as-search-box">
                <input
                  type="text"
                  v-model="searchQuery"
                  :placeholder="$t('articles.sidebar.searchPlaceholder')"
                >
                <i class="fas fa-search"></i>
              </div>
            </div>

            <!-- หมวดหมู่บทความ (นับ dynamic จาก tag ของบทความทั้งหมด) -->
            <div v-if="categoryCounts.length" class="as-card">
              <h3 class="as-card-title">{{ $t('articles.sidebar.categoryTitle') }}</h3>
              <ul class="as-category-list">
                <li
                  v-for="cat in categoryCounts"
                  :key="cat.tag"
                  :class="{ active: activeCategory === cat.tag }"
                  @click="toggleCategory(cat.tag)"
                >
                  <i :class="categoryIcon(cat.tag)"></i>
                  <span class="as-cat-name">{{ cat.tag }}</span>
                  <span class="as-cat-count">({{ cat.count }})</span>
                </li>
              </ul>
            </div>

            <!-- บทความยอดนิยม (sort ตาม views จริงจาก API) -->
            <div v-if="popularArticles.length" class="as-card">
              <h3 class="as-card-title">{{ $t('articles.sidebar.popularTitle') }}</h3>
              <div
                v-for="(pa, idx) in popularArticles"
                :key="pa.id"
                class="as-popular-item"
                @click="goToDetail(pa.slug)"
              >
                <span class="as-popular-rank">{{ idx + 1 }}</span>
                <img class="as-popular-thumb" :src="pa.image" :alt="pa.title">
                <div class="as-popular-info">
                  <div class="as-popular-title">{{ pa.title }}</div>
                  <div class="as-popular-date">{{ formatDate(pa.date) }}</div>
                </div>
              </div>
            </div>

          </aside>

        </div><!-- /.articles-layout -->

      </div><!-- /articles-grid-wrap -->

    </template>
  </section>
</template>

<script setup>
import { ref, computed, watch, onMounted, onBeforeUnmount, nextTick } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { getArticles } from '@/services/api.js'

const { t, locale } = useI18n()
const router = useRouter()

// ── Hero background image ─────────────────
// 👉 เปลี่ยนชื่อไฟล์ตรงนี้ได้เลย (ไฟล์ต้องอยู่ใน src/assets/images/article/article_cover/)
const heroImage = new URL('@/assets/images/article/heroheader.png', import.meta.url).href

// ── API state ─────────────────────────────
const loading       = ref(true)   // โหลดครั้งแรก (ยังไม่มีข้อมูลเลย) → โชว์ full loading state ได้
const switchingLang  = ref(false) // โหลดเพราะสลับภาษา (มีข้อมูลเดิมอยู่แล้ว) → ไม่ถอดเนื้อหาเดิม กันกระพริบ
const loadError      = ref(null)

// ── Raw data from API ─────────────────────
// ✅ ข้อมูลจาก api_i18n.php เป็น flat string ตาม lang ที่ขอไปแล้ว (PHP ทำ fallback ให้แล้ว)
const articlesRaw = ref([])

// ── Load data (รับ lang ปัจจุบันจาก locale) ──
async function loadData() {
  // ถ้ามีข้อมูลเดิมอยู่แล้ว (กรณีสลับภาษา) ใช้ flag เบา ๆ
  // ไม่แตะ loading ตัวหลัก เพื่อไม่ให้ v-if="loading" เอาเนื้อหาเดิมออกจากจอ
  const hasData = articlesRaw.value.length > 0
  if (hasData) {
    switchingLang.value = true
  } else {
    loading.value = true
  }
  loadError.value = null
  try {
    const data = await getArticles(locale.value)
    articlesRaw.value = data || []
  } catch (e) {
    loadError.value = t('articles.alerts.loadError') + e.message
  } finally {
    const wasFirstLoad = loading.value
    loading.value       = false
    switchingLang.value = false
    // ✅ รัน scroll-reveal animation (fade+slide) เฉพาะตอนโหลดครั้งแรกเท่านั้น
    if (wasFirstLoad) {
      await nextTick()
      initCardAnimations()
    }
  }
}

onMounted(() => {
  loadData()
  startHeroAutoplay()
})

onBeforeUnmount(() => {
  stopHeroAutoplay()
})

// ✅ เมื่อสลับภาษา (locale ของ vue-i18n เปลี่ยน) ให้ fetch ข้อมูลบทความใหม่ตามภาษานั้น
watch(locale, () => {
  loadData()
})

// ── Article images (Vite glob) ──────────────
// glob ทุกไฟล์ใน article_cover/ ไว้ล่วงหน้า (Vite จะ bundle และ hash ชื่อให้อัตโนมัติ)
const articleCoverImages = import.meta.glob(
  '@/assets/images/article/article_cover/*.png',
  { eager: true }
)
const fallbackImage = new URL('@/assets/images/article/article_cover/cover_0001.png', import.meta.url).href

// หา URL จาก glob map โดย match ชื่อไฟล์ (case-insensitive, trim)
function findCoverByName(filename) {
  if (!filename) return null
  const lower = filename.trim().toLowerCase()
  const key = Object.keys(articleCoverImages).find(k =>
    k.split('/').pop().toLowerCase() === lower
  )
  return key ? articleCoverImages[key].default : null
}

// card ใน list ใช้ "ปก หัวหลัก.png" เป็น cover ทุกบทความ (มีบทความเดียว)
// ถ้ามีหลายบทความในอนาคต ให้เพิ่ม slug→filename mapping ตรงนี้
const SLUG_COVER_MAP = {
  '5-signal-antarai-krueangjak': 'ปก หัวหลัก.png',
  '5-warning-signs-your-machine': 'ปก หัวหลัก.png',
}

function getArticleImage(a) {
  // 1. ถ้า API ส่ง image มาและเป็น http URL ใช้เลย
  if (a.image && (a.image.startsWith('http') || a.image.startsWith('/'))) return a.image
  // 2. หาจาก slug map
  const filename = SLUG_COVER_MAP[a.slug]
  if (filename) return findCoverByName(filename) || fallbackImage
  // 3. fallback
  return fallbackImage
}

// ── Computed articles (with image fallback) ──
const _articles = computed(() =>
  articlesRaw.value.map(a => ({
    ...a,
    image: getArticleImage(a)
  }))
)

// ── Hero carousel (ฝั่งขวา): การ์ดบทความเลื่อนอัตโนมัติ ──
// ใช้บทความทั้งหมดเรียงล่าสุดก่อน ไม่ผูกกับตัวกรอง/ค้นหา (เหมือน hero ของ Knowledge.vue)
const heroIndex = ref(0)
const heroTimer = ref(null)

const heroArticles = computed(() =>
  [..._articles.value].sort((a, b) => new Date(b.date) - new Date(a.date))
)
const currentHeroArticle = computed(() => heroArticles.value[heroIndex.value] || null)

// ป้ายกำกับ "อ่านเพิ่มเติม / Read More" ผูกกับ locale โดยตรง กันเคส key แปลยังไม่มีใน articles.hero.*
const heroReadMoreLabel = computed(() => (locale.value === 'th' ? 'อ่านเพิ่มเติม' : 'Read More'))

function nextHero() {
  if (!heroArticles.value.length) return
  heroIndex.value = (heroIndex.value + 1) % heroArticles.value.length
}
function prevHero() {
  if (!heroArticles.value.length) return
  heroIndex.value = (heroIndex.value - 1 + heroArticles.value.length) % heroArticles.value.length
}
function goNextHero() {
  nextHero()
  startHeroAutoplay() // รีเซ็ตนับถอยหลังเมื่อผู้ใช้กดเอง
}
function goPrevHero() {
  prevHero()
  startHeroAutoplay()
}
function startHeroAutoplay() {
  stopHeroAutoplay()
  heroTimer.value = setInterval(nextHero, 5000) // เลื่อนอัตโนมัติทุก 5 วิ
}
function stopHeroAutoplay() {
  if (heroTimer.value) {
    clearInterval(heroTimer.value)
    heroTimer.value = null
  }
}

// ── Sidebar: ค้นหาบทความ (filter ฝั่ง frontend จาก title + desc) ──
const searchQuery = ref('')

// ── Sidebar: หมวดหมู่บทความ — นับ dynamic จาก tag ของบทความทั้งหมด
// ✅ ไม่ hardcode รายชื่อ/จำนวน หมวดหมู่เลย ถ้า backend เพิ่มบทความ tag ใหม่เข้ามา
//    ลิสต์นี้จะสร้างหมวดใหม่ขึ้นมาเองอัตโนมัติพร้อมนับจำนวนถูกต้องทันที
const categoryCounts = computed(() => {
  const counts = {}
  for (const a of _articles.value) {
    if (!a.tag) continue
    counts[a.tag] = (counts[a.tag] || 0) + 1
  }
  return Object.entries(counts)
    .map(([tag, count]) => ({ tag, count }))
    .sort((a, b) => b.count - a.count) // หมวดที่มีบทความมากสุดอยู่บนสุด
})

// ── Sidebar: filter ตามหมวดที่เลือก (คลิกซ้ำ = ยกเลิก filter) ──
const activeCategory = ref(null)
function toggleCategory(tag) {
  activeCategory.value = (activeCategory.value === tag) ? null : tag
}

// ไอคอนต่อหมวด — ถ้าไม่มีใน map จะ fallback เป็นไอคอนกลาง ๆ (รองรับ tag ใหม่ในอนาคต)
const CATEGORY_ICON_MAP = {
  'Predictive Maintenance': 'fas fa-chart-line',
  'Vibration Analysis':     'fas fa-wave-square',
  'Vibration':              'fas fa-wave-square',
  'Condition Monitoring':   'fas fa-satellite-dish',
  'Thermography':           'fas fa-thermometer-half',
  'Oil Analysis':           'fas fa-oil-can',
  'Reliability Engineering':'fas fa-cogs',
  'Maintenance Tips':       'fas fa-tools',
  'Training':               'fas fa-graduation-cap',
  'Case Study':             'fas fa-book-open',
  'Bearing':                'fas fa-circle-notch',
  'Downtime':               'fas fa-clock',
}
function categoryIcon(tag) {
  return CATEGORY_ICON_MAP[tag] || 'fas fa-tag'
}

// ── รายการบทความที่แสดงจริง (ผ่าน search + category filter) ──
const filteredArticles = computed(() => {
  let list = _articles.value
  if (activeCategory.value) {
    list = list.filter(a => a.tag === activeCategory.value)
  }
  const q = searchQuery.value.trim().toLowerCase()
  if (q) {
    list = list.filter(a =>
      (a.title || '').toLowerCase().includes(q) ||
      (a.desc  || '').toLowerCase().includes(q)
    )
  }
  return list
})

// ── Sidebar: บทความยอดนิยม — sort ตาม views จริงจาก API (ไม่ใช่ mock) ──
const popularArticles = computed(() =>
  [..._articles.value]
    .sort((a, b) => (b.views || 0) - (a.views || 0))
    .slice(0, 5)
)

// ── Date formatter (เปลี่ยนตามภาษาที่เลือก) ───────────
const MONTHS_TH = ['ม.ค.', 'ก.พ.', 'มี.ค.', 'เม.ย.', 'พ.ค.', 'มิ.ย.', 'ก.ค.', 'ส.ค.', 'ก.ย.', 'ต.ค.', 'พ.ย.', 'ธ.ค.']
const MONTHS_EN = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

function formatDate(dateStr) {
  if (!dateStr) return ''
  const d = new Date(dateStr)
  if (locale.value === 'th') {
    return `${d.getDate()} ${MONTHS_TH[d.getMonth()]} ${d.getFullYear() + 543}`
  }
  return `${MONTHS_EN[d.getMonth()]} ${d.getDate()}, ${d.getFullYear()}`
}

// ── Navigation ────────────────────────────
function goToDetail(slug) {
  router.push({ path: '/article/' + slug })
}

// ── Card scroll animation ─────────────────
const cardRefs = ref([])

function initCardAnimations() {
  const allCards = cardRefs.value || []
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
</script>

<style>
@import "@/assets/css/Articles.css";
</style>