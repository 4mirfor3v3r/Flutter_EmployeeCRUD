
class EmployeeModel{
  String id;
  String employeeName;
  String employeeSalary;
  String employeeAge;
  String employeeProfileImage;

  EmployeeModel(this.id,this.employeeName,this.employeeSalary,this.employeeAge,this.employeeProfileImage);

  factory EmployeeModel.fromJson(Map<String, dynamic> json)=> EmployeeModel(
    json['id'],
    json['employee_name'],
    json['employee_salary'],
    json['employee_age'],
    json['profile_image'],
  );
}