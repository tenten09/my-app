import axios from 'axios';
const state = {
    currentUser: null,
};

const getters = {
    currentUser: state => state.currentUser,
};

const mutations = {
    SET_CURRENT_USER: (state, user) => {
        state.currentUser = user;
        localStorage.setItem('currentUser', JSON.stringify(user))
        axios.defaults.headers.common['Authorization'] = `Bearer ${user.token}`
        console.log(user.token)
    },
    CLEAR_CURRENT_USER: () => {
        state.currentUser = null
        localStorage.removeItem('currentUser')
        location.reload()
    }
};

const actions = {
    async login({ commit }, sessionParams) {
        const res = await axios.post(`/api/session`, sessionParams)
        commit("SET_CURRENT_USER", res.data.user);
    },

    logout({ commit }) {
        commit("CLEAR_CURRENT_USER");
    },
    async updateProfile({ commit, state }, userParams) {
        const res = await axios.patch(`/api/me/account`, userParams)
        commit("SET_CURRENT_USER", { ...res.data.user, ...{ token: state.currentUser.token } });
    },
};

export default {
    namespaced: true,
    state,
    mutations,
    actions,
    getters
}; 
