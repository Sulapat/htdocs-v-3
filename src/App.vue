<template>
  <AppNav />
  <router-view />
  <AppFooter />
</template>

<script>
import AppNav    from '@/components/nav.vue'
import AppFooter from '@/components/footer.vue'

export default {
  components: {
    AppNav,
    AppFooter
  }
}
</script>