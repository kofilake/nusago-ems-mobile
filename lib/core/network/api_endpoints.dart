class ApiEndpoints {
  static const String baseUrl = 'http://192.168.1.45:8000/api';

  // Auth endpoints
  static const String loginEnd = '$baseUrl/login';
  static const String registerEnd = '$baseUrl/register';
  static const String logoutEnd = '$baseUrl/logout';
  static const String employeesListEnd = '$baseUrl/employees';
  static const String employeesDetailEnd = '$baseUrl/employees/{id}';
}
