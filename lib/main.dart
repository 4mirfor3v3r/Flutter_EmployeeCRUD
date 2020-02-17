import 'package:employee_crud/providers/employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:employee_crud/pages/employee.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => EmployeeProvider()),],
      child: MaterialApp(
        home: Employee(),
      ),
    );
  }

}
