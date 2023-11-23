import 'dart:ui';

import 'colors.dart';

class DlsColors {
  // Todo: DLS: Create theme color tokens
  const DlsColors({
    required this.titleActive,
    required this.body,
  });

  final Color titleActive;
  final Color body;

  // Todo: DLS: Create colors for light theme
  static DlsColors light() => const DlsColors(
        titleActive: dlsGrey800,
        body: dlsGrey700,
      );

// Todo: DLS: Create colors for dark theme
  static DlsColors dark() => const DlsColors(
        titleActive: dlsGrey800,
        body: dlsGrey700,
      );
}
