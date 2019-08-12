import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    user: {},
    team: {},
    status: false
  },
  mutations: {
    onSignIn: function (state, data) {
      state.user = data.user
      state.team = data.team
      state.status = true
    },
    onSignOff: function (state) {
      state.status = false
      state.user = {}
      state.team = {}
    }
  },
  actions: {
    signIn (context, user, team) {
      context.commit({
        user: user,
        team: team,
        status: true
      })
    },
    signOff (context) {
      context.commit({
        user: {},
        team: {},
        status: false
      })
    }
  },
  getters: {
    user: state => {
      return state.user
    },
    team: state => {
      return state.team
    },
    isSignedIn: state => {
      return state.status
    }
  }
})
