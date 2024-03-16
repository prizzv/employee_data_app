var express = require('express');
var router = express.Router();
const EmployeeController = require('../controller/employeeController');
const wrapAsync = require('../utils/wrapAsync');

/* GET all employees listing. */
router.get('/', wrapAsync(EmployeeController.getAllEmployees));

// Add a new employee to the database
router.post('/add', wrapAsync(EmployeeController.addEmployee));

router.post('/remove', wrapAsync(EmployeeController.removeEmployee));

router.patch('/update', wrapAsync(EmployeeController.updateEmployee));

module.exports = router;
