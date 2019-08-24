import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    session: null
  },
  mutations: {
    setSession (state, session) {
      state.session = session
    },
    clearSession (state) {
      state.session = null
    }
  },
  actions: {
    signIn (context, session) {
      context.commit('setSession', session)
    },
    signOff (context) {
      context.commit('clearSession')
    }
  },
  getters: {
    isSignedIn: state => {
      return !!state.session
    },
    user: state => {
      return state.session.user
    },
    team: state => {
      return state.session.team
    }
  }
})
