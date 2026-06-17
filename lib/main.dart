import 'package:flutter/material.dart';
import 'injection_container.dart';
import 'features/auth/presentation/pages/login_page.dart';
import '/core/theme/app_theme.dart';
import '/core/theme/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // Initialize dependencies first!
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        const String bodyFont = 'Roboto';
        const String displayFont = 'Roboto';

        final customTheme = createTextTheme(context, bodyFont, displayFont);
        final materialThemeInstance = MaterialTheme(customTheme);
        final finalTheme = materialThemeInstance.light();

        return MaterialApp(
          title: 'NusaGo Auth Demo',
          theme: finalTheme,
          home: const LoginPage(), // Start directly on the login page
          debugShowCheckedModeBanner: false,
        );
      },
    );
    /*
    MaterialApp(
      title: 'NusaGo Auth Demo',
      theme: ThemeData(),
      home: const LoginPage(), // Start directly on the login page
      debugShowCheckedModeBanner: false,
    );
    */
  }
}
