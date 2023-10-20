import 'package:flutter/material.dart';

//import 'package:provider/provider.dart';

//import 'package:user_app/view_model/home_page_provider.dart';

class SecondProvider extends ChangeNotifier {
  late int index;
  late int nextindex = index + 1;

  /*void nextUser(BuildContext context) {
    if (currentIndex <
        Provider.of<HomepageProvider>(context).userlist.length - 1) {
      currentIndex++;
      notifyListeners();
    }
  }*/
}
