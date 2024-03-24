import 'package:flutter/material.dart';
import 'package:getxapp/provider/provider_controller.dart';
import 'package:provider/provider.dart';

class ProviderScreen extends StatefulWidget {
  const ProviderScreen({super.key});

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   final counterProvider =
  //       Provider.of<CounterProvider>(context, listen: false);
  //   Timer.periodic(
  //       Duration(
  //         microseconds: 1,
  //       ), (timer) {
  //     counterProvider.setCount();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Consumer<CounterProvider>(
            builder: (context, value, child) {
              return Text(
                value.count.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
