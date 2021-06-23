import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class Kanza<S> {
  Kanza(this.initialState) {
    stateController = StreamController<S>.broadcast();
    stateController.add(initialState);
    _state ??= initialState;
  }

  late final StreamController<S> stateController;
  Stream<S> get stream => stateController.stream;
  final S initialState;
  S? _state;

  S get state => _state!;
  set state(S state) {
    _state = state;
  }

  void notify(S state) {
    _state = state;
    print('notify: $_state');
    stateController.add(state);
  }

  @mustCallSuper
  void dispose() {
    stateController.close();
    _state = null;
  }
}
