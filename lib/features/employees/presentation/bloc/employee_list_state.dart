import 'package:equatable/equatable.dart';
import 'package:nusago_ems/features/employees/domain/entities/employee_entity.dart';

abstract class EmployeeListState extends Equatable {
  const EmployeeListState();
  @override
  List<Object> get props => [];
}

class EmployeeListInitial extends EmployeeListState {}

class EmployeeListLoading extends EmployeeListState {}

class EmployeeListLoaded extends EmployeeListState {
  final List<Employee> employees;
  const EmployeeListLoaded({required this.employees});
  @override
  List<Object> get props => [employees];
}

class EmployeeListError extends EmployeeListState {
  final String message;
  const EmployeeListError({required this.message});
  @override
  List<Object> get props => [message];
}
