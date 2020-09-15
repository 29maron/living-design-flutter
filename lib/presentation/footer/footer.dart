import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:living_design/presentation/footer/footer_model.dart';
import 'package:provider/provider.dart';


class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FooterModel>(
      create: (_) => FooterModel(),
      child: Scaffold(
        body: Consumer<FooterModel>(builder: (context, model, child) {
          return Center(child: model.routes.elementAt(model.selectedIndex));
        }),
        bottomNavigationBar:
        Consumer<FooterModel>(builder: (context, model, child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: model.bottomNavigationBarItems,
            currentIndex: model.selectedIndex,
            onTap: model.onItemTapped,
          );
        }),
      ),
    );
  }
}
