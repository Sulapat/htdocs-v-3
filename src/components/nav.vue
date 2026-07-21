<template>
    <div class="nav">
        <nav id="navbar" ref="navbarRef" :class="{ 'nav-compact': isCompact }">
            <div class="logo" ref="logoRef">
                <router-link to="/">
                    <img src="@/assets/images/data/logo_Patineer-removebg.png">
                </router-link>
            </div>

            <ul class="nav-links" ref="navLinksRef" :class="{ 'show': isMenuOpen }">
                <li><router-link to="/" @click="closeAll">{{ $t('nav.home') }}</router-link></li>
                <li><a href="#service" @click.prevent="handleServiceClick">{{ $t('nav.service') }}</a></li>
                <li><router-link to="/knowledge" @click="closeAll">{{ $t('nav.knowledge') }}</router-link></li>
                <li><a href="#article" @click.prevent="handleArticleClick">{{ $t('nav.article') }}</a></li>
                
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
                    ref="langSwitchRef"
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
      // true = บังคับให้ nav-links เป็น list แบบมือถือ (hamburger) แม้จอจะกว้างเกิน 768px
      // ก็ตาม เพราะช่องว่างจริงระหว่างโลโก้กับปุ่มเปลี่ยนภาษาแคบกว่าความกว้างเมนู (ดู checkNavFit)
      isCompact: false,
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
      if (this.windowWidth <= 768 || this.isCompact) {
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

    // เช็คว่าเมนูจะทับกับโลโก้/ปุ่มเปลี่ยนภาษาไหมตั้งแต่โหลดหน้าแรก
    // ใช้ document.fonts.ready เพราะฟอนต์โหลดช้ากว่า DOM มักทำให้วัดความกว้างข้อความผิดถ้าเช็คเร็วเกินไป
    if (document.fonts && document.fonts.ready) {
      document.fonts.ready.then(() => this.checkNavFit());
    }
    this.$nextTick(() => this.checkNavFit());

    // ใช้ ResizeObserver คู่กับ window 'resize' เพราะเวลาซูมหน้าเว็บ (Ctrl +/-) เบราว์เซอร์บางตัว
    // ไม่ยิง 'resize' ให้ครบทุกครั้งอย่างสม่ำเสมอ แต่ ResizeObserver จับการเปลี่ยนขนาดจริงของ
    // #navbar ได้ตรงกว่า (ทำงานหลัง layout นิ่งแล้ว) — ใช้ debounce ด้วย setTimeout (ไม่ใช่แค่
    // requestAnimationFrame เฟรมเดียว) เผื่อเวลาให้ข้อความ/ฟอนต์รีโฟลว์ที่ zoom ระดับใหม่เสร็จก่อน
    // ค่อยวัด ไม่งั้นจะเจอบั๊กค้างสภาพเดิม (เช่น ซูม 175% -> 200% -> กลับ 175% แล้วเช็คไม่ถูกต้อง
    // เพราะวัดจากค่าที่ยังรีโฟลว์ไม่เสร็จ)
    if (window.ResizeObserver) {
      this._navResizeObserver = new ResizeObserver(() => {
        if (this._navFitTimer) clearTimeout(this._navFitTimer);
        this._navFitTimer = setTimeout(() => this.checkNavFit(), 120);
      });
      // สำคัญ: ต้องระบุ box:'border-box' เพราะ #navbar กำหนด width:100% + box-sizing:border-box
      // ไว้ตายตัวอยู่แล้ว border-box จึงไม่เปลี่ยนขนาดตอนสลับ .nav-compact (ซึ่งเปลี่ยนแค่ padding)
      // ถ้าใช้ค่า default (content-box) การสลับ .nav-compact จะทำให้ content-box เปลี่ยน แล้ว
      // ResizeObserver ยิง callback ซ้ำ -> เรียก checkNavFit ซ้ำ -> อาจสลับ isCompact กลับไปมา
      // กลายเป็น feedback loop ที่เห็นเป็นอาการกระพริบ (โดยเฉพาะตอนความกว้างก้ำกึ่งพอดี buffer)
      if (this.$refs.navbarRef) this._navResizeObserver.observe(this.$refs.navbarRef, { box: 'border-box' });
    }
  },
  beforeUnmount() {
    // สำคัญมาก: ต้องคืนค่า scroll ทุกครั้งก่อนทำลาย component
    this.toggleBodyScroll(false);
    if (this._navFitFrame) cancelAnimationFrame(this._navFitFrame);
    if (this._navFitTimer) clearTimeout(this._navFitTimer);
    if (this._navResizeObserver) this._navResizeObserver.disconnect();
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
    // เมนู "บริการ": ไม่พาไปหน้าแยกอีกต่อไป แต่เลื่อนลงไปยัง #service ในหน้า Home แทน
    // - อยู่หน้า Home อยู่แล้ว → เลื่อนทันที
    // - อยู่หน้าอื่น → พาไปหน้า Home ก่อน แล้วค่อยเลื่อนหลัง component mount เสร็จ
    handleServiceClick() {
      this.closeAll();
      if (this.$route.path === '/') {
        this.scrollToService();
      } else {
        this.$router.push('/').then(() => {
          this.$nextTick(() => this.scrollToService());
        });
      }
    },
    scrollToService() {
      // เผื่อเวลาให้ DOM ของหน้า Home render เสร็จก่อนคำนวณตำแหน่ง scroll
      setTimeout(() => {
        const target = document.getElementById('service');
        if (target) target.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }, 60);
    },
    // เมนู "บทความ": พาไปหน้า /knowledge แล้วเลื่อนลงไปยัง #article
    // (ส่วนบทความถูกต่อท้ายไว้ล่างสุดของหน้าประชาสัมพันธ์ ไม่ได้แยกเป็นหน้า /article อีกต่อไป)
    // - อยู่หน้า /knowledge อยู่แล้ว → เลื่อนทันที
    // - อยู่หน้าอื่น → พาไปหน้า /knowledge ก่อน แล้วค่อยเลื่อนหลัง component mount เสร็จ
    handleArticleClick() {
      this.closeAll();
      if (this.$route.path === '/knowledge') {
        this.scrollToArticle();
      } else {
        this.$router.push('/knowledge').then(() => {
          this.$nextTick(() => this.scrollToArticle());
        });
      }
    },
    scrollToArticle() {
      // ส่วนบทความโหลดข้อมูลจาก API เอง (getArticles) จึงเผื่อเวลาให้ DOM/รูป hero เรนเดอร์เสร็จก่อนคำนวณตำแหน่ง scroll
      setTimeout(() => {
        const target = document.getElementById('article');
        if (target) target.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }, 150);
    },
    handleViClick() {
      if (this.windowWidth <= 768 || this.isCompact) {
        // มือถือ หรือ compact-mode (จอกว้างแต่เมนูจะทับโลโก้/ปุ่มเปลี่ยนภาษา): toggle dropdown เหมือนเดิม
        this.viDropOpen = !this.viDropOpen;
      } else {
        // Desktop ปกติ (ไม่ compact): ไปหน้า /result เลย
        this.closeAll();
        this.$router.push('/result');
      }
    },
    handleMouseEnter() {
      if (this.windowWidth > 768 && !this.isCompact) this.viDropOpen = true;
    },
    handleMouseLeave() {
      if (this.windowWidth > 768 && !this.isCompact) this.viDropOpen = false;
    },
    handleResize() {
      this.windowWidth = window.innerWidth;
      if (this.windowWidth > 768) {
        this.toggleBodyScroll(false); // ปลดล็อคถ้าขยายหน้าจอเป็น Desktop
      }
      // ใช้ requestAnimationFrame กันเรียก checkNavFit (มี forced reflow) รัวเกินไปตอนลาก resize
      if (this._navFitFrame) cancelAnimationFrame(this._navFitFrame);
      this._navFitFrame = requestAnimationFrame(() => this.checkNavFit());
    },
    // ============ วัดว่าเมนูจะทับกับโลโก้/ปุ่มเปลี่ยนภาษาไหม ============
    // ปกติ nav-links ถูกตรึงกลางจอด้วย position:absolute (ดู nav.css) ซึ่งไม่แย่งพื้นที่ตาม
    // flow ปกติ ทำให้ล้นทับโลโก้/ปุ่มเปลี่ยนภาษาได้แบบไม่รู้ตัวถ้าช่องว่างจริงแคบกว่าความกว้างเมนู
    // (เช่น สลับเป็นภาษาอังกฤษแล้วข้อความยาวขึ้น หรือจอกว้างระดับแท็บเล็ต) เลยต้องวัดจริงด้วย JS
    // แทนที่จะยึด breakpoint 768px อย่างเดียว แล้วสลับไปโหมด hamburger เหมือนมือถือทันทีที่ชนกัน
    //
    // เช็ค 2 ฝั่งตรง ๆ ตามที่ควรจะเป็น:
    //   ฝั่งซ้าย: ขอบซ้ายของ "หน้าแรก" (li ตัวแรก) เทียบกับขอบขวาของโลโก้
    //   ฝั่งขวา:  ขอบขวาของ "ลูกค้า" (li ตัวสุดท้าย) เทียบกับขอบซ้ายของปุ่มเปลี่ยนภาษา
    checkNavFit() {
      // ต่ำกว่า 768px มี @media ใน nav.css บังคับโหมดมือถืออยู่แล้ว ไม่ต้องเช็คซ้ำ
      if (window.innerWidth <= 768) return;

      const navbarEl = this.$refs.navbarRef;
      const navEl = this.$refs.navLinksRef;
      const logoEl = this.$refs.logoRef;
      const langEl = this.$refs.langSwitchRef;
      if (!navbarEl || !navEl || !logoEl || !langEl) return;

      // clone ออกไปวัดนอก DOM จริงก่อน (ไม่ต่อกลับเข้า #navbar) เพื่อเลี่ยง flex-shrink ที่ #navbar
      // (display:flex) จะบีบความกว้างของ nav-links ให้พอดีกับพื้นที่ว่างถ้าเอากลับเข้า flow จริง —
      // จากนั้นค่อยย้าย clone ไปวางที่ "ตำแหน่งจริงที่มันจะอยู่" (กึ่งกลาง #navbar) แล้ววัด li
      // ตัวแรก/ตัวสุดท้ายตรง ๆ จาก clone นั้น แทนที่จะคำนวณเลขคณิตเดา — กันพลาดจาก padding/margin
      // แฝงของ <ul> (ค่า default ของเบราว์เซอร์) ที่ทำให้ขอบ block กับขอบ li จริงไม่ตรงกัน
      const clone = navEl.cloneNode(true);
      clone.classList.remove('show');
      clone.style.cssText = 'display:flex; flex-direction:row; position:fixed; top:-9999px; left:-9999px; margin:0; padding:0; visibility:hidden; width:auto; max-width:none; white-space:nowrap; transform:none; pointer-events:none;';
      document.body.appendChild(clone);
      const naturalWidth = clone.scrollWidth;

      // ย้าย clone ไปที่ตำแหน่งกึ่งกลาง #navbar จริง (จำลองตำแหน่งที่ nav-links จะไปอยู่ถ้าไม่ compact)
      const navbarRect = navbarEl.getBoundingClientRect();
      const centerX = navbarRect.left + navbarRect.width / 2;
      clone.style.left = `${centerX - naturalWidth / 2}px`;
      clone.style.top = `${navbarRect.top}px`;

      const items = clone.querySelectorAll(':scope > li');
      const firstRect = items.length ? items[0].getBoundingClientRect() : null;
      const lastRect = items.length ? items[items.length - 1].getBoundingClientRect() : null;
      document.body.removeChild(clone);
      if (!firstRect || !lastRect) return;

      const logoRect = logoEl.getBoundingClientRect();
      const langRect = langEl.getBoundingClientRect();

      // Hysteresis: ใช้ buffer ไม่เท่ากันระหว่างเข้า-ออกโหมด compact เพื่อกัน "แกว่ง" (flicker)
      // เวลาความกว้างจริงตกอยู่ก้ำกึ่งพอดีใกล้ ๆ buffer เดิม (เช่น ระหว่างเปลี่ยน zoom แล้ว browser
      // reflow หลายรอบ ค่า getBoundingClientRect ที่วัดได้แต่ละรอบต่างกันเป็นเศษพิกเซล) — ถ้าใช้
      // ค่าเดียวกันทั้งเข้า-ออก แค่ต่างกันเสี้ยว px ก็สลับ true/false กลับไปมาได้ ต้องเผื่อระยะห่าง
      // ให้ "ออก" จากโหมด compact ยากกว่า "เข้า" เล็กน้อย (ต้องมีที่ว่างเหลือจริง ๆ ไม่ใช่แค่พอดีเป๊ะ)
      const enterBuffer = 16; // ระยะกันชนตอนจะสลับเป็น compact
      const exitBuffer = 32;  // ต้องมีที่ว่างเผื่อมากกว่านี้ถึงจะยอมสลับกลับเป็น full menu
      const buffer = this.isCompact ? exitBuffer : enterBuffer;
      const overlapsLogo = firstRect.left < logoRect.right + buffer;
      const overlapsLang = lastRect.right > langRect.left - buffer;

      this.isCompact = overlapsLogo || overlapsLang;
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
      // ข้อความเมนูยาว/สั้นไม่เท่ากันตามภาษา (เช่น EN มักยาวกว่า TH) ต้องเช็คใหม่ว่าจะทับกันไหม
      this.$nextTick(() => this.checkNavFit());
    }
  }
}
</script>

<style>
@import "@/assets/css/nav.css";
</style>