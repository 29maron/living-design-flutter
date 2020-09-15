import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:living_design/data/PickerData.dart';
import 'package:living_design/data/dataStructure.dart';
import 'package:provider/provider.dart';

import 'package:living_design/presentation/detail/detail_model.dart';
import 'package:living_design/presentation/edit/edit_model.dart';


class Edit extends StatelessWidget {
  Edit({this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    final nameEdittingController = TextEditingController();
    if (item.name != null && item != null) {
      nameEdittingController.text = item.name;
    };
    final genreEdittingController = TextEditingController();
    if (item.genre != null) {
      genreEdittingController.text = item.genre;
    };
    final modelNumberEdittingController = TextEditingController();
    if (item.modelNumber != null) {
      modelNumberEdittingController.text = item.modelNumber;
    };
    final priceEdittingController = TextEditingController();
    if (item.price != null) {
      priceEdittingController.text = item.price.toString();
    };
    final purchaseDateEdittingController = TextEditingController();
    if (item.purchaseDate != null) {
      purchaseDateEdittingController.text = item.purchaseDate;
    };
    final warrantyPeriodEdittingController = TextEditingController();
    if (item.warrantyPeriod != null) {
      warrantyPeriodEdittingController.text = item.warrantyPeriod;
    };
    final reasonEdittingController = TextEditingController();
    if (item.reason != null) {
      reasonEdittingController.text = item.reason;
    };
    final comfortEdittingController = TextEditingController();
    if (item.comfort != null) {
      comfortEdittingController.text = item.comfort.toString();
    };
    final otherTargetsEdittingController = TextEditingController();
    if (item.otherTargets != null) {
      otherTargetsEdittingController.text = item.otherTargets;
    };
    final memoEdittingController = TextEditingController();
    if (item.memo != null) {
      memoEdittingController.text = item.memo;
    };


    return ChangeNotifierProvider<EditModel>(
      create: (_) => EditModel(genre:item.genre),
      child: Scaffold(
        appBar: AppBar(
            title: Text('編集',),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  //todo 変更の登録
                },
                child: Text('完了',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
              )
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
                      child: Image.asset('images/${item.photo}', fit: BoxFit.cover),
                    ),),
                  EditText('名前',nameEdittingController,context),
                  EditText('ジャンル',genreEdittingController,context),
                  RaisedButton(
                    onPressed: (){
                      model.showPickerModal(context);
                      print(model.genre);
                      },
                    child: Text(model.genre),
                  ),
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
