<template>
  <div class="Knowledge">
    <section class="knowledge-header">
      <p>{{ $t('knowledge.headerText') }}</p>
    </section>

    <div class="filter-section">
      <div class="search-box">
        <i class="fas fa-search"></i>
        <input type="text" v-model="searchQuery" @input="searchArticles(searchQuery)" :placeholder="$t('knowledge.searchPlaceholder')">
      </div>
      <div class="filter-buttons">
        <button class="filter-btn" :class="{ active: activeCategory === 'all' }" @click="filterArticles('all')">{{ $t('knowledge.filterAll') }}</button>
        <button class="filter-btn" :class="{ active: activeCategory === 'category2' }" @click="filterArticles('category2')">Category II</button>
        <button class="filter-btn" :class="{ active: activeCategory === 'training' }" @click="filterArticles('training')">{{ $t('knowledge.filterTraining') }}</button>
        <button class="filter-btn" :class="{ active: activeCategory === 'news' }" @click="filterArticles('news')">{{ $t('knowledge.filterNews') }}</button>
      </div>
    </div>

    <div class="articles-container">
      <div class="articles-grid">
        <router-link
            v-for="article in paginatedArticles"
            :key="article.id"
            :to="`/detail?id=${article.id}`"
            class="article-card">
            <img :src="article.image" :alt="article.title">
            <div class="article-info">
                <span class="article-category" :class="'cat-' + article.category">
                {{ getCategoryLabel(article.category) }}
                </span>
                <h3>{{ article.title }}</h3>
                <p>{{ article.description }}</p>
                <div class="article-meta">
                <span><i class="far fa-calendar"></i> {{ article.date }}</span>
                <span class="btn-read-more"><span>{{ $t('knowledge.readMore') }}</span> <i class="fas fa-arrow-right"></i></span>
                </div>
            </div>
        </router-link>
        <div v-if="paginatedArticles.length === 0" class="no-results">
          <p>{{ $t('knowledge.noResults') }}</p>
        </div>
      </div>

      <div class="pagination">
        <button
          v-for="page in totalPages" :key="page"
          class="page-btn"
          :class="{ active: currentPage === page }"
          @click="goToPage(page)">
          {{ page }}
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { getNewsList } from '@/services/api.js'

// Glob รูปทั้งหมดใน training
const trainingImages = import.meta.glob('@/assets/images/training/**/*.{jpg,png}', { eager: true })

function resolveImage(path) {
  // แปลง /images/training/... → /src/assets/images/training/...
  const assetPath = path.replace('/images/training/', '/src/assets/images/training/')
  const mod = trainingImages[assetPath]
  return mod ? mod.default : ''
}

function mapArticle(n) {
  let category = 'news'
  if (n.tags && n.tags.includes('Category II')) {
    category = 'category2'
  } else if (n.tags && (n.tags.includes('อบรม') || n.tags.includes('สัมมนา'))) {
    category = 'training'
  }
  return {
    id: n.id,
    title: n.title,
    description: n.shortDesc,
    image: resolveImage(n.image),
    date: n.date,
    category: category
  }
}

export default {
  name: 'Knowledge',
  data() {
    return {
      articles: [],
      filteredArticles: [],
      searchQuery: '',
      activeCategory: 'all',
      currentPage: 1,
      itemsPerPage: 6
    }
  },
  computed: {
    totalPages() {
      return Math.ceil(this.filteredArticles.length / this.itemsPerPage)
    },
    paginatedArticles() {
      const start = (this.currentPage - 1) * this.itemsPerPage
      return this.filteredArticles.slice(start, start + this.itemsPerPage)
    }
  },
  async mounted() {
    await this.loadNews()
  },
  watch: {
    // เมื่อกดปุ่มสลับภาษา → fetch news ใหม่ตาม locale ปัจจุบัน แล้ว re-apply filter/search ที่เลือกอยู่
    '$i18n.locale'() {
      this.loadNews()
    }
  },
  methods: {
    async loadNews() {
      const newsData = await getNewsList(this.$i18n.locale)
      if (!newsData) return
      this.articles = newsData.map(mapArticle)
      this.applyCurrentFilter()
    },
    applyCurrentFilter() {
      if (this.searchQuery.trim() !== '') {
        this.searchArticles(this.searchQuery)
      } else if (this.activeCategory !== 'all') {
        this.filterArticles(this.activeCategory)
      } else {
        this.filteredArticles = [...this.articles].sort((a, b) => b.id - a.id)
      }
    },
    getCategoryLabel(category) {
      // ใช้ this.$t() เพราะอยู่ใน methods (ไม่ใช่ template) ของ Options API
      const labels = {
        'category2': this.$t('knowledge.categoryLabel.category2'),
        'training': this.$t('knowledge.categoryLabel.training'),
        'news': this.$t('knowledge.categoryLabel.news')
      }
      return labels[category] || this.$t('knowledge.categoryLabel.default')
    },
    filterArticles(category) {
      this.activeCategory = category
      this.searchQuery = ''
      this.filteredArticles = category === 'all'
        ? [...this.articles].sort((a, b) => b.id - a.id)
        : this.articles.filter(a => a.category === category)
      this.currentPage = 1
    },
    searchArticles(query) {
      this.activeCategory = 'all'
      this.filteredArticles = query.trim() === ''
        ? [...this.articles].sort((a, b) => b.id - a.id)
        : this.articles.filter(a =>
            a.title.toLowerCase().includes(query.toLowerCase()) ||
            a.description.toLowerCase().includes(query.toLowerCase())
          )
      this.currentPage = 1
    },
    goToPage(page) {
      this.currentPage = page
      window.scrollTo({ top: 0, behavior: 'smooth' })
    }
  }
}
</script>

<style>
@import "@/assets/css/Knowledge.css";
</style>