<template>
  <AppNav v-if="!$route.meta.hideChrome" />
  <div class="page-content">
    <router-view />
  </div>
  <AppFooter v-if="!$route.meta.hideChrome" />
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