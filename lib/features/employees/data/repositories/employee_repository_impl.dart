import 'package:dartz/dartz.dart';
import '/core/error/exception.dart';
import '/core/error/failure.dart';
import '../../domain/entities/employee_entity.dart';
import '../../domain/repositories/employee_repository.dart';
import '../data_sources/employee_remote_data_source.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeRemoteDataSource remoteDataSource;

  EmployeeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Employee>>> getEmployees() async {
    try {
      final remoteEmployees = await remoteDataSource.getEmployees();
      return Right(remoteEmployees);
    } on ServerException catch (e) {
      return Left(ServerFailure(e as String));
    } catch (e) {
      return Left(ServerFailure('An unexpected error occurred'));
    }
  }
}