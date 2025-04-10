import 'package:flutter/material.dart';
import 'package:newsapp/provider/news_provider.dart';
import 'package:newsapp/screens/login_screen.dart';
import 'package:newsapp/services/theme_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => NewsProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeController.themeNotifier,
      builder: (context, ThemeMode currentMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFFAF5EE),
            textTheme: TextTheme(
              bodyLarge: TextStyle(color: Color(0xFF1D503A)),
            ),
            iconTheme: IconThemeData(color: Color(0xFF1D503A)),
            appBarTheme: AppBarTheme(
              backgroundColor: Color(0xFF1D503A),
              iconTheme: IconThemeData(color: Color(0xFFFAF5EE)),
              titleTextStyle: TextStyle(color: Color(0xFFFAF5EE), fontSize: 20),
            ),
          ),
          darkTheme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white54)),
            iconTheme: IconThemeData(color: Colors.white54),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white54,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          themeMode: currentMode,
          home: LoginPage(),
        );
      },
    );
  }
}
