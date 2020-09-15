import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:living_design/data/PickerData.dart';

class EditModel extends ChangeNotifier {
  BuildContext context;
  EditModel({this.genre});
  String genre;

  void showPickerModal(BuildContext context) {
    Picker(
        adapter: PickerDataAdapter<String>(pickerdata: JsonDecoder().convert(PickerData2),
          isArray: true,
        ),
        changeToFirst: true,
        hideHeader: false,
        onConfirm: (Picker picker, List value) {
          print(value);
          print(picker.adapter.getText());
          print(picker.getSelectedValues().toString());
          print(picker.getSelectedValues().toString());
          genre = picker.adapter.text.toString();
        }
    ).showModal(context);
    notifyListeners();
  }

}