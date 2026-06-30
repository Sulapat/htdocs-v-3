<template>
  <div class="home">
    <!-- Hero Section -->
    <section class="hero">
      <div class="morphing-bg"></div>
      <div class="morphing-bg-2"></div>
      <div class="hero-container">
        <div class="hero-left">
          <h1 v-html="$t('home.hero.title')"></h1>
          <p>{{ $t('home.hero.description') }}</p>
          <router-link to="/service" class="cta-button">{{ $t('home.hero.ctaButton') }}</router-link>
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

    <!-- Service Section -->
    <section id="service" class="service-section">
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

    <!-- VI Section -->
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
  </div>
</template>

<script>
export default {
  name: 'index',
  data() {
    const galleryImages = import.meta.glob('@/assets/images/gallery/*.jpg', { eager: true })
    return {
      currentSlide: 3,
      totalSlides: 8,
      autoSlideInterval: null,
      photos: Array.from({ length: 8 }, (_, i) => {
        const mod = galleryImages[`/src/assets/images/gallery/Photo${i + 1}.jpg`]
        return mod ? mod.default : ''
      })
    }
  },
  methods: {
    // ── คำนวณตำแหน่ง/scale/opacity ของแต่ละการ์ด ตามระยะห่างจริงจากภาพปัจจุบัน (วนรอบ) ──
    // ✅ แก้ปัญหาเดิม: การ์ดที่อยู่ไกลเกิน 3 ตำแหน่งเคยถูกตรึงไว้จุดเดียวกันหมด
    //    ทำให้ตอนข้ามหลายภาพทีเดียวดูกระตุก/ไม่ลื่น เพราะไม่ได้ขยับตามระยะจริง
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
    }
  },
  mounted() {
    this.startAutoSlide()
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('animate')
        } else {
          entry.target.classList.remove('animate')
        }
      })
    }, { threshold: 0.2 })
    this.$el.querySelectorAll('.service-card').forEach(card => {
      observer.observe(card)
    })
  },
  beforeUnmount() {
    clearInterval(this.autoSlideInterval)
  }
}
</script>
<style>
@import "@/assets/css/index.css";
</style>