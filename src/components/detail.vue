<template>
    <div class="detail">

        <template v-if="news">
            <div class="detail-wrapper">
                <!-- รูปโปสเตอร์: ย้ายมาเป็นคอลัมน์ซ้ายเดี่ยวๆ -->
                <div class="detail-media">
                    <div class="detail-card">
                        <div class="detail-image-wrapper">
                            <button
                                v-if="showArrows"
                                class="arrow-btn left"
                                @click="prevImage">
                                <i class="fas fa-chevron-left"></i>
                            </button>
                            <img :src="currentImage" :alt="news.title" class="detail-image">
                            <button
                                v-if="showArrows"
                                class="arrow-btn right"
                                @click="nextImage">
                                <i class="fas fa-chevron-right"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- เนื้อหา: ย้ายขึ้นมาอยู่คอลัมน์ขวาแทนที่ "ข่าวประชาสัมพันธ์อื่นๆ" เดิม -->
                <div class="detail-info">
                    <div class="detail-card">
                        <!-- Meta Info -->
                        <div class="detail-meta">
                            <div class="meta-item">
                                <i class="fas fa-calendar"></i>
                                <span>{{ news.date }}</span>
                            </div>
                            <div class="meta-item">
                                <i class="fas fa-map-marker-alt"></i>
                                <span>{{ news.location }}</span>
                            </div>
                        </div>

                        <!-- Title -->
                        <h1 class="detail-title">{{ news.title }}</h1>

                        <!-- Lead summary: ข้อความเดียวกับที่การ์ดใน Knowledge.vue ตัดไว้แค่ 2 บรรทัด (line-clamp)
                             ที่นี่แสดงแบบเต็ม ไม่ตัดบรรทัด เพื่อไม่ให้เนื้อหาส่วนนี้หายไปสำหรับคนที่กดเข้ามาดู -->
                        <p class="detail-lead" v-if="news.shortDesc || news.description">
                            {{ news.shortDesc || news.description }}
                        </p>

                        <div class="detail-content" v-html="news.fullDescription"></div>

                        <!-- Tags -->
                        <div class="tags" v-if="news.tags">
                            <span v-for="tag in news.tags" :key="tag" class="tag">
                                {{ tag }}
                            </span>
                        </div>

                        <!-- Contact -->
                        <div class="contact-box">
                            <h3><i class="fas fa-phone-alt"></i> <span>{{ $t('detail.contactTitle') }}</span></h3>
                            <p>{{ $t('detail.contactSubtitle') }}</p>
                            <div class="contact-buttons">
                                <a href="tel:0961879595" class="contact-btn">
                                    <i class="fas fa-phone"></i> 096-1879595
                                </a>
                                <a href="https://line.me/R/ti/p/@530ddhwa" target="_blank" class="contact-btn">
                                    <i class="fab fa-line"></i> @530ddhwa
                                </a>
                                <a href="mailto:patineer@outlook.com" class="contact-btn">
                                    <i class="fas fa-envelope"></i> <span>{{ $t('detail.emailLabel') }}</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ข่าวประชาสัมพันธ์อื่นๆ: เปลี่ยนเป็นการ์ดเลื่อนอัตโนมัติแบบเดียวกับ hero ของ Knowledge -->
            <section class="related-section" v-if="relatedArticles.length">
                <div class="related-container">
                    <h2 class="related-title"><i class="fas fa-bullhorn"></i> <span>{{ $t('detail.relatedNewsTitle') }}</span></h2>

                    <div class="related-carousel" @mouseenter="stopRelatedAutoplay" @mouseleave="startRelatedAutoplay">
                        <transition name="related-slide" mode="out-in">
                            <router-link
                                v-if="currentRelatedArticle"
                                :key="currentRelatedArticle.id"
                                :to="`?id=${currentRelatedArticle.id}`"
                                class="related-card">
                                <img :src="currentRelatedArticle.image" :alt="currentRelatedArticle.title" class="related-card-image">
                                <div class="related-card-content">
                                    <span class="article-category" :class="'cat-' + currentRelatedArticle.category">
                                        {{ getCategoryLabel(currentRelatedArticle.category) }}
                                    </span>
                                    <h3>{{ currentRelatedArticle.title }}</h3>
                                    <p>{{ currentRelatedArticle.description }}</p>
                                    <span class="btn-read-more"><span>{{ $t('knowledge.readMore') }}</span> <i class="fas fa-arrow-right"></i></span>
                                </div>
                            </router-link>
                        </transition>
                    </div>
                </div>
            </section>
        </template>

        <div v-else-if="loading" class="no-news">
            <p>{{ $t('detail.loading') }}</p>
        </div>

        <div v-else class="no-news">
            <p>{{ error || $t('detail.notFound') }}</p>
        </div>
    </div>
</template>

<script>
import { getNewsById, getNewsList } from '@/services/api.js'

const trainingImages = import.meta.glob('@/assets/images/training/**/*.{jpg,png}', { eager: true })

function resolveImage(path) {
  const assetPath = path.replace('/images/training/', '/src/assets/images/training/')
  const mod = trainingImages[assetPath]
  return mod ? mod.default : ''
}

