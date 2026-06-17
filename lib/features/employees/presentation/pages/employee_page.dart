import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart'; // Ensure this points to your GetIt 'sl' instance
import '../bloc/employee_list_bloc.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart'; 
import '../../../auth/presentation/bloc/login_event.dart'; 
import '../widgets/employee_card.dart';

// --- 1. THE WRAPPER (Injects the BLoC) ---
class EmployeeListPage extends StatelessWidget {
  const EmployeeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // We grab the registered BLoC from GetIt
      create: (_) => sl<EmployeeListBloc>(), 
      child: const EmployeeListView(),
    );
  }
}

// --- 2. THE VIEW (Consumes the BLoC) ---
class EmployeeListView extends StatefulWidget {
  const EmployeeListView({super.key});

  @override
  State<EmployeeListView> createState() => _EmployeeListViewState();
}

class _EmployeeListViewState extends State<EmployeeListView> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Now this is perfectly safe because EmployeeListPage provided the BLoC!
    context.read<EmployeeListBloc>().add(FetchEmployees());
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back arrow
        backgroundColor: Colors.red[700], // NusaGo Red
        title: const Text('NusaGo EMS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              // Triggers your authentication BLoC logout flow
              context.read<AuthBloc>().add(LogoutRequested());
            },
          ),
        ],
      ),
      body: _selectedIndex == 0 ? _buildDirectoryTab() : _buildProfileTab(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.red[700],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Directory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildDirectoryTab() {
    return BlocBuilder<EmployeeListBloc, EmployeeListState>(
      builder: (context, state) {
        if (state is EmployeeListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is EmployeeListError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read<EmployeeListBloc>().add(FetchEmployees()),
                  child: const Text('Retry'),
                )
              ],
            ),
          );
        } else if (state is EmployeeListLoaded) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<EmployeeListBloc>().add(FetchEmployees());
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: state.employees.length,
              itemBuilder: (context, index) {
                final employee = state.employees[index];
                return EmployeeCard(employee: employee);
              },
            ),
          );
        }
        return const Center(child: Text('No employees found.'));
      },
    );
  }

  Widget _buildProfileTab() {
    return const Center(child: Text('Personal Profile View (Read-Only)'));
  }
}