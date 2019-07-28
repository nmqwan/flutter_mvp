import 'package:mvp_demo1/mvp_base/mvp_view.dart';

abstract class IMainView extends MvpView{
  onIncrement(int i);
  onDecrement(int i);
}