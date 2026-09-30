<template>
  <AppNav v-if="!$route.meta.hideChrome" />
  <div class="page-content">
    <router-view />
  </div>
  <AppFooter v-if="!$route.meta.hideChrome" />
</template>

<script>
import AppNav    from '@/components/nav.vue'
import AppFooter from '@/components/footer.vue'

export default {
  components: {
    AppNav,
    AppFooter
  }
}
</script>

<style scoped>
/* ── Reveal footer ──
   footer.vue ตั้ง footer เป็น position: fixed ค้างอยู่ล่างสุดของจอเสมอ (z-index: 0)
   ส่วน .page-content ตรงนี้ต้องอยู่ "ข้างหน้า" (z-index สูงกว่า) และมีพื้นหลังทึบ
   คลุมพื้นที่ไว้เต็มๆ ระหว่าง scroll ปกติ ผู้ใช้จะไม่เห็น footer เลยจนกว่าจะ scroll
   ผ่านเนื้อหาหลักไปหมด

   margin-bottom เท่ากับ --footer-height (คำนวณ+อัปเดตสดจาก footer.vue ด้วย
   ResizeObserver ผ่าน document.documentElement) คือ "ช่องว่าง" ที่จองไว้ท้ายเนื้อหา
   พอ scroll เข้าไปในช่วงนี้ พื้นหลังทึบของ .page-content จะเลื่อนพ้นจอไปแล้ว
   เหลือแต่ footer ที่ fixed อยู่ตำแหน่งเดิมโผล่ขึ้นมาให้เห็นทีละนิดตาม progress
   ของ scroll จริง — ได้ motion ที่ผูกกับ scroll โดยตรงแบบ native ไม่ต้องพึ่ง JS/GSAP
   ขับเลย (เบากว่า ลื่นกว่า เพราะเป็น browser compositing ล้วนๆ) */
.page-content {
  position: relative;
  z-index: 1;
  background: #f5f5f5;
  min-height: 100vh;
  margin-bottom: var(--footer-height, 0px);
}
</style>