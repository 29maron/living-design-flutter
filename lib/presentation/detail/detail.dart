import 'package:flutter/material.dart';
import 'package:living_design/data/dataStructure.dart';
import 'package:living_design/presentation/edit/edit.dart';
import 'package:living_design/presentation/newItem/newItem.dart';
import 'package:provider/provider.dart';

import 'package:living_design/presentation/detail/detail_model.dart';


class Detail extends StatelessWidget {
  Detail({this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailModel>(
        create: (_) => DetailModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('アイテム詳細',
              ),
            actions: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.16,
                child: FlatButton(
                  onPressed: (){
                    Navigator.push (
                      context,
                      MaterialPageRoute(builder: (context) => Edit(item:item)),
                    );
                  },
                  child: Text('編集',
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                ),
              ),
              SizedBox(
                width:MediaQuery.of(context).size.width * 0.16,
                child: FlatButton(
                  onPressed: (){
                    Navigator.push (
                      context,
                      MaterialPageRoute(builder: (context) => NewItem(item:item)),
                    );
                  },
                  child: Text('買替',
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                ),
              )
            ],
          ),
          body: Consumer<DetailModel>(
            builder: (context, model, child) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Center(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.width * 0.7,
                            child: Image.asset('images/${item.photo}', fit: BoxFit.cover),
                          ),),
                    detailText('名前',item.name,context),
                    detailText('ジャンル',item.genre,context),
                    detailText('型番',item.modelNumber,context),
                    detailText('価格',item.price.toString(),context),
                    detailText('購入日',item.purchaseDate,context),
                    detailText('保証期限',item.warrantyPeriod,context),
                    detailText('購入理由',item.reason,context),
                    detailText('使い心地',item.comfort.toString(),context),
                    detailText('他候補',item.otherTargets,context),
                    detailText('メモ',item.memo,context),
                  ],
                ),
              );
              },
          ),
        ),
    );
  }

  Widget detailText(String label, String text, BuildContext context){
    return Row(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Text("${label}：",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.06
              ),
            ),
          ),
          Text(text,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.06
            ),
          ),
    ],
    );
  }
}
