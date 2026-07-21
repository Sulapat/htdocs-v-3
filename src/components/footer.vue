<template>
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-col footer-contact">
                <h3>{{ $t('footer.contactUs') }}</h3>
                <p v-html="$t('footer.address')"></p>
                <p>
                    <strong>{{ $t('footer.emailLabel') }}</strong><br>
                    <a href="mailto:patineer@outlook.com">patineer@outlook.com</a><br>
                    <a href="mailto:Pat_eng2@patineer.co.th">Pat_eng2@patineer.co.th</a>
                </p>
                <p>
                    <strong>{{ $t('footer.telLabel') }}</strong><br>
                    096-1879595<br>
                    081-3927447
                </p>
            </div>

            <div class="footer-col footer-links">
                <ul>
                    <li><router-link to="/">{{ $t('nav.home') }}</router-link></li>
                    <li><a href="#service" @click.prevent="handleServiceClick">{{ $t('nav.service') }}</a></li>
                    <li><router-link to="/knowledge">{{ $t('nav.knowledge') }}</router-link></li>
                    <li><a href="#article" @click.prevent="handleArticleClick">{{ $t('nav.article') }}</a></li>
                    <li><router-link to="/result">{{ $t('nav.viAnalysts') }}</router-link></li>
                    <li><router-link to="/courses">{{ $t('nav.courses') }}</router-link></li>
                    <li><router-link to="/clients">{{ $t('nav.clients') }}</router-link></li>
                </ul>
            </div>

            <div class="footer-col footer-social">
                <div class="social-icons">
                    <a href="mailto:patineer@outlook.com" aria-label="Email" :title="$t('footer.emailTitle')">
                        <i class="fa fa-envelope"></i>
                    </a>
                    <a href="https://line.me/R/ti/p/@530ddhwa?oat_content=url&ts=05281716" target="_blank" rel="noopener" aria-label="Line" :title="$t('footer.lineTitle')">
                        <i class="fab fa-line"></i>
                    </a>
                    <a href="https://www.facebook.com/Patineerr?locale=th_TH" target="_blank" rel="noopener" aria-label="Facebook" :title="$t('footer.facebookTitle')">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                </div>
                <img
                    src="https://api.qrserver.com/v1/create-qr-code/?size=180x180&data=https://line.me/R/ti/p/@530ddhwa"
                    alt="Line QR"
                    class="qr"
                >
            </div>
        </div>

        <div class="footer-bottom">
            <p>&copy; 2025 PATINEER</p>
        </div>
    </footer>
</template>

<script>
export default {
    name: 'AppFooter',
    mounted() {
        if (!document.querySelector('link[href*="font-awesome"]')) {
            const link = document.createElement('link')
            link.rel = 'stylesheet'
            link.href = 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css'
            document.head.appendChild(link)
        }
    },
    methods: {
        // เหมือน logic ใน nav.vue: ถ้าอยู่หน้าแรกอยู่แล้วให้เลื่อนทันที ถ้าไม่ใช่ให้พาไปหน้าแรกก่อนแล้วค่อยเลื่อน
        handleServiceClick() {
            if (this.$route.path === '/') {
                this.scrollToSection('service')
            } else {
                this.$router.push('/').then(() => {
                    this.$nextTick(() => this.scrollToSection('service', 60))
                })
            }
        },
        // เหมือน logic ใน nav.vue: ส่วนบทความอยู่ท้ายหน้า /knowledge
        handleArticleClick() {
            if (this.$route.path === '/knowledge') {
                this.scrollToSection('article', 150)
            } else {
                this.$router.push('/knowledge').then(() => {
                    this.$nextTick(() => this.scrollToSection('article', 150))
                })
            }
        },
        scrollToSection(id, delay = 60) {
            setTimeout(() => {
                const target = document.getElementById(id)
                if (target) target.scrollIntoView({ behavior: 'smooth', block: 'start' })
            }, delay)
        }
    }
}
</script>

<style>
@import "@/assets/css/footer.css";
</style>