import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:health/screens/about_screen.dart';
import 'package:health/screens/home_screen.dart';
import 'package:health/screens/login_screen.dart';
import 'package:health/screens/records_screen.dart';
import 'package:health/screens/register_screen.dart';
import 'package:health/screens/services_screen.dart';
import 'package:health/screens/settings_page.dart';

class ThemeManager {
  static final ValueNotifier<ThemeMode> themeModeNotifier = 
    ValueNotifier(ThemeMode.dark);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeManager.themeModeNotifier,
      builder: (_, mode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: mode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF181A20),
          ),
          home: const AuthWrapper(), 
          routes: {
            "/home": (context) => const HomeScreen(),
            "/login": (context) => const LoginScreen(),
            "/services": (context) => const ServicesScreen(),
            "/register": (context) => const RegisterScreen(),
            "/records": (context) => const RecordsScreen(),
            "/settings": (context) => const SettingsScreen(),
            "/about": (context) => const AboutScreen()
          },
        );
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeScreen();
        }
        return const LoginScreen();
      },
    );
  }
}