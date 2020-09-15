import 'package:flutter/material.dart';
import 'package:living_design/data/dataStructure.dart';

class HistoryModel extends ChangeNotifier {
  List<Item> items;
  HistoryModel(this.items);
}