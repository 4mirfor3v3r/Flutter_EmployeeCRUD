import 'package:employee_crud/pages/employee_add.dart';
import 'package:employee_crud/providers/employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:employee_crud/models/employee_model.dart';
import 'package:provider/provider.dart';

class Employee extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee CRUD"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(
          "+",
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Colors.pinkAccent,
        onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmployeeAdd()));},
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            Provider.of<EmployeeProvider>(context, listen: false).getEmployee(),
        color: Colors.red,
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: FutureBuilder(
            future: Provider.of<EmployeeProvider>(context, listen: false)
                .getEmployee(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Consumer<EmployeeProvider>(builder: (context, data, _) {
                return ListView.builder(
                    itemCount: data.employeeData.length,
                    itemBuilder: (context, i) {
                      return Card(
                        elevation: 3,
                        child: ListTile(
                          title: Text(
                            data.employeeData[i].employeeName,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          subtitle: Text(data.employeeData[i].employeeAge),
                          trailing:
                              Text("\$${data.employeeData[i].employeeSalary}"),
                        ),
                      );
                    });
              });
            },
          ),
        ),
      ),
    );
  }
}
