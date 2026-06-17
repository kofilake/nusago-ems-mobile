class ApiEndpoints {
  static const String baseUrl = 'http://10.166.8.153:8000/api';

  static const String loginEnd = '$baseUrl/login';
  static const String registerEnd = '$baseUrl/register';
  static const String logoutEnd = '$baseUrl/logout';
  static const String employeesListEnd = '$baseUrl/employees';
  static const String employeesDetailEnd = '$baseUrl/employees/{id}';
}
