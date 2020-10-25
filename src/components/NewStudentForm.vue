<template>
    <div>      
        <div class="alert alert-danger" v-show="errors.length > 0">
            <li v-for="error in errors" v-bind:key="error">{{ error }}</li>
        </div>

        <div class="card add-student m-2 p-2">
            <h4 class="card-title">Add new student</h4>

            <div class="form-group">
                <label for="name">Name</label>
                <input id="name" class="form-control" v-model.trim="newStudentName">
            </div>
            <div class="form-group">
                <label for="starID">Star ID</label>
                <input id="starID" class="form-control" v-model.trim="newStarID">
            </div>
            <button class="btn btn-primary" v-on:click="addStudent">Add</button>
        </div>
    </div>
</template>

<script>

export default {
    name: 'NewStudentForm',
    data() {
        return {
            newStudentName: '',
            newStarID: '',
            errors: []
        }
    },
    methods: {
        addStudent() {
            this.errors = []

            if (!this.newStudentName) {
                this.errors.push('Student name is required')
            }

            if (!this.newStarID) {
                this.errors.push('StarID is required')
            }

            if (this.errors.length == 0) {
                let student = { name: this.newStudentName, starID: this.newStarID, present: false }
                this.$emit('student-added', student)
                this.newStudentName = ''
                this.newStarID = ''
            } 
        }
    }
}

</script>

<style scoped>
    /* Write any styles for elements in this component here  */
</style>


