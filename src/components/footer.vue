<template>
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-contact">
                <h3>ติดต่อเรา</h3>
                <p>65/17 หมู่ 4 ตำบลดอนหัวฬ่อ<br>อำเภอเมือง จังหวัดชลบุรี 20000</p>
                <p>
                    <strong>Email:</strong><br>
                    <a href="mailto:patineer@outlook.com">patineer@outlook.com</a><br>
                    <a href="mailto:patineer2@outlook.com">patineer2@outlook.com</a>
                </p>
                <p>
                    <strong>Tel:</strong><br>
                    096-1879595<br>
                    081-3927447
                </p>
            </div>
            <div class="footer-social">
                <div class="social-icons">
                    <a href="mailto:patineer@outlook.com" aria-label="Email" title="ส่งอีเมลถึงเรา">
                        <i class="fa fa-envelope"></i>
                    </a>
                    <a href="https://line.me/R/ti/p/@530ddhwa?oat_content=url&ts=05281716" target="_blank" rel="noopener" aria-label="Line" title="ติดต่อทาง LINE">
                        <i class="fab fa-line"></i>
                    </a>
                    <a href="https://www.facebook.com/Patineerr?locale=th_TH" target="_blank" rel="noopener" aria-label="Facebook" title="เยี่ยมชม Facebook">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                </div>
                <img src="https://api.qrserver.com/v1/create-qr-code/?size=180x180&data=https://line.me/R/ti/p/@530ddhwa" alt="Line QR" class="qr">
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
    }
}
</script>

<style>
@import "@/assets/css/footer.css";
</style>