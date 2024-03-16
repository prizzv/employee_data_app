import 'package:employee_data_app/repository/employee_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EmployeeRepository>(context, listen: false).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Consumer<EmployeeRepository>(
            builder: (context, employeeProvider, _) {
          if (employeeProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return DataTable(
            columns: const <DataColumn>[
              DataColumn(label: Expanded(child: Text('Name'))),
              DataColumn(label: Expanded(child: Text("Organization Name"))),
              DataColumn(label: Text("Position")),
              DataColumn(label: Text("Age")),
              DataColumn(label: Text("Joining Date")),
              DataColumn(label: Text("Leaving Date")),
              DataColumn(label: Text("Active")),
            ],
            rows: employeeProvider.employees.map((data) {
              return DataRow(cells: [
                DataCell(Text(data.name)),
                DataCell(Text(data.organizationName)),
                DataCell(Text(data.position)),
                DataCell(Text(data.age.toString())),
                DataCell(Text(
                    "${data.joiningDate.day}-${data.joiningDate.month}-${data.joiningDate.year}")),
                DataCell(Text(data.leavingDate != null
                    ? "${data.leavingDate!.day}-${data.leavingDate!.month}-${data.leavingDate!.year}"
                    : "-")),
                DataCell(
                  data.active
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 24.0,
                          semanticLabel: 'Active icon',
                        )
                      : const Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 24.0,
                          semanticLabel: 'Inactive icon',
                        ),
                ),
              ]);
            }).toList(),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Show refresh indicator programmatically on button tap.
          Provider.of<EmployeeRepository>(context, listen: false).fetchData();
        },
        icon: const Icon(Icons.refresh),
        label: const Text('Refresh Indicator'),
      ),
    );
  }
}
