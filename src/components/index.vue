<template>
  <div class="home">
    <!-- ============================================
         1) HERO SECTION — การ์ดสไลด์โชว์ผลงาน (เดิมจาก index.vue)
         ============================================ -->
    <section class="hero">
      <div class="morphing-bg"></div>
      <div class="morphing-bg-2"></div>
      <div class="hero-container">
        <div class="hero-left">
          <h1 v-html="$t('home.hero.title')"></h1>
          <p>{{ $t('home.hero.description') }}</p>
          <a href="#service" class="cta-button" @click.prevent="scrollToService">{{ $t('home.hero.ctaButton') }}</a>
        </div>

        <!-- Card Slider -->
        <div class="hero-right card-slider">
          <div class="slider__holder">
            <div v-for="n in 8" :key="n" class="slider__item" :style="getCardStyle(n)">
              <img :src="photos[n-1]" :alt="`Service ${n}`">
            </div>
          </div>

          <div class="bullets">
            <span v-for="n in 8" :key="n"
              class="bullets__item"
              :class="{ 'bullets__item--active': n === currentSlide }"
              @click="selectSlide(n)">
            </span>
          </div>
        </div>
      </div>
    </section>

    <!-- ============================================
         2) SERVICE SECTION — บริการของเรา (จุดที่ navbar เลื่อนลงมาหา)
         ============================================ -->
    <section id="service-features" class="service-section">
      <h2 class="section-title">{{ $t('home.services.sectionTitle') }}</h2>
      <div class="services-grid">
        <div class="service-card">
          <div class="service-icon"><i class="fas fa-headset"></i></div>
          <h3>{{ $t('home.services.consultTitle') }}</h3>
          <p>{{ $t('home.services.consultDesc') }}</p>
        </div>
        <div class="service-card">
          <div class="service-icon"><i class="fas fa-tools"></i></div>
          <h3>{{ $t('home.services.serviceTitle') }}</h3>
          <p>{{ $t('home.services.serviceDesc') }}</p>
        </div>
        <div class="service-card">
          <div class="service-icon"><i class="fas fa-award"></i></div>
          <h3>{{ $t('home.services.trainingTitle') }}</h3>
          <p>{{ $t('home.services.trainingDesc') }}</p>
        </div>
      </div>
    </section>

    <!-- ============================================
         3) VI SECTION — ATINEER & Vibration Institute
         ============================================ -->
    <section class="about-vi">
      <div class="logo-container">
        <div class="logo-box">
          <img src="@/assets/images/data/logo_Patineer-removebg.png" alt="Patineer Logo">
        </div>
        <div class="logo-divider">&amp;</div>
        <div class="logo-box">
          <img src="@/assets/images/data/international-rep.jpg" alt="Vibration Institute Logo">
        </div>
      </div>
      <h1 v-html="$t('home.vi.title')"></h1>
      <p class="subtitle">
        <a href="https://www.vi-institute.org/international-representative-directory/" target="_blank" rel="noopener noreferrer">
          {{ $t('home.vi.exclusiveRep') }}
        </a>
      </p>
      <p class="description">
        {{ $t('home.vi.description') }}
      </p>
    </section>

    <!-- ============================================
         4) INNOVATION / STATS HERO (เดิมเป็น hero ของหน้า Service)
         ============================================ -->
    <section id="service" class="svc-hero">
      <div class="svc-morphing-bg"></div>
      <div class="svc-morphing-bg-2"></div>
      <div class="svc-hero-content">
        <div class="svc-hero-text">
          <h1 v-html="$t('service.hero.title')"></h1>
          <p v-html="$t('service.hero.subtitle')"></p>
          <div class="svc-hero-stats">
            <div class="svc-stat-box">
              <h3>200+</h3>
              <p>{{ $t('service.hero.statProjects') }}</p>
            </div>
            <div class="svc-stat-box">
              <h3>10+</h3>
              <p>{{ $t('service.hero.statYears') }}</p>
            </div>
          </div>
        </div>
        <div class="svc-hero-image">
          <img src="@/assets/images/data/AboutUs2.jpg" alt="Team">
        </div>
      </div>
    </section>

    <!-- ============================================
         5) ABOUT SECTION — เกี่ยวกับเรา
         ============================================ -->
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

    <!-- ============================================
         6) STATS SECTION (พื้นเข้ม) — ตัวเลขความน่าเชื่อถือ
         ============================================ -->
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

    <!-- ============================================
         7) FEATURED SECTION — ประชาสัมพันธ์ / ข่าวสาร
         ============================================ -->
    <section class="featured-section">
      <h1 class="section-title">{{ $t('service.featured.sectionTitle') }}</h1>
      <div class="featured-container">
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
          <button class="nav-btn" @click="prevFeatured">&lt;</button>
          <button class="nav-btn" @click="nextFeatured">&gt;</button>
        </div>
      </div>
    </section>

    <!-- ============================================
         8) PARTNERS SECTION — Our Clients
         ============================================ -->
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

