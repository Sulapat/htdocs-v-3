<template>
    <footer class="footer" ref="footerEl">
        <!-- ── .footer-inner ──
             ห่อเนื้อหาทั้งหมดไว้เป็นชั้นเดียว เพื่อเป็นตัวที่ "ขยับ + fade" ตอนถูกเผย
             (ตัว .footer เองยัง fixed อยู่ตำแหน่งเดิมเป๊ะเสมอ ไม่ขยับ — ให้ .footer-inner
             เป็นตัวสร้างความรู้สึก "มุดออกมาจากใต้เนื้อหาด้านบน" แทน ผ่าน translateY + opacity
             ที่ผูกกับ --reveal-progress ซึ่งอัปเดตสดตาม scroll ในสคริปต์ด้านล่าง) -->
        <div class="footer-inner" ref="footerInner">
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
                    <li><router-link to="/showcase" @click="closeAll">{{ $t('nav.portfolio') }}</router-link></li>
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
        </div>
    </footer>
</template>

<script>
export default {
    name: 'AppFooter',
    data() {
        return {
            _revealTicking: false
        }
    },
    mounted() {
        if (!document.querySelector('link[href*="font-awesome"]')) {
            const link = document.createElement('link')
            link.rel = 'stylesheet'
            link.href = 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css'
            document.head.appendChild(link)
        }

        // วัดความสูง footer แล้วส่งเป็น --footer-height ให้ App.vue เอาไปคำนวณ
        // negative margin ของ .page-content (ต้องเท่ากันเป๊ะถึงจะซ้อนทับพอดี ไม่มีรอยห่าง/ล้น)
        this.footerHeightObserver = new ResizeObserver(this.updateFooterHeightVar)
        this.footerHeightObserver.observe(this.$refs.footerEl)
        this.updateFooterHeightVar()

        // ── Reveal motion: fade + slide ขึ้นมาเหมือน "มุดออกมาจากใต้เนื้อหา" ──
        // ผูกกับ scroll ตรงๆ (ไม่ใช้ CSS transition ที่มี duration ตายตัว เพราะจะ
        // lag ตาม scroll จริงไม่ทัน) คำนวณทุกครั้งที่ scroll/resize ว่า "เผยไปแล้วกี่ %"
        // โดยเทียบตำแหน่ง scroll ปัจจุบันกับช่องว่างท้ายหน้า (ความสูงเท่า footer พอดี
        // ที่ App.vue เว้นไว้ด้วย margin-bottom: var(--footer-height))
        // ใช้ requestAnimationFrame throttle กัน scroll event ยิงถี่เกินจำเป็น
        window.addEventListener('scroll', this.onRevealScroll, { passive: true })
        window.addEventListener('resize', this.onRevealScroll)
        this.updateRevealProgress()

        // ── Fix: footer ค้าง/เบลอตอนสลับหน้า (SPA ไม่ reload) ──
        // เดิม updateRevealProgress ถูกเรียกซ้ำแค่ตอน scroll/resize event หรือความสูง
        // "footer เอง" เปลี่ยน (footerHeightObserver ด้านบน) แต่ไม่เคยรู้เลยว่า "เนื้อหา
        // หน้าเปลี่ยน" (สลับ route ไปหน้าที่สั้น/ยาวกว่าเดิม) ทำให้ --reveal-progress ที่เคย
        // ค้างจากหน้าก่อน (เช่น เผยเต็มที่ตอน scroll ลึกๆ ในหน้า Clients) โผล่ทับหน้าใหม่ทันที
        // จนกว่าจะมี scroll/resize event ใหม่มาคำนวณซ้ำ — เฝ้าดูความสูงของ document.body
        // ตรงๆ แทน ให้ recompute ทุกครั้งที่ความสูงเอกสารเปลี่ยน ไม่ว่าจะมาจากสาเหตุอะไร
        // (สลับหน้า, เนื้อหาโหลดเพิ่ม, สลับภาษาแล้วบรรทัดเปลี่ยน ฯลฯ) กันพลาดซ้ำซ้อนกับ
        // การรีเซ็ต scroll ที่ App.vue ทำไว้อีกชั้น (เผื่อ route watcher นั้นพลาดเคสไหนไป)
        this.docHeightObserver = new ResizeObserver(this.onRevealScroll)
        this.docHeightObserver.observe(document.body)
    },
    beforeUnmount() {
        if (this.footerHeightObserver) this.footerHeightObserver.disconnect()
        if (this.docHeightObserver) this.docHeightObserver.disconnect()
        window.removeEventListener('scroll', this.onRevealScroll)
        window.removeEventListener('resize', this.onRevealScroll)
    },
    methods: {
        // อัปเดตตัวแปร global --footer-height (ใช้โดย .page-content ใน App.vue)
        updateFooterHeightVar() {
            const el = this.$refs.footerEl
            if (!el) return
            document.documentElement.style.setProperty('--footer-height', el.offsetHeight + 'px')
            // ความสูง footer เปลี่ยน (เช่น สลับภาษาแล้วข้อความยาวขึ้น/สั้นลง ทำให้ขึ้นบรรทัดใหม่)
            // ต้องคำนวณ progress ใหม่ทันที ไม่งั้นค่าที่ค้างไว้จะอิงความสูงเก่า
            this.updateRevealProgress()
        },
        onRevealScroll() {
            if (this._revealTicking) return
            this._revealTicking = true
            requestAnimationFrame(() => {
                this.updateRevealProgress()
                this._revealTicking = false
            })
        },
        // คำนวณว่า scroll ผ่านช่องว่างท้ายหน้า (สูงเท่า footer) ไปแล้วกี่ % (0 ถึง 1)
        // 0   = ยังไม่เริ่มเข้าเขต reveal เลย (footer-inner โปร่งใส/เลื่อนลงซ่อนอยู่)
        // 1   = scroll สุดหน้าแล้ว (footer-inner แสดงเต็มที่ ไม่มี offset)
        updateRevealProgress() {
            const el = this.$refs.footerInner
            const footerEl = this.$refs.footerEl
            if (!el || !footerEl) return
            const footerHeight = footerEl.offsetHeight
            if (!footerHeight) return

            const docHeight = document.documentElement.scrollHeight
            const scrollBottom = window.scrollY + window.innerHeight
            const gapStart = docHeight - footerHeight

            let progress = (scrollBottom - gapStart) / footerHeight
            progress = Math.min(1, Math.max(0, progress))

            el.style.setProperty('--reveal-progress', progress.toFixed(3))
        },
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