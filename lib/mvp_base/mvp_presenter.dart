import 'mvp_view.dart';

class MvpPresenter<T extends MvpView> {
  T _view;

  onAttachView(T mvpView) {
    _view = mvpView;
  }

  onDetachView() {
    _view = null;
  }

  T get view => _view;

}
