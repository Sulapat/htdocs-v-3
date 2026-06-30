<template>
  <div class="ar-page">

    <!-- Loading (ครั้งแรกเท่านั้น — ยังไม่มี article ในมือ) -->
    <div v-if="loading" class="ar-not-found">
      <i class="fas fa-spinner fa-spin"></i>
    </div>

    <!-- Not Found -->
    <div v-else-if="!article" class="ar-not-found">
      <i class="fas fa-exclamation-circle"></i>
      <h2>{{ $t('articleDetail.notFound.title') }}</h2>
      <button class="ar-btn-back" @click="router.push('/article')">
        <i class="fas fa-arrow-left"></i> {{ $t('articleDetail.notFound.backButton') }}
      </button>
    </div>

    <template v-else>

      <!-- แถบบอกสถานะตอนสลับภาษา: ไม่เอาเนื้อหาเดิมออก แค่ dim + แสดง indicator เล็ก ๆ -->
      <div class="ar-lang-switch-bar" :class="{ active: switchingLang }">
        <i class="fas fa-spinner fa-spin"></i>
      </div>

      <div class="ar-content-wrap" :class="{ 'ar-content-dimmed': switchingLang }">

        <!-- ── BREADCRUMB ── -->
        <div class="ar-breadcrumb">
          <div class="ar-breadcrumb-inner">
            <router-link to="/">{{ $t('articleDetail.breadcrumb.home') }}</router-link>
            <span class="sep">›</span>
            <router-link to="/article">{{ $t('articleDetail.breadcrumb.articles') }}</router-link>
            <span class="sep">›</span>
            <span class="current">{{ article.title }}</span>
          </div>
        </div>

        <!-- ── HERO ── -->
        <section
          class="ar-hero"
          :style="{ backgroundImage: 'url(' + heroImage + ')' }"
        >
          <div class="ar-hero-overlay"></div>
          <div class="ar-hero-inner">
            <span class="ar-tag-hero">{{ article.tag }}</span>
            <h1 class="ar-title">{{ article.title }}</h1>
            <div class="ar-meta-row">
              <span><i class="far fa-calendar"></i> {{ formatDate(article.date) }}</span>
              <span><i class="far fa-user"></i> {{ article.author || 'PATINEER Team' }}</span>
              <span><i class="far fa-eye"></i> {{ article.views }}</span>
            </div>
          </div>
        </section>

        <!-- ── CONTENT ── -->
        <div class="ar-content">

          <!-- ── TOC ── -->
          <aside class="ar-toc-col">
            <nav class="ar-toc-box">
              <h3>{{ $t('articleDetail.toc.title') }}</h3>
              <ul class="ar-toc-list">
                <li v-for="(section, idx) in article.sections" :key="section.id">
                  <a
                    href="javascript:void(0)"
                    @click.prevent="scrollToSection(section.id)"
                    :class="{ active: activeSection === section.id }"
                  >{{ idx + 1 }}. {{ section.title }}</a>
                </li>
                <li>
                  <a
                    href="javascript:void(0)"
                    @click.prevent="scrollToSection('ar-summary')"
                    :class="{ active: activeSection === 'ar-summary' }"
                  >
                    {{ $t('articleDetail.toc.summary') }}
                  </a>
                </li>
              </ul>
            </nav>

            <div class="ar-consult-box">
              <div class="ar-consult-ico"><i class="fas fa-headset"></i></div>
              <h4>{{ $t('articleDetail.consult.title') }}</h4>
              <p>{{ $t('articleDetail.consult.desc') }}</p>
              <a
                href="https://line.me/R/ti/p/@530ddhwa?oat_content=url&ts=05281716"
                target="_blank"
                rel="noopener"
                class="ar-btn-consult"
              >{{ $t('articleDetail.consult.button') }}</a>
            </div>
          </aside>

          <!-- ── MAIN ARTICLE BODY ── -->
          <article class="ar-body">
            <p class="ar-lead">{{ article.lead }}</p>

            <div
              v-for="(section, idx) in article.sections"
              :key="section.id"
              :id="section.id"
              class="ar-step-block"
              ref="sectionRefs"
            >
              <div class="ar-step-title">
                <span class="ar-step-num">{{ idx + 1 }}</span>{{ section.title }}
              </div>

              <p v-for="(p, pIdx) in section.paragraphs" :key="pIdx">{{ p }}</p>

              <ul v-if="section.items?.length" class="ar-item-list">
                <li v-for="(item, iIdx) in section.items" :key="iIdx">{{ item }}</li>
              </ul>

              <div v-if="getSectionImage(article.slug, idx)" class="ar-img-frame">
                <img :src="getSectionImage(article.slug, idx)" :alt="section.title">
              </div>

              <div v-if="section.tip" class="ar-tip-box">
                <i class="fas fa-info-circle"></i>
                <div>
                  <div class="ar-tip-label">{{ $t('articleDetail.labels.tip') }}</div>
                  <p>{{ section.tip }}</p>
                </div>
              </div>

              <div v-if="section.warning" class="ar-warning-box">
                <i class="fas fa-exclamation-triangle"></i>
                <div>
                  <div class="ar-warn-label">{{ $t('articleDetail.labels.warning') }}</div>
                  <p>{{ section.warning }}</p>
                </div>
              </div>
            </div>

            <div id="ar-summary" class="ar-step-block ar-summary-block" ref="sectionRefs">
              <div class="ar-step-title ar-summary-title">{{ $t('articleDetail.toc.summary') }}</div>
              <p>{{ article.summary }}</p>
            </div>
          </article>

          <!-- ── SIDEBAR ── -->
          <aside class="ar-sidebar">

            <div v-if="article.pdfUrl" class="ar-sidebar-card">
              <h3>{{ $t('articleDetail.sidebar.downloadTitle') }}</h3>
              <div class="ar-pdf-row">
                <div class="ar-pdf-ico"><i class="fas fa-file-pdf"></i></div>
                <p>{{ article.pdfLabel }}</p>
              </div>
              <a :href="article.pdfUrl" target="_blank" class="ar-btn-download">
                <i class="fas fa-download"></i> {{ $t('articleDetail.sidebar.downloadButton') }}
              </a>
            </div>

            <div v-if="relatedArticles.length" class="ar-sidebar-card">
              <h3>{{ $t('articleDetail.sidebar.relatedTitle') }}</h3>
              <router-link
                v-for="rel in relatedArticles"
                :key="rel.id"
                :to="'/article/' + rel.slug"
                class="ar-related-item"
              >
                <img class="ar-related-thumb" :src="rel.image" :alt="rel.title">
                <div>
                  <div class="ar-related-title">{{ rel.title }}</div>
                  <div class="ar-related-date">{{ formatDate(rel.date) }}</div>
                </div>
              </router-link>
              <div class="ar-related-more">
                <router-link to="/article">{{ $t('articleDetail.sidebar.viewAll') }} →</router-link>
              </div>
            </div>

            <div v-if="article.tags?.length" class="ar-sidebar-card">
              <h3>{{ $t('articleDetail.sidebar.tagsTitle') }}</h3>
              <div class="ar-tag-cloud">
                <span v-for="tg in article.tags" :key="tg" class="ar-tag-chip">{{ tg }}</span>
              </div>
            </div>

          </aside>

        </div><!-- /.ar-content -->

      </div><!-- /.ar-content-wrap -->

    </template>
  </div>
