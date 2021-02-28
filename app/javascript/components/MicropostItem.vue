<template>
    <div>
        <v-list-item
                @click=""
        >
            <v-list-item-avatar>
                <v-img src="https://picsum.photos/80/80/?random"></v-img>
            </v-list-item-avatar>

            <v-list-item-content>
                <span style="white-space: pre-line">
                    {{micropost.content}}
                </span>
            </v-list-item-content>
        </v-list-item>
        <v-divider
                :inset="true"
        ></v-divider>
    </div>

</template>
<script>
    export default {
        props: {
            micropost: {
                type: Object,
                required: true
            }
        }
    }
</script> 