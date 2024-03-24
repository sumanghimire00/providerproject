import 'package:flutter/material.dart';
import 'package:getxapp/provider/multiprovider/provider_slider.dart';
import 'package:provider/provider.dart';

class MultiProviderScreen extends StatefulWidget {
  const MultiProviderScreen({super.key});

  @override
  State<MultiProviderScreen> createState() => _MultiProviderScreenState();
}

class _MultiProviderScreenState extends State<MultiProviderScreen> {
  @override
  Widget build(BuildContext context) {
    final sliderProvider = Provider.of<SliderProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multiprovider Slider"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                      child: Container(
                          height: 100,
                          color: Colors.red.withOpacity(value.value))),
                  Expanded(
                      child: Container(
                          height: 100,
                          color: Colors.blue.withOpacity(value.value))),
                ],
              );
            },
          ),
          Consumer<SliderProvider>(
            builder: (context, value, child) {
              return Slider(
                min: 0.0,
                max: 1.0,
                value: sliderProvider.value,
                onChanged: (val) {
                  value.sliderChange(val);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
