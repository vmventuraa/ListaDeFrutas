
import 'package:flutter/material.dart';
import 'package:untitled/screens/controller/fruit_get.controller.dart';
import 'package:untitled/screens/widget/content_get.widget.dart';
import 'controller/fruit_change_notify.controller.dart';
import 'create_fruit.screen.dart';
import 'widget/content_change_notify.dart';
import '../snippets.dart';

class ListFruit extends StatefulWidget {
  const ListFruit({super.key});

  @override
  State<ListFruit> createState() => _ListFruitState();
}

class _ListFruitState extends State<ListFruit> {
  late FruitChangeNotifyController _fruitChangeNotifyController;
  late FruitGetController _fruitGetController;

  @override
  void initState() {
    _fruitChangeNotifyController = FruitChangeNotifyController();
    _fruitGetController = FruitGetController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Frutas")),
      body: ContentGetWidget(controller: _fruitGetController),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openRoute(
            context,
            CreateFruitScreen(
              onPress: (fruit) {
                _fruitGetController.addFruit(fruit);
              },
            ),
          );
        },
        child: const Icon(Icons.plus_one_sharp),
      ),
    );
  }
}
