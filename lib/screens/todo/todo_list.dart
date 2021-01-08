import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
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

  onAddTodo(context) {
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
            child: AddTodo(onCancel: () {}, onSave: () {},));
        });
  }

  Widget circleIcon() {
    return RawMaterialButton(
      onPressed: () {},
      constraints: BoxConstraints(),
      elevation: 2.0,
      fillColor: Colors.white,
      child: Icon(
        Icons.pause,
        size: 35.0,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
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
                          onAddTodo(context);
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
                  Divider(color: Colors.black),
                  ExpansionTile(
                    title: Text(
                      "All",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    children: vm.todos.map((item) {
                      return Container(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          circleIcon(),
                          SizedBox(
                            width: ((width / 100) * 3),
                          ),
                          Text(item.todo)
                        ],
                      ));
                    }).toList(),
                  )
                ],
              ),
            ),
          );
        });
  }
}
