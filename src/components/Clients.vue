<template>
    <div class="Ciients">
        <!-- Navigation -->
        <div id="nav-placeholder"></div>

        <!-- Hero Split Section (ref: Option C — Split View: Story + Masonry Grid)
             ซ้าย = story panel (เนื้อหายังไม่ finalize -> เป็น mockup จองพื้นที่ไว้ก่อน)
             ขวา  = คอลัมน์โลโก้ลูกค้าเลื่อนขึ้น/ลงสวนกันอัตโนมัติ -->
        <section class="clients-split" id="Portfolio">

            <!-- Story panel: headline (เด่น) + body (รอง) บนพื้นหลังกรมท่าเข้ม #112E81
                 ครอบด้วย .story-text เพื่อให้ headline/body อยู่ในกล่องเดียวกัน ใช้ขอบซ้ายร่วมกัน
                 แล้วค่อยจัดกล่องนี้ทั้งก้อนให้อยู่กึ่งกลางโซนซ้าย (ไม่ centered แยกทีละบรรทัด) -->
            <div class="clients-story">
                <div class="story-text">
                    <h2 class="story-headline">{{ $t('clients.story.headline') }}</h2>
                    <p class="story-body">{{ $t('clients.story.body') }}</p>
                </div>
            </div>

            <!-- คอลัมน์โลโก้ลูกค้า: เลื่อนอัตโนมัติสวนทางกันทีละคอลัมน์ hover คอลัมน์ไหนหยุดเฉพาะคอลัมน์นั้น (ยังไม่มีระบบกด/เลือกค้าง) -->
            <div class="clients-columns">
                <div
                    v-for="(col, colIndex) in columns"
                    :key="colIndex"
                    class="client-column"
                    :style="{ marginTop: columnOffset(colIndex) }"
                >
                    <div
                        class="client-column-track"
                        :class="colIndex % 2 === 0 ? 'scroll-up' : 'scroll-down'"
                        :style="{ animationDuration: columnDuration(col) }"
                    >
                        <div
                            v-for="(client, i) in col.concat(col)"
                            :key="colIndex + '-' + i"
                            class="client-card"
                            :class="{ 'is-dimmed': hoveredClient && hoveredClient !== client }"
                            @mouseenter="showTooltip($event, client)"
                            @mouseleave="hideTooltip"
                        >
                            <img v-if="getLogo(client.file)" :src="getLogo(client.file)" :alt="client.alt" class="client-logo">
                            <span v-else class="client-logo client-logo--fallback">{{ client.name }}</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tooltip: teleport ไป body เพราะ .client-column ต้อง overflow:hidden เพื่อ mask การเลื่อนแบบ infinite scroll -->
            <Teleport to="body">
                <div v-if="hoveredClient" class="client-info-teleport" :style="tooltipStyle">
                    <div class="client-name">{{ hoveredClient.name }}</div>
                    <div class="client-description">{{ $t(hoveredClient.descKey) }}</div>
                </div>
            </Teleport>
        </section>

        <!-- Testimonial section: tag (รอง) นำสายตาสู่ testimonial card (เด่น) -->
        <section class="clients-testimonial">
            <p class="testimonial-tag">{{ $t('clients.testimonial.tag') }}</p>
            <div class="testimonial-card">
                <span class="testimonial-quote-mark" aria-hidden="true">&ldquo;</span>
                <p class="testimonial-quote">{{ $t('clients.testimonial.quote') }}</p>
            </div>
        </section>
    </div>
</template>

<script setup>
import { ref, computed } from 'vue'

