<template>
  <div class="gs-page">
    <!-- ============================================
         HERO — ข้อความแนะนำ + ภาพเด่นพร้อมป้าย overlay
         ภาพจะสลับตามหัวข้อย่อยแรกของแต่ละหมวด (ไม่ใช่สุ่ม)
         ============================================ -->
    <section class="gs-hero">
      <div class="gs-hero-inner">
        <div class="gs-hero-text">
          <span class="gs-eyebrow">— {{ $t('service.gallery.heading') }}</span>
          <h1 class="gs-hero-title">{{ $t('service.gallery.heading') }}</h1>
          <p class="gs-hero-desc">{{ $t('service.gallery.subheading') }}</p>
          <a href="#gs-gallery-body" class="gs-btn-primary">
            <span>ดูผลงานทั้งหมด</span>
            <i class="fas fa-arrow-right"></i>
          </a>
        </div>

        <div class="gs-hero-media">
          <transition name="gs-fade" mode="out-in">
            <img
              :key="heroSlide"
              :src="heroImages[heroSlide]"
              class="gs-hero-img"
              :alt="galleryCategories[0] ? galleryCategories[0].title : ''"
              loading="lazy"
            >
          </transition>

          <div class="gs-hero-badge">
            <div class="gs-hero-badge-icon"><i class="fas fa-shield-alt"></i></div>
            <p>ตรวจวัดแม่นยำ<br>วิเคราะห์เชิงลึก<br>ลดการหยุดเครื่องจักร</p>
          
          </div>

          <button class="gs-hero-nav gs-hero-nav--prev" type="button" aria-label="ภาพก่อนหน้า" @click="prevHero">
            <i class="fas fa-chevron-left"></i>
          </button>
          <button class="gs-hero-nav gs-hero-nav--next" type="button" aria-label="ภาพถัดไป" @click="nextHero">
            <i class="fas fa-chevron-right"></i>
          </button>
        </div>
      </div>

      <div class="gs-hero-steps">
        <span
          v-for="(img, idx) in heroImages"
          :key="idx"
          class="gs-hero-step"
          :class="{ 'gs-hero-step--active': idx === heroSlide }"
        >{{ String(idx + 1).padStart(2, '0') }}</span>
      </div>
    </section>

    <!-- ============================================
         หมวดที่มีภาพหน้างานเยอะ (เช่น งานตรวจวัด/วิเคราะห์วิศวกรรม)
         แต่ละหัวข้อย่อย = 1 แถว ไอคอน + ข้อความอยู่ซ้าย รูปเลื่อนแนวนอนอยู่ขวา
         ============================================ -->
    <section id="gs-gallery-body" class="gs-rows-section">
      <template v-for="category in rowCategories" :key="category.slug">
        <div v-for="(item, idx) in category.items" :key="item.slug" class="gs-row">
          <span class="gs-row-eyebrow">— {{ category.title }}</span>

          <div class="gs-row-grid">
            <div class="gs-row-info">
              <div class="gs-row-icon">
                <i :class="rowIcon(idx)"></i>
              </div>
              <h3 class="gs-row-title">{{ item.title }}</h3>
              <p v-if="item.description" class="gs-row-desc">{{ item.description }}</p>
              <a href="#" class="gs-row-link">
                <span>ดูผลงานเพิ่มเติม</span>
                <i class="fas fa-arrow-right"></i>
              </a>
            </div>

            <div class="gs-row-media">
              <div class="gs-row-scroll" :ref="setRowScrollRef(category.slug, item.slug)">
                <div v-for="(img, i) in item.images" :key="i" class="gs-row-photo">
                  <img :src="img" :alt="`${item.title} ${i + 1}`" loading="lazy">
                </div>
                <div v-if="!item.images.length" class="gs-row-photo gs-row-photo--empty">
                  <i class="fas fa-image"></i>
                </div>
              </div>

              <button
                v-if="item.images.length > 3"
                class="gs-row-arrow"
                type="button"
                aria-label="เลื่อนดูรูปถัดไป"
                @click="scrollRow(category.slug, item.slug)"
              >
                <i class="fas fa-chevron-right"></i>
              </button>
            </div>
          </div>

          <div v-if="item.images.length > 3" class="gs-row-dots">
            <span
              v-for="n in Math.min(item.images.length, 5)"
              :key="n"
              class="gs-row-dot"
            ></span>
          </div>
        </div>
      </template>
    </section>

    <!-- ============================================
         หมวดอบรม/สัมมนา — แสดงเป็นการ์ดกริด 4 คอลัมน์
         ============================================ -->
    <section v-if="cardCategory" class="gs-cards-section">
      <h2 class="gs-cards-title">{{ cardCategory.title }}</h2>

      <div class="gs-cards-grid">
        <a
          v-for="(item, idx) in cardCategory.items"
          :key="item.slug"
          href="#"
          class="gs-card"
        >
          <div class="gs-card-media">
            <img v-if="item.images[0]" :src="item.images[0]" :alt="item.title" loading="lazy">
            <div v-else class="gs-card-media--empty"><i class="fas fa-image"></i></div>
          </div>
          <div class="gs-card-body">
            <div class="gs-card-icon"><i :class="cardIcon(idx)"></i></div>
            <h3 class="gs-card-title">{{ item.title }}</h3>
            <p v-if="item.description" class="gs-card-desc">{{ item.description }}</p>
            <span class="gs-card-link">
              <span>ดูรูปเพิ่มเติม</span>
              <i class="fas fa-arrow-right"></i>
            </span>
          </div>
        </a>
      </div>
    </section>

    <!-- ============================================
         CTA banner
         ============================================ -->
    <section class="gs-cta">
      <div class="gs-cta-icon"><i class="fas fa-camera"></i></div>
      <div class="gs-cta-text">
        <p class="gs-cta-eyebrow">ชมผลงานและภาพบรรยากาศเพิ่มเติม</p>
        <h3>ดูภาพทั้งหมดในแกลเลอรี</h3>
        <p class="gs-cta-sub">รวบรวมทุกช่วงเวลาการให้บริการและกิจกรรมของเรา</p>
      </div>
      <a href="#gs-gallery-body" class="gs-cta-btn">
        <span>เข้าสู่แกลเลอรี</span>
        <i class="fas fa-arrow-right"></i>
      </a>
    </section>

    <!-- ============================================
         Stats bar
         ============================================ -->
    <section class="gs-stats-bar">
      <div v-for="stat in statBar" :key="stat.label" class="gs-stat-item">
        <div class="gs-stat-icon"><i :class="stat.icon"></i></div>
        <div>
          <p class="gs-stat-title">{{ stat.title }}</p>
          <p class="gs-stat-label">{{ stat.label }}</p>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
