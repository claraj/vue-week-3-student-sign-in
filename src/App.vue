<template>
  <div id="app">
    
    <NewStudentForm v-on:student-added="newStudentAdded"></NewStudentForm>
    <StudentTable
      v-bind:students="students" 
      v-on:student-present="studentArrivedOrLeft"
      v-on:delete-student="studentDeleted">
    </StudentTable>
    <StudentMessage v-bind:student="mostRecentStudent"></StudentMessage>

  </div>
</template>

<script>
import NewStudentForm from './components/NewStudentForm.vue'
import StudentTable from './components/StudentTable.vue'
import StudentMessage from './components/StudentMessage.vue'

export default {
  name: 'app',
  data() {
    return {
      students: [
        { name: 'Example', 'starID': 'aa1234aa', present: true },
        { name: 'Test', 'starID': 'bb5678bb', present: false },
      ],
      mostRecentStudent: {}
    }
  },
  components: {
    NewStudentForm,
    StudentTable,
    StudentMessage
  },
  methods: {
    newStudentAdded(student) {
      this.students.push(student)
      this.students.sort(function(s1, s2) {
        return s1.name.toLowerCase() < s2.name.toLowerCase() ? -1 : 1
      })
    },
    studentArrivedOrLeft(student, present) {
      // find student in this.students, set present value 
      let updateStudent = this.students.find( function(s) {
        if (s.name === student.name && s.starID === student.starID) {
          return true
        }
      })
      if (updateStudent) {
        updateStudent.present = present
        this.mostRecentStudent = student
      }
    },
    studentDeleted(student) {
      this.students = this.students.filter( function(s) { return s != student })
      this.mostRecentStudent = {}   // clears welcome/goodbye message
    }
  }
}
</script>

<style>
/* Add any styles for this component here */
</style>
