import 'package:flutter/cupertino.dart';
import 'package:mvp_demo1/mvp_base/mvp_presenter.dart';

import 'i_main_view.dart';

class MainPresenter extends MvpPresenter<IMainView> with ChangeNotifier{
  int count = 0;

  increment() {
    count++;
    notifyListeners();
//    view.onIncrement(count);
  }

  decrement() {
    count--;
    notifyListeners();
//    view.onDecrement(count);
  }
}