// ── ใช้โครงสร้างข้อมูลเดียวกับ Service.vue / index.vue ──
// ดึง title/description จาก th.json / en.json ที่ key เดิม
// (service.gallery.categories.<categoryKey>.items.<itemKey>.title/description)
// และดึงรูปจาก src/assets/images/gallery/<categorySlug>/<itemSlug>/ เหมือนเดิมทุกประการ
// หน้านี้แค่ "จัดวาง" ข้อมูลชุดเดียวกันในเลย์เอาต์ใหม่เท่านั้น ไม่ต้องเพิ่มรูป/ข้อความใหม่
const galleryImages = import.meta.glob(
  '@/assets/images/gallery/**/*.{jpg,jpeg,png,webp,JPG,JPEG,PNG,WEBP}',
  { eager: true }
)

function getGalleryImages(categorySlug, itemSlug) {
  return Object.keys(galleryImages)
    .filter(path => path.includes(`/images/gallery/${categorySlug}/${itemSlug}/`))
    .sort()
    .map(path => galleryImages[path].default)
}

export default {
  name: 'GalleryShowcase',
  data() {
    return {
      heroSlide: 0,
      heroTimer: null,
      rowScrollRefs: {},
    
    }
  },
  computed: {
    // ── โครงสร้างหมวด/หัวข้อย่อยเดียวกับ Service.vue เป๊ะ ──
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
        description: this.$t(`service.gallery.categories.${category.categoryKey}.description`),
        items: category.items.map(item => ({
          slug: item.slug,
          title: this.$t(`service.gallery.categories.${category.categoryKey}.items.${item.itemKey}.title`),
          description: this.$t(`service.gallery.categories.${category.categoryKey}.items.${item.itemKey}.description`),
          images: getGalleryImages(category.slug, item.slug)
        }))
      }))
    },
    // แถวแบบ "ไอคอน + ข้อความ + ภาพเลื่อนแนวนอน" ใช้กับหมวดงานตรวจวัด/วิเคราะห์
    rowCategories() {
      return this.galleryCategories.filter(c => c.slug === 'vibration_analysis')
    },
    // การ์ดกริดใช้กับหมวดอบรม/สัมมนา
    cardCategory() {
      return this.galleryCategories.find(c => c.slug === 'training_academic_seminar') || null
    },
    // ภาพที่ใช้หมุนใน hero — เอาภาพแรกของแต่ละหัวข้อย่อยทั้งหมดมาต่อกัน
    heroImages() {
      const imgs = []
      this.galleryCategories.forEach(category => {
        category.items.forEach(item => {
          if (item.images[0]) imgs.push(item.images[0])
        })
      })
      return imgs.length ? imgs : ['']
    },
    statBar() {
      return [
        { icon: 'fas fa-user-tie', title: 'ทีมงานมืออาชีพ', label: 'ประสบการณ์กว่า 15 ปี' },
        { icon: 'fas fa-microchip', title: 'เทคโนโลยีทันสมัย', label: 'เครื่องมือมาตรฐานสากล' },
        { icon: 'fas fa-check-circle', title: 'วิเคราะห์แม่นยำ', label: 'แก้ไขปัญหาตรงจุด' },
        { icon: 'fas fa-bolt', title: 'ลด Downtime', label: 'เพิ่มประสิทธิภาพการผลิต' }
      ]
    }
  },
  mounted() {
    this.startHeroAutoplay()
  },
  beforeUnmount() {
    clearInterval(this.heroTimer)
  },
  methods: {
    rowIcon(idx) {
      return idx === 0 ? 'fas fa-wave-square' : 'fas fa-cog'
    },
    cardIcon(idx) {
      const icons = ['fas fa-book', 'fas fa-users', 'fas fa-clipboard-list', 'fas fa-graduation-cap']
      return icons[idx % icons.length]
    },
    startHeroAutoplay() {
      clearInterval(this.heroTimer)
      this.heroTimer = setInterval(() => {
        this.heroSlide = (this.heroSlide + 1) % this.heroImages.length
      }, 5000)
    },
    nextHero() {
      this.heroSlide = (this.heroSlide + 1) % this.heroImages.length
      this.startHeroAutoplay()
    },
    prevHero() {
      this.heroSlide = (this.heroSlide - 1 + this.heroImages.length) % this.heroImages.length
      this.startHeroAutoplay()
    },
    setRowScrollRef(categorySlug, itemSlug) {
      const key = `${categorySlug}__${itemSlug}`
      return (el) => { if (el) this.rowScrollRefs[key] = el }
    },
    scrollRow(categorySlug, itemSlug) {
      const key = `${categorySlug}__${itemSlug}`
      const el = this.rowScrollRefs[key]
      if (!el) return
      const cardWidth = el.querySelector('.gs-row-photo')?.offsetWidth || 280
      const maxScroll = el.scrollWidth - el.clientWidth
      const next = el.scrollLeft + cardWidth + 16
      el.scrollTo({ left: next > maxScroll ? 0 : next, behavior: 'smooth' })
    }
  }
}
</script>

<style>
@import "@/assets/css/gallery-showcase.css";
</style>