import 'package:flutter/material.dart';

import 'kanza.dart';
import 'kanza_provider.dart';

typedef WidgetBuilder<S> = Widget Function(BuildContext context, S state);

class KanzaBuilder<K extends Kanza, S> extends StatelessWidget {
  const KanzaBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final WidgetBuilder<S> builder;

  @override
  Widget build(BuildContext context) {
    final kanza = KanzaProvider.of<K>(context);

    return StreamBuilder<S>(
      stream: kanza.stream as Stream<S>,
      initialData: kanza.initialState,
      builder: (context, snapshot) {
        return builder(context, snapshot.data as S);
      },
    );
  }
}
