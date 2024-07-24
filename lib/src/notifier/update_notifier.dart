import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../database.dart';
import '../model/user.dart';
import '../view/home_screen.dart';

class UpdateNotifier extends ChangeNotifier{
  TextEditingController name = TextEditingController();
  TextEditingController discription = TextEditingController();
  int? id;
  final formkey = GlobalKey<FormState>();
  DatabaseHelper? databaseHelper;

  checkvalidation(context) {
    if (formkey.currentState!.validate()){
      updateItem(Item(name: name.text, description: discription.text,id: id));
      print("Done");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreeen()));
    }else{
      print("error");
    }
    notifyListeners();
  }

  Future<void> updateItem(Item item) async {
    await DatabaseHelper().updateItem(item.toMap());
    notifyListeners();

  }


  Initstate(Item item){
    name.text = item.name;
    discription.text =item.description;
    id=  item.id ;

    notifyListeners();

  }
}