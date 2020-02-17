import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:employee_crud/models/employee_model.dart';
import 'package:http/http.dart' as http;

class EmployeeProvider extends ChangeNotifier{
  List<EmployeeModel> _data = [];
  List<EmployeeModel> get employeeData => _data;
  Future<List<EmployeeModel>> getEmployee() async {
    final url = 'http://dummy.restapiexample.com/api/v1/employees';
    final response = await http.get(url);

    if(response.statusCode == 200){
      final result = json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      _data = result.map<EmployeeModel>((json) => EmployeeModel.fromJson(json)).toList();
      return _data;
    }else{
      throw Exception();
    }
  }
}