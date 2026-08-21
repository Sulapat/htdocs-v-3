<template>
  <div class="home">
    <!-- ============================================
         1) HERO SECTION — Scroll-driven story "From Vibration to Insight"
            ย้ายมาจาก patineer-vibration-scroll-story.html ทั้งหมด (โครงสร้าง + แอนิเมชัน)
            ขับเคลื่อนด้วย GSAP + ScrollTrigger (scrub) แทนระบบ rAF/CSS-var เดิม
            ต้องติดตั้ง dependency ก่อนใช้งาน: npm install gsap
         ============================================ -->
    <div class="hero-wrap" ref="heroWrap">
      <section class="hero" ref="heroSticky">
        <div class="grid"></div>

        <div class="hero-inner">

          <div class="copy">
            <div class="eyebrow">{{ $t('home.hero.eyebrow') }}</div>

            <h1 v-html="$t('home.hero.title')"></h1>

            <p>{{ $t('home.hero.description') }}</p>

            <a class="cta-button" href="#service" @click.prevent="scrollToService">
              {{ $t('home.hero.ctaButton') }}
              <span>→</span>
            </a>
          </div>

          <div class="visual">

            <div class="signal-label">LIVE VIBRATION SIGNAL</div>

            <svg viewBox="0 0 650 620" aria-label="Vibration visualization">
              <path ref="signalGlow" class="signal-glow"
                d="M10,315 C100,315 110,315 145,315
                   C165,315 175,265 195,315
                   C215,365 230,250 250,315
                   C275,365 300,300 330,315
                   C390,315 460,315 640,315" />

              <path ref="signal" class="signal"
                d="M10,315 C100,315 110,315 145,315
                   C165,315 175,265 195,315
                   C215,365 230,250 250,315
                   C275,365 300,300 330,315
                   C390,315 460,315 640,315" />

              <circle ref="signalDot" class="signal-dot" cx="10" cy="315" r="4" />
            </svg>

            <div class="machine" ref="machine">
              <div class="machine-top"></div>
              <div class="machine-body"></div>
              <div class="shaft"></div>
              <div class="machine-foot foot-a"></div>
              <div class="machine-foot foot-b"></div>
              <div class="sensor" ref="sensor"></div>
              <div class="sensor-line" ref="sensorLine"></div>
            </div>

            <div class="analysis" ref="analysis">
              <div class="analysis-title">CONDITION ANALYSIS</div>
              <div class="analysis-row">
                <span>Vibration</span><strong>4.8 mm/s</strong>
              </div>
              <div class="analysis-row">
                <span>Frequency</span><strong>1X</strong>
              </div>
              <div class="analysis-row">
                <span>Amplitude</span><strong>HIGH</strong>
              </div>
              <div class="status">
                <i></i>
                CONDITION IDENTIFIED
              </div>
            </div>

            <div class="spectrum" ref="spectrum">
              <div class="analysis-title">FREQUENCY SPECTRUM</div>
              <div class="bar" style="left:20%;height:20%"></div>
              <div class="bar" style="left:31%;height:36%"></div>
              <div class="bar" style="left:42%;height:72%"></div>
              <div class="bar" style="left:53%;height:28%"></div>
              <div class="bar" style="left:64%;height:48%"></div>
              <div class="bar" style="left:75%;height:18%"></div>
              <div class="bar" style="left:86%;height:30%"></div>
            </div>

            <div class="final-message" ref="finalMessage">
              <div class="small">PATINEER</div>
              <h2 v-html="$t('home.hero.finalTagline')"></h2>
              <p>{{ $t('home.hero.finalDesc') }}</p>
            </div>

          </div>
        </div>
      </section>
    </div>

    <!-- ============================================
         2) SERVICE SECTION — บริการของเรา (จุดที่ navbar เลื่อนลงมาหา)
         ============================================ -->
    <section id="service-features" class="service-section">
      <div class="services-grid">
        <div class="service-card">
          <div class="service-body">
            <div class="service-icon"><i class="fas fa-headset"></i></div>
            <h3>{{ $t('home.services.consultTitle') }}</h3>
            <p>{{ $t('home.services.consultDesc') }}</p>
            <router-link to="/showcase" class="service-link">ดูเพิ่มเติม <i class="fas fa-arrow-right"></i></router-link>
          </div>
          <div class="service-image">
            <img :src="serviceImages.consult" alt="ที่ปรึกษา">
          </div>
        </div>
        <div class="service-card">
          <div class="service-body">
            <div class="service-icon"><i class="fas fa-tools"></i></div>
            <h3>{{ $t('home.services.serviceTitle') }}</h3>
            <p>{{ $t('home.services.serviceDesc') }}</p>
            <router-link to="/showcase" class="service-link">ดูเพิ่มเติม <i class="fas fa-arrow-right"></i></router-link>
          </div>
          <div class="service-image">
            <img :src="serviceImages.service" alt="บริการ">
          </div>
        </div>
        <div class="service-card">
          <div class="service-body">
            <div class="service-icon"><i class="fas fa-award"></i></div>
            <h3>{{ $t('home.services.trainingTitle') }}</h3>
            <p>{{ $t('home.services.trainingDesc') }}</p>
            <router-link to="/showcase" class="service-link">ดูเพิ่มเติม <i class="fas fa-arrow-right"></i></router-link>
          </div>
          <div class="service-image">
            <img :src="serviceImages.training" alt="ฝึกอบรม">
          </div>
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

    <!-- gallery section ถูกย้ายไปหน้า /showcase แล้ว (ดู GalleryShowcase.vue) -->

 <section></section>
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
          <img src="@/assets/images/data/Logo_partners/ADS.jpg" alt="ADS">
          <img src="@/assets/images/data/Logo_partners/NPS.jpg" alt="NPS">
          <img src="@/assets/images/data/Logo_partners/SES.jpg" alt="SES">
          <img src="@/assets/images/data/Logo_partners/Murata.jpg" alt="MURATA">
          <img src="@/assets/images/data/Logo_partners/Proterial.png" alt="PROTERIAL">
          <img src="@/assets/images/data/Logo_partners/TT.png" alt="TT">
          <img src="@/assets/images/data/Logo_partners/U-Services.jpg" alt="U-Services">
          <img src="@/assets/images/data/Logo_partners/ming.png" alt="MING">
          <img src="@/assets/images/data/Logo_partners/ASKO.jpg" alt="ASKO">
          <img src="@/assets/images/data/Logo_partners/BGC.jpg" alt="BGC">
          <img src="@/assets/images/data/Logo_partners/EWater.jpg" alt="EW">
          <img src="@/assets/images/data/Logo_partners/OTANI.jpg" alt="OTANI">
          <img src="@/assets/images/data/Logo_partners/MCL.png" alt="MICHELIN">
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import { getNewsList } from '@/services/api.js'
// Hero scroll-story ใช้ GSAP + ScrollTrigger เหมือน patineer-vibration-scroll-story.html ต้นแบบ
// ต้องติดตั้ง dependency ก่อน: npm install gsap
import { gsap } from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

