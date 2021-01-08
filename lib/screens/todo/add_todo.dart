import 'package:flutter/material.dart';
import 'package:itax_test/models/models.dart';
import 'package:itax_test/widget/widget.dart';
import 'package:intl/intl.dart';

class AddTodo extends StatefulWidget {
  AddTodo({Key key, @required this.onCancel, @required this.onSave})
      : super(key: key);
  final Function onCancel;
  final Function onSave;
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _formKey = new GlobalKey<FormState>();
  final todoController = TextEditingController();
  final createDateController = new TextEditingController();
  DateTime selectedDate = DateTime.now();
  handleOnSave() {
    if(_formKey.currentState.validate()) {
    final todo = Todo(todo: todoController.text, isCompleted: false);
    widget.onSave(todo);
    }
  }

  _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate:  DateTime(2100));
    print('picked ${picked.toString()}');
    if (picked != null)
      setState(() {
        selectedDate = picked;
      });
    createDateController.text = changeDateToBuddhist(picked.toString());
  }

  String changeDateToBuddhist(String date) {
    var dateTime = DateFormat('yyyy-MM-dd').parse(date);
    var newDate =
        new DateTime(dateTime.year + 543, dateTime.month, dateTime.day);
    var formatter = new DateFormat('dd/MM/yyyy', 'th_TH');
    String formatted = formatter.format(newDate);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.only(top: ((width / 100) * 3)),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        left: ((width / 100) * 3), right: ((width / 100) * 3)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(onTap: widget.onCancel, child: Text('Cancel')),
                        InkWell(onTap: handleOnSave, child: Text('Save')),
                      ],
                    )),
                SizedBox(height: ((height / 100) * 3)),
                Divider(color: Colors.black),
                TextInput(
                  autofocus: true,
                  controller: todoController,
                  decoration: new InputDecoration(
                    hintText: 'Task name...',
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please input task.';
                    }
                  },
                ),
                Container(
                    padding: EdgeInsets.only(
                        left: ((width / 100) * 3), right: ((width / 100) * 3)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Due Date *'),
                        SizedBox(height: ((height / 100) * 1)),
                        TextInput(
                          controller: createDateController,
                          readOnly: true,
                          onTap: () {
                            _selectDate(context);
                          },
                          validator: (value) {
                    if (value.isEmpty) {
                      return 'Please input task.';
                    }
                  },
                          decoration: InputDecoration(
                              hintText: 'วัน / เดือน / ปี พ.ศ.',
                              suffixIcon: Icon(Icons.calendar_today)),
                        )
                      ],
                    )),
                SizedBox(height: ((height / 100) * 5)),
              ],
            ),
          ),
        ));
  }
}
