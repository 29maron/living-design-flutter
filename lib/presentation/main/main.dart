import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:living_design/presentation/edit/edit.dart';
import 'package:living_design/presentation/footer/footer.dart';
import 'package:provider/provider.dart';

import 'package:living_design/presentation/main/main_model.dart';
import 'package:living_design/presentation/detail/detail.dart';
import 'package:living_design/data/dataStructure.dart';
import 'package:living_design/data/global.dart' as global;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadJsonAsset();
  runApp(MyApp());
}

Future<void> loadJsonAsset() async {
  String loadData = await rootBundle.loadString('json/testItemData.json');
  final jsonResponse = json.decode(loadData);
  jsonResponse.forEach((key,value) {
    for(dynamic v in value){
      global.items.add(
          Item(
              id: v['id'],
              name: v['name'],
              genre: v['genre'],
              modelNumber: v['modelNumber'],
              price: v['price'],
              purchaseDate: v['purchaseDate'],
              warrantyPeriod: v['warrantyPeriod'],
              reason: v['reason'],
              comfort: v['comfort'],
              otherTargets: v['otherTargets'],
              memo: v['memo'],
              photo: v['photo'],
          )
      );
    }
  });
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'living-design',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
        ),
      home: Footer(),
      );
  }
}