// ⚠️ ย้าย CSS มา import ผ่าน JS แทนการใช้ @import ใน <style scoped>
// สาเหตุ: @import ใน <style scoped> บางกรณี Vite/vue-loader ไม่ apply scope attribute
// ให้ไฟล์ที่ import เข้ามาอย่างถูกต้อง ทำให้หลุดออกไปเป็น native @import ของ browser
// (fetch ไฟล์ตรงๆ แยกอีกชุด ไม่ผ่านการ scope) → เกิด CSS 2 ชุดโหลดซ้อนกัน
// ชุดที่ scope แล้ว (มี animation ที่แก้แล้ว) กับชุดดิบที่ยังมี animation เก่าอยู่
// import ผ่าน JS แบบนี้ Vite จะ bundle รวมเป็นก้อนเดียวถูกต้อง ไม่มีทางหลุดซ้ำ
import '@/assets/css/index.css'
import '@/assets/css/service-embed.css'

const trainingImages = import.meta.glob('@/assets/images/training/**/*.{jpg,png}', { eager: true })

function resolveImage(path) {
  const assetPath = path.replace('/images/training/', '/src/assets/images/training/')
  const mod = trainingImages[assetPath]
  return mod ? mod.default : ''
}

// gallery section (glob รูปภาพ + getGalleryImages) ถูกย้ายไปใช้ใน GalleryShowcase.vue แล้ว

