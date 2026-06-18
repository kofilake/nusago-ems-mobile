import 'package:flutter/material.dart';
import 'package:nusago_ems/features/employees/presentation/pages/employee_detail_page.dart';
import '../../domain/entities/employee_entity.dart';
import '/core/theme/app_theme.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    // Generate initials for avatar (e.g., Aditya Rahardjo -> AR)
    String getInitials(String name) {
      List<String> names = name.split(" ");
      String initials = "";
      int numWords = names.length > 2 ? 2 : names.length;
      for (int i = 0; i < numWords; i++) {
        initials += names[i][0];
      }
      return initials.toUpperCase();
    }

    return Card(
      elevation: 0,
      color: MaterialTheme.backgroundColorCard,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: MaterialTheme.primaryRedBorder, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: MaterialTheme.primaryRedShade,
          child: Text(
            getInitials(employee.name),
            style: TextStyle(
              color: MaterialTheme.primaryRed,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        title: Text(
          employee.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              employee.position,
              style: TextStyle(color: MaterialTheme.textSecondary),
            ),
            const SizedBox(height: 4),
            Text(
              employee.department.toUpperCase(),
              style: TextStyle(
                color: MaterialTheme.textSecondaryBlacker,
                fontWeight: FontWeight.bold,
                fontSize: 10,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: MaterialTheme.iconGrey,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmployeeDetailPage(employee: employee),
            ),
          );
        },
      ),
    );
  }
}
