<template>
    <div>
        <v-textarea
                outlined
                color="indigo"
                name="input-7-4"
                label="車両専用投稿"
                v-model="postContent"
                prepend-icon="mdi-comment"
        ></v-textarea>
        <div class="text-center">
            <v-btn :dark="isValid" color="indigo" :disabled="!isValid" @click="createPost">投稿</v-btn>
        </div>
    </div>
</template>

<script>
    import axios from 'axios'
    export default  {
        data() {
            return {
                postContent: ""
            }
        },
        computed: {
            isValid() {
                return this.postContent.length > 0 && this.postContent.length <= 140
            }
        },
        methods: {
            createPost() {
                this.$emit('created', this.postContent)
                this.postContent = ""
            },
        //   async createMicropost() {
        //     const res = await fetch(`/`);
        //     // const json = await res.json();
        //     console.log(res.data)
        //     }
        }
    }
</script> 