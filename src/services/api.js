// src/services/api.js
// service กลางสำหรับเรียก backend PHP — ใช้แทนการ import ไฟล์ data/*.js แบบ static เดิม

import { courses as coursesData } from '@/data/coursesdetail.js'
import { categoryConfig } from '@/data/categoryConfig.js'

// ปรับ BASE_URL ตามจริง:
// - ถ้า deploy โดเมนเดียวกัน เช่น เว็บอยู่ที่ https://patineer.co.th และวาง backend ไว้ที่ /backend/api
//   ให้ใช้ '/backend/api' (relative path ก็พอ ไม่ต้องใส่โดเมน)
const BASE_URL = '/backend/api'

async function fetchJSON(url) {
  try {
    const res = await fetch(url)
    if (!res.ok) {
      throw new Error(`HTTP ${res.status}`)
    }
    const text = await res.text()
    // Check if response looks like JSON
    if (!text.startsWith('{') && !text.startsWith('[')) {
      throw new Error('Not JSON response')
    }
    return JSON.parse(text)
  } catch (error) {
    console.warn(`API fetch failed for ${url}:`, error.message)
    return null
  }
}

// ----- Categories -----
export async function getCategories() {
  const data = await fetchJSON(`${BASE_URL}/categories.php`)
  if (data) return data
  
  // Fallback to local categoryConfig
  return Object.entries(categoryConfig).map(([code, config]) => ({
    code,
    ...config
  }))
}

// ----- Courses -----
export async function getCourses(category = null) {
  const url = category
    ? `${BASE_URL}/courses.php?category=${encodeURIComponent(category)}`
    : `${BASE_URL}/courses.php`
  const data = await fetchJSON(url)
  if (data) return data
  
  // Fallback to local coursesData
  if (!category) return coursesData
  return coursesData.filter(c => c.category === category)
}

export async function getCourseBySlug(slug) {
  const data = await fetchJSON(`${BASE_URL}/courses.php?slug=${encodeURIComponent(slug)}`)
  if (data) return data
  
  // Fallback to local coursesData
  return coursesData.find(c => c.slug === slug)
}

// ----- News -----
export function getNewsList() {
  return fetchJSON(`${BASE_URL}/news.php`)
}

export function getNewsById(id) {
  return fetchJSON(`${BASE_URL}/news.php?id=${id}`)
}

// ----- Members (TestResult.vue / StatsIndex.vue) -----
export function getMembers(filter = null) {
  const url = filter
    ? `${BASE_URL}/members.php?filter=${encodeURIComponent(filter)}`
    : `${BASE_URL}/members.php`
  return fetchJSON(url)
}

export function getMemberStats() {
  return fetchJSON(`${BASE_URL}/members.php?stats=1`)
}
