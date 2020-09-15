import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:living_design/presentation/history/history.dart';
import 'package:living_design/presentation/home/home.dart';
import 'package:living_design/data/global.dart' as global;


class FooterModel extends ChangeNotifier {
  static const int indexHome = 0;
  static const int indexHistroy  = 1;
  int selectedIndex = indexHome;
  final bottomNavigationBarItems = <BottomNavigationBarItem>[];

  FooterModel() {
    bottomNavigationBarItems.add(updateActiveState(selectedIndex));
    for (var i = 1; i < _footerItemNames.length; i++) {
      bottomNavigationBarItems.add(updateDeactiveState(i));
    }
  }

  static const _footerIcons = [
    Icons.home,
    Icons.history,
  ];

  static const _footerItemNames = [
    'ホーム',
    '履歴'
  ];

  var routes = [
    Home(),
    History(),
  ];

  BottomNavigationBarItem updateActiveState(int index) {
    return BottomNavigationBarItem(
        icon: Stack(
          children: <Widget>[
            Icon(
              _footerIcons[index],
              color: Colors.black87,
            ),
          ],
        ),
        title: Text(
          _footerItemNames[index],
          style: TextStyle(
            color: Colors.black87,
          ),
        )
    );
  }

  BottomNavigationBarItem updateDeactiveState(int index) {
    return BottomNavigationBarItem(
        icon: Stack(
          children: <Widget>[
            Icon(
              _footerIcons[index],
              color: Colors.black26,
            ),
          ],
        ),
        title: Text(
          _footerItemNames[index],
          style: TextStyle(
            color: Colors.black26,
          ),
        )
    );
  }

  void onItemTapped(int index) {
    bottomNavigationBarItems[selectedIndex] =
        updateDeactiveState(selectedIndex);
    bottomNavigationBarItems[index] = updateActiveState(index);
    selectedIndex = index;
    notifyListeners();
  }
}
