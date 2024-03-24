import 'package:flutter/material.dart';
import 'package:getxapp/provider/login/login_provider.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
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
                onPressed: () {
                  provider.createUser(nameController.text.toString(),
                      jobController.text.toString());
                },
                child: Center(
                    child: provider.isloading
                        ? CircularProgressIndicator()
                        : const Text("Create User")))
          ],
        ),
      ),
    );
  }
}
