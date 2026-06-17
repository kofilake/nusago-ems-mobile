import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nusago_ems/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nusago_ems/features/auth/presentation/bloc/login_event.dart';
import 'injection_container.dart';
import 'features/auth/presentation/pages/login_page.dart';
import '/core/theme/app_theme.dart';
import '/core/theme/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // Initialize dependencies CRUCIAL.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String bodyFont = 'Roboto';
    const String displayFont = 'Roboto';

    final customTheme = createTextTheme(context, bodyFont, displayFont);
    final materialThemeInstance = MaterialTheme(customTheme);
    final finalTheme = materialThemeInstance.light();
    return BlocProvider(
      create: (_) => sl<AuthBloc>()..add(CheckRequested()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NusaGo EMS',
          theme: finalTheme,
          home: const LoginPage(),
        )
    );
  }
}
