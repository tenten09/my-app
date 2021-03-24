<template>
    <div>
        <v-list-item
                 @click="$router.push(`/posts/${post.id}`)"
        >
            <v-list-item-avatar @click="$router.push(`/users/${post.user.id}`)">
                <v-img :src="post.user.avatar_url"></v-img>
            </v-list-item-avatar>

            <v-list-item-content>
                <v-list-item-title v-html="post.user.name"></v-list-item-title>
                <v-list-item-subtitle style="white-space: pre-line" v-html="post.content"></v-list-item-subtitle>
            </v-list-item-content>
            <v-list-item-action>
                <v-list-item-action-text v-text="$dayjs(post.created_at).format('YYYY-MM-DD HH:mm:ss')"></v-list-item-action-text>
            </v-list-item-action>
        </v-list-item>
        <v-divider
                :inset="true"
        ></v-divider>
    </div>

</template>
<script>
    export default {
        props: {
            post: {
                type: Object,
                required: true
            }
        }
    }
</script> 