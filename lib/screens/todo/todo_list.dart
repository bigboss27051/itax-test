import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:itax_test/models/models.dart';
import 'package:itax_test/redux/redux.dart';
import 'package:itax_test/widget/widget.dart';
import 'package:redux/redux.dart';

import 'add_todo.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({Key key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  bool expandFlag = false;

  onCancelModal() {
    Navigator.of(context).pop();
  }

  onAddNewTodo({BuildContext context, Todo todo, TodoViewModel vm}) {
    vm.addTodo(todo);
    Navigator.of(context).pop();
  }

  onComplete(int indexTodo, TodoViewModel vm) {
    vm.changeStatusTodo(indexTodo);
  }

  onLogout(TodoViewModel vm) {
    Completer _completer = new Completer();
    _completer.future.then((value) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    });
    vm.signOut(_completer);
  }

  onShowModalAddTodo(BuildContext context, TodoViewModel vm) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        builder: (BuildContext bc) {
          return AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: AddTodo(
                onCancel: onCancelModal,
                onSave: (
                  Todo todo,
                ) {
                  onAddNewTodo(vm: vm, context: context, todo: todo);
                },
              ));
        });
  }

  Widget circleIcon(double width) {
    return Container(
      margin: EdgeInsets.all((width / 100) * 0.5),
      width: (width / 100) * 6.5,
      height: (width / 100) * 6.5,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return StoreConnector<AppState, TodoViewModel>(
        converter: (Store<AppState> store) => TodoViewModel.create(store),
        builder: (context, vm) {
          return Scaffold(
              body: Container(
            padding: EdgeInsets.only(
                top: ((height / 100) * 5),
                left: ((width / 100) * 6),
                right: ((width / 100) * 3)),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'To-do list',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Button(
                      onPressed: () {
                        onShowModalAddTodo(context, vm);
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: ((width / 100) * 8),
                      ),
                      borderRadius: 30.0,
                      width: ((width / 100) * 18),
                      height: ((height / 100) * 8),
                    )
                  ],
                ),
                SizedBox(
                  height: ((height / 100) * 3.5),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1.0, color: Colors.grey))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'All',
                      ),
                      IconButton(
                          icon: new Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: new Center(
                              child: new Icon(
                                expandFlag
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                size: 30.0,
                              ),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              expandFlag = !expandFlag;
                            });
                          }),
                    ],
                  ),
                ),
                ExpandableContainer(
                  expandedHeight: (height / 100) * 60,
                  expanded: expandFlag,
                  child: new ListView.builder(
                      itemCount: vm.todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: () {
                              onComplete(index, vm);
                            },
                            child: Container(
                                margin: EdgeInsets.only(bottom: 5),
                                padding: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 0.5,
                                            color: (index + 1 < vm.todos.length)
                                                ? Colors.grey
                                                : Colors.white))),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    vm.todos[index].isCompleted
                                        ? Icon(Icons.check_circle,
                                            size: (width / 100) * 7.5,
                                            color:
                                                Color.fromRGBO(1, 178, 102, 1))
                                        : circleIcon(width),
                                    SizedBox(
                                      width: ((width / 100) * 5),
                                    ),
                                    vm.todos[index].isCompleted
                                        ? Text(
                                            vm.todos[index].todo,
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationThickness: 2.85,
                                              decorationColor: Colors.black,
                                            ),
                                          )
                                        : Text(vm.todos[index].todo)
                                  ],
                                )));
                      }),
                ),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                            onTap: () {
                              onLogout(vm);
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(bottom: (height / 100) * 5),
                              child: Text('Log out',
                                  style: TextStyle(fontSize: 20)),
                            ))))
              ],
            ),
          ));
        });
  }
}
