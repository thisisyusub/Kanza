import 'dart:async';

import 'package:flutter/material.dart';

abstract class Kanza<S> {
  Kanza(this.initialState) {
    stateController = StreamController<S>.broadcast();
    _state ??= initialState;
    stateController.add(_state!);
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
    if (state != _state) {
      _state = state;
      stateController.add(state);
    }
  }

  @mustCallSuper
  void dispose() {
    stateController.close();
    _state = null;
  }
}
