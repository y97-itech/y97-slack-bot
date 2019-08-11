const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)

const sass = require('./loaders/sass')
environment.loaders.prepend('sass', sass)

const VuetifyLoaderPlugin = require('vuetify-loader/lib/plugin')
environment.plugins.append('VuetifyLoaderPlugin',
  new VuetifyLoaderPlugin()
)

module.exports = environment