// รายชื่อลูกค้าทั้งหมด (ของจริง ไม่ใช่ mockup) — เก็บเป็น data array แทนการเขียน
// <div class="client-card"> ซ้ำทีละใบ เพื่อให้แบ่งลงคอลัมน์และทำ infinite scroll ได้
const CLIENTS = [
  { file: 'Atsumitec.jpg', alt: 'Atsumitec', name: 'Atsumitec', descKey: 'clients.desc.atsumitec' },
  { file: 'B_G.jpg', alt: 'B.G', name: 'Bgrim', descKey: 'clients.desc.b_g' },
  { file: 'BD_th.jpg', alt: 'BD Thailand', name: 'Broadcast depot Thailand', descKey: 'clients.desc.bd_thailand' },
  { file: 'BDMS.jpg', alt: 'BDMS', name: 'BDMS', descKey: 'clients.desc.bdms' },
  { file: 'Boon.jpg', alt: 'Boon', name: 'Boon Rawd Brewery', descKey: 'clients.desc.boon' },
  { file: 'Daikin.jpg', alt: 'Daikin', name: 'Daikin', descKey: 'clients.desc.daikin' },
  { file: 'Egat.jpg', alt: 'EGAT', name: 'EGAT', descKey: 'clients.desc.egat' },
  { file: 'enfourt.jpg', alt: 'Enfourt', name: 'Enfourtech', descKey: 'clients.desc.enfourt' },
  { file: 'GCME.jpg', alt: 'GCME', name: 'GCME', descKey: 'clients.desc.gcme' },
  { file: 'Griffith.jpg', alt: 'Griffith', name: 'Griffith', descKey: 'clients.desc.griffith' },
  { file: 'Gulf.jpg', alt: 'Gulf', name: 'Gulf', descKey: 'clients.desc.gulf' },
  { file: 'GYPROC.png', alt: 'GYPROC', name: 'GYPROC', descKey: 'clients.desc.gyproc' },
  { file: 'IHI.jpg', alt: 'IHI', name: 'IHI', descKey: 'clients.desc.ihi' },
  { file: 'Indoama.jpg', alt: 'Indoama', name: 'Indorama', descKey: 'clients.desc.indoama' },
  { file: 'Is_software.jpg', alt: 'IS Software', name: 'IS Software', descKey: 'clients.desc.is_software' },
  { file: 'JSJS.jpg', alt: 'JSJS', name: 'Johnson & Johnson', descKey: 'clients.desc.jsjs' },
  { file: 'KI.jpg', alt: 'KI', name: 'ki sugar group', descKey: 'clients.desc.ki' },
  { file: 'KKF.jpg', alt: 'KKF', name: 'KKF khon kaen', descKey: 'clients.desc.kkf' },
  { file: 'Mars.jpg', alt: 'Mars', name: 'Mars petcare', descKey: 'clients.desc.mars' },
  { file: 'Mitr_phol.jpg', alt: 'Mitr Phol', name: 'Mitr Phol', descKey: 'clients.desc.mitr_phol' },
  { file: 'Nestle.jpg', alt: 'Nestle', name: 'Nestle', descKey: 'clients.desc.nestle' },
  { file: 'Npp.jpg', alt: 'Npp', name: 'NPP Combined Heat and Power Producing', descKey: 'clients.desc.npp' },
  { file: 'Nteq.jpg', alt: 'Nteq', name: 'Nteq polymer co. ltd', descKey: 'clients.desc.nteq' },
  { file: 'PAE.jpg', alt: 'PAE', name: 'PAE', descKey: 'clients.desc.pae' },
  { file: 'Pttep.jpg', alt: 'PTTEP', name: 'PTT Exploration and Production', descKey: 'clients.desc.pttep' },
  { file: 'repo.jpg', alt: 'Repo', name: 'REPCO NEX', descKey: 'clients.desc.repo' },
  { file: 'sahakol.png', alt: 'Sahakol', name: 'Sahakol Equipment', descKey: 'clients.desc.sahakol' },
  { file: 'SCG.jpg', alt: 'SCG', name: 'SCG', descKey: 'clients.desc.scg' },
  { file: 'seckisui.png', alt: 'Seckisui', name: 'SEKISUI', descKey: 'clients.desc.seckisui' },
  { file: 'SKF.jpg', alt: 'SKF', name: 'SKF', descKey: 'clients.desc.skf' },
  { file: 'Sotus.jpg', alt: 'Sotus', name: 'Sotus', descKey: 'clients.desc.sotus' },
  { file: 'SSG.jpg', alt: 'SSG', name: 'SSG', descKey: 'clients.desc.ssg' },
  { file: 'SSL.jpg', alt: 'SSL', name: 'SSL manufacturing', descKey: 'clients.desc.ssl' },
  { file: 'STM.jpg', alt: 'STM', name: 'STM', descKey: 'clients.desc.stm' },
  { file: 'Thaioil.jpg', alt: 'Thaioil', name: 'Thai Oil', descKey: 'clients.desc.thaioil' },
  { file: 'Thanakorn.jpg', alt: 'Thanakorn', name: 'Thanakorn Vegetable Oil Products', descKey: 'clients.desc.thanakorn' },
  { file: 'TRANE.jpg', alt: 'TRANE', name: 'TRANE', descKey: 'clients.desc.trane' },
  { file: 'Transitions.jpg', alt: 'Transitions', name: 'Transitions Optical', descKey: 'clients.desc.transitions' },
  { file: 'TTM.jpg', alt: 'TTM', name: 'TRANS THAI-MALAYSIA', descKey: 'clients.desc.ttm' },
  { file: 'WHA.jpg', alt: 'WHA', name: 'WHA', descKey: 'clients.desc.wha' },
  { file: 'ADS.jpg', alt: 'ADS', name: 'ADS SALES AND SERVICE CO., LTD.', descKey: 'clients.desc.ads' },
  { file: 'NPS.jpg', alt: 'NPS', name: 'NPS ENGINEERING CO.,LTD.', descKey: 'clients.desc.nps' },
  { file: 'SES.jpg', alt: 'SES', name: 'SES SUCCESS ENGINEERING AND SERVICE CO., LTD.', descKey: 'clients.desc.ses' },
  { file: 'Murata.jpg', alt: 'MURATA', name: 'MURATA ELECTRONIC (THAILAND) CO., LTD.', descKey: 'clients.desc.murata' },
  { file: 'Proterial.png', alt: 'PROTERIAL', name: 'PROTERIAL (THAILAND) LTD.', descKey: 'clients.desc.proterial' },
  { file: 'TT.png', alt: 'TT', name: 'TT FUJI TOOL SUPPORT CO.,LTD', descKey: 'clients.desc.tt' },
  { file: 'U-Services.jpg', alt: 'U-Services', name: 'U-Services Thailand Co.,Ltd', descKey: 'clients.desc.uservice' },
  { file: 'ming.png', alt: 'MING', name: 'MING TAI INDUSTRIAL (THAILAND) CO., LTD.', descKey: 'clients.desc.ming' },
  { file: 'ASKO.jpg', alt: 'ASKO', name: 'ASKO EQUIPMENT COMPANY LIMITED', descKey: 'clients.desc.asko' },
  { file: 'BGC.jpg', alt: 'BGC', name: 'BG CONTAINER GLASS PUBLIC COMPANY LIMITED', descKey: 'clients.desc.bgc' },
  { file: 'EWater.jpg', alt: 'EW', name: 'EASTERN WATER RESOURCES DEVELOPMENT AND MANAGEMENT PUBLIC COMPANY LIMITED', descKey: 'clients.desc.ewater' },
  { file: 'OTANI.jpg', alt: 'OTANI', name: 'OTANI RADIAL CO.,LTD.', descKey: 'clients.desc.otani' },
  { file: 'MCL.png', alt: 'MICHELIN', name: 'MICHELIN SIAM COMPANY LIMITED', descKey: 'clients.desc.mcl' },
]

