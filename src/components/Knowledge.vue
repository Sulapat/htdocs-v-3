<template>
  <div class="Knowledge">
    <section class="knowledge-header">
      <div class="knowledge-header-inner knowledge-hero">
        <div class="hero-left">
          <div class="hero-carousel" @mouseenter="stopHeroAutoplay" @mouseleave="startHeroAutoplay">
            <button class="hero-nav-btn hero-nav-prev" @click="goPrevHero" aria-label="Previous">
              <i class="fas fa-chevron-left"></i>
            </button>

            <transition name="hero-slide" mode="out-in">
              <router-link
                  v-if="currentHeroArticle"
                  :key="currentHeroArticle.id"
                  :to="`/detail?id=${currentHeroArticle.id}`"
                  class="hero-card">
                  <img :src="currentHeroArticle.image" :alt="currentHeroArticle.title" class="hero-card-image">
                  <div class="hero-card-content">
                      <span class="article-category" :class="'cat-' + currentHeroArticle.category">
                      {{ getCategoryLabel(currentHeroArticle.category) }}
                      </span>
                      <h3>{{ currentHeroArticle.title }}</h3>
                      <p>{{ currentHeroArticle.description }}</p>
                      <span class="btn-read-more"><span>{{ $t('knowledge.readMore') }}</span> <i class="fas fa-arrow-right"></i></span>
                  </div>
              </router-link>
            </transition>

            <button class="hero-nav-btn hero-nav-next" @click="goNextHero" aria-label="Next">
              <i class="fas fa-chevron-right"></i>
            </button>
          </div>
        </div>

        <div class="hero-right">
          <h1>{{ $t('knowledge.title') }}</h1>
          <p>{{ $t('knowledge.headerText') }}</p>
        </div>
      </div>
    </section>

    <div class="filter-section">
      <div class="search-box">
        <i class="fas fa-search"></i>
        <input type="text" v-model="searchQuery" @input="searchArticles(searchQuery)" :placeholder="$t('knowledge.searchPlaceholder')">
      </div>
      <div class="filter-buttons">
        <button class="filter-btn" :class="{ active: activeCategory === 'all' }" @click="filterArticles('all')">{{ $t('knowledge.filterAll') }}</button>
        <button class="filter-btn" :class="{ active: activeCategory === 'category2' }" @click="filterArticles('category2')">Category II</button>
        <button class="filter-btn" :class="{ active: activeCategory === 'training' }" @click="filterArticles('training')">{{ $t('knowledge.filterTraining') }}</button>
        <button class="filter-btn" :class="{ active: activeCategory === 'news' }" @click="filterArticles('news')">{{ $t('knowledge.filterNews') }}</button>
      </div>
    </div>

    <div class="articles-container">
      <div class="kn-articles-grid" ref="articlesGrid">
        <router-link
            v-for="article in paginatedArticles"
            :key="article.id"
            :to="`/detail?id=${article.id}`"
            class="kn-article-card">
            <img :src="article.image" :alt="article.title">
            <div class="article-info">
                <span class="article-category" :class="'cat-' + article.category">
                {{ getCategoryLabel(article.category) }}
                </span>
                <h3>{{ article.title }}</h3>
                <p>{{ article.description }}</p>
                <div class="kn-article-meta">
                <span><i class="far fa-calendar"></i> {{ article.date }}</span>
                <span class="btn-read-more"><span>{{ $t('knowledge.readMore') }}</span> <i class="fas fa-arrow-right"></i></span>
                </div>
            </div>
        </router-link>
        <div v-if="paginatedArticles.length === 0" class="no-results">
          <p>{{ $t('knowledge.noResults') }}</p>
        </div>
      </div>

      <div class="pagination">
        <button
          v-for="page in totalPages" :key="page"
          class="page-btn"
          :class="{ active: currentPage === page }"
          @click="goToPage(page)">
          {{ page }}
        </button>
      </div>
    </div>
  </div>

  <!-- ─── ต่อท้ายด้วยบทความ ─────────────────────
       id="article" ใช้เป็นจุด scrollIntoView จากเมนู navbar (nav.vue)
       <Article /> เริ่มด้วย .articles-hero (พื้นหลังรูป) อยู่แล้ว
       จึงทำหน้าที่เป็นตัวคั่นระหว่างส่วนประชาสัมพันธ์ด้านบนกับกริดบทความด้านล่างในตัว
       ไม่ต้องเพิ่ม divider แยกต่างหาก ── -->
  <div id="article">
    <Article />
  </div>
