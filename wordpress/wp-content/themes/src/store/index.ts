import { MutationTree, createStore } from 'vuex'
import { Settings, State } from '@/types/App'


export enum Mutations {
}

interface StoreWithModules extends State {

}


export const mutations: MutationTree<State> = {
  
}




export default createStore<StoreWithModules>({
  state: {
  },
  mutations,
  getters: {

  },
  actions: {
  },
  modules: {
  },
})

