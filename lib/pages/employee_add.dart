import 'package:employee_crud/pages/employee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:employee_crud/providers/employee_provider.dart';
class EmployeeAdd extends StatefulWidget {
  @override
  _EmployeeAddState createState() => _EmployeeAddState();
}

class _EmployeeAddState extends State<EmployeeAdd> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _salary = TextEditingController();
  final TextEditingController _age = TextEditingController();
  bool _isLoading = false;

  void submit(BuildContext context){
    if(!_isLoading) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<EmployeeProvider>(context, listen: false).storeEmployee(
          _name.text, _salary.text, _age.text).then((res) =>
      {
        if(res){
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Employee()))
        } else
          {
//        ALERT
          }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Employee"),
        actions: <Widget>[
          FlatButton(
            child:_isLoading? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ) : Icon(
                Icons.save,
              color: Colors.white,
            ),
            onPressed: () =>{submit(context)},
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _name,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pinkAccent,
                  )
                ),
                hintText: "Nama",
              ),
            ),
            TextField(
              controller: _salary,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.pinkAccent,
                    )
                ),
                hintText: "Gaji",
              ),
            ),
            TextField(
              controller: _age,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.pinkAccent,
                    )
                ),
                hintText: "Umur",
              ),
            )
          ],
        ),
      ),
    );
  }
}
