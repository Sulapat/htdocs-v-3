<template>
    <div class="nav">
        <nav id="navbar">
            <div class="logo">
                <router-link to="/">
                    <img src="@/assets/images/data/logo_Patineer-removebg.png">
                </router-link>
            </div>
            
            <div class="hamburger" @click="toggleMenu">
                <i class="fa" :class="isMenuOpen ? 'fa-times' : 'fa-bars'"></i>
            </div>

            <ul class="nav-links" :class="{ 'show': isMenuOpen }">
                <li><router-link to="/" @click="closeAll">Home</router-link></li>
                <li><router-link to="/service" @click="closeAll">Service</router-link></li>
                <li><router-link to="/knowledge" @click="closeAll">ประชาสัมพันธ์</router-link></li>
                <li><router-link to="/clients" @click="closeAll">Clients</router-link></li>
                
                <li class="nav-dropdown-wrap"
                    @mouseenter="handleMouseEnter"
                    @mouseleave="handleMouseLeave"
                >
                  <a href="javascript:void(0)" class="nav-dropdown-trigger" @click="toggleViDrop">
                    VI Certified Analysts
                    <svg class="nav-drop-chevron" :class="{ open: viDropOpen }"
                      xmlns="http://www.w3.org/2000/svg" width="13" height="13"
                      viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
                      <polyline points="6 9 12 15 18 9"/>
                    </svg>
                  </a>

                  <transition name="fade-slide">
                    <ul class="nav-dropdown-menu" 
                        v-show="viDropOpen" 
                        :class="{ open: viDropOpen }">
                      <li>
                        <router-link to="/result?course=BMV" @click="closeAll">
                          <span class="nav-drop-dot dot-bmv"></span>
                          Basic Machinery Vibration
                        </router-link>
                      </li>
                      <li>
                        <router-link to="/result?course=C2VA" @click="closeAll">
                          <span class="nav-drop-dot dot-va2"></span>
                          Category II Vibration Analyst
                        </router-link>
                      </li>
                      <li>
                        <router-link to="/result?course=C3VA" @click="closeAll">
                          <span class="nav-drop-dot dot-va3"></span>
                          Category III Vibration Analyst
                        </router-link>
                      </li>
                      <li>
                        <router-link to="/result?course=C4VA" @click="closeAll">
                          <span class="nav-drop-dot dot-va4"></span>
                          Category IV Vibration Analyst
                        </router-link>
                      </li>
                    </ul>
                  </transition>
                </li>

                <li><router-link to="/courses" @click="closeAll">Courses</router-link></li>
            </ul>

            <div class="social-links">
                <a href="https://mail.google.com/mail/?view=cm&to=patineer@outlook.com" target="_blank"><i class="fa fa-envelope"></i></a>
                <a href="https://line.me/R/ti/p/@530ddhwa" target="_blank"><i class="fab fa-line"></i></a>
                <a href="https://www.facebook.com/Patineerr" target="_blank"><i class="fab fa-facebook-f"></i></a>
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
      windowWidth: window.innerWidth
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
    }
  }
}
</script>

<style>
@import "@/assets/css/nav.css";
</style>