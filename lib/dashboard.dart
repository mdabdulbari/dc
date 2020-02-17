import 'package:dc/scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _signOut() async {
      FirebaseAuth.instance.signOut();
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      await _googleSignIn.signOut();
    }
    return Scaffold(
      appBar: AppBar(title: Text('Data Collection'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          tooltip: 'Sign out',
          onPressed: _signOut,
        ),
      ]),
      body: Scanner(),
    );
  }
}
