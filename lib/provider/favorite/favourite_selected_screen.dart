import 'package:flutter/material.dart';
import 'package:getxapp/provider/favorite/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavouriteSelectedScreen extends StatefulWidget {
  const FavouriteSelectedScreen({super.key});

  @override
  State<FavouriteSelectedScreen> createState() =>
      _FavouriteSelectedScreenState();
}

class _FavouriteSelectedScreenState extends State<FavouriteSelectedScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteList>(context);
    print("object");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Items"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Consumer<FavouriteList>(
            builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: provider.selectedItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item $index'),
                      onTap: () {
                        if (value.selectedItems.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      trailing: Icon(
                        Icons.favorite,
                        color: value.selectedItems.contains(index)
                            ? Colors.red
                            : Colors.grey,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
