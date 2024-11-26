<script setup>
import Info from './components/Info.vue';
import Row from './components/Row.vue';
import RowHead from './components/RowHead.vue';
const data = {
  nom: 'Mahaliana',
  prenom: 'Fitiavana',
  naissance: '02/03/2003',
  notes: [
    {code: "Mat002", matiere: "Mathematique", credits: 5, note: 15}
  ]
};

</script>

<template>
  <header>
    <Info :nom="data.nom" :prenom="data.prenom" :naissance="data.naissance"></Info>
  </header>
  <table>
    <RowHead />
    <template v-for="note in data.notes ">
      <Row :UE="note.code" :matiere="note.matiere" :credits="note.credits" :note="note.note" ></Row>

    </template>
  </table>
<!-- 
  <main>
    <Row></Row>
  </main> -->
</template>