</template>

<script setup>
import { ref, computed, watch, onMounted, nextTick } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { getArticleBySlug, getArticles } from '@/services/api.js'

const route  = useRoute()
const router = useRouter()
const { t, locale } = useI18n()

// ── Loading & data state ──────────────────────────────────
// loading       = โหลดครั้งแรก (ตอนยังไม่มี article เลย) → โชว์ full spinner ได้
// switchingLang = โหลดเพราะสลับภาษา (มี article เดิมอยู่แล้ว) → ไม่ซ่อนเนื้อหาเดิม กัน UI กระพริบ
const loading       = ref(true)
const switchingLang = ref(false)
// ✅ ข้อมูลจาก api_i18n.php เป็น flat string ตาม lang ที่ขอไปแล้ว (PHP ทำ fallback ให้แล้ว)
const article        = ref(null)
const relatedRaw     = ref([])

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

// mapping: slug → cover image สำหรับ hero
// mapping: slug → section index → image filename
const SLUG_COVER_MAP = {
  '5-signal-antarai-krueangjak': 'ปก หัวหลัก.png',
  '5-warning-signs-your-machine': 'ปก หัวหลัก.png',
}
const SLUG_SECTION_IMAGES = {
  '5-signal-antarai-krueangjak': {
    0: 'cover_0001.png',
    1: 'cover_0002.png',
    2: 'cover_0003.png',
  },
  '5-warning-signs-your-machine': {
    0: 'cover_0001.png',
    1: 'cover_0002.png',
    2: 'cover_0003.png',
  },
}

