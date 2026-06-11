import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusago_ems/injection_container.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/auth_repository.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import '/core/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordVisibility = false;
  bool forgetMeNot = false;

  @override
  void initState() {
    super.initState();
    // Optional: Auto-trigger login on load for testing purposes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<
            AuthBloc
          >(); //.add(const LoginRequested('admin@example.com', 'password'));
    });
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleLogin() {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || !email.contains('@')) {
      SnackBar(content: Text('Email Invalid!'));
    }

    if (password.isEmpty || password.length < 8) {
      SnackBar(content: Text('Password must be longer than 8 characters.'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(authRepository: sl<AuthRepository>()),
//        ..add(
//          const LoginRequested('admin@example.com', 'password'),
//        ), // Initial event dispatch
      child: Scaffold(
        backgroundColor: MaterialTheme.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // 1. Header Section (Logo/Title)
                const Text(
                  'NusaGo EMS',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Employee Management System',
                  style: TextStyle(
                    fontSize: 16,
                    color: MaterialTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 40),

                // 2. Email Field
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is LoginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Login Failed: ${state.failure.message}',
                          ),
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
                          decoration: InputDecoration(
                            hint: Text(
                              'example@mail.com',
                              style: TextStyle(color: MaterialTheme.textHint, fontSize: 16),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                            ),
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

                // 3. Password Field (with toggle)
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is LoginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Login Failed: ${state.failure.message}',
                          ),
                        ),
                      );
                    }
                  },
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
                                obscureText: true,
                                decoration: InputDecoration(
                                  hint: Text(
                                  'Enter your password',
                                  style: TextStyle(color: MaterialTheme.textHint, fontSize: 16),
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
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
                                        passwordVisibility =
                                            !passwordVisibility;
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

                // 4. Remember Me & Forgot Password Row
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
                        const Text(
                          'Remember me',
                          style: TextStyle(fontSize: 14),
                        ),
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

                // 5. Login Button
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login Successful! Token received.'),
                        ),
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
                        onPressed: state is LoginLoading ? null : handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MaterialTheme
                              .primaryRed, // Red/Orange color from mockup
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

                // 6. Footer/Help Section
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

                const SizedBox(height: 30),

                const Align(
                  alignment: .bottomCenter,
                  child: Text(
                    '© 2026 NusaGo Enterprise Solutions. All rights reserved.',
                    style: TextStyle(
                      fontSize: 12,
                      color: MaterialTheme.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
