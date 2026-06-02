import { ref } from 'vue';
import emailjs from '@emailjs/browser';

// 1. ตัวแปรสำหรับผูกกับ Input (v-model) ในฟอร์มของคุณ
const fullName = ref('');
const phone = ref('');
const email = ref('');
const course = ref('เทคนิคการขันยึดโบลท์และนัตอย่างถูกต้องเพื่อความเที่ยงตรง'); // ชื่อหลักสูตร
const price = ref('N/A'); // ราคา

// ตัวแปรควบคุมสถานะปุ่มหรือการแสดงข้อความแจ้งเตือน (ถ้ามี)
const errorMessage = ref('');
const isSubmitting = ref(false);

// 2. ฟังก์ชันหลักสำหรับกดส่งข้อมูล
const sendBooking = () => {
  // เช็กความเรียบร้อยก่อนส่ง
  if (!fullName.value || !phone.value || !email.value) {
    errorMessage.value = 'กรุณากรอกข้อมูลให้ครบถ้วน';
    return;
  }

  isSubmitting.value = true;
  errorMessage.value = '';

  // แพ็กข้อมูลให้ชื่อ Key ตรงกับปีกกาคู่ {{ }} ที่ตั้งไว้บนเว็บ EmailJS
  const templateParams = {
    fullName: fullName.value,
    phone: phone.value,
    email: email.value,
    course: course.value,
    price: price.value
  };

  // สั่งส่งข้อมูลตรงไปหา EmailJS (ไม่ต้องผ่าน PHP ไม่ติด CORS แน่นอน)
  emailjs.send(
    'service_r1g3hlq',   // 🌟 ใส่ Service ID ของคุณ (เช่น service_xxxxxx)
    'template_yihwf5c',  // 🌟 ใส่ Template ID ของคุณ (เช่น template_xxxxxx)
    templateParams,
    'jFrquSpMoGPiPa_t-'    // 🌟 ใส่ Public Key ของคุณ (เช่น user_xxxxxxxxxxxx)
  ) 
  .then((response) => {
    console.log('SUCCESS!', response.status, response.text);
    alert('🎉 บันทึกข้อมูลการจองและส่งเมลแจ้งเตือนสำเร็จแล้ว!');
    
    // เคลียร์ฟอร์มหลังจากส่งสำเร็จ
    fullName.value = '';
    phone.value = '';
    email.value = '';
  })
  .catch((error) => {
    console.error('FAILED...', error);
    errorMessage.value = `Error: ${error?.text || error?.message || JSON.stringify(error)}`;
  })
  .finally(() => {
    isSubmitting.value = false;
  });
};