</template>

<script>
import { getNewsList } from '@/services/api.js'
// ปรับ path ตรงนี้ให้ตรงกับตำแหน่งไฟล์จริงในโปรเจกต์ (สมมติว่าอยู่โฟลเดอร์เดียวกัน)
import Article from './Article.vue'

// Glob รูปทั้งหมดใน training
const trainingImages = import.meta.glob('@/assets/images/training/**/*.{jpg,png}', { eager: true })

function resolveImage(path) {
  // แปลง /images/training/... → /src/assets/images/training/...
  const assetPath = path.replace('/images/training/', '/src/assets/images/training/')
  const mod = trainingImages[assetPath]
  return mod ? mod.default : ''
}

function mapArticle(n) {
  let category = 'news'
  if (n.tags && n.tags.includes('Category II')) {
    category = 'category2'
  } else if (n.tags && (n.tags.includes('อบรม') || n.tags.includes('สัมมนา') || n.tags.includes('Training'))) {
    category = 'training'
  }
  return {
    id: n.id,
    title: n.title,
    description: n.shortDesc,
    image: resolveImage(n.image),
    date: n.date,
    category: category
  }
}

export default {
  name: 'Knowledge',
  components: {
    Article
  },
  data() {
    return {
      articles: [],
      filteredArticles: [],
      searchQuery: '',
      activeCategory: 'all',
      currentPage: 1,
      itemsPerPage: 6,
      // ── Hero carousel (ฝั่งซ้าย 3 ส่วน : ข้อความ PR ฝั่งขวา 1 ส่วน) ──
      heroIndex: 0,
      heroTimer: null,
      // ── สำหรับ debounce การคำนวณความสูงการ์ดใหม่ตอน resize จอ ──
      resizeTimer: null
    }
  },
  computed: {
    totalPages() {
      return Math.ceil(this.filteredArticles.length / this.itemsPerPage)
    },
    paginatedArticles() {
      const start = (this.currentPage - 1) * this.itemsPerPage
      return this.filteredArticles.slice(start, start + this.itemsPerPage)
    },
    // ข่าวทั้งหมดเรียงล่าสุดก่อน ใช้แสดงในการ์ดเลื่อนอัตโนมัติ (ไม่ผูกกับตัวกรอง/ค้นหา)
    // แสดงเฉพาะประชาสัมพันธ์ที่ "ยังไม่ผ่านไป" เท่านั้น (ดู isUpcoming ใน methods)
    heroArticles() {
      const now = new Date()
      return [...this.articles]
        .filter(a => this.isUpcoming(a.date, now))
        .sort((a, b) => b.id - a.id)
    },
    currentHeroArticle() {
      return this.heroArticles[this.heroIndex] || null
    }
  },
  async mounted() {
    await this.loadNews()
    this.startHeroAutoplay()
    window.addEventListener('resize', this.onWindowResize)
  },
  beforeUnmount() {
    this.stopHeroAutoplay()
    window.removeEventListener('resize', this.onWindowResize)
    if (this.resizeTimer) clearTimeout(this.resizeTimer)
  },
  watch: {
    // เมื่อกดปุ่มสลับภาษา → fetch news ใหม่ตาม locale ปัจจุบัน แล้ว re-apply filter/search ที่เลือกอยู่
    '$i18n.locale'() {
      this.loadNews()
    }
  },
  methods: {
    async loadNews() {
      const newsData = await getNewsList(this.$i18n.locale)
      if (!newsData) return
      this.articles = newsData.map(mapArticle)
      this.applyCurrentFilter()
      this.syncCardHeights()
    },
    applyCurrentFilter() {
      if (this.searchQuery.trim() !== '') {
        this.searchArticles(this.searchQuery)
      } else if (this.activeCategory !== 'all') {
        this.filterArticles(this.activeCategory)
      } else {
        this.filteredArticles = [...this.articles].sort((a, b) => b.id - a.id)
      }
    },
    getCategoryLabel(category) {
      // ใช้ this.$t() เพราะอยู่ใน methods (ไม่ใช่ template) ของ Options API
      const labels = {
        'category2': this.$t('knowledge.categoryLabel.category2'),
        'training': this.$t('knowledge.categoryLabel.training'),
        'news': this.$t('knowledge.categoryLabel.news')
      }
      return labels[category] || this.$t('knowledge.categoryLabel.default')
    },
    filterArticles(category) {
      this.activeCategory = category
      this.searchQuery = ''
      this.filteredArticles = category === 'all'
        ? [...this.articles].sort((a, b) => b.id - a.id)
        : this.articles.filter(a => a.category === category)
      this.currentPage = 1
      this.syncCardHeights()
    },
    searchArticles(query) {
      this.activeCategory = 'all'
      this.filteredArticles = query.trim() === ''
        ? [...this.articles].sort((a, b) => b.id - a.id)
        : this.articles.filter(a =>
            a.title.toLowerCase().includes(query.toLowerCase()) ||
            a.description.toLowerCase().includes(query.toLowerCase())
          )
      this.currentPage = 1
      this.syncCardHeights()
    },
    goToPage(page) {
      this.currentPage = page
      window.scrollTo({ top: 0, behavior: 'smooth' })
      this.syncCardHeights()
    },
    // ── Hero carousel ──
    // แปลงวันที่ "วันสุดท้ายของกิจกรรม" จากฟิลด์ date ของข่าว เพื่อใช้เทียบว่ายังไม่ผ่านไปหรือไม่
    // รองรับ format ที่ backend ส่งจริง คือวันที่ไทย + พ.ศ. เช่น:
    //   "15-20 ธันวาคม 2568"        (วันเดียวกัน เดือนเดียวกัน)
    //   "21-26 กรกฎาคม 2025"        (เจอทั้ง พ.ศ. และ ค.ศ. ปนกันในข้อมูลจริง เลยต้องเช็คทั้งคู่)
    //   "30 มีนาคม - 4 เมษายน 2569" (คาบเกี่ยวข้ามเดือน)
    // และยัง fallback ไป native Date parse เผื่อวันไหน backend เปลี่ยนไปส่งเป็น ISO ("2025-07-26")
    parseEventEndDate(dateValue) {
      if (!dateValue) return null
      const str = String(dateValue).trim()
      const THAI_MONTHS = {
        'มกราคม': 1, 'กุมภาพันธ์': 2, 'มีนาคม': 3, 'เมษายน': 4,
        'พฤษภาคม': 5, 'มิถุนายน': 6, 'กรกฎาคม': 7, 'สิงหาคม': 8,
        'กันยายน': 9, 'ตุลาคม': 10, 'พฤศจิกายน': 11, 'ธันวาคม': 12
      }
      // ปี > 2400 ถือว่าเป็น พ.ศ. (ปีปัจจุบันของ ค.ศ. ไม่มีทางเกิน 2400) แปลงเป็น ค.ศ. โดยลบ 543
      const toGregorianYear = y => (y > 2400 ? y - 543 : y)

      // ช่วงคาบเกี่ยวข้ามเดือน เช่น "30 มีนาคม - 4 เมษายน 2569"
      const crossMonth = str.match(/\d{1,2}\s+([ก-๙]+)\s*-\s*(\d{1,2})\s+([ก-๙]+)\s+(\d{4})/)
      if (crossMonth) {
        const [, , endDay, endMonthName, yearStr] = crossMonth
        const month = THAI_MONTHS[endMonthName]
        if (month) return new Date(toGregorianYear(Number(yearStr)), month - 1, Number(endDay))
      }

      // ช่วงในเดือนเดียวกัน เช่น "15-20 ธันวาคม 2568" หรือวันเดียว เช่น "20 ธันวาคม 2568"
      const sameMonth = str.match(/(\d{1,2})(?:\s*-\s*(\d{1,2}))?\s+([ก-๙]+)\s+(\d{4})/)
      if (sameMonth) {
        const [, startDay, endDay, monthName, yearStr] = sameMonth
        const month = THAI_MONTHS[monthName]
        if (month) return new Date(toGregorianYear(Number(yearStr)), month - 1, Number(endDay || startDay))
      }

      // fallback: ลอง native Date parse เผื่อเป็น ISO string
      const native = new Date(str)
      if (!isNaN(native.getTime())) return native

      return null
    },
    // เช็คว่าประชาสัมพันธ์ "ยังมาไม่ถึง/ยังไม่ผ่านไป" หรือไม่ จากวันสุดท้ายของกิจกรรม
    // ถ้าไม่มีวันที่ หรือ parse ไม่ได้ (รูปแบบไม่ตรงที่คาดไว้เลย) จะให้ "แสดงไว้ก่อน" (fail-open)
    // เพื่อไม่ให้ข่าวหายไปทั้งหมดเงียบๆ เพราะ format วันที่ไม่ตรงที่คาด
    isUpcoming(dateValue, now = new Date()) {
      const eventEnd = this.parseEventEndDate(dateValue)
      if (!eventEnd) return true
      const today = new Date(now.getFullYear(), now.getMonth(), now.getDate())
      const eventDay = new Date(eventEnd.getFullYear(), eventEnd.getMonth(), eventEnd.getDate())
      return eventDay >= today
    },
    nextHero() {
      if (!this.heroArticles.length) return
      this.heroIndex = (this.heroIndex + 1) % this.heroArticles.length
    },
    prevHero() {
      if (!this.heroArticles.length) return
      this.heroIndex = (this.heroIndex - 1 + this.heroArticles.length) % this.heroArticles.length
    },
    goNextHero() {
      this.nextHero()
      this.startHeroAutoplay() // รีเซ็ตนับถอยหลังเมื่อผู้ใช้กดเอง
    },
    goPrevHero() {
      this.prevHero()
      this.startHeroAutoplay()
    },
    startHeroAutoplay() {
      this.stopHeroAutoplay()
      this.heroTimer = setInterval(this.nextHero, 5000) // เลื่อนอัตโนมัติทุก 5 วิ
    },
    stopHeroAutoplay() {
      if (this.heroTimer) {
        clearInterval(this.heroTimer)
        this.heroTimer = null
      }
    },
    // ── ปรับความสูงการ์ดให้เท่ากับการ์ดที่ยาวที่สุดเสมอ (dynamic ไม่ fix ตัวเลขตายตัว) ──
    // เรียกทุกครั้งที่รายการการ์ดที่แสดงเปลี่ยน (โหลดข่าวใหม่/เปลี่ยนภาษา/กรอง/ค้นหา/เปลี่ยนหน้า)
    // และตอน resize จอ เพราะความกว้างที่เปลี่ยนไปทำให้ข้อความตัดบรรทัดต่างกัน ความสูงจึงต้องคำนวณใหม่
    async syncCardHeights() {
      await this.$nextTick()
      const grid = this.$refs.articlesGrid
      if (!grid) return
      const cards = grid.querySelectorAll('.kn-article-card')
      if (!cards.length) return

      // รีเซ็ตเป็น auto ก่อน เพื่อวัดความสูงตามเนื้อหาจริงของแต่ละใบ
      // (ไม่งั้นค่าความสูงเก่าที่เคยตั้งไว้จะทำให้วัดค่าผิด)
      cards.forEach(card => { card.style.height = 'auto' })

      let maxHeight = 0
      cards.forEach(card => {
        maxHeight = Math.max(maxHeight, card.offsetHeight)
      })

      cards.forEach(card => {
        card.style.height = maxHeight + 'px'
      })
    },
    onWindowResize() {
      // debounce ป้องกันคำนวณรัวๆ ระหว่างลากขยับขนาดหน้าต่าง
      if (this.resizeTimer) clearTimeout(this.resizeTimer)
      this.resizeTimer = setTimeout(() => {
        this.syncCardHeights()
      }, 200)
    }
  }
}
</script>

<style>
@import "@/assets/css/Knowledge.css";
</style>