import 'package:flutter/material.dart';
import '../../domain/entities/employee_entity.dart';
import '/core/theme/app_theme.dart';

class EmployeeDetailPage extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailPage({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    // Generates initials for avatar (matching your card logic)
    String getInitials(String name) {
      List<String> names = name.split(" ");
      String initials = "";
      int numWords = names.length > 2 ? 2 : names.length;
      for (int i = 0; i < numWords; i++) {
        if (names[i].isNotEmpty) initials += names[i][0];
      }
      return initials.toUpperCase();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
        backgroundColor: MaterialTheme.primaryRed,
        foregroundColor: MaterialTheme.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Profile Header Card
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.red.shade50,
                    child: Text(
                      getInitials(employee.name),
                      style: TextStyle(
                        color: MaterialTheme.primaryRed,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    employee.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    employee.position,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.brown.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.brown.shade100),
                    ),
                    child: Text(
                      employee.department.toUpperCase(),
                      style: TextStyle(
                        color: MaterialTheme.textSecondaryBlacker,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),
            
            // Detailed Profile Fields
            _buildDetailTile(
              icon: Icons.email_outlined,
              label: 'Email Address',
              value: employee.email,
            ),
            _buildDetailTile(
              icon: Icons.phone_outlined,
              label: 'Phone Number',
              value: employee.phone.isNotEmpty ? employee.phone : '-',
            ),
            _buildDetailTile(
              icon: Icons.location_on_outlined,
              label: 'Home Address',
              value: employee.address.isNotEmpty ? employee.address : '-',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: MaterialTheme.primaryRed, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: MaterialTheme.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}