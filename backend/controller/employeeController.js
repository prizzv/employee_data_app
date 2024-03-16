const Employee = require('../models/employee');


async function getAllEmployees(req, res, next) {
    try {
        const employees = await Employee.find();

        const currentDate = new Date();
        const fiveYearsAgo = new Date(currentDate.getFullYear() - 5, currentDate.getMonth(), currentDate.getDate());
        for (let i = 0; i < employees.length; i++) {

            if (employees[i].joining_date <= fiveYearsAgo && employees[i].leaving_date == null) {
                employees[i].active = true;
            } else {
                employees[i].active = false;
            }
        }

        res.status(200).json({ data: employees });
    } catch (error) {
        res.status(500).json({ error });
    }
}

async function addEmployee(req, res, next) {
    try {
        //TODO: Add validation
        //TODO: check if the employee already exists
        //TODO: check working 
        console.log(req.body);;

        const employee = new Employee(req.body);
        await employee.save();

        res.status(201).json({ employee });
    } catch (error) {
        res.status(500).json({ error });
    }
}

async function removeEmployee(req, res, next) {
    try {
        const { id } = req.body;
        if (id == null) {
            throw new Error('id is required');
        }

        const employee = await Employee.findById(req.body.id);
        await employee.remove();
        res.status(200).json({ employee });
    }
    catch (error) {
        res.status(500).json({ error });
    }
}

async function updateEmployee(req, res, next) {
    try {
        const employee = await Employee
            .findByIdAndUpdate(req
                .body.id, req.body,
                { new: true }
            );
        res.status(200).json({ employee });
    }
    catch (error) {
        res.status(500).json({ error });
    }
}

async function leaveEmployee(req, res, next) {
    try {
        const employee = await Employee
            .findByIdAndUpdate(req
                .body.id, req.body,
                { new: true }
            );
        res.status(200).json({ employee });
    }
    catch (error) {
        res.status(500).json({ error });
    }
}

module.exports = { getAllEmployees, addEmployee, removeEmployee, updateEmployee };
