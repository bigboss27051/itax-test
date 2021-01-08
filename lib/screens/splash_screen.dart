import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:itax_test/redux/redux.dart';
import 'package:redux/redux.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  handleIsLogged(Store store) {
    final isLogged = store.state.authState.isLogged;
    if (isLogged) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/todo-list', (Route<dynamic> route) => false);
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserViewModel>(
        onInit: (Store store) {
          Future.delayed(Duration(seconds: 1), () async {
            await handleIsLogged(store);
          });
        },
        converter: (Store<AppState> store) => UserViewModel.create(store),
        builder: (context, vm) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(251, 251, 251, 1),
          );
        });
  }
}
