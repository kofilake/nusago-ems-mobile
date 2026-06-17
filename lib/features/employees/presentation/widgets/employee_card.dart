import 'package:flutter/material.dart';
import '../../domain/entities/employee_entity.dart';

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
      for(int i = 0; i < numWords; i++){
        initials += names[i][0];
      }
      return initials.toUpperCase();
    }

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.red.shade100, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.red.shade50,
          child: Text(
            getInitials(employee.name),
            style: TextStyle(color: Colors.red[700], fontWeight: FontWeight.bold),
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
            Text(employee.position, style: TextStyle(color: Colors.grey[700])),
            const SizedBox(height: 4),
            Text(
              employee.department.toUpperCase(),
              style: TextStyle(
                color: Colors.brown[700], 
                fontWeight: FontWeight.bold, 
                fontSize: 10,
                letterSpacing: 1.2
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {
          // TODO: Navigate to Employee Detail Page
        },
      ),
    );
  }
}