function getArticleImage(a) {
  if (!a) return fallbackImage
  if (a.image && (a.image.startsWith('http') || a.image.startsWith('/'))) return a.image
  const filename = SLUG_COVER_MAP[a.slug]
  return filename ? (findCoverByName(filename) || fallbackImage) : fallbackImage
}

// คืน URL รูป section ตาม slug + index (0-based)
function getSectionImage(slug, sectionIndex) {
  const map = SLUG_SECTION_IMAGES[slug]
  if (!map) return null
  const filename = map[sectionIndex]
  return filename ? findCoverByName(filename) : null
}

// ── โหลด article ตาม slug + locale ปัจจุบัน ───────────────
async function loadArticle() {
  // ถ้ามีข้อมูลเดิมอยู่แล้ว (กรณีสลับภาษา) ให้ใช้ flag เบา ๆ
  // ไม่ใช้ loading ตัวหลัก เพื่อไม่ให้ v-if="loading" สั่งเอาเนื้อหาเดิมออกจากจอ
  if (article.value) {
    switchingLang.value = true
  } else {
    loading.value = true
  }

  try {
    const [data, allArticles] = await Promise.all([
      getArticleBySlug(route.params.slug, locale.value),
      getArticles(locale.value)
    ])
    article.value = data
    relatedRaw.value = (allArticles || []).filter(a => a.slug !== route.params.slug)
  } finally {
    const wasFirstLoad = loading.value
    loading.value       = false
    switchingLang.value = false
    if (wasFirstLoad) {
      await nextTick()
      initSectionObserver()
    }
  }
}

onMounted(loadArticle)

// ── เมื่อสลับภาษา → fetch ใหม่ แต่ไม่ทำให้หน้าจอกระพริบ ──
watch(locale, loadArticle)

// ── เมื่อเปลี่ยน article (slug เปลี่ยน) → เริ่ม loading ใหม่จริง ๆ ──
watch(() => route.params.slug, () => {
  article.value = null
  loadArticle()
  window.scrollTo({ top: 0, behavior: 'smooth' })
})

// ── Hero cover image (มี fallback เดียวกับ related articles) ──
const heroImage = computed(() =>
  article.value ? getArticleImage(article.value) : ''
)

// ── Related articles (ตัดมา 3 ชิ้น พร้อมรูป) ─────────
const relatedArticles = computed(() =>
  relatedRaw.value.slice(0, 3).map(a => ({
    ...a,
    image: getArticleImage(a)
  }))
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

// ── Active section highlight (scroll spy) ──
const sectionRefs   = ref([])
const activeSection  = ref('')

function initSectionObserver() {
  const sections = sectionRefs.value || []
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        activeSection.value = entry.target.id
      }
    })
  }, { threshold: 0.3, rootMargin: '-100px 0px -40% 0px' })

  sections.forEach(el => { if (el) observer.observe(el) })
}

// ── Scroll ไปยัง section ตาม id โดยชดเชย sticky header/navbar ──
// 👉 ถ้า navbar หลักของเว็บสูงไม่เท่ากับ 90px ให้ปรับเลขนี้
const SCROLL_OFFSET = 90

function scrollToSection(id) {
  const el = document.getElementById(id)
  if (!el) return
  const top = el.getBoundingClientRect().top + window.scrollY - SCROLL_OFFSET
  window.scrollTo({ top, behavior: 'smooth' })
}
</script>

<style>
@import "@/assets/css/ArticleDetail.css";
</style>