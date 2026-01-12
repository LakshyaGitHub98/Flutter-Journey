import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

import 'providers/task_provider.dart';
import 'providers/profile_provider.dart';
import 'providers/theme_provider.dart';

import 'helpers/task_storage.dart';
import 'helpers/profile_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load saved data
  final tasks = await TaskStorage.loadTasks();
  final profileData = await ProfileStorage.loadProfile();
  final isDarkMode = await ThemeProvider.loadTheme();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskProvider()..setTasks(tasks),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileProvider()
            ..setProfileFromStorage(profileData),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkMode),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final profileProvider = Provider.of<ProfileProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode:
      themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,

      // ✅ AUTO LOGIN LOGIC
      home: profileProvider.isLoggedIn
          ? const HomeScreen()
          : const LoginScreen(),
    );
  }
}
