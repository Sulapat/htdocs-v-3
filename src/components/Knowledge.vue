<template>
  <div class="Knowledge">
    <section class="knowledge-header">
      <p>เพื่อให้คุณได้รับข้อมูลและแนวปฏิบัติที่ทันสมัยในงานบำรุงรักษา</p>
    </section>

    <div class="filter-section">
      <div class="search-box">
        <i class="fas fa-search"></i>
        <input type="text" v-model="searchQuery" @input="searchArticles(searchQuery)" placeholder="ค้นหาบทความ...">
      </div>
      <div class="filter-buttons">
        <button class="filter-btn" :class="{ active: activeCategory === 'all' }" @click="filterArticles('all')">ทั้งหมด</button>
        <button class="filter-btn" :class="{ active: activeCategory === 'category2' }" @click="filterArticles('category2')">Category II</button>
        <button class="filter-btn" :class="{ active: activeCategory === 'training' }" @click="filterArticles('training')">อบรม</button>
        <button class="filter-btn" :class="{ active: activeCategory === 'news' }" @click="filterArticles('news')">ข่าวสาร</button>
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
                <span class="btn-read-more">อ่านเพิ่มเติม <i class="fas fa-arrow-right"></i></span>
                </div>
            </div>
        </router-link>
        <div v-if="paginatedArticles.length === 0" class="no-results">
          <p>ไม่พบบทความที่ค้นหา</p>
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
import newsData from '@/data/newsData.js'

export default {
  name: 'Knowledge',
  data() {
    return {
      articles: newsData.map(function(n) {
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
          image: n.image,
          date: n.date,
          category: category
        }
      }),
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
  mounted() {
    this.filteredArticles = [...this.articles].sort((a, b) => b.id - a.id)
  },
  methods: {
    getCategoryLabel(category) {
      const labels = {
        'category2': 'Category II',
        'training': 'อบรม',
        'news': 'ข่าวสาร'
      }
      return labels[category] || 'บทความ'
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