import 'package:equatable/equatable.dart';

abstract class EmployeeListEvent extends Equatable {
  const EmployeeListEvent();
  @override
  List<Object> get props => [];
}

class FetchEmployees extends EmployeeListEvent {}
