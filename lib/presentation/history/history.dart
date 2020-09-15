import 'package:flutter/material.dart';
import 'package:living_design/data/dataStructure.dart';
import 'package:living_design/presentation/detail/detail.dart';
import 'package:living_design/presentation/history/history_model.dart';
import 'package:provider/provider.dart';
import 'package:living_design/data/global.dart' as global;



class History extends StatelessWidget {
  List<Item> items;
  History():this.items = global.items;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HistoryModel>(
      create: (_) => HistoryModel(items),
      child: Scaffold(
        appBar: AppBar(
          title: Text('履歴')
        ),
        body: Consumer<HistoryModel>(
          builder: (context, model, child) {
            final userTiles = model.items.map((item) =>
                Container(
                  decoration: new BoxDecoration(
                      border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey)),
                  ),
                  height:60,
                  child: ListTile(
                      onTap: () async {
                        //todo:画面遷移
                        await Navigator.push (
                            context,
                            MaterialPageRoute(builder: (context) => Detail(item:item),)
                        );
                      },
                      leading:  Container(
                          padding: EdgeInsets.all(10),
                          child: Image.asset('images/${item.photo}', fit: BoxFit.cover)
                      ),
                      title: Text(item.name),
                  ),
                )).toList();
            return ListView(
              children:userTiles,
              );
            },
            ),
        ),
      );
  }
}
