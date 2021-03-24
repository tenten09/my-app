<template>
    <v-container>
        <v-row>
            <v-col>
                <div>
                    <div class="mb-5" v-if="$store.getters['auth/currentUser']">
                        <post-form @created="createPost"></post-form>
                    </div>
                    <postTimeline-list v-if="isExistPosts" :posts="posts"></postTimeline-list>
                    <div class="text-center" v-else>
                        一件もありません!!!
                    </div>
                </div>
            </v-col>
        </v-row>
    </v-container>
</template> 

<script>
    import PostForm from '@/components/PostForm'
    import PostTimelineList from '@/components/PostTimelineList'
    // import TimelineList from '@/components/TimelineList'
    import axios from "axios";
    export default {
        data() {
            return {
                posts: [],
            }
        },
        components: {
            PostForm,
            PostTimelineList
        },
        computed: {
            isExistPosts() {
                return this.posts.length > 0
            }
        },
        created() {
            this.fetchPosts()
        },
        methods: {
            async fetchPosts() {
                const res = await axios.get(`/api/posts`)
                this.posts = res.data.posts
                console.log(res.data);
            },
            async createPost(postContent) {
                const postParams = {
                    post: {
                        content: postContent
                    }
                }
                const res = await axios.post(`/api/posts`, postParams)
                this.posts =[...[res.data.post], ...this.posts]
            }
        }
    }
</script> 