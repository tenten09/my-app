<template>
    <div>
        <v-textarea
                outlined
                color="indigo"
                name="input-7-4"
                label="投稿"
                v-model="micropostContent"
                prepend-icon="mdi-comment"
        ></v-textarea>
        <div class="text-center">
            <v-btn :dark="isValid" color="indigo" :disabled="!isValid" @click="createMicropost">投稿</v-btn>
        </div>
    </div>
</template>

<script>
    import axios from 'axios'
    export default  {
        data() {
            return {
                micropostContent: ""
            }
        },
        computed: {
            isValid() {
                return this.micropostContent.length > 0 && this.micropostContent.length <= 140
            }
        },
        methods: {
            createMicropost() {
                axios.get(`/`)
                .then(res => {
                console.log(res.data)
                })
                this.$emit('created', this.micropostContent)
                this.micropostContent = ""
            },
        // fetch() {
        //   axios.get(`/api/users/${this.userId}`)
        //     .then(res => {
        //       console.log(res.data)
        //     })
        //   },
        //   async createMicropost() {
        //     const res = await fetch(`/`);
        //     // const json = await res.json();
        //     console.log(res.data)
        //     }
        }
    }
</script> 