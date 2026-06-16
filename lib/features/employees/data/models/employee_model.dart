import '../../domain/entities/employee_entity.dart';

class EmployeeModel extends Employee {
  const EmployeeModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.address,
    required super.position,
    required super.department,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      position: json['position'] ?? '',
      department: json['department'] ?? '',
    );
  }
}