import 'package:flutter/material.dart';

typedef KanzaInstanceBuilder<K> = K Function(BuildContext context);

typedef KanzaWidgetBuilder<S> = Widget Function(BuildContext context, S state);

typedef KanzaListenerBuilder<S> = void Function(BuildContext context, S state);
