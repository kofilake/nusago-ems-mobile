import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/employee_repository.dart';
import 'employee_list_event.dart'; 
import 'employee_list_state.dart';

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