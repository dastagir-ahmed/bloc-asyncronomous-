import 'package:flutter/material.dart';

class DialogManager{
  static Future<bool> showProgressDialog({
    required BuildContext context,
    required String text,
  }) async {
    try{
      bool result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text(text),
                ],
              ),
            ),
          );
        },
      );
      return result;
    }catch(e){
      return false;
    }
  }

  static Future<bool> showNormalDialog({
    required BuildContext context,
    required String title,
    required String content
  }) async {
    try{
      bool result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                child: Text('cancel',style: TextStyle(color: Colors.lightBlueAccent)),
                onPressed: (){
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text('OK',style: TextStyle(color: Colors.lightBlueAccent)),
                onPressed: (){
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
      return result;
    }catch(e){
      return false;
    }
  }

  static Future<bool> showNoticeDialog({
    required BuildContext context,
    required String title,
    required String content
  }) async {
    try{
      bool result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                child: Text('OK',style: TextStyle(color: Colors.lightBlueAccent)),
                onPressed: (){
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );

      return result;
    }catch(e){
      return false;
    }
  }
}