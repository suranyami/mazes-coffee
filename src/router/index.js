import Vue from 'vue'
import Router from 'vue-router'
import Maze from '@/components/Maze'
import About from '@/components/About'

Vue.use(Router)

export default new Router({
  routes: [
    {path: '/', alias: '/maze', component: Maze},
    {path: '/about', name: 'About', component: About},
  ]
})
