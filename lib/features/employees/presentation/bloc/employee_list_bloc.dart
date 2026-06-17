import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/employee_entity.dart';
import '../../domain/repositories/employee_repository.dart';

// --- EVENTS ---
abstract class EmployeeListEvent extends Equatable {
  const EmployeeListEvent();
  @override
  List<Object> get props => [];
}

class FetchEmployees extends EmployeeListEvent {}

// --- STATES ---
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

// --- BLOC ---
class EmployeeListBloc extends Bloc<EmployeeListEvent, EmployeeListState> {
  final EmployeeRepository repository;

  EmployeeListBloc({required this.repository}) : super(EmployeeListInitial()) {
    on<FetchEmployees>((event, emit) async {
      emit(EmployeeListLoading());
      
      final failureOrEmployees = await repository.getEmployees();
      
      failureOrEmployees.fold(
        (failure) => emit(EmployeeListError(message: failure.message)),
        (employees) => emit(EmployeeListLoaded(employees: employees)),
      );
    });
  }
}