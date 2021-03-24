<template>
     <v-container>
        <v-row>
            <v-col>
                <div v-if="post">
                    <v-list-item
                    >
                        <v-list-item-avatar @click="$router.push(`/users/${post.user.id}`)" style="cursor: pointer">
                            <v-img :src="post.user.avatar_url"></v-img>
                        </v-list-item-avatar>

           <v-list-item-content>
                            <v-list-item-title v-html="post.user.name"></v-list-item-title>
                            <v-list-item-subtitle style="white-space: pre-line" v-html="post.content"></v-list-item-subtitle>
                        </v-list-item-content>
                        <v-list-item-action>
                            <v-list-item-action-text v-text="$dayjs(post.created_at).format('YYYY-MM-DD HH:mm:ss')"></v-list-item-action-text>
                            <div v-if="isMine" class="d-flex">
                                <v-btn fab small dark color="teal" @click="openEditPost" class="mx-2">
                                    <v-icon>mdi-pen</v-icon>
                                </v-btn>
                                <v-btn fab small dark color="error" @click="deletePost" class="mx-2">
                                    <v-icon>mdi-delete</v-icon>
                                </v-btn>
                            </div>
                        </v-list-item-action>
                    </v-list-item>
                    <v-divider
                            :inset="true"
                    ></v-divider>
                    <post-edit-modal v-if="isMine" ref="dialog" :post="post" @update="updatePost"></post-edit-modal>
                </div>
             </v-col>
        </v-row>
    </v-container>
</template>

<script>
    import axios from 'axios'
    import PostEditModal from '@/components/PostEditModal'
    export default {
        data() {
            return {
                post: null,
            }
        },
        components: {
            PostEditModal
        },
        created() {
            this.fetchPost()
        },
        computed: {
            postId() {
                return this.$route.params.id
                 },
            isMine() {
                if(!this.$store.getters['auth/currentUser']) return false
                
                return this.post.user.id == this.$store.getters['auth/currentUser'].id
            }
        },
        methods: {
            async fetchPost() {
                const res = await axios.get(`/api/posts/${this.postId}`)
                this.post = res.data.post
                console.log(res.data);
            },
            openEditPost() {
                this.$refs.dialog.open()
            },
            async updatePost(postContent) {
                await axios.patch(`/api/posts/${this.postId}`, { post: { content: postContent } })
                this.$refs.dialog.close()
                this.post.content = postContent
              },
            async deletePost() {
                if(confirm("削除しますか？")) {
                    await axios.delete(`/api/posts/${this.postId}`)
                    this.$router.push(`/posts`)
                }
            }
        }
    }
</script> 