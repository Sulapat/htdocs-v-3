<template>
  <div class="gs-page">

    <section class="gs-hero">
      <div class="gs-hero-inner">
        <div class="gs-hero-text">
          <h1 class="gs-hero-title">{{ $t('service.gallery.heading') }}</h1>
          <p class="gs-hero-desc">{{ $t('service.gallery.subheading') }}</p>
          <a href="#gs-gallery-body" class="gs-btn-primary">
            <span>{{ $t('service.gallery.ui.viewAll') }}</span>
            <i class="fas fa-arrow-right"></i>
          </a>
        </div>

        <div class="gs-hero-media">
          <div class="gs-hero-photo">
            <div
              v-for="(img, idx) in heroImages"
              :key="idx"
              class="gs-hero-imgwrap"
              :class="{ 'gs-hero-imgwrap--active': idx === heroSlide }"
            >
              <img
                :src="img"
                class="gs-hero-img"
                :alt="galleryCategories[0] ? galleryCategories[0].title : ''"
                loading="lazy"
              >
            </div>
            <div class="gs-hero-media-overlay"></div>
          </div>

          <div class="gs-hero-badge">
            <span class="gs-hero-badge-icon"><i class="fas fa-shield-alt"></i></span>
            <p v-html="$t('service.gallery.ui.badge')"></p>
            <span class="gs-hero-badge-divider"></span>
          </div>

          <button class="gs-hero-nav gs-hero-nav--prev" type="button" :aria-label="$t('service.gallery.ui.prevImage')" @click="prevHero">
            <i class="fas fa-chevron-left"></i>
          </button>
          <button class="gs-hero-nav gs-hero-nav--next" type="button" :aria-label="$t('service.gallery.ui.nextImage')" @click="nextHero">
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
              <h3 class="gs-row-title">{{ item.title }}</h3>
              <p v-if="item.description" class="gs-row-desc">{{ item.description }}</p>
              <button type="button" class="gs-row-link" @click="openLightbox(item)">
                <span>{{ $t('service.gallery.ui.viewMore') }}</span>
                <i class="fas fa-arrow-right"></i>
              </button>
            </div>

            <div class="gs-row-media">
              <div class="gs-row-scroll" :ref="setRowScrollRef(category.slug, item.slug)">
                <div
                  v-for="(img, i) in item.images"
                  :key="i"
                  class="gs-row-photo"
                  @click="openLightbox(item, i)"
                >
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
                :aria-label="$t('service.gallery.ui.scrollNext')"
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
        <div
          v-for="item in cardCategory.items"
          :key="item.slug"
          class="gs-card"
          role="button"
          tabindex="0"
          @click="openLightbox(item)"
          @keyup.enter="openLightbox(item)"
        >
          <div class="gs-card-media">
            <img v-if="item.images[0]" :src="item.images[0]" :alt="item.title" loading="lazy">
            <div v-else class="gs-card-media--empty"><i class="fas fa-image"></i></div>
          </div>
          <div class="gs-card-body">
            <h3 class="gs-card-title">{{ item.title }}</h3>
            <p v-if="item.description" class="gs-card-desc">{{ item.description }}</p>
            <span class="gs-card-link">
              <span>{{ $t('service.gallery.ui.viewMorePhotos') }}</span>
              <i class="fas fa-arrow-right"></i>
            </span>
          </div>
        </div>
      </div>
    </section>

   
    <!-- ============================================
         Lightbox — popup แสดงรูปทั้งหมดของแต่ละหัวข้อ เลื่อนดูได้
         ============================================ -->
    <transition name="gs-modal-fade">
      <div
        v-if="lightboxOpen"
        class="gs-lightbox"
        @click.self="closeLightbox"
      >
        <div class="gs-lightbox-panel">
          <div class="gs-lightbox-header">
            <h4 class="gs-lightbox-title">{{ lightboxTitle }}</h4>
            <button type="button" class="gs-lightbox-close" :aria-label="$t('service.gallery.ui.close')" @click="closeLightbox">
              <i class="fas fa-times"></i>
            </button>
          </div>

          <div
            class="gs-lightbox-stage"
            @touchstart="onLightboxTouchStart"
            @touchend="onLightboxTouchEnd"
          >
            <button
              v-if="lightboxImages.length > 1"
              type="button"
              class="gs-lightbox-nav gs-lightbox-nav--prev"
              :aria-label="$t('service.gallery.ui.prev')"
              @click="lightboxPrev"
            >
              <i class="fas fa-chevron-left"></i>
            </button>

            <transition name="gs-fade" mode="out-in">
              <img
                :key="lightboxIndex"
                :src="lightboxImages[lightboxIndex]"
                class="gs-lightbox-img"
                :alt="`${lightboxTitle} ${lightboxIndex + 1}`"
              >
            </transition>

            <button
              v-if="lightboxImages.length > 1"
              type="button"
              class="gs-lightbox-nav gs-lightbox-nav--next"
              :aria-label="$t('service.gallery.ui.next')"
              @click="lightboxNext"
            >
              <i class="fas fa-chevron-right"></i>
            </button>
          </div>

          <p v-if="lightboxImages.length" class="gs-lightbox-count">
            {{ lightboxIndex + 1 }} / {{ lightboxImages.length }}
          </p>

          <div v-if="lightboxImages.length > 1" class="gs-lightbox-thumbs">
            <button
              v-for="(img, i) in lightboxImages"
              :key="i"
              type="button"
              class="gs-lightbox-thumb"
              :class="{ 'gs-lightbox-thumb--active': i === lightboxIndex }"
              @click="lightboxIndex = i"
            >
              <img :src="img" :alt="`thumb ${i + 1}`" loading="lazy">
            </button>
          </div>
        </div>
      </div>
    </transition>
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

      // ── Lightbox / popup ──
      lightboxOpen: false,
      lightboxImages: [],
      lightboxIndex: 0,
      lightboxTitle: '',
      touchStartX: 0,
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

  },
  mounted() {
    this.startHeroAutoplay()
  },
  beforeUnmount() {
    clearInterval(this.heroTimer)
    document.removeEventListener('keydown', this.onLightboxKeydown)
  },
  methods: {
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
    },

    // ── Lightbox / popup ──
    openLightbox(item, startIndex = 0) {
      if (!item.images.length) return
      this.lightboxImages = item.images
      this.lightboxTitle = item.title
      this.lightboxIndex = startIndex
      this.lightboxOpen = true
      document.body.style.overflow = 'hidden'
      document.addEventListener('keydown', this.onLightboxKeydown)
    },
    closeLightbox() {
      this.lightboxOpen = false
      document.body.style.overflow = ''
      document.removeEventListener('keydown', this.onLightboxKeydown)
    },
    lightboxNext() {
      this.lightboxIndex = (this.lightboxIndex + 1) % this.lightboxImages.length
    },
    lightboxPrev() {
      this.lightboxIndex = (this.lightboxIndex - 1 + this.lightboxImages.length) % this.lightboxImages.length
    },
    onLightboxKeydown(e) {
      if (e.key === 'Escape') this.closeLightbox()
      else if (e.key === 'ArrowRight') this.lightboxNext()
      else if (e.key === 'ArrowLeft') this.lightboxPrev()
    },
    onLightboxTouchStart(e) {
      this.touchStartX = e.changedTouches[0].clientX
    },
    onLightboxTouchEnd(e) {
      const diff = e.changedTouches[0].clientX - this.touchStartX
      if (Math.abs(diff) < 40) return
      if (diff < 0) this.lightboxNext()
      else this.lightboxPrev()
    }
  }
}
</script>

<style>
@import "@/assets/css/gallery-showcase.css";
</style>