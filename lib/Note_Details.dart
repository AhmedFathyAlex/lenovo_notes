import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  String appBarTitle;
  NoteDetails(this.appBarTitle);
  @override
  _NoteDetailsState createState() => _NoteDetailsState(this.appBarTitle);
}

class _NoteDetailsState extends State<NoteDetails> {
  String appBarTitle;
  _NoteDetailsState(this.appBarTitle);
  static var _priorities = ['High', 'Low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.pop(context);
        })
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10, right: 10),
        child: ListView(
          children: <Widget>[
            // First Element
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                style: textStyle,
                value: 'Low',
                onChanged: (valueSelectedByUser) {
                  setState(() {
                    debugPrint('User Selected $valueSelectedByUser');
                  });
                },
              ),
            ),
            //Second element
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'title',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                controller: titleController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('something changed in title text field ');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('something changed in description text field ');
                },
                decoration: InputDecoration(
                  labelText: 'description',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
