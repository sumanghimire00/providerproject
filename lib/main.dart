import 'package:flutter/material.dart';
import 'package:getxapp/provider/favorite/favorite_provider.dart';
import 'package:getxapp/provider/login/login_provider.dart';
import 'package:getxapp/provider/login/login_screen.dart';
import 'package:getxapp/provider/multiprovider/provider_slider.dart';
import 'package:getxapp/provider/provider_controller.dart';
import 'package:getxapp/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteList()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      child: Builder(
        builder: (BuildContext context) {
          // final provider = Provider.of<ThemeProvider>(context);
          final provider = Provider.of<AuthProvider>(context);
          return MaterialApp(
            themeMode: provider.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
            ),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.grey,
                )),
            debugShowCheckedModeBanner: false,
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
