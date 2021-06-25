import 'package:flutter/material.dart';

import 'kanza.dart';
import 'typedefs.dart';

dynamic _kanza;

class KanzaProvider<K extends Kanza> extends StatefulWidget {
  KanzaProvider({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final KanzaInstanceBuilder<K> builder;
  final Widget? child;

  static K of<K extends Kanza>(BuildContext context) {
    final KanzaProvider<K>? provider =
        context.findAncestorWidgetOfExactType<KanzaProvider<K>>();

    if (provider == null) throw UnimplementedError('No Kanza found!');
    _kanza ??= provider.builder(context);

    return _kanza;
  }

  @override
  _KanzaProviderState<K> createState() => _KanzaProviderState<K>();
}

class _KanzaProviderState<K extends Kanza> extends State<KanzaProvider<K>> {
  @override
  Widget build(BuildContext context) {
    return widget.child ?? SizedBox.shrink();
  }

  @override
  void dispose() {
    _kanza.dispose();
    super.dispose();
  }
}
