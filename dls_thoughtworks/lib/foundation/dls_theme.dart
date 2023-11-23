import 'package:dls_thoughtworks/foundation/dls_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DlsTheme extends InheritedTheme {
  const DlsTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final DlsThemeData data;

  static DlsTheme? _getDlsTheme(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DlsTheme>();

  // Todo: DLS: Create design APIs to expose your theme properties

  @override
  Widget wrap(BuildContext context, Widget child) {
    return DlsTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(DlsTheme oldWidget) => data != oldWidget.data;
}
