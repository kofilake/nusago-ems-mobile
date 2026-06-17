import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String position;
  final String department;

  const Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.position,
    required this.department,
  });

  @override
  List<Object?> get props => [id, name, email, phone, address, position, department];
}