import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvp_demo1/presenter/main_presenter/i_main_view.dart';
import 'package:mvp_demo1/presenter/main_presenter/main_presenter.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => MainPresenter()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainView(),
      ),
    );
  }
}

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> implements IMainView {
  MainPresenter presenter;
//  int count = 0;

  _MainViewState() {
    presenter = new MainPresenter();
    presenter.onAttachView(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (presenter != null) presenter.onDetachView();
  }

  @override
  onDecrement(int i) {
    // TODO: implement onDecrement
//    setState(() {
//      count = i;
//    });

  }

  @override
  onIncrement(int i) {
    // TODO: implement onIncrement
//    setState(() {
//      count = i;
//    });
  }

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<MainPresenter>(context).count;
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
//                presenter.decrement();
                Provider.of<MainPresenter>(context, listen: false).decrement();
              },
              child: Text(
                '-',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '$counter',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            RaisedButton(
              onPressed: () {
//                presenter.increment();
                Provider.of<MainPresenter>(context, listen: false).increment();
              },
              child: Text(
                '+',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
