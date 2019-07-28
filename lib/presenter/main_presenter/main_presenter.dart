import 'package:mvp_demo1/mvp_base/mvp_presenter.dart';

import 'i_main_view.dart';

class MainPresenter extends MvpPresenter<IMainView> {
  int count = 0;

  increment() {
    count++;
    view.onIncrement(count);
  }

  decrement() {
    count--;
    view.onDecrement(count);
  }
}
