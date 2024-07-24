import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqldatabaseflutter/src/view/home_screen.dart';

import '../database.dart';
import '../model/user.dart';

class AddNotifier  extends ChangeNotifier {


  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();

  final formkey = GlobalKey<FormState>();
  DatabaseHelper? databaseHelper;

  checkvalidation(context) {
    if (formkey.currentState!.validate()){
      addItem(Item(name: name.text, description: lastname.text));
      print("Done");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreeen()));
  }else{
  print("error");
    }
    notifyListeners();
}

   addItem(Item item) async {
    await DatabaseHelper().insertItem(item.toMap());
    notifyListeners();

  }

Initstate(){
    
}

}
