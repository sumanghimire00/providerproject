import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getxapp/contollers/counter_controller.dart';

class HomeScreen extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getx Counter"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Obx(
        () => Center(
            child: Text(
          controller.count.value.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increament();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
