import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itax_test/redux/redux.dart';
import 'package:redux/redux.dart';

import '../widget/widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = new GlobalKey<FormState>();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();

  handleOnSubmit(BuildContext context, UserViewModel vm) {
    Completer _completer = new Completer();
    print('handleOnSubmit');
    _completer.future.then((value) {
      Navigator.of(context)
      .pushNamedAndRemoveUntil('/todo-list', (Route<dynamic> route) => false);
    }).catchError((error) {
      print(error);
      Fluttertoast.showToast(
          msg: "${error ?? ''}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    });
    vm.signInLocal(
        completer: _completer,
        email: emailController.text,
        password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return StoreConnector<AppState, UserViewModel>(
        converter: (Store<AppState> store) => UserViewModel.create(store),
        builder: (context, vm) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(251, 251, 251, 1),
            body: SingleChildScrollView(child:
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    top: (height / 100) * 18.0,
                    left: (width / 100) * 9.5,
                    right: (width / 100) * 9.5),
                child: Form(
                  key: _formKey,
                  child: 
                  Column(
                    children: [
                      Text('Login',
                          style: Theme.of(context).textTheme.headline1),
                      SizedBox(
                        height: ((height / 100) * 7),
                      ),
                      TextInput(
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'กรุณาใส่ Password';
                          }
                        },
                      ),
                      SizedBox(
                        height: ((height / 100) * 1),
                      ),
                      TextInput(
                        decoration: InputDecoration(
                          hintText: 'Password',
                        ),
                        obscureText: true,
                        controller: passwordController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'กรุณาใส่ Password';
                          }
                        },
                      ),
                      SizedBox(
                        height: ((height / 100) * 3),
                      ),
                      Button(
                        label: 'Login',
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            handleOnSubmit(context, vm);
                          }
                        },
                      )
                    ],
                  ),
                ))),
          );
        });
  }
}
