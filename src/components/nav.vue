<template>
    <div class="nav">
        <nav id="navbar">
            <div class="logo">
                <router-link to="/">
                    <img src="@/assets/images/data/logo_Patineer-removebg.png">
                </router-link>
            </div>

            <ul class="nav-links" :class="{ 'show': isMenuOpen }">
                <li><router-link to="/" @click="closeAll">{{ $t('nav.home') }}</router-link></li>
                <li><router-link to="/service" @click="closeAll">{{ $t('nav.service') }}</router-link></li>
                <li><router-link to="/knowledge" @click="closeAll">{{ $t('nav.knowledge') }}</router-link></li>
                <li><router-link to="/article" @click="closeAll">{{ $t('nav.article') }}</router-link></li>
                
                <li class="nav-dropdown-wrap"
                    @mouseenter="handleMouseEnter"
                    @mouseleave="handleMouseLeave"
                >
                  <router-link to="/result" class="nav-dropdown-trigger" @click.prevent="handleViClick">
                    {{ $t('nav.viAnalysts') }}
                    <svg class="nav-drop-chevron" :class="{ open: viDropOpen }"
                      xmlns="https://www.w3.org/2000/svg" width="13" height="13"
                      viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                      <polyline points="6 9 12 15 18 9"/>
                    </svg>
                  </router-link>

                  <transition name="fade-slide">
                    <ul class="nav-dropdown-menu" 
                        v-show="viDropOpen" 
                        :class="{ open: viDropOpen }">
                      <li>
                        <router-link to="/result?course=BMV" @click="closeAll">
                          <span class="nav-drop-dot dot-bmv"></span>
                          {{ $t('nav.bmv') }}
                        </router-link>
                      </li>
                      <li>
                        <router-link to="/result?course=C2VA" @click="closeAll">
                          <span class="nav-drop-dot dot-va2"></span>
                          {{ $t('nav.c2va') }}
                        </router-link>
                      </li>
                      <li>
                        <router-link to="/result?course=C3VA" @click="closeAll">
                          <span class="nav-drop-dot dot-va3"></span>
                          {{ $t('nav.c3va') }}
                        </router-link>
                      </li>
                      <li>
                        <router-link to="/result?course=C4VA" @click="closeAll">
                          <span class="nav-drop-dot dot-va4"></span>
                          {{ $t('nav.c4va') }}
                        </router-link>
                      </li>
                    </ul>
                  </transition>
                </li>

                <li><router-link to="/courses" @click="closeAll">{{ $t('nav.courses') }}</router-link></li>
                <li><router-link to="/clients" @click="closeAll">{{ $t('nav.clients') }}</router-link></li>
            </ul>

            <!-- กลุ่มขวา: ปุ่มสลับภาษา + hamburger (มือถือ) + โซเชียล (เดสก์ท็อป) เป็นก้อนเดียวกัน
                 ไม่แย่งพื้นที่กับ nav-links เพราะ nav-links ถูกตรึงกลางจอด้วย position:absolute -->
            <div class="nav-right">
                <button
                    class="lang-switch"
                    :class="{ 'is-en': currentLang === 'en' }"
                    type="button"
                    role="switch"
                    :aria-checked="currentLang === 'en'"
                    aria-label="Switch language / สลับภาษา"
                    @click="toggleLanguage"
                >
                    <span class="lang-switch-thumb"></span>
                    <span class="lang-switch-label lang-th">TH</span>
                    <span class="lang-switch-label lang-en">EN</span>
                </button>

                <div class="hamburger" @click="toggleMenu">
                    <i class="fa" :class="isMenuOpen ? 'fa-times' : 'fa-bars'"></i>
                </div>

                <div class="social-links">
                    <a href="https://mail.google.com/mail/?view=cm&to=patineer@outlook.com" target="_blank"><i class="fa fa-envelope"></i></a>
                    <a href="https://line.me/R/ti/p/@530ddhwa" target="_blank"><i class="fab fa-line"></i></a>
                    <a href="https://www.facebook.com/Patineerr" target="_blank"><i class="fab fa-facebook-f"></i></a>
                </div>
            </div>
        </nav>
    </div>
</template>

