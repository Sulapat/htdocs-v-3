import { createRouter, createWebHistory } from 'vue-router'

import index      from '@/components/index.vue'
import Service   from '@/components/Service.vue'
import Clients   from '@/components/Clients.vue'
import Detail    from '@/components/detail.vue'
import Knowledge from '@/components/Knowledge.vue'
import Portfolio from '@/components/Portfolio.vue'
import TestResult from '@/components/TestResult.vue'

const routes = [
  { path: '/',           component: index      },
  { path: '/index.html', redirect: '/'        },
  { path: '/service',    component: Service   },
  { path: '/clients',    component: Clients   },
  { path: '/detail',     component: Detail    },
  { path: '/knowledge',  component: Knowledge },
  { path: '/portfolio',  component: Portfolio },
  { path: '/result', component: TestResult },
]

export default createRouter({
  history: createWebHistory(),
  routes,
  scrollBehavior() {
    return { top: 0 }
  }
})