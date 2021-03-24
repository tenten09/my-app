<template>
    <v-row justify="center">
        <v-dialog v-model="dialog" max-width="600px">
            <v-card>
                <v-card-title>
                    <span class="headline">Edit Post</span>
                </v-card-title>
                <v-card-text>
                    <v-container>
                        <v-row>
                            <v-col cols="12">
                                <v-textarea
                                        outlined
                                        color="indigo"
                                        name="input-7-4"
                                        label="投稿"
                                        v-model="postContent"
                                        prepend-icon="mdi-comment"
                                ></v-textarea>
                            </v-col>
                        </v-row>
                    </v-container>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="indigo" text @click="close">キャンセル</v-btn>
                    <v-btn :dark="isValid" color="indigo" :disabled="!isValid" @click="update">更新</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-row>
</template>

<script>
    import PostForm from '@/components/PostForm'
    export default {
        props: {
            post: {
                type: Object
            }
        },
        data() {
            return {
                dialog: false,
                postContent: null
            }
        },
        created() {
            this.postContent = this.post.content
        },
        components: {
            PostForm
        },
        computed: {
            isValid() {
                return this.postContent.length > 0 && this.postContent.length <= 140
            }
        },
        methods: {
            open() {
                this.dialog = true;
            },
            close() {
                this.dialog = false;
            },
            update() {
                this.$emit('update', this.postContent)
            }
        }
    }
</script> 