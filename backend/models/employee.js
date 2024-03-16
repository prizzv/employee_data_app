const mongoose = require('mongoose');
const { Schema } = mongoose;

const employeeSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    organizationName: {
        type: String,
        required: true
    },
    position: {
        type: String,
        required: true
    },

    age: {
        type: Number,
        required: true
    },
    joining_date: {
        type: Date,
        required: true
    },
    leaving_date: {
        type: Date,
    },
    active: {
        type: Boolean,

    }
});

const Employee = mongoose.model('Employee', employeeSchema);

module.exports = Employee;