export default {
  name: 'Home',
  data() {
    const galleryImages = import.meta.glob('@/assets/images/gallery/*.jpg', { eager: true })
    return {
      // --- Hero card slider (เดิมจาก index.vue) ---
      currentSlide: 3,
      totalSlides: 8,
      autoSlideInterval: null,
      photos: Array.from({ length: 8 }, (_, i) => {
        const mod = galleryImages[`/src/assets/images/gallery/Photo${i + 1}.jpg`]
        return mod ? mod.default : ''
      }),
      // --- Featured news carousel (เดิมจาก Service.vue) ---
      newsData: [],
      currentFeaturedIndex: 0
    }
  },
  computed: {
    sortedNews() {
      return [...this.newsData].sort((a, b) => b.id - a.id)
    }
  },
  watch: {
    // เมื่อกดปุ่มสลับภาษา → fetch news ใหม่ตาม locale ปัจจุบัน
    '$i18n.locale'() {
      this.loadNews()
    }
  },
  methods: {
    // ============ Hero Card Slider ============
    // ── คำนวณตำแหน่ง/scale/opacity ของแต่ละการ์ด ตามระยะห่างจริงจากภาพปัจจุบัน (วนรอบ) ──
    getCardStyle(n) {
      const total = this.totalSlides
      let diff = n - this.currentSlide
      if (diff > total / 2) diff -= total
      if (diff < -total / 2) diff += total

      const abs = Math.min(Math.abs(diff), 3)
      const sign = diff === 0 ? 0 : (diff > 0 ? 1 : -1)
      const distanceTable = [0, 130, 240, 280]
      const scaleTable = [1, 0.85, 0.7, 0.6]
      const opacityTable = [1, 0.9, 0.4, 0]
      const zIndexTable = [5, 4, 3, -1]

      return {
        transform: `translateX(${sign * distanceTable[abs]}px) scale(${scaleTable[abs]})`,
        opacity: opacityTable[abs],
        zIndex: zIndexTable[abs]
      }
    },
    autoSlide() {
      this.currentSlide = (this.currentSlide % this.totalSlides) + 1
    },
    startAutoSlide() {
      this.autoSlideInterval = setInterval(this.autoSlide, 8000)
    },
    selectSlide(n) {
      this.currentSlide = n
      clearInterval(this.autoSlideInterval)
      this.startAutoSlide()
    },

    // ============ Scroll to service section (ใช้จากปุ่ม CTA ในหน้านี้เอง) ============
    scrollToService() {
      const target = document.getElementById('service')
      if (target) target.scrollIntoView({ behavior: 'smooth' })
    },

    // ============ Featured News Carousel (เดิมจาก Service.vue) ============
    prevFeatured() {
      if (this.currentFeaturedIndex > 0) {
        this.currentFeaturedIndex--
        this.updateCarousel()
      }
    },
    nextFeatured() {
      if (this.currentFeaturedIndex < this.sortedNews.length - 1) {
        this.currentFeaturedIndex++
        this.updateCarousel()
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
      const images = Array.from(galleryTrack.children)
      for (let i = 0; i < 3; i++) {
        images.forEach(img => {
          galleryTrack.appendChild(img.cloneNode(true))
        })
      }
      let scrollPosition = 0
      let isPaused = false
      const autoScroll = () => {
        if (!isPaused) {
          scrollPosition += 0.5
          const setWidth = (150 * 40) + (64 * 40)
          if (scrollPosition >= setWidth) scrollPosition = 0
          galleryTrack.style.transform = `translateX(-${scrollPosition}px)`
        }
        requestAnimationFrame(autoScroll)
      }
      autoScroll()
      galleryTrack.addEventListener('mouseenter', () => isPaused = true)
      galleryTrack.addEventListener('mouseleave', () => isPaused = false)
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
      this.$el.querySelectorAll('.portfolio-item').forEach(el => {
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
  async mounted() {
    // Hero slider
    this.startAutoSlide()

    // การ์ดบริการ (3 ใบ) เล่นอนิเมชันตอน scroll เข้ามาในจอ
    const serviceCardObserver = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('animate')
        } else {
          entry.target.classList.remove('animate')
        }
      })
    }, { threshold: 0.2 })
    this.$el.querySelectorAll('.service-card').forEach(card => {
      serviceCardObserver.observe(card)
    })

    // เนื้อหาที่ย้ายมาจากหน้า Service เดิม
    await this.loadNews()
    this.initPartnersScroll()
    this.initScrollAnimations()
    window.addEventListener('resize', this.updateCarousel)
  },
  beforeUnmount() {
    clearInterval(this.autoSlideInterval)
    window.removeEventListener('resize', this.updateCarousel)
  }
}
</script>
<style>
@import "@/assets/css/index.css";
@import "@/assets/css/service-embed.css";
</style>