// โหลดโลโก้ทั้งหมดด้วย import.meta.glob (แบบเดียวกับ Courses.vue) แล้ว lookup ตามชื่อไฟล์ตอน render
const logoModules = import.meta.glob('@/assets/images/data/Logo_partners/*', { eager: true })
function getLogo(file) {
  const exactKey = `/src/assets/images/data/Logo_partners/${file}`
  if (logoModules[exactKey]) return logoModules[exactKey].default

  // fallback 1: ไม่สนตัวพิมพ์เล็ก-ใหญ่ (เช่น Is_software.jpg ในโค้ด vs IS_Software.jpg บน disk จริง)
  const targetLower = file.toLowerCase()
  let foundKey = Object.keys(logoModules).find(k => k.toLowerCase().endsWith('/' + targetLower))
  if (foundKey) return logoModules[foundKey].default

  // fallback 2: ไม่สนทั้งตัวพิมพ์เล็ก-ใหญ่และนามสกุลไฟล์ (เผื่อไฟล์จริงเป็นคนละนามสกุล เช่น .png แทน .jpg)
  const stem = targetLower.replace(/\.[a-z0-9]+$/, '')
  foundKey = Object.keys(logoModules).find(k => {
    const kStem = k.toLowerCase().replace(/\.[a-z0-9]+$/, '')
    return kStem.endsWith('/' + stem)
  })
  return foundKey ? logoModules[foundKey].default : ''
}

// ── จำนวนคอลัมน์: fix ไว้ที่ 3 เสมอ (ขึ้น 2 คอลัมน์ + ลง 1 คอลัมน์ ตามที่ต้องการ) ──
const columnCount = ref(3)

// ── แบ่งลูกค้าลงคอลัมน์แบบ round-robin ──
const columns = computed(() => {
  const cols = Array.from({ length: columnCount.value }, () => [])
  CLIENTS.forEach((client, i) => {
    cols[i % columnCount.value].push(client)
  })
  return cols
})

// ── offset แนวตั้งสลับกันของแต่ละคอลัมน์ ให้ดูเป็น masonry แบบใน ref ──
const OFFSET_PATTERN = [0, -46, -92, -22] // px, วนซ้ำตามจำนวนคอลัมน์
function columnOffset(colIndex) {
  return `${OFFSET_PATTERN[colIndex % OFFSET_PATTERN.length]}px`
}

// ── ความเร็วเลื่อน: คอลัมน์ที่มีการ์ดเยอะกว่าใช้เวลาต่อรอบนานกว่า เพื่อให้ความเร็ว (px/s) ใกล้เคียงกันทุกคอลัมน์
//    (ปรับตัวคูณให้ช้าลงเพื่อความ smooth ไม่รีบ) ──
function columnDuration(col) {
  return `${col.length * 9}s`
}

// ── Tooltip (teleport ไป body เพื่อไม่ให้โดน overflow:hidden ของคอลัมน์ตัดขอบ) ──
const hoveredClient = ref(null)
const tooltipStyle = ref({})

function showTooltip(e, client) {
  hoveredClient.value = client
  const rect = e.currentTarget.getBoundingClientRect()
  tooltipStyle.value = {
    left: `${rect.left + rect.width / 2}px`,
    top: `${rect.top}px`,
  }
}

function hideTooltip() {
  hoveredClient.value = null
}
</script>

<style>
@import "@/assets/css/Clients.css";
</style>