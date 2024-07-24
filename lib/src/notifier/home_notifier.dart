
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import '../database.dart';
import '../model/user.dart';

class HomeNotifier extends ChangeNotifier{
  List<Item> _items = [];

  List<Item> get items => _items;

  Future<void> fetchItems() async {
    final data = await DatabaseHelper().fetchItems();
    _items = data.map((item) => Item.fromMap(item)).toList();
    notifyListeners();
  }
  initState(){

    fetchItems();
    print(items.length);

  }

  Future<void> deleteItem(int id) async {
    await DatabaseHelper().deleteItem(id);
    notifyListeners();

  }

}