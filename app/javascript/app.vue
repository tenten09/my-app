<template>
  <v-app id="inspire">
    <v-navigation-drawer
            v-model="drawer"
            app
    >
      <v-list dense>
        <v-list-item to="/" link>
          <v-list-item-action>
            <v-icon>mdi-home</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>ホーム</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item to="/profile" link v-if="$store.getters['auth/currentUser']">
          <v-list-item-action>
            <v-icon>mdi-account</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>プロフィール</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item link v-if="$store.getters['auth/currentUser']">
          <v-list-item-action>
            <v-icon>mdi-logout</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title @click="logout">ログアウト</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item to="/login" link v-else>
          <v-list-item-action>
            <v-icon>mdi-account</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>ログイン</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar
            app
            color="green"
            dark
    >
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>情報共有</v-toolbar-title>
    </v-app-bar>

  <template>
    <v-card>
      <v-toolbar
        color="light-green"
        dark
        flat
      >
       
        <v-spacer></v-spacer>

        <template v-slot:extension>
          <v-tabs
            v-model="tab"
            align-with-title
          >
          <v-tabs-slider color="yellow"></v-tabs-slider>
            <v-tab 
              :key="item1"
              to="/"
            >
              {{ item1 }}
            </v-tab>

             <v-tab 
              :key="item2"
              to="/posts"
            >
              {{ item2 }}
            </v-tab>

            <v-tab 
              :key="item3"
              to="/profile"
            >
              {{ item3 }}
            </v-tab>
          </v-tabs>
        </template>
      </v-toolbar>

      <v-tabs-items v-model="tab">
        <v-tab-item>
          <v-card flat>
            <v-card-text v-text="text"></v-card-text>
          </v-card>
        </v-tab-item>
      
        <v-tab-item>
          <v-card flat>
            <v-card-text v-text="text1"></v-card-text>
          </v-card>
        </v-tab-item>

        <v-tab-item>
          <v-card flat>
            <v-card-text v-text="text2"></v-card-text>
          </v-card>
        </v-tab-item>
      </v-tabs-items>

    </v-card>
  </template>

    <v-main>
      <router-view></router-view>
    </v-main>
    <v-footer
            color="green"
            app
    >
      <span class="white--text">&copy; 2021</span>
    </v-footer>
  </v-app>
</template>

<script>
  export default {
    props: {
      source: String,
    },
    data () {
      return {
        drawer: null,
        tab: null,
        item1: '共通業務',
        item2: '車両手配・ドライバー',
        item3: 'プロフィール',
        text: '共通の情報共有',
        text1: '倉庫に関する情報共有',
        text2: '配車状況に関する情報共有',
      }
    },
    methods: {
      logout() {
        if (confirm("ログアウトしますか？")) {
          this.$store.dispatch('auth/logout')
        }
      }
    }
  }
</script>