export default {
  name: 'Detail',
  data() {
    return {
      news: null,
      newsList: [],   // ← list ทั้งหมด ใช้สำหรับ Related News (เหมือนเดิม filter ออกจากตัวเอง)
      images: [],
      currentImageIndex: 0,
      loading: false,
      error: '',
      relatedIndex: 0,
      relatedTimer: null
    }
  },

  computed: {
    currentImage() {
      if (!this.images || this.images.length === 0) return ''
      return this.images[this.currentImageIndex]
    },
    showArrows() {
      return this.images && this.images.length >= 2
    },
    relatedNews() {
      if (!this.news || !this.newsList) return []
      return this.newsList.filter(n => n.id !== this.news.id).slice(0, 5)
    },
    // แปลง relatedNews (ข้อมูลดิบ) ให้อยู่ในรูปแบบการ์ดเดียวกับ hero ของ Knowledge.vue
    relatedArticles() {
      return this.relatedNews.map(this.mapRelatedArticle)
    },
    currentRelatedArticle() {
      return this.relatedArticles[this.relatedIndex] || null
    }
  },

  methods: {
    async updateDetailContent() {
      const newsId = parseInt(this.$route.query.id, 10)
      if (!newsId) {
        this.news = null
        return
      }

      this.loading = true
      this.error   = ''

      const [detail, list] = await Promise.all([
        getNewsById(newsId, this.$i18n.locale),
        getNewsList(this.$i18n.locale)
      ])

      this.loading = false

      if (!detail) {
        console.error('ไม่พบข่าวที่ต้องการ')
        this.news = null
        this.error = this.$t('detail.notFound')
        return
      }

      this.news     = detail
      this.newsList = list || []

      // แปลง path รูปทั้งหมด
      if (Array.isArray(this.news.images) && this.news.images.length > 0) {
        this.images = this.news.images.map(resolveImage)
      } else if (this.news.image) {
        this.images = [resolveImage(this.news.image)]
      } else {
        this.images = []
      }

      document.title = `${this.news.title} - PATINEER`
      this.currentImageIndex = 0

      // การ์ดข่าวประชาสัมพันธ์อื่นๆ เปลี่ยนทุกครั้งที่เปิดข่าวใหม่ → เริ่มนับที่การ์ดแรกและรีเซ็ต autoplay ใหม่
      this.relatedIndex = 0
      this.startRelatedAutoplay()
    },

    prevImage() {
      if (this.images.length < 2) return
      this.currentImageIndex = (this.currentImageIndex - 1 + this.images.length) % this.images.length
      this.preloadNextImage()
    },

    nextImage() {
      if (this.images.length < 2) return
      this.currentImageIndex = (this.currentImageIndex + 1) % this.images.length
      this.preloadNextImage()
    },

    preloadNextImage() {
      if (this.images.length < 2) return
      const nextIndex = (this.currentImageIndex + 1) % this.images.length
      const preload = new Image()
      preload.src = this.images[nextIndex]
    },

    handleKeydown(e) {
      if (this.images.length < 2) return
      if (e.key === 'ArrowLeft') this.prevImage()
      else if (e.key === 'ArrowRight') this.nextImage()
    },

    // ── Related carousel: แปลงข้อมูลข่าวดิบให้เป็นการ์อยู่ในฟอร์แมตเดียวกับ hero-card ของ Knowledge.vue ──
    mapRelatedArticle(n) {
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
        category: category
      }
    },

    getCategoryLabel(category) {
      const labels = {
        'category2': this.$t('knowledge.categoryLabel.category2'),
        'training': this.$t('knowledge.categoryLabel.training'),
        'news': this.$t('knowledge.categoryLabel.news')
      }
      return labels[category] || this.$t('knowledge.categoryLabel.default')
    },

    nextRelated() {
      if (!this.relatedArticles.length) return
      this.relatedIndex = (this.relatedIndex + 1) % this.relatedArticles.length
    },

    startRelatedAutoplay() {
      this.stopRelatedAutoplay()
      this.relatedTimer = setInterval(this.nextRelated, 5000) // เลื่อนอัตโนมัติทุก 5 วิ เหมือน Knowledge.vue
    },

    stopRelatedAutoplay() {
      if (this.relatedTimer) {
        clearInterval(this.relatedTimer)
        this.relatedTimer = null
      }
    }
  },

  created() {
    this.updateDetailContent()
  },

  mounted() {
    window.addEventListener('keydown', this.handleKeydown)
  },

  beforeUnmount() {
    window.removeEventListener('keydown', this.handleKeydown)
    this.stopRelatedAutoplay()
  },

  watch: {
    '$route.query.id'() {
      this.updateDetailContent()
    },
    // เมื่อกดสลับภาษา → fetch ใหม่ตาม locale ปัจจุบัน (เหมือน Service.vue / Knowledge.vue)
    '$i18n.locale'() {
      this.updateDetailContent()
    }
  }
}
</script>

<style>
@import "@/assets/css/detail.css";
</style>