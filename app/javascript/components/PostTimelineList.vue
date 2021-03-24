<template>
    <v-card>
        <v-list three-line>
            <post-item v-for="post in posts" :key="post.id" :post="post"></post-item>
        </v-list>
    </v-card>
</template>

<script>
    import PostItem from '@/components/PostItem'
    export default {
        props: {
            posts: {
                type: Array,
                default: []
            }
        },
        components: {
            PostItem
        }
    }
</script> 