<script>
export default {
  name: 'AppNav',
  data() {
    return {
      isMenuOpen: false,
      viDropOpen: false,
      windowWidth: window.innerWidth,
      // currentLang อ่านจาก vue-i18n locale ปัจจุบัน (sync กับ localStorage ผ่าน i18n.js)
      currentLang: this.$i18n.locale
    }
  },
  // เพิ่ม Watcher เพื่อจับการเปลี่ยนแปลงของตัวแปรเปิด/ปิดเมนู
  watch: {
    // เมื่อเมนู Hamburger เปิดหรือปิด
    isMenuOpen(value) {
      this.toggleBodyScroll(value);
    },
    // เมื่อ Dropdown ในหน้าจอมือถือเปิดหรือปิด
    viDropOpen(value) {
      if (this.windowWidth <= 768) {
        this.toggleBodyScroll(value || this.isMenuOpen);
      }
    }
  },
  mounted() {
    // ตั้งธีมสีให้ตรงกับภาษาที่ใช้อยู่ตอนโหลดหน้า (เผื่อ currentLang มาจาก localStorage ไม่ใช่ default)
    document.documentElement.setAttribute('data-theme', this.currentLang);
    window.addEventListener('resize', this.handleResize);
    window.addEventListener('scroll', this.handleNavbarScroll);
    document.addEventListener('click', this.handleClickOutside);
  },
  beforeUnmount() {
    // สำคัญมาก: ต้องคืนค่า scroll ทุกครั้งก่อนทำลาย component
    this.toggleBodyScroll(false);
    window.removeEventListener('resize', this.handleResize);
    window.removeEventListener('scroll', this.handleNavbarScroll);
    document.removeEventListener('click', this.handleClickOutside);
  },
  methods: {
    // ฟังก์ชันสำหรับล็อคและปลดล็อค Scroll แบบเด็ดขาด
    toggleBodyScroll(isLock) {
      const body = document.body;
      if (isLock) {
        body.style.overflow = 'hidden';
        body.style.height = '100vh'; // บังคับความสูงเท่าหน้าจอ
        body.style.touchAction = 'none'; // ปิดการสัมผัสเพื่อเลื่อนบนมือถือ
      } else {
        body.style.overflow = '';
        body.style.height = '';
        body.style.touchAction = '';
      }
    },
    toggleMenu() {
      this.isMenuOpen = !this.isMenuOpen;
      if (!this.isMenuOpen) this.viDropOpen = false;
    },
    toggleViDrop() {
      this.viDropOpen = !this.viDropOpen;
    },
    handleViClick() {
      if (this.windowWidth <= 768) {
        // มือถือ: toggle dropdown เหมือนเดิม
        this.viDropOpen = !this.viDropOpen;
      } else {
        // Desktop: ไปหน้า /result เลย
        this.closeAll();
        this.$router.push('/result');
      }
    },
    handleMouseEnter() {
      if (this.windowWidth > 768) this.viDropOpen = true;
    },
    handleMouseLeave() {
      if (this.windowWidth > 768) this.viDropOpen = false;
    },
    handleResize() {
      this.windowWidth = window.innerWidth;
      if (this.windowWidth > 768) {
        this.toggleBodyScroll(false); // ปลดล็อคถ้าขยายหน้าจอเป็น Desktop
      }
    },
    closeAll() {
      this.isMenuOpen = false;
      this.viDropOpen = false;
      this.toggleBodyScroll(false);
    },
    handleClickOutside(e) {
      if (!this.$el.contains(e.target)) {
        this.closeAll();
      }
    },
    handleNavbarScroll() {
      const navbar = document.getElementById('navbar');
      if (!navbar) return;
      if (window.scrollY > 100) {
        navbar.style.background = 'rgba(255, 255, 255, 0.95)';
        navbar.style.boxShadow = '0 2px 10px rgba(0,0,0,0.1)';
      } else {
        navbar.style.background = 'white';
        navbar.style.boxShadow = '0 2px 5px rgba(0,0,0,0.05)';
      }
    },
    // สลับภาษา TH <-> EN — ต่อกับ vue-i18n จริง
    toggleLanguage() {
      this.currentLang = this.currentLang === 'th' ? 'en' : 'th';
      // เปลี่ยนภาษาทั้งแอปทันที ทุก component ที่ใช้ $t() จะ re-render อัตโนมัติ
      this.$i18n.locale = this.currentLang;
      localStorage.setItem('lang', this.currentLang);
      document.documentElement.setAttribute('lang', this.currentLang);
      // สลับธีมสีทั้งเว็บตามภาษา: th = เขียว, en = น้ำเงินตามโลโก้ (ดู styles.css)
      document.documentElement.setAttribute('data-theme', this.currentLang);
      // ยิง custom event ไว้เผื่อ component อื่นอยากฟังการเปลี่ยนภาษา (เช่น โค้ดที่ไม่ใช่ Vue)
      window.dispatchEvent(new CustomEvent('lang-changed', { detail: this.currentLang }));
    }
  }
}
</script>

<style>
@import "@/assets/css/nav.css";
</style>