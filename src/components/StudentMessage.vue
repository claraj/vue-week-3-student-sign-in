<template>
  <div>
      <div v-show="student.name">
          <div v-if="student.present" class="alert alert-success">
              Welcome, {{ student.name }}!
          </div>
          <div v-else class="alert alert-info">
              Goodbye, {{ student.name }}. See you later!
          </div>          
      </div> 
  </div>
</template>

<script>

export default {
  name: 'StudentMessage',
  props: {
    student: Object
  }
}

</script>

<style scoped>
/* Add any styles for this component here */
</style>

