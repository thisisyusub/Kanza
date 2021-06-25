import 'package:flutter/material.dart';

import 'kanza.dart';
import 'kanza_provider.dart';
import 'typedefs.dart';

class KanzaListener<K extends Kanza, S> extends StatelessWidget {
  const KanzaListener({
    Key? key,
    required this.listener,
  }) : super(key: key);

  final KanzaListenerBuilder<S> listener;

  @override
  Widget build(BuildContext context) {
    final kanza = KanzaProvider.of<K>(context);

    return StreamBuilder<S>(
      stream: kanza.stream as Stream<S>,
      initialData: kanza.initialState,
      builder: (context, snapshot) {
        listener(context, snapshot.data as S);
        return SizedBox.shrink();
      },
    );
  }
}
