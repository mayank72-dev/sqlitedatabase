import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqldatabaseflutter/src/model/user.dart';
import 'package:sqldatabaseflutter/src/notifier/update_notifier.dart';

import 'home_screen.dart';

UpdateScreeen({required Item item})=> ChangeNotifierProvider(create: (_)=>UpdateNotifier(), child:Builder(builder: (context)=>UpdateScreenProvider(context:context, item: item,)));

class UpdateScreenProvider extends StatelessWidget {
  Item item;
   UpdateScreenProvider({Key? key, required BuildContext context,required this.item }) : super(key: key){
     var state = Provider.of<UpdateNotifier>(context,listen: false);
     state.Initstate(item);
   }

  @override
  Widget build(BuildContext context) {
    return  Consumer<UpdateNotifier>(builder: (context , state, child)=> Scaffold(
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
                  controller: state.discription,
                  decoration: InputDecoration(labelText: 'lastname'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {

                    state.checkvalidation(context);

                  },
                  child: Text('update'),
                )
              ],
            ),
          ),


        )));
  }
}
