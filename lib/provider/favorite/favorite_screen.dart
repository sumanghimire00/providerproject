import 'package:flutter/material.dart';
import 'package:getxapp/provider/favorite/favorite_provider.dart';
import 'package:getxapp/provider/favorite/favourite_selected_screen.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FavouriteSelectedScreen()));
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.white,
              ))
        ],
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
                  itemCount: 40,
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
