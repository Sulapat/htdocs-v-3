<template>
  <div class="home">
    <!-- Hero Section -->
    <section class="hero">
      <div class="hero-content">
        <div class="hero-text">
          <h1 v-html="$t('service.hero.title')"></h1>
          <p v-html="$t('service.hero.subtitle')"></p>
          <div class="hero-stats">
            <div class="stat-box">
              <h3>200+</h3>
              <p>{{ $t('service.hero.statProjects') }}</p>
            </div>
            <div class="stat-box">
              <h3>10+</h3>
              <p>{{ $t('service.hero.statYears') }}</p>
            </div>
          </div>
        </div>
        <div class="hero-image">
          <img src="@/assets/images/data/AboutUs2.jpg" alt="Team">
        </div>
      </div>
    </section>

    <!-- About Section -->
    <section id="about" class="about-section">
      <div class="about-grid">
        <div class="about-image">
          <img src="@/assets/images/data/AboutUs.jpg" alt="About Us">
        </div>
        <div class="about-content">
          <h2>{{ $t('service.about.title') }}</h2>
          <h3>{{ $t('service.about.subtitle') }}</h3>
          <p>{{ $t('service.about.description') }}</p>
          <div class="about-features">
            <div class="feature-item">
              <div class="feature-icon"><i class="fas fa-check-circle"></i></div>
              <p>{{ $t('service.about.feature1') }}</p>
            </div>
            <div class="feature-item">
              <div class="feature-icon"><i class="fas fa-check-circle"></i></div>
              <p>{{ $t('service.about.feature2') }}</p>
            </div>
            <div class="feature-item">
              <div class="feature-icon"><i class="fas fa-check-circle"></i></div>
              <p>{{ $t('service.about.feature3') }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Gallery Section — หัวข้อใหญ่ > หัวข้อย่อย > รูปภาพ (แสดงตรงในหน้า ไม่ต้องกดเข้าไปดูอีกชั้น) -->
    <section id="gallery" class="gallery-section">
      <h2 class="gallery-heading">{{ galleryHeading }}</h2>
      <p class="gallery-subheading">{{ gallerySubheading }}</p>

      <div v-for="category in galleryCategories" :key="category.slug" class="gallery-category">
        <h2 class="gallery-category-title">{{ category.title }}</h2>

        <div v-for="item in category.items" :key="item.slug" class="gallery-subcategory">
          <h3 class="gallery-subcategory-title">{{ item.title }}</h3>

          <div v-if="item.images.length" class="gallery-photo-grid">
            <div
              v-for="(column, colIdx) in masonryColumnsMap[`${category.slug}__${item.slug}`]"
              :key="colIdx"
              class="gallery-column"
            >
              <div v-for="(img, idx) in column" :key="idx" class="gallery-photo">
                <img :src="img" :alt="`${item.title} ${idx + 1}`" loading="lazy">
              </div>
            </div>
          </div>
          <div v-else class="gallery-photo-grid gallery-photo-grid--empty">
            <div class="gallery-photo-placeholder">
              <i class="fas fa-image"></i>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section">
      <div class="stats-content">
        <div class="stat-item">
          <h2>10+</h2>
          <p>{{ $t('service.stats.yearsInBusiness') }}</p>
        </div>
        <div class="stat-item">
          <h2>150+</h2>
          <p>{{ $t('service.stats.clientsServed') }}</p>
        </div>
        <div class="stat-item">
          <h2>500+</h2>
          <p>{{ $t('service.stats.traineesCertified') }}</p>
        </div>
      </div>
    </section>

    <!-- Featured Section -->
    <section class="featured-section">
      <h1 class="section-title">{{ $t('service.featured.sectionTitle') }}</h1>
      <div class="featured-container" @mouseenter="stopFeaturedAutoplay" @mouseleave="startFeaturedAutoplay">
        <div class="featured-track" ref="featuredTrack">
          <div v-for="news in sortedNews" :key="news.id" class="featured-card">
            <div class="featured-image">
              <img :src="news.image" :alt="news.title" loading="lazy">
            </div>
            <div class="featured-content">
              <h3>{{ news.title }}</h3>
              <p>{{ news.shortDesc }}</p>
              <router-link :to="`/detail?id=${news.id}`" class="btn-featured">
                <span>{{ $t('service.featured.readMore') }}</span> <i class="fas fa-arrow-right"></i>
              </router-link>
            </div>
          </div>
        </div>
        <div class="nav-buttons">
          <button class="nav-btn" @click="goPrevFeatured">&lt;</button>
          <button class="nav-btn" @click="goNextFeatured">&gt;</button>
        </div>
      </div>
    </section>

    <!-- Partners Section -->
    <section class="partners-section">
      <h3 class="partners-title">Our Clients</h3>
      <div class="partners-gallery-wrapper">
        <div class="partners-gallery">
          <img src="@/assets/images/data/Logo_partners/Atsumitec.jpg" alt="Atsumitec">
          <img src="@/assets/images/data/Logo_partners/B_G.jpg" alt="B.G">
          <img src="@/assets/images/data/Logo_partners/BD_th.jpg" alt="BD Thailand">
          <img src="@/assets/images/data/Logo_partners/BDMS.jpg" alt="BDMS">
          <img src="@/assets/images/data/Logo_partners/Boon.jpg" alt="Boon">
          <img src="@/assets/images/data/Logo_partners/Daikin.jpg" alt="Daikin">
          <img src="@/assets/images/data/Logo_partners/Egat.jpg" alt="EGAT">
          <img src="@/assets/images/data/Logo_partners/enfourt.jpg" alt="Enfourt">
          <img src="@/assets/images/data/Logo_partners/GCME.jpg" alt="GCME">
          <img src="@/assets/images/data/Logo_partners/Griffith.jpg" alt="Griffith">
          <img src="@/assets/images/data/Logo_partners/Gulf.jpg" alt="Gulf">
          <img src="@/assets/images/data/Logo_partners/GYPROC.png" alt="GYPROC">
          <img src="@/assets/images/data/Logo_partners/IHI.jpg" alt="IHI">
          <img src="@/assets/images/data/Logo_partners/Indoama.jpg" alt="Indoama">
          <img src="@/assets/images/data/Logo_partners/Is_software.jpg" alt="IS Software">
          <img src="@/assets/images/data/Logo_partners/JSJS.jpg" alt="JSJS">
          <img src="@/assets/images/data/Logo_partners/KI.jpg" alt="KI">
          <img src="@/assets/images/data/Logo_partners/KKF.jpg" alt="KKF">
          <img src="@/assets/images/data/Logo_partners/Mars.jpg" alt="Mars">
          <img src="@/assets/images/data/Logo_partners/Mitr_phol.jpg" alt="Mitr Phol">
          <img src="@/assets/images/data/Logo_partners/Nestle.jpg" alt="Nestle">
          <img src="@/assets/images/data/Logo_partners/Npp.jpg" alt="Npp">
          <img src="@/assets/images/data/Logo_partners/Nteq.jpg" alt="Nteq">
          <img src="@/assets/images/data/Logo_partners/PAE.jpg" alt="PAE">
          <img src="@/assets/images/data/Logo_partners/Pttep.jpg" alt="PTTEP">
          <img src="@/assets/images/data/Logo_partners/repo.jpg" alt="Repo">
          <img src="@/assets/images/data/Logo_partners/sahakol.png" alt="Sahakol">
          <img src="@/assets/images/data/Logo_partners/SCG.jpg" alt="SCG">
          <img src="@/assets/images/data/Logo_partners/seckisui.png" alt="Seckisui">
          <img src="@/assets/images/data/Logo_partners/SKF.jpg" alt="SKF">
          <img src="@/assets/images/data/Logo_partners/Sotus.jpg" alt="Sotus">
          <img src="@/assets/images/data/Logo_partners/SSG.jpg" alt="SSG">
          <img src="@/assets/images/data/Logo_partners/SSL.jpg" alt="SSL">
          <img src="@/assets/images/data/Logo_partners/STM.jpg" alt="STM">
          <img src="@/assets/images/data/Logo_partners/Thaioil.jpg" alt="Thaioil">
          <img src="@/assets/images/data/Logo_partners/Thanakorn.jpg" alt="Thanakorn">
          <img src="@/assets/images/data/Logo_partners/TRANE.jpg" alt="TRANE">
          <img src="@/assets/images/data/Logo_partners/Transitions.jpg" alt="Transitions">
          <img src="@/assets/images/data/Logo_partners/TTM.jpg" alt="TTM">
          <img src="@/assets/images/data/Logo_partners/WHA.jpg" alt="WHA">
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import { getNewsList } from '@/services/api.js'

const trainingImages = import.meta.glob('@/assets/images/training/**/*.{jpg,png}', { eager: true })

function resolveImage(path) {
  const assetPath = path.replace('/images/training/', '/src/assets/images/training/')
  const mod = trainingImages[assetPath]
  return mod ? mod.default : ''
}

// ── Service Gallery: โหลดรูปทั้งหมดจาก src/assets/images/gallery/<หมวดใหญ่>/<หมวดย่อย>/*
// วางไฟล์รูปตามโครงสร้างจริงบนดิสก์ได้เลย เช่น
//   src/assets/images/gallery/training_academic_seminar/CBM/cbm_01.jpg
//   src/assets/images/gallery/vibration_analysis/railway_locomotive/1.jpg
// ไม่ต้องแก้โค้ด ระบบจะดึงมาแสดงอัตโนมัติ (เรียงตามชื่อไฟล์) รองรับจำนวนรูปเท่าไหร่ก็ได้ต่อหัวข้อย่อย
const galleryImages = import.meta.glob(
  '@/assets/images/gallery/**/*.{jpg,jpeg,png,webp,JPG,JPEG,PNG,WEBP}',
  { eager: true }
)

function getGalleryImages(categorySlug, itemSlug) {
  return Object.keys(galleryImages)
    .filter(path => path.includes(`/images/gallery/${categorySlug}/${itemSlug}/`))
    .sort((a, b) => a.localeCompare(b, undefined, { numeric: true }))
    .map(path => galleryImages[path].default)
}

export default {
  name: 'Service',
  data() {
    return {
      newsData: [],
      currentFeaturedIndex: 0,
      featuredTimer: null,
      // ── Masonry gallery: อัตราส่วนสูง/กว้างจริงของแต่ละรูป (เติมทีหลังตอนโหลดเสร็จ)
      // และจำนวนคอลัมน์ปัจจุบัน (ผูกกับ breakpoint เดียวกับที่เคยใช้ column-count)
      imageAspectRatios: {},
      galleryColumnCount: 3
    }
  },
  computed: {
    galleryHeading() {
      return this.$t('service.gallery.heading')
    },
    gallerySubheading() {
      return this.$t('service.gallery.subheading')
    },
    // 2 หัวข้อใหญ่ / 6 หัวข้อย่อย — ข้อความ (title) มาจาก th.json / en.json
    // ที่ key service.gallery.categories.<categoryKey>.items.<itemKey>.title
    // ส่วนรูปภาพจะถูกดึงอัตโนมัติจาก src/assets/images/gallery/<categorySlug>/<itemSlug>/
    // slug ต้องตรงกับชื่อโฟลเดอร์จริงบนดิสก์เป๊ะๆ (รวมตัวพิมพ์เล็ก/ใหญ่)
    galleryCategories() {
      const structure = [
        {
          categoryKey: 'vibrationAnalysis',
          slug: 'vibration_analysis',
          items: [
            { itemKey: 'railwayLocomotive', slug: 'railway_locomotive' },
            { itemKey: 'industrialMachinery', slug: 'Industrial_machinery' }
          ]
        },
        {
          categoryKey: 'trainingSeminar',
          slug: 'training_academic_seminar',
          items: [
            { itemKey: 'cbm', slug: 'CBM' },
            { itemKey: 'mtc', slug: 'MTC' },
            { itemKey: 'inHouseTraining', slug: 'in_house_training' },
            { itemKey: 'publicTraining', slug: 'public_training' }
          ]
        }
      ]

      return structure.map(category => ({
        slug: category.slug,
        title: this.$t(`service.gallery.categories.${category.categoryKey}.title`),
        items: category.items.map(item => ({
          slug: item.slug,
          title: this.$t(`service.gallery.categories.${category.categoryKey}.items.${item.itemKey}.title`),
          images: getGalleryImages(category.slug, item.slug)
        }))
      }))
    },
    // ── จัดรูปแต่ละหัวข้อย่อยลงคอลัมน์แบบ Masonry จริง (ไหลขึ้นเติมที่ว่าง) ──
    // ต่างจาก CSS column-count เดิมตรงที่รูปถัดไปจะถูกส่งไปคอลัมน์ที่ "เตี้ยที่สุด" ในขณะนั้นเสมอ
    // โดยใช้อัตราส่วนสูง/กว้างจริงของภาพ (imageAspectRatios) ในการประมาณความสูง
    masonryColumnsMap() {
      const map = {}
      this.galleryCategories.forEach(category => {
        category.items.forEach(item => {
          map[`${category.slug}__${item.slug}`] =
            this.buildMasonryColumns(item.images, this.galleryColumnCount)
        })
      })
      return map
    },
    // แสดงเฉพาะประชาสัมพันธ์ที่ "ยังไม่ผ่านไป" เท่านั้น (ดู isUpcoming ใน methods)
    sortedNews() {
      const now = new Date()
      return [...this.newsData]
        .filter(n => this.isUpcoming(n.date, now))
        .sort((a, b) => b.id - a.id)
    }
  },
  methods: {
    // ── Masonry gallery ──────────────────────────────────────────────
    // จัดรูปลงคอลัมน์แบบ greedy: รูปถัดไปเสมอไปคอลัมน์ที่ความสูงสะสมน้อยที่สุด ณ ขณะนั้น
    // ทำให้ภาพ "ไหลขึ้น" ไปเติมช่องว่าง แทนที่จะค้างเป็นแถวว่างแบบ column-count เดิม
    buildMasonryColumns(images, colCount) {
      const count = Math.max(1, colCount)
      const heights = new Array(count).fill(0)
      const columns = Array.from({ length: count }, () => [])
      images.forEach(src => {
        let shortestIdx = 0
        for (let i = 1; i < count; i++) {
          if (heights[i] < heights[shortestIdx]) shortestIdx = i
        }
        columns[shortestIdx].push(src)
        // ใช้อัตราส่วนจริงถ้าโหลดเสร็จแล้ว ไม่งั้นประมาณเป็น 4:3 ไปก่อน (จะรีเฟรชอัตโนมัติเมื่อโหลดเสร็จ)
        const ratio = this.imageAspectRatios[src] || 0.75
        heights[shortestIdx] += ratio
      })
      return columns
    },
    // เตรียม key ทุกภาพไว้ล่วงหน้าเป็น null (ให้ reactive tracking จับ key ได้ตั้งแต่แรก)
    // แล้วค่อยโหลดภาพจริงเพื่อไปแทนที่ด้วยอัตราส่วนสูง/กว้างจริง
    initImageAspectRatios() {
      const ratios = {}
      this.galleryCategories.forEach(category => {
        category.items.forEach(item => {
          item.images.forEach(src => {
            if (!(src in ratios)) ratios[src] = null
          })
        })
      })
      this.imageAspectRatios = ratios
      Object.keys(ratios).forEach(src => this.loadImageAspect(src))
    },
    loadImageAspect(src) {
      const img = new Image()
      img.onload = () => {
        if (img.naturalWidth > 0) {
          this.imageAspectRatios[src] = img.naturalHeight / img.naturalWidth
        }
      }
      img.src = src
    },
    // จำนวนคอลัมน์ผูกกับ breakpoint เดิมที่เคยใช้กับ column-count (768px = 2 คอลัมน์, 480px = 1 คอลัมน์)
    updateGalleryColumnCount() {
      const w = window.innerWidth
      this.galleryColumnCount = w <= 480 ? 1 : (w <= 768 ? 2 : 3)
    },
    // แปลงวันที่ "วันสุดท้ายของกิจกรรม" จากฟิลด์ date ของข่าว เพื่อใช้เทียบว่ายังไม่ผ่านไปหรือไม่
    // รองรับ format ที่ backend ส่งจริง คือวันที่ไทย + พ.ศ. เช่น:
    //   "15-20 ธันวาคม 2568"        (วันเดียวกัน เดือนเดียวกัน)
    //   "21-26 กรกฎาคม 2025"        (เจอทั้ง พ.ศ. และ ค.ศ. ปนกันในข้อมูลจริง เลยต้องเช็คทั้งคู่)
    //   "30 มีนาคม - 4 เมษายน 2569" (คาบเกี่ยวข้ามเดือน)
    // และยัง fallback ไป native Date parse เผื่อวันไหน backend เปลี่ยนไปส่งเป็น ISO ("2025-07-26")
    // logic เดียวกับใน Knowledge.vue เพื่อให้พฤติกรรมตรงกันทั้งสองหน้า
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
    // ── Featured carousel: หมุนวนอัตโนมัติเหมือนหน้าประชาสัมพันธ์ (Knowledge.vue) ──
    prevFeatured() {
      if (!this.sortedNews.length) return
      this.currentFeaturedIndex =
        (this.currentFeaturedIndex - 1 + this.sortedNews.length) % this.sortedNews.length
      this.updateCarousel()
    },
    nextFeatured() {
      if (!this.sortedNews.length) return
      this.currentFeaturedIndex = (this.currentFeaturedIndex + 1) % this.sortedNews.length
      this.updateCarousel()
    },
    goPrevFeatured() {
      this.prevFeatured()
      this.startFeaturedAutoplay() // รีเซ็ตนับถอยหลังเมื่อผู้ใช้กดเอง
    },
    goNextFeatured() {
      this.nextFeatured()
      this.startFeaturedAutoplay()
    },
    startFeaturedAutoplay() {
      this.stopFeaturedAutoplay()
      if (this.sortedNews.length <= 1) return // การ์ดเดียวหรือไม่มีการ์ด ไม่ต้องเลื่อน
      this.featuredTimer = setInterval(this.nextFeatured, 5000) // เลื่อนอัตโนมัติทุก 5 วิ
    },
    stopFeaturedAutoplay() {
      if (this.featuredTimer) {
        clearInterval(this.featuredTimer)
        this.featuredTimer = null
      }
    },
    updateCarousel() {
      const track = this.$refs.featuredTrack
      if (!track) return
      const card = track.querySelector('.featured-card')
      if (!card) return
      const cardWidth = card.offsetWidth
      const gap = 30
      track.style.transform = `translateX(-${this.currentFeaturedIndex * (cardWidth + gap)}px)`
    },
    initPartnersScroll() {
      const galleryTrack = this.$el.querySelector('.partners-gallery')
      if (!galleryTrack) return
      // ⚠️ แก้เหมือน index.vue: เดิมใช้ requestAnimationFrame วนตลอดไปตั้งแต่
      // mounted() ไม่มีวันหยุด แถม clone รูปไว้ 4 ชุด (~200 รูปที่มี filter:
      // grayscale ค้างอยู่) แล้วสั่ง style.transform ทาง JS ทุกเฟรม → main thread
      // ทำงานหนักต่อเนื่องตลอดเวลา เปลี่ยนมาใช้ CSS animation (@keyframes
      // scrollPartners ที่มีอยู่แล้วในไฟล์ CSS) แทน ให้ browser คอมโพสิตเอง
      const images = Array.from(galleryTrack.children)
      images.forEach(img => galleryTrack.appendChild(img.cloneNode(true)))
      galleryTrack.classList.add('partners-gallery--animated')
    },
    initScrollAnimations() {
      const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            entry.target.style.opacity = '1'
            entry.target.style.transform = 'translateY(0)'
          }
        })
      }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' })
      this.$el.querySelectorAll('.service-card, .portfolio-item').forEach(el => {
        el.style.opacity = '0'
        el.style.transform = 'translateY(30px)'
        el.style.transition = 'all 0.6s ease-out'
        observer.observe(el)
      })
    },
    async loadNews() {
      const data = await getNewsList(this.$i18n.locale)
      if (!data) return
      this.newsData = data.map(n => ({ ...n, image: resolveImage(n.image) }))
    }
  },
  watch: {
    // เมื่อกดปุ่มสลับภาษา → fetch news ใหม่ตาม locale ปัจจุบัน
    '$i18n.locale'() {
      this.loadNews()
    },
    // รายการเปลี่ยน (เช่น loadNews ใหม่) → รีเซ็ต index กันชี้เกินขอบเขต แล้วรีเซ็ต autoplay
    sortedNews() {
      this.currentFeaturedIndex = 0
      this.$nextTick(() => this.updateCarousel())
      this.startFeaturedAutoplay()
    }
  },
  created() {
    this.updateGalleryColumnCount()
    this.initImageAspectRatios()
  },
  async mounted() {
    await this.loadNews()
    this.initPartnersScroll()
    this.initScrollAnimations()
    this.startFeaturedAutoplay()
    window.addEventListener('resize', this.updateCarousel)
    window.addEventListener('resize', this.updateGalleryColumnCount)
  },
  beforeUnmount() {
    this.stopFeaturedAutoplay()
    window.removeEventListener('resize', this.updateCarousel)
    window.removeEventListener('resize', this.updateGalleryColumnCount)
  }
}
</script>

<style>
/* ต้อง import แบบนี้ (style block ปกติ ไม่ scoped) ห้ามย้ายไป import ผ่าน JS
   ใน <script> อีก — ดูเหตุผลเดียวกับ index.vue/TestResult.vue */
@import "@/assets/css/service.css";
</style>