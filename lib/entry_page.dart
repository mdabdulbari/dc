import 'package:dc/dashboard.dart';
import 'package:dc/login_page.dart';
import 'package:dc/new_person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
//          if (snapshot.connectionState == ConnectionState.waiting) {
//            return Image.asset('assets/background.png');
//          } else {
            if (snapshot.hasData) {
              return NewPerson();
            }
            return LoginPage();
//          }
        }
    );
  }
}