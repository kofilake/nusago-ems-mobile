import 'package:dartz/dartz.dart';
import '/core/error/failure.dart';
import '../entities/employee_entity.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, List<Employee>>> getEmployees();
}