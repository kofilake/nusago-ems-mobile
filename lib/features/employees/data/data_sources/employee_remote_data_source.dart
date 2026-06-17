import 'package:dio/dio.dart';
import 'package:nusago_ems/core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '/core/error/exception.dart';
import '../models/employee_model.dart';

class EmployeeRemoteDataSource {
  final DioClient dioClient;

  EmployeeRemoteDataSource({required this.dioClient});

  Future<List<EmployeeModel>> getEmployees() async {
    try {
      final response = await dioClient.get(ApiEndpoints.employeesListEnd); 
      
      final List<dynamic> data = response.data as List; 
      
      return data.map((json) => EmployeeModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ServerException(message: e.response?.data['message'] ?? 'Failed to load employees');
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}