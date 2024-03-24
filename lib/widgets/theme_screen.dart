import 'package:flutter/material.dart';
import 'package:getxapp/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    print("object");
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, value, child) => IconButton(
                onPressed: () {
                  if (value.themeMode == ThemeMode.light) {
                    provider.setTheme(ThemeMode.dark);
                  } else if (value.themeMode == ThemeMode.dark) {
                    provider.setTheme(ThemeMode.light);
                  } else {
                    value.setTheme(ThemeMode.light);
                  }
                },
                icon: value.themeMode == ThemeMode.light
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.light_mode)),
          ),
        ],
        title: const Text("Theme Change"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text("Light Mode"),
            value: ThemeMode.light,
            groupValue: provider.themeMode,
            onChanged: provider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text("Dark Mode"),
            value: ThemeMode.dark,
            groupValue: provider.themeMode,
            onChanged: provider.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text("System Mode"),
            value: ThemeMode.system,
            groupValue: provider.themeMode,
            onChanged: provider.setTheme,
          ),
        ],
      ),
    );
  }
}