export default {
  name: 'Home',
  data() {
    const galleryImages = import.meta.glob('@/assets/images/gallery/*.jpg', { eager: true })
    const resolveGalleryPhoto = (n) => {
      const mod = galleryImages[`/src/assets/images/gallery/Photo${n}.jpg`]
      return mod ? mod.default : ''
    }
    return {
      // --- รูปประกอบการ์ด 3 ใบใน SERVICE SECTION ---
      serviceImages: {
        consult: resolveGalleryPhoto(10), // ที่ปรึกษา
        service: resolveGalleryPhoto(9),  // บริการ
        training: resolveGalleryPhoto(4)  // ฝึกอบรม
      },
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
    // ============ Scroll to service section (ใช้จากปุ่ม CTA ในหน้านี้เอง) ============
    scrollToService() {
      const target = document.getElementById('service')
      if (target) target.scrollIntoView({ behavior: 'smooth' })
    },

    // ============ Hero scroll-story — "From Vibration to Insight" ============
    // ย้ายมาจาก patineer-vibration-scroll-story.html ทั้งหมด: ใช้ GSAP + ScrollTrigger
    // (scrub) ขับเคลื่อน timeline เดียวตามตำแหน่ง scroll ของ .hero-wrap แทนระบบ
    // rAF/lerp/CSS-var เดิม ต้องติดตั้ง dependency ก่อนใช้งาน: npm install gsap
    initHeroStory() {
      const signal = this.$refs.signal
      const signalGlow = this.$refs.signalGlow
      const machine = this.$refs.machine
      const sensor = this.$refs.sensor
      const sensorLine = this.$refs.sensorLine
      const analysis = this.$refs.analysis
      const spectrum = this.$refs.spectrum
      const finalMessage = this.$refs.finalMessage
      if (!signal || !signalGlow || !machine) return

      // เส้นสัญญาณ "วาดตัวเอง" ตอนเริ่มต้น (stroke-dasharray/offset)
      const signalLength = signal.getTotalLength()
      ;[signal, signalGlow].forEach(path => {
        path.style.strokeDasharray = signalLength
        path.style.strokeDashoffset = signalLength
      })

      const tl = gsap.timeline({
        scrollTrigger: {
          trigger: this.$refs.heroWrap,
          start: 'top top',
          end: 'bottom bottom',
          scrub: 1.2,
          pin: false,
          anticipatePin: 1
        }
      })
      this._heroTimeline = tl

      // 0–15%: signal appears
      tl.to(signal, { strokeDashoffset: 0, duration: 1.5, ease: 'none' }, 0)
      tl.to(signalGlow, { strokeDashoffset: 0, duration: 1.5, ease: 'none' }, 0)

      // 15–30%: stronger vibration / visual energy
      tl.to(signal, { strokeWidth: 4, duration: 1 }, 1.5)
      tl.to(signalGlow, { opacity: .42, strokeWidth: 8, duration: 1 }, 1.5)

      // 30–45%: machine enters
      tl.to(machine, { opacity: 1, x: 0, duration: 1.1, ease: 'power2.out' }, 2.5)

      // 45–55%: machine vibration
      tl.to(machine, { x: 5, duration: .08, repeat: 16, yoyo: true, ease: 'none' }, 3.3)
      tl.to(signal, { scaleY: 1.7, transformOrigin: 'center', duration: 1 }, 3.3)
      tl.to(signalGlow, { scaleY: 1.7, transformOrigin: 'center', duration: 1 }, 3.3)

      // 55–65%: sensor activates
      tl.to(sensor, { opacity: 1, duration: .5 }, 4.3)
      tl.to(sensorLine, { opacity: 1, scaleX: 1, duration: .8, ease: 'power2.out' }, 4.5)

      // 65–75%: analysis appears
      tl.to(analysis, { opacity: 1, y: 0, duration: 1, ease: 'power2.out' }, 5.1)
      tl.to(spectrum, { opacity: 1, y: 0, duration: 1, ease: 'power2.out' }, 5.6)

      // แท่ง spectrum สั่นเบาๆ ตลอดเวลา
      if (spectrum) {
        gsap.to(spectrum.querySelectorAll('.bar'), {
          scaleY: 1.15,
          duration: .7,
          repeat: -1,
          yoyo: true,
          stagger: .08,
          ease: 'sine.inOut'
        })
      }

      // 82–92%: analysis completed, machine stabilizes
      tl.to(analysis, { opacity: .65, duration: .6 }, 7.0)
      tl.to(machine, { x: 0, duration: 1.4, ease: 'power2.out' }, 7.0)
      tl.to(signal, { scaleY: .42, duration: 1.4, ease: 'power2.out' }, 7.0)
      tl.to(signalGlow, { scaleY: .42, opacity: .18, duration: 1.4, ease: 'power2.out' }, 7.0)

      // 92–100%: final insight
      tl.to(analysis, { opacity: 0, duration: .7 }, 8.4)
      tl.to(spectrum, { opacity: 0, duration: .7 }, 8.4)
      tl.to(sensorLine, { opacity: 0, duration: .5 }, 8.6)
      tl.to(finalMessage, { opacity: 1, duration: 1, ease: 'power2.out' }, 9.0)

      // Accessibility / reduced motion — จบ timeline ทันทีที่สถานะ final
      if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
        tl.scrollTrigger.disable()
        gsap.set(finalMessage, { opacity: 1 })
        gsap.set(signal, { strokeDashoffset: 0 })
        gsap.set(signalGlow, { strokeDashoffset: 0 })
      }
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
      // ⚠️ เดิมใช้ requestAnimationFrame วนตลอดไปตั้งแต่ mounted() (รันทุกเฟรม
      // ไม่มีวันหยุด ไม่ว่าจะ scroll ไปเห็น section นี้หรือไม่) แถม clone รูปไว้ 4 ชุด
      // (~200 รูปที่มี filter: grayscale ค้างอยู่) แล้วสั่ง style.transform ทาง JS
      // ทุกเฟรม → main thread ทำงานหนักต่อเนื่องตลอดเวลา นี่คือสาเหตุที่แล็คตลอด
      // แม้ไม่ได้ scroll/ขยับอะไรเลย เปลี่ยนมาใช้ CSS animation (@keyframes
      // scrollPartners ที่มีอยู่แล้วในไฟล์ CSS แต่ไม่เคยถูกเรียกใช้) แทน ให้ browser
      // คอมโพสิตเองบนการ์ดจอ ไม่แตะ main thread ต่อเนื่องอีกต่อไป
      // duplicate ครั้งเดียว (รวมเป็น 2 ชุด) ให้ตรงกับ translateX(-50%) ใน keyframe พอดี
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

    this.initHeroStory() // ตั้งค่า GSAP ScrollTrigger ของ Hero scroll-story (ไม่ต้องรอ news API)

    // เนื้อหาที่ย้ายมาจากหน้า Service เดิม
    await this.loadNews()
    this.initPartnersScroll()
    this.initScrollAnimations()
    window.addEventListener('resize', this.updateCarousel)

    // ⚠️ ต่างจาก patineer-vibration-scroll-story.html ต้นแบบ (static ทั้งหน้า
    // ไม่มีอะไรโหลดทีหลัง) หน้านี้มีข่าว/รูปพาร์ทเนอร์ 49 รูป/ฟอนต์ Prompt-Sarabun
    // ที่โหลด "หลัง" ตอน initHeroStory() คำนวณตำแหน่ง .hero-wrap ไปแล้ว
    // พอโหลดเสร็จทีหลัง เลย์เอาต์ขยับนิดหน่อย (เช่น scrollbar โผล่/ฟอนต์เปลี่ยน
    // line-height) แต่ ScrollTrigger cache ค่า pixel start/end เดิมไว้ไม่รู้ตัว
    // → progress ของ timeline จบไม่ตรงกับตำแหน่ง scroll จริง (จอเลื่อนหลุด
    // ออกจาก .hero-wrap ก่อน animation เล่นจบ) ต้องสั่งรีเฟรชซ้ำเมื่อทุกอย่างนิ่งแล้ว
    this._refreshOnLoad = () => ScrollTrigger.refresh()
    window.addEventListener('load', this._refreshOnLoad)

    if (document.fonts && document.fonts.ready) {
      document.fonts.ready.then(() => ScrollTrigger.refresh())
    }

    this.$nextTick(() => ScrollTrigger.refresh())
  },
  beforeUnmount() {
    window.removeEventListener('resize', this.updateCarousel)
    window.removeEventListener('load', this._refreshOnLoad)
    if (this._heroTimeline) {
      this._heroTimeline.scrollTrigger && this._heroTimeline.scrollTrigger.kill()
      this._heroTimeline.kill()
      this._heroTimeline = null
    }
  }
}
</script>

<style scoped>
</style>