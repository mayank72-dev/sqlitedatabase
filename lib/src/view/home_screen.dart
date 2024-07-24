

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqldatabaseflutter/src/model/user.dart';
import 'package:sqldatabaseflutter/src/view/update_screen.dart';

import '../notifier/home_notifier.dart';
import 'add_screen.dart';


HomeScreeen()=> ChangeNotifierProvider(create: (_)=>HomeNotifier(), child:Builder(builder: (context)=>HomeScreenProvider(context:context)));
class HomeScreenProvider extends StatelessWidget {
   HomeScreenProvider({Key? key, required BuildContext context, }) : super(key: key){
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    var state = Provider.of<HomeNotifier>(context,listen: false);
    state.initState();
  });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context, state, child)=> Scaffold(
      body: Padding(padding: EdgeInsets.all(20),
      child :ListView.builder(
    itemCount: state.items.length,
    itemBuilder: (context, index) {
    final item = state.items[index];
    return ListTile(
    title: Text(item.name),
    subtitle: Text(item.description),
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => UpdateScreeen(item: item),
    ),
    );
    },
    trailing: IconButton(
    icon: Icon(Icons.delete),
    onPressed: () {
    state.deleteItem(item.id!);
    },
    ),
    );
    },

  )
   ),

        floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        })));
  }
}
