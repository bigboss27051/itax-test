import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
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

  handleOnSubmit(BuildContext context, UserViewModel vm) {}

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return StoreConnector<AppState, UserViewModel>(
        converter: (Store<AppState> store) => UserViewModel.create(store),
        builder: (context, vm) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(250, 250, 251, 1),
            body: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    top: (height / 100) * 18.0,
                    left: (width / 100) * 9.5,
                    right: (width / 100) * 9.5),
                child: Form(
                  key: _formKey,
                  child: Column(
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
                        label: ' Login',
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            handleOnSubmit(context, vm);
                          }
                        },
                      )
                    ],
                  ),
                )),
          );
        });
  }
}