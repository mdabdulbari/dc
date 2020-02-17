import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPerson extends StatefulWidget {
  final List<String> scannedDetails;

  NewPerson({Key key, this.scannedDetails}) : super(key: key);

  @override
  _NewPerson createState() => _NewPerson();
}

class _NewPerson extends State<NewPerson> {
  final Object enteredDetails = {
    'name': '',
    'number': '',
    'role': '',
    'email': ''
  };

  Widget _getTextField(String label) {
    return TextField(
        decoration: InputDecoration(
      labelText: label,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget nameField = _getTextField('Name');
    Widget numberField = _getTextField('Number');
    return Scaffold(
        appBar: AppBar(title: Text('Data Collection'), actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Sign out',
//          onPressed: _signOut,
          ),
        ]),
        body: Column(
          children: <Widget>[
            Expanded(child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: <Widget>[
                nameField,
                numberField,
                nameField,
                numberField
              ],
            )),
          ],
        ));
  }
}
