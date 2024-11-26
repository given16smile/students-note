<script>
export default {
    name : "Row",
    props: {
        UE: {
            type: String,
            required: true
        },
        matiere: {
            type: String,
            required: true
        },
        credits: {
            type: Number,
            required: true
        },
        note: {
            type: Number,
            required: true
        }
    } 
}
</script>
<template>
    <tr>
        <td>{{ UE }}</td>
        <td>{{ matiere }}</td>
        <td>{{ credits }}</td>
        <td>{{ note }}</td>
    </tr>
</template>