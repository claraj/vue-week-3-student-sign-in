<template>
  <div class="message">

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
  data() {
    return {
      seeMessage: false 
    }
  },
  props: {
    student: Object
  }
}
</script>

<style>

</style>

