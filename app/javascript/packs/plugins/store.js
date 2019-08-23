import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

// TODO: 状態管理は見直しを行う
export default new Vuex.Store({
  state: {
    user: {},
    team: {}
  },
  mutations: {
    signOff: function (state) {
      state.user = {}
      state.team = {}
    }
  },
  actions: {
    signIn (context, user, team) {
      context.commit({
        user: user,
        team: team
      })
    },
    signOff (context) {
      context.commit({
        user: {},
        team: {}
      })
    }
  },
  getters: {
    user: state => {
      return state.user
    },
    team: state => {
      return state.team
    }
  }
})
