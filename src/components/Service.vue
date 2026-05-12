<template>
  <div class="home">
    <!-- Hero Section -->
    <section class="hero">
      <div class="morphing-bg"></div>
      <div class="morphing-bg-2"></div>
      <div class="hero-content">
        <div class="hero-text">
          <h1>Where Innovation Drives<br><span>Industrial Excellence</span></h1>
          <p>ด้วยประสบการณ์มากกว่า 10 ปีในการให้บริการด้านบำรุงรักษา<br>เครื่องจักรอุตสาหกรรมที่มีคุณภาพสูง</p>
          <div class="hero-stats">
            <div class="stat-box">
              <h3>200+</h3>
              <p>โครงการสำเร็จ</p>
            </div>
            <div class="stat-box">
              <h3>10+</h3>
              <p>ปีประสบการณ์</p>
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
          <h2>About us</h2>
          <h3>เราเป็นผู้เชี่ยวชาญด้านเครื่องจักรอุตสาหกรรม</h3>
          <p>ด้วยประสบการณ์มากกว่า10ปีในการให้บริการด้านบำรุงรักษาเครื่องจักรอุตสาหกรรมที่มีคุณภาพสูง ช่วยเหลือทั้งองค์กรในกิจการโดยการซ่อมบำรุงกระบวนการประเภทต่างๆ ให้สามารถดำเนินการเครื่องจักรอุตสาหกรรม และเพิ่มประสิทธิภาพในการผลิตอย่างต่อเนื่อง</p>
          <div class="about-features">
            <div class="feature-item">
              <div class="feature-icon"><i class="fas fa-check-circle"></i></div>
              <p>ตรวจวิเคราะห์สภาพเครื่องจักรด้วยเทคโนโลยีที่ทันสมัย</p>
            </div>
            <div class="feature-item">
              <div class="feature-icon"><i class="fas fa-check-circle"></i></div>
              <p>ฝึกอบรมบุคลากรในโรงงานให้สามารถดูแลและวางแผนงานซ่อมบำรุงได้อย่างมีประสิทธิภาพ</p>
            </div>
            <div class="feature-item">
              <div class="feature-icon"><i class="fas fa-check-circle"></i></div>
              <p>พัฒนาแนวทางการบำรุงรักษาให้เหมาะสมกับแต่ละอุตสาหกรรม</p>
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
          <p>ปีแห่งการดำเนินธุรกิจ</p>
        </div>
        <div class="stat-item">
          <h2>150+</h2>
          <p>ลูกค้าที่ให้บริการ</p>
        </div>
        <div class="stat-item">
          <h2>500+</h2>
          <p>ผู้เข้ารับการอบรมและรับรอง</p>
        </div>
      </div>
    </section>

    <!-- Featured Section -->
    <section class="featured-section">
      <h1 class="section-title">ประชาสัมพันธ์</h1>
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
                อ่านเพิ่มเติม <i class="fas fa-arrow-right"></i>
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
import newsData from '@/data/newsData.js'

export default {
  name: 'Service',
  data() {
    return {
      newsData: newsData,
      currentFeaturedIndex: 0
    }
  },
  computed: {
    sortedNews() {
      return [...this.newsData].sort((a, b) => b.id - a.id)
    }
  },
  methods: {
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

      this.$el.querySelectorAll('.service-card, .portfolio-item').forEach(el => {
        el.style.opacity = '0'
        el.style.transform = 'translateY(30px)'
        el.style.transition = 'all 0.6s ease-out'
        observer.observe(el)
      })
    }
  },
  mounted() {
    this.initPartnersScroll()
    this.initScrollAnimations()
    window.addEventListener('resize', this.updateCarousel)
  },
  beforeUnmount() {
    window.removeEventListener('resize', this.updateCarousel)
  }
}
</script>

<style>
@import "@/assets/css/service.css";
</style>