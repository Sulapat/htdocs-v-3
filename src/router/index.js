import { createRouter, createWebHistory } from 'vue-router'

import index      from '@/components/index.vue'
import Service   from '@/components/Service.vue'
import Clients   from '@/components/Clients.vue'
import Detail    from '@/components/detail.vue'
import Knowledge from '@/components/Knowledge.vue'
import Portfolio from '@/components/Portfolio.vue'
import TestResult from '@/components/TestResult.vue'
import courses from '@/components/Courses.vue'
import courseSplit from '@/components/course_split.vue'
import CourseDetail from '@/components/CourseDetail.vue'
import Article from '@/components/Article.vue'
import ArticleDetail from '@/components/ArticleDetail.vue'
import GalleryShowcase from '@/components/GalleryShowcase.vue'



const routes = [
  { path: '/',           component: index      },
  { path: '/index.html', redirect: '/'        },
  { path: '/service',    component: Service   },
  { path: '/clients',    component: Clients   },
  { path: '/detail',     component: Detail    },
  { path: '/knowledge',  component: Knowledge },
  { path: '/portfolio',  component: Portfolio },
  { path: '/result', component: TestResult },
  { path: '/courses', component: courses },
  { path: '/course-split', component: courseSplit, meta: { hideChrome: true } },
  { path: '/courses/:slug', component: CourseDetail },
  { path: '/article', component: Article },
  { path: '/article/:slug', component: ArticleDetail },
  { path: '/showcase', component: GalleryShowcase },
]

const router = createRouter({
  history: createWebHistory(),
  routes,
  scrollBehavior() {
    return { top: 0 }
  }
})

// ✅ FIX: บัค footer ค้าง/เบลอเฉพาะหน้า /courses
// Courses.vue เก็บตำแหน่ง scroll ไว้ใน sessionStorage ('coursesScrollY') ตอนกดเข้าไปดู
// course detail แล้วดึงกลับมาเลื่อน scroll กลับตำแหน่งเดิมตอน mount ใหม่ — ค่านี้ควรมีอายุ
// แค่ "course detail -> กลับมา /courses" เที่ยวเดียวเท่านั้น แต่ sessionStorage อยู่ข้ามทั้ง
// session ถ้าผู้ใช้ออกจากหน้า detail ไปที่อื่น (เช่น /clients) แทนที่จะกลับมา /courses ตรง ๆ
// ค่าเก่าจะยังค้างอยู่ แล้วถูกดึงมาใช้ผิด ๆ ตอนวนกลับมา /courses ทีหลังจากหน้าอื่น ทำให้
// scrollTo กระโดดไปตำแหน่งลึกที่ไม่สัมพันธ์กับเนื้อหาจริง จนไปชนกับ reveal ของ footer
// ล้างทิ้งทุกครั้งที่ "หน้าก่อนหน้า" ไม่ใช่ course detail — รันด้วย beforeEach เพราะยืนยันได้ว่า
// ทำงานก่อน Courses.vue mount แน่นอน (ต่างจาก afterEach ที่อาจชนจังหวะกับ onMounted)
router.beforeEach((to, from) => {
  if (to.path === '/courses' && !/^\/courses\//.test(from.path)) {
    sessionStorage.removeItem('coursesScrollY')
  }
})

export default router