import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)
import PageUserRegister from '@/pages/PageUserRegister'
import PageUserLogin from '@/pages/PageUserLogin'
import PageTimeline from '@/pages/PageTimeline'
import PageMicropostDetail from '@/pages/PageMicropostDetail'
import PagePostDetail from '@/pages/PagePostDetail'
import PagePostTimeline from '@/pages/PagePostTimeline'
import PageProfile from '@/pages/PageProfile'

const router = new VueRouter({
    routes: [
        { path: '/signup', component: PageUserRegister, name: 'user-register' },
        { path: '/login', component: PageUserLogin, name: 'user-login' },
        { path: '/', component: PageTimeline, name: 'timeline' },
        { path: '/microposts', component: PageTimeline },
        { path: '/microposts/:id', component: PageMicropostDetail, name: 'micropost-detail' },

        { path: '/posts', component: PagePostTimeline },
        { path: '/posts/:id', component: PagePostDetail, name: 'post-detail' },
        
        { path: '/profile', component: PageProfile, name: 'my-profile' },
        { path: '/users/:id', component: PageProfile, name: 'user-profile' },
    ]
});

export default router; 