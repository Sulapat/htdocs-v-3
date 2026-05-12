<template>
  <div class="home">
    <!-- Hero Section -->
    <section class="hero">
      <div class="morphing-bg"></div>
      <div class="morphing-bg-2"></div>
      <div class="hero-container">
        <div class="hero-left">
          <h1>
            Maintenance technology<br>
            Consulting <span class="highlight">and</span><br>
            Training service
          </h1>
          <p>บริษัทแพททิเนียร์ ให้บริการด้านงานบำรุงรักษากับเครื่องจักรในภาคอุตสาหกรรม
            ก่อตั้งขึ้นในปี พ.ศ. 2557 โดยเกิดจากความต้องการของภาคอุตสาหกรรม
            ที่ไม่สามารถยอมให้เครื่องจักรเสียหาย (Breakdown) โดยหาสาเหตุที่แท้จริงไม่ได้
            ทำให้เสียโอกาสในการผลิต ดังนั้น บริษัทแพททิเนียร์
            ให้คำปรึกษาทางด้านเทคโนโลยีบำรุงรักษาเชิงคาดการณ์ (Condition Based Maintenance)
            ซึ่งเอาไปใช้ในการตรวจสอบสภาพเครื่องจักร และนำไปสู่ประโยชน์สูงสุดในการจัดการงานบำรุงรักษา</p>
          <router-link to="/service" class="cta-button">More About Us</router-link>
        </div>

        <!-- Card Slider -->
        <div class="hero-right card-slider">
          <input type="radio" name="slider" v-for="n in 8" :key="n"
            :id="`slide-${n}`" class="slider__radio" :checked="n === currentSlide">

          <div class="slider__holder">
            <div v-for="n in 8" :key="n" :class="`slider__item slider__item--${n}`">
              <img :src="`/src/assets/images/gallery/Photo${n}.jpg`" :alt="`Service ${n}`">
            </div>
          </div>

          <div class="bullets">
            <label v-for="n in 8" :key="n"
              :for="`slide-${n}`"
              :class="`bullets__item bullets__item--${n}`"
              @click="selectSlide(n)">
            </label>
          </div>
        </div>
      </div>
    </section>

    <!-- Service Section -->
    <section id="service" class="service-section">
      <h2 class="section-title">Our Services</h2>
      <div class="services-grid">
        <div class="service-card">
          <div class="service-icon"><i class="fas fa-headset"></i></div>
          <h3>Consult</h3>
          <p>ทีมงานผู้เชี่ยวชาญของเราให้คำปรึกษาด้านการวางแผนและการพัฒนาระบบบำรุงรักษา และระบบการบำรุงรักษาเชิงรุก เพื่อช่วยเพิ่มประสิทธิภาพและลดต้นทุนการซ่อมบำรุงในโรงงานอุตสาหกรรม</p>
        </div>
        <div class="service-card">
          <div class="service-icon"><i class="fas fa-tools"></i></div>
          <h3>Service</h3>
          <p>เราบริการตรวจวัด วิเคราะห์สภาพเครื่องจักรด้วยเทคโนโลยีที่ทันสมัย การวิเคราะห์การสั่นสะเทือน เพื่อป้องกันความเสียหายและยืดอายุการใช้งานของอุปกรณ์ในโรงงาน</p>
        </div>
        <div class="service-card">
          <div class="service-icon"><i class="fas fa-award"></i></div>
          <h3>Training</h3>
          <p>เรามุ่งเน้นส่งมอบการอบรมที่มีคุณภาพสูง เพื่อพัฒนาทักษะและความรู้ด้านการวิเคราะห์สั่นสะเทือน การตรวจสอบสภาพเครื่องจักร และการบำรุงรักษาเชิงคาดการณ์ ตามมาตรฐานสากล</p>
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
      <h1>Official Training and Certification<br>Representative of the Vibration Institute</h1>
      <p class="subtitle">
        <a href="https://www.vi-institute.org/international-representative-directory/" target="_blank" rel="noopener noreferrer">
          Exclusive Representative in Thailand
        </a>
      </p>
      <p class="description">
        Patineer Co., Ltd. is the officially authorized representative of the Vibration Institute (USA) in Thailand,
        offering professional training and certification programs in vibration analysis.
      </p>
    </section>
  </div>
</template>

<script>
export default {
  name: 'index',
  data() {
    return {
      currentSlide: 3,
      totalSlides: 8,
      autoSlideInterval: null
    }
  },
  methods: {
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

    // Intersection Observer สำหรับ service cards
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