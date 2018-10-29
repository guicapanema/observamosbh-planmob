
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */


require('./bootstrap');
require('./removeAccents');
window.$ = require("jquery");
window.ImageMap = require('image-map/dist/image-map.js');
window.ClipboardJS = require('clipboard/dist/clipboard.js');
window.tippy = require('tippy.js');


window.Vue = require('vue');
import VueRouter from 'vue-router';
import VueClipboard from 'vue-clipboard2';
import Buefy from 'buefy';

Vue.use(VueRouter);
Vue.use(VueClipboard);
Vue.use(Buefy, {
	defaultIconPack: 'fa'
});

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('chart', require('./components/Chart.vue'));
Vue.component('chart-new', require('./components/ChartNew.vue'));
Vue.component('chart-wrapper', require('./components/ChartWrapper.vue'));
const planmob = Vue.component('planmob', require('./components/PlanMob.vue'));
Vue.component('planmob-columns', require('./components/PlanMobColumns.vue'));
Vue.component('planmob-list', require('./components/PlanMobList.vue'));
Vue.component('item-card', require('./components/ItemCard.vue'));
Vue.component('filters-menu', require('./components/FiltersMenu.vue'));
Vue.component('nav-menu', require('./components/NavMenu.vue'));
Vue.component('home-axes', require('./components/HomeAxes.vue'));
Vue.component('indicators', require('./components/Indicators.vue'));
Vue.component('indicator-card', require('./components/IndicatorCard.vue'));

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
			},
			{
				path: 'indicador/:indicador',
				component: planmob,
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
