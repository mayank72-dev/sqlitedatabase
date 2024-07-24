

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqldatabaseflutter/src/model/user.dart';

import '../notifier/add_notifier.dart';

  AddScreen()=>ChangeNotifierProvider(create: (_)=>AddNotifier(), child: Builder(builder: (context)=> AddScreenProvider(context:context,)),);
class AddScreenProvider extends StatelessWidget {
   AddScreenProvider({Key? key, required BuildContext context ,}) : super(key: key){
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
   var state = Provider.of<AddNotifier>(context,listen: false);

   });

   }

  @override
  Widget build(BuildContext context) {
    return  Consumer<AddNotifier>(builder: (context , state, child)=> Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: state.formkey,
            child: Column(
              children: [
                TextField(
                  controller: state.name,
                  decoration: InputDecoration(labelText: 'name'),
                ),
                TextField(
                  controller: state.lastname,
                  decoration: InputDecoration(labelText: 'lastname'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {

                        state.checkvalidation(context);

                  },
                  child: Text('Add'),
                )
              ],
            ),
          ),


    )));
  }
}