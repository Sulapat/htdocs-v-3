// src/data/coursesData.js
export const courses = [
  {
    id: 'SYS002',
    courseCode: 'SYS002',
    title: 'การบริหารงานบำรุงรักษาสำหรับผู้บริหาร',
    englishTitle: 'Maintenance Management for Executives',
    desc: 'หลักสูตรสำหรับพัฒนาระบบบริหารงานบำรุงรักษาในโรงงานอุตสาหกรรม เพื่อเพิ่มประสิทธิภาพการทำงานของเครื่องจักร',
    category: 'SYS',
    duration: '1 วัน', capacity: '15 คน/รุ่น', price: 'N/A',
    image: '/images/course-maintenance.jpg', badge: 'ยอดนิยม', badgeClass: '',
    slug: 'maintenance-management-for-executives',
    description: 'หลักสูตรสำหรับพัฒนาระบบบริหารงานบำรุงรักษาในโรงงานอุตสาหกรรม เพื่อเพิ่มประสิทธิภาพการทำงานของเครื่องจักร ลดความเสียหาย ลดต้นทุน และเพิ่มประสิทธิผลในการผลิต',
    objectives: ['การพัฒนาระบบงานซ่อมบำรุง','จัดทำระบบซ่อมบำรุงเชิงรุกและเชิงป้องกัน','พัฒนาระบบประกันคุณภาพงานซ่อมบำรุง','ประยุกต์ใช้คอมพิวเตอร์ในงานซ่อมบำรุง','วัดและประเมินผลระบบซ่อมบำรุง'],
    targetGroups: ['ผู้จัดการโรงงาน','ผู้จัดการฝ่ายผลิต','ผู้จัดการฝ่ายซ่อมบำรุง','วิศวกร','หัวหน้างาน','ผู้สนใจทั่วไป'],
    topics: [
      { title: 'การพัฒนาระบบบำรุงรักษา', items: ['Proactive Maintenance (PoM)','Breakdown Maintenance (BM)','Preventive Maintenance (PM)','Predictive Maintenance (PdM)','Corrective Maintenance (CM)','Reliability Centered Maintenance (RCM)','Total Productive Maintenance (TPM)'] },
      { title: 'วิธีการเลือกระบบบำรุงรักษา', items: ['เลือกระบบบำรุงรักษาให้เหมาะสมกับเครื่องจักร'] },
      { title: 'ระบบ Predictive Maintenance', items: ['ตรวจวัดสุขภาพเครื่องจักร','ทำนายอายุการใช้งานเครื่องจักร'] },
      { title: 'Computerized Maintenance', items: ['โปรแกรมออกใบแจ้งงาน','โปรแกรมวางแผนบำรุงรักษา','โปรแกรมติดตามประวัติการซ่อม','โปรแกรมบริหารอะไหล่'] }
    ],
    schedules: [
      { time: '09:00 - 12:00', activities: ['การพัฒนาระบบบำรุงรักษา','วิธีการเลือกระบบบำรุงรักษา','Predictive Maintenance','Skill Development'] },
      { time: '13:00 - 16:00', activities: ['TPM','การใช้คอมพิวเตอร์บริหารงานซ่อมบำรุง','KPI งานซ่อมบำรุง','ถามตอบและแลกเปลี่ยนประสบการณ์'] }
    ],
    trainingMethod: ['การบรรยาย','Workshop','ให้คำปรึกษาโดยผู้เชี่ยวชาญ'],
    equipments: ['LCD Projector'],
    notes: ['Training fee: Exclude VAT'],
  },
  {
    id: 'SYS001',
    courseCode: 'SYS001',
    title: 'การวัดประสิทธิผลโดยรวมของเครื่องจักร',
    englishTitle: 'Overall Equipment Effectiveness (OEE)',
    desc: 'หลักสูตรสำหรับวิเคราะห์และปรับปรุงประสิทธิผลโดยรวมของเครื่องจักร (OEE) เพื่อลดความสูญเสีย',
    category: 'SYS',
    duration: '1 วัน', capacity: '15 คน/รุ่น', price: 'N/A',
    image: '/images/course-oee.jpg', badge: 'ใหม่', badgeClass: 'new',
    slug: 'overall-equipment-effectiveness',
    description: 'หลักสูตรสำหรับวิเคราะห์และปรับปรุงประสิทธิผลโดยรวมของเครื่องจักร (OEE) เพื่อลดความสูญเสีย เพิ่มประสิทธิภาพ และลดต้นทุนการผลิต',
    objectives: ['เข้าใจแนวคิดของ OEE','เข้าใจความสูญเสียหลัก 6 ประการ','นำ OEE ไปประยุกต์ใช้ในองค์กรได้'],
    targetGroups: ['พนักงานปฏิบัติการ','ผู้ใช้เครื่องจักร','ช่างเทคนิค','ฝ่ายซ่อมบำรุง','ผู้จัดการ'],
    topics: [
      { title: 'OEE Basics', items: ['ความสูญเสีย 6 ประการของเครื่องจักร','หลักการ OEE','การวัดประสิทธิผลเครื่องจักร'] },
      { title: 'OEE Improvement', items: ['วิเคราะห์และปรับปรุง OEE','แนวทางลดความสูญเสีย','กรณีศึกษา'] }
    ],
    schedules: [
      { time: '09:00 - 12:00', activities: ['TPM','ความสูญเสีย 6 ประการ','การวัด OEE'] },
      { time: '13:00 - 16:00', activities: ['การประยุกต์ใช้ OEE','การวิเคราะห์และปรับปรุง OEE','กรณีศึกษา'] }
    ],
    trainingMethod: ['บรรยาย','Workshop','นำเสนอผลงาน'],
    equipments: ['LCD Projector','Whiteboard','Flip Chart'],
    notes: ['ไม่รวมค่าเดินทางและที่พัก'],
  },
]

export function getCourseBySlug(slug) {
  return courses.find(c => c.slug === slug) || null
}