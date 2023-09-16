import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/status.dart';

class BLoC {
  //stream
  final _triggerController = BehaviorSubject<void>();
  Sink<void> get triggerAction => _triggerController.sink;

  final _dialogController = BehaviorSubject<Status>();
  Stream<Status> get onDialogChange => _dialogController.stream;

  BLoC(){
    _dialogController.sink.add(Status.inPreparation);

    _triggerController.stream.listen((_) {
      _dialogController.sink.add(Status.inProgress);

      Future.delayed(Duration(seconds: 3)).then((_) {
        _dialogController.sink.add(Status.completed);
      });
    });
  }

  void close() {
    _triggerController.close();
    _dialogController.close();
  }
}