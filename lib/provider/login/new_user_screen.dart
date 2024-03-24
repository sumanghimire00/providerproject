import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:getxapp/provider/login/login_provider.dart';
import 'package:getxapp/widgets/theme_screen.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NewUserScreen extends StatefulWidget {
  const NewUserScreen({super.key});

  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController jobController = TextEditingController();
  final GlobalKey<FormBuilderState> formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New User"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: FormBuilder(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "user cannot be empty";
                  } else {
                    return null;
                  }
                },
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
                    hintText: "Enter Your Name"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "job cannot be empty";
                  } else {
                    return null;
                  }
                },
                controller: jobController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
                    hintText: "Enter Job"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (formkey.currentState!.saveAndValidate()) {
                      final isValid = formkey.currentState!.saveAndValidate();
                      if (isValid) {
                        provider.createUser(nameController.text.toString(),
                            jobController.text.toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ThemeScreen(),
                            ));
                      }
                    } else {
                      print("Unable create new user ");
                    }
                  },
                  child: Center(
                      child: provider.isloading
                          ? CircularProgressIndicator()
                          : const Text("Create User")))
            ],
          ),
        ),
      ),
    );
  }
}
