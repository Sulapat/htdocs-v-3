<template>
    <div class="nav">
        <nav id="navbar">
            <div class="logo">
                <router-link to="/">
                    <img src="@/assets/images/data/logo_Patineer-removebg.png">
                </router-link>
            </div>
            <div class="hamburger">
                <i class="fa fa-bars"></i>
            </div>
            <ul class="nav-links">
                <li><router-link to="/">Home</router-link></li>
                <li><router-link to="/service">Service</router-link></li>
                <li><router-link to="/knowledge">ประชาสัมพันธ์</router-link></li>
                <li><router-link to="/clients">Clients</router-link></li>
                <li><router-link to="/result">VI Certified Analysts</router-link></li>
                <li><router-link to="/result">Courses</router-link></li>
            </ul>
            <div class="social-links">
                <a href="https://mail.google.com/mail/?view=cm&to=patineer@outlook.com" 
                  target="_blank" aria-label="Email">
                    <i class="fa fa-envelope"></i>
                </a>
                <a href="https://line.me/R/ti/p/@530ddhwa" target="_blank" aria-label="Line">
                    <i class="fab fa-line"></i>
                </a>
                <a href="https://www.facebook.com/Patineerr" target="_blank" aria-label="Facebook">
                    <i class="fab fa-facebook-f"></i>
                </a>
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
      navbarBg: 'white'
    }
  },
  mounted() {
    this.initNavigation();
    window.addEventListener('scroll', this.handleNavbarScroll);
  },
  beforeUnmount() {
    window.removeEventListener('scroll', this.handleNavbarScroll);
  },
  methods: {
    initNavigation() {
      const hamburger = this.$el.querySelector('.hamburger');
      const navLinks = this.$el.querySelector('.nav-links');

      if (hamburger && navLinks) {
        hamburger.addEventListener('click', (e) => {
          e.stopPropagation();
          this.isMenuOpen = !this.isMenuOpen;
          navLinks.classList.toggle('show');
        });

        document.addEventListener('click', (e) => {
          if (!navLinks.contains(e.target) && !hamburger.contains(e.target)) {
            this.isMenuOpen = false;
            navLinks.classList.remove('show');
          }
        });
      }

      this.initSmoothScroll();
    },

    initSmoothScroll() {
      this.$el.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', (e) => {
          e.preventDefault();
          const target = document.querySelector(anchor.getAttribute('href'));
          if (target) {
            target.scrollIntoView({
              behavior: 'smooth',
              block: 'start'
            });
          }
        });
      });
    },

    handleNavbarScroll() {
      const navbar = this.$el.querySelector('#navbar');
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