import 'package:flutter/material.dart';
import 'package:getxapp/provider/login/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("object");
    final loginProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Provider"),
        centerTitle: true,
        actions: [
          Consumer<AuthProvider>(
            builder: (context, value, child) {
              return IconButton(
                  onPressed: () {
                    if (loginProvider.themeMode == ThemeMode.light) {
                      loginProvider.setTheme(ThemeMode.dark);
                    } else if (loginProvider.themeMode == ThemeMode.dark) {
                      loginProvider.setTheme(ThemeMode.light);
                    } else {
                      loginProvider.setTheme(ThemeMode.system);
                    }
                  },
                  icon: loginProvider.themeMode == ThemeMode.dark
                      ? const Icon(Icons.light_mode)
                      : const Icon(Icons.dark_mode));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email Field"),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: "Password Field"),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                loginProvider.login(emailController.text.toString(),
                    emailController.text.toString());
              },
              child: Center(
                  child: loginProvider.isloading
                      ? const CircularProgressIndicator()
                      : const Text("Login")),
            ),
          ],
        ),
      ),
    );
  }
}
