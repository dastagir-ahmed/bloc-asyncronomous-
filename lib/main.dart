import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc/dialog.dart';
import 'package:bloc/status.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC & Dialog App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BLoC _BLoC;

  @override
  void initState(){
    super.initState();
    _BLoC = BLoC();
    _BLoC.onDialogChange.listen((Status status) async {
      if(Navigator.of(context).canPop() == true){
        Navigator.pop(context);
      }
      if(status == Status.inPreparation){
        //Show the dialog box before you start.
        bool result = await DialogManager.showNormalDialog(
            context: context,
            title:' Confirm download',
            content:' Do you want to download data?'
        );
        if(result == true){
          _BLoC.triggerAction.add(null);
        }
      }else if(status == Status.inProgress){
        //Displays the dialog box being processed.
        await DialogManager.showProgressDialog(
            context: context,
            text: 'Downloading'
        );
      }else if(status == Status.completed){
        //Show dialog box when finished
        await DialogManager.showNoticeDialog(
            context: context,
            title:' Download complete',
            content:' Download complete.'
        );
      }
    });
  }



  @override
  void dispose(){
    _BLoC.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC & Dialog App'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('BLoC & Dialog App'),
          ],
        ),
      ),
    );
  }
}
