

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:living_design/data/dataStructure.dart';
import 'package:living_design/presentation/detail/detail.dart';
import 'package:living_design/presentation/edit/edit.dart';
import 'package:living_design/presentation/newItem/newItem.dart';
import 'package:provider/provider.dart';

import 'package:living_design/data/global.dart' as global;


import 'home_model.dart';

class Home extends StatelessWidget{

  List<Item> items;
  Home():this.items = global.items;
@override
Widget build(BuildContext context) {
  return ChangeNotifierProvider<HomeModel>(
      create: (_) => HomeModel(),
      child: Scaffold(
        appBar: AppBar(
          title:Text('ホーム'),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => NewItem()
                ),
                );
              },
              child: Text('新規登録',
              style: TextStyle(
                color: Colors.white,
              ),),
            )
          ],
        ),
        body: Consumer<HomeModel>(
          builder: (context, model, child) {
            return GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
              padding: EdgeInsets.all(2.0),
              children:List.generate(items.length,(index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Detail(item: items[index]),
                    ),
                    );
                  },
                  child: Container(
                    child:Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(15),
                            child: Image.asset('images/${items[index].photo}', fit: BoxFit.cover)
                        ),
                        Container(
                          margin: EdgeInsets.all(0.0),
                          child: Text(items[index].name),
                        ),
                      ],
                    ),
                  ),
                );
              },
              ),
            );
          },
        ),
      ),
    );
}
}

