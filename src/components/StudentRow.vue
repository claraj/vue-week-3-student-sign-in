<template>
  <tr>    
    <td>{{ student.name }}</td>
    <td>{{ student.starID }}</td>
    <td><input type="checkbox" v-model="student.present" v-on:change="checked(student)"></td>
    <td v-show="edit">
        <img class="delete-icon" v-on:click="deleteStudent(student)" src="@/assets/delete.png">
    </td>
  </tr>
</template>

<script>

export default {
    name: 'StudentTable',
    props: {
        student: Object,
        edit: Boolean
    },
    methods: {
        checked(student) {
            this.$emit('student-present', student)       
        }, 
        deleteStudent(student) {
            if (confirm(`Delete ${student.name}?`)) {
                this.$emit('delete-student', student)
            }
        }
    }
}
</script>

<style>
</style>


