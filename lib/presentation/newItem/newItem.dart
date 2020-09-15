import 'package:flutter/material.dart';
import 'package:living_design/data/dataStructure.dart';
import 'package:provider/provider.dart';

import 'package:living_design/presentation/detail/detail_model.dart';
import 'package:living_design/presentation/edit/edit_model.dart';


class NewItem extends StatelessWidget {
  NewItem({this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    final nameEdittingController = TextEditingController();
    final genreEdittingController = TextEditingController();
    final modelNumberEdittingController = TextEditingController();
    final priceEdittingController = TextEditingController();
    final purchaseDateEdittingController = TextEditingController();
    final warrantyPeriodEdittingController = TextEditingController();
    final reasonEdittingController = TextEditingController();
    final comfortEdittingController = TextEditingController();
    final otherTargetsEdittingController = TextEditingController();
    final memoEdittingController = TextEditingController();
    bool isChangeItem = item != null;
    if (isChangeItem){
      genreEdittingController.text = item.genre;
    }


    return ChangeNotifierProvider<EditModel>(
      create: (_) => EditModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('新規登録',),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                //todo 変更の登録
              },
              child: Text('完了',
                style: TextStyle(
                  color: Colors.white,
                )),
            ),
          ],
        ),
        body: Consumer<EditModel>(
          builder: (context, model, child) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.width * 0.7,
                      child: Container(color: Colors.grey),
                      ),
                  ),
                  EditText('名前',nameEdittingController,context),
                  EditText('ジャンル',genreEdittingController,context),
                  EditText('型番',modelNumberEdittingController,context),
                  EditText('価格',priceEdittingController,context),
                  EditText('購入日',purchaseDateEdittingController,context),
                  EditText('保証期限',warrantyPeriodEdittingController,context),
                  EditText('購入理由',reasonEdittingController,context),
                  EditText('使い心地',comfortEdittingController,context),
                  EditText('他候補',otherTargetsEdittingController,context),
                  EditText('メモ',memoEdittingController,context),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget EditText(String label, TextEditingController textEditingController, BuildContext context){
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
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.width * 0.08,
          child: TextField(
            controller: textEditingController,
            style: TextStyle(fontSize: MediaQuery
                .of(context)
                .size
                .width * 0.05,),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(5)
            ),),
        ),
      ],
    );
  }
}
