import Vue from 'vue'
import Router from 'vue-router'
import Maze from '@/components/Maze'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Maze',
      component: Maze
    }
  ]
})
