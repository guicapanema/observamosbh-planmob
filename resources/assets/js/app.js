
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');
require('./removeAccents');

window.Vue = require('vue');
import VueRouter from 'vue-router';
import Buefy from 'buefy';

Vue.use(VueRouter);
Vue.use(Buefy, {
	defaultIconPack: 'fa'
});

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const planmob = Vue.component('planmob', require('./components/PlanMob.vue'));
Vue.component('planmob-columns', require('./components/PlanMobColumns.vue'));
Vue.component('planmob-list', require('./components/PlanMobList.vue'));
Vue.component('item-card', require('./components/ItemCard.vue'));
Vue.component('filters-menu', require('./components/FiltersMenu.vue'));
Vue.component('nav-menu', require('./components/NavMenu.vue'));

const routes = [
	{
		path: '/',
		component: planmob,
		children: [
			{
				path: 'busca',
				component: planmob,
			},
			{
				path: 'eixo/:eixo',
				component: planmob,
				children: [
					{
					path: 'programa/:programa',
					component: planmob
					}
				]
			}
		]
  	}
]

const router = new VueRouter({
	mode: 'history',
	base: '/plano',
	routes
})

const app = new Vue({
	router
}).$mount('#app')
