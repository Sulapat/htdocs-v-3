<template>
    <div class="detail">
        
        <div class="detail-wrapper" v-if="news">
            <div class="detail-main">
                <div class="detail-card">
                    <!-- Image Gallery -->
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

                    <div class="detail-content" v-html="news.fullDescription"></div>

                    <!-- Tags -->
                    <div class="tags" v-if="news.tags">
                        <span v-for="tag in news.tags" :key="tag" class="tag">
                            {{ tag }}
                        </span>
                    </div>

                    <!-- Contact -->
                    <div class="contact-box">
                        <h3><i class="fas fa-phone-alt"></i> สนใจสอบถามเพิ่มเติม</h3>
                        <p>ติดต่อเราได้ตลอด 24 ชั่วโมง</p>
                        <div class="contact-buttons">
                            <a href="tel:0961879595" class="contact-btn">
                                <i class="fas fa-phone"></i> 096-1879595
                            </a>
                            <a href="https://line.me/R/ti/p/@530ddhwa" target="_blank" class="contact-btn">
                                <i class="fab fa-line"></i> @530ddhwa
                            </a>
                            <a href="mailto:patineer@outlook.com" class="contact-btn">
                                <i class="fas fa-envelope"></i> อีเมล
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Related News -->
            <aside class="related-news">
                <h2><i class="fas fa-bullhorn"></i> ข่าวประชาสัมพันธ์อื่นๆ</h2>
                <ul v-if="relatedNews.length" class="related-news-list">
                    <li v-for="item in relatedNews" :key="item.id">
                        <router-link :to="`?id=${item.id}`">
                            {{ item.title }}
                        </router-link>
                    </li>
                </ul>
                <p v-else>ไม่มีข่าวเพิ่มเติม</p>
            </aside>
        </div>

        <div v-else class="no-news">
            <p>ไม่พบข่าวที่ต้องการ</p>
        </div>
    </div>
</template>

<script>
import newsData from '@/data/newsData.js'

export default {
  name: 'Detail',
  components: {
  },
  data() {
    return {
      newsData: newsData,
      news: null,
      images: [],
      currentImageIndex: 0
    };
  },

  computed: {
    currentImage() {
      if (!this.images || this.images.length === 0) return '';
      return this.images[this.currentImageIndex];
    },

    showArrows() {
      return this.images && this.images.length >= 2;
    },

    relatedNews() {
      if (!this.news || !this.newsData) return [];
      return this.newsData.filter(n => n.id !== this.news.id).slice(0, 5);
    }
  },

  methods: {
    updateDetailContent() {
      const newsId = parseInt(this.$route.query.id, 10);
      this.news = this.newsData.find(n => n.id === newsId);

      if (!this.news) {
        console.error('ไม่พบข่าวที่ต้องการ');
        return;
      }

      // เตรียม images array
      if (Array.isArray(this.news.images) && this.news.images.length > 0) {
        this.images = this.news.images;
      } else if (this.news.image) {
        this.images = [this.news.image];
      } else {
        this.images = [];
      }

      document.title = `${this.news.title} - PATINEER`;
      this.currentImageIndex = 0;
    },

    prevImage() {
      if (this.images.length < 2) return;
      this.currentImageIndex = (this.currentImageIndex - 1 + this.images.length) % this.images.length;
      this.preloadNextImage();
    },

    nextImage() {
      if (this.images.length < 2) return;
      this.currentImageIndex = (this.currentImageIndex + 1) % this.images.length;
      this.preloadNextImage();
    },

    preloadNextImage() {
      if (this.images.length < 2) return;
      const nextIndex = (this.currentImageIndex + 1) % this.images.length;
      const preload = new Image();
      preload.src = this.images[nextIndex];
    },

    handleKeydown(e) {
      if (this.images.length < 2) return;
      if (e.key === 'ArrowLeft') {
        this.prevImage();
      } else if (e.key === 'ArrowRight') {
        this.nextImage();
      }
    }
  },

  created() {
    this.updateDetailContent();
  },

  mounted() {
    window.addEventListener('keydown', this.handleKeydown);
  },

  beforeUnmount() {
    window.removeEventListener('keydown', this.handleKeydown);
  },

  watch: {
    '$route.query.id': function() {
      this.updateDetailContent();
    }
  }
};
</script>

<style>
@import "@/assets/css/detail.css";
</style>