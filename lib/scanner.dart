import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Scanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future _processImage(File image) async {
      var lines = new List();
      final TextRecognizer _textRecognizer =
          FirebaseVision.instance.textRecognizer();
      VisionText textFromImage = await _textRecognizer
          .processImage(FirebaseVisionImage.fromFile(image));
      print(textFromImage.text);
      for (TextBlock block in textFromImage.blocks) {
        for (TextLine line in block.lines) {
          print(line.text);
          lines.add(line);
        }
      }
      print(lines);
    }

    Future _openCamera() async {
      File image = await ImagePicker.pickImage(
        source: ImageSource.camera,
      );
      _processImage(image);
    }

    Future _openGallery() async {
      var image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
      );
      _processImage(image);
    }

    Widget ActionRow(Icon icon, String text, Function onPressed) {
      return GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            icon,
            Padding(
                child: Text(
                  text,
                ),
                padding: const EdgeInsets.only(left: 20))
          ],
        ),
        onTap: onPressed,
      );
    }

    Future<void> _optionsDialogBox() {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    ActionRow(Icon(Icons.camera_alt), 'Camera', _openCamera),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    ActionRow(
                        Icon(Icons.file_upload), 'Upload image', _openGallery),
                  ],
                ),
              ),
            );
          });
    }

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: _optionsDialogBox,
    );
  }
}
