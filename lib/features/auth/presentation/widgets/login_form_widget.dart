// lib/features/auth/presentation/widgets/login_form_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import '../../../employees/presentation/pages/employee_page.dart';
import '/core/theme/app_theme.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordVisibility = false;
  bool forgetMeNot = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleLogin() {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || !email.contains('@')) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Email Invalid!')));
      return;
    }

    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password cannot be empty!')),
      );
      return;
    }

    context.read<AuthBloc>().add(LoginRequested(email, password));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: ${state.failure.message}'),
                ),
              );
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'EMAIL ADDRESS',
                  style: TextStyle(
                    fontSize: 12,
                    color: MaterialTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hint: Text(
                      'example@mail.com',
                      style: TextStyle(
                        color: MaterialTheme.textHint,
                        fontSize: 16,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 10,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 25),

        // Password Field (with toggle)
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PASSWORD',
                  style: TextStyle(
                    fontSize: 12,
                    color: MaterialTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: !passwordVisibility,
                        decoration: InputDecoration(
                          hint: Text(
                            'Enter your password',
                            style: TextStyle(
                              color: MaterialTheme.textHint,
                              fontSize: 16,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisibility
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: MaterialTheme.iconGrey,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisibility = !passwordVisibility;
                              });
                            },
                          ),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 20),

        // Remember Me & Forgot Password Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: forgetMeNot, // Placeholder state
                  onChanged: (bool? value) {
                    setState(() {
                      forgetMeNot = value!;
                    });
                  },
                ),
                const Text('Remember me', style: TextStyle(fontSize: 14)),
              ],
            ),
            TextButton(
              onPressed: () {
                // Handle Forgot Password click
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: MaterialTheme.textRedirect),
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),

        // Login Button
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Login Successful! Token received.'),
                ),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const EmployeeListPage()),
              );
            } else {
              const SnackBar(
                content: Text('Login gagal. Cek username/password anda!'),
                backgroundColor: MaterialTheme.errorColor,
              );
            }
          },
          builder: (context, state) {
            return SizedBox(
              width: double.infinity, // Full width button
              child: ElevatedButton(
                onPressed: state is LoginLoading
                    ? null
                    : handleLogin, // Login Handler
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      MaterialTheme.primaryRed, // Red/Orange color from mockup
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: MaterialTheme.inputFill,
                  ),
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 40),

        // Footer/Help Section
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Need help accessing your account?',
              style: TextStyle(
                fontSize: 14,
                color: MaterialTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // Handle Contact Admin click
              },
              child: const Text(
                'Contact Admin',
                style: TextStyle(
                  fontSize: 14,
                  color: MaterialTheme.textRedirect,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
