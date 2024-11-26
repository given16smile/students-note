<template>
    <div>
        <p>Nom: {{ nom }}</p>
        <p>Prenom: {{ prenom }}</p>
        <p>Date de naissance: {{ naissance }}</p>
        <p>Session: {{ session }}</p>
    </div>
</template>

<script>
export default {
    name: 'Info',
    props: {
        nom: {
            type: String,
            required: true
        },
        prenom: {
            type: String,
            required: true
        },
        naissance: {
            type: String,
            required: true
        },
        session: {
            type: String,
            required: true
        }
    }
}
</script>
