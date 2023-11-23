import 'package:flutter/material.dart';

class DlsTypography {
  // Todo: DLS: Create typography tokens

  const DlsTypography({
    required this.displayLargeBold,
  });

  final TextStyle displayLargeBold;

  // Todo: DLS: Add typography tokens for mobile and desktop

  static DlsTypography mobile() => const DlsTypography(
        displayLargeBold: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          fontSize: 48,
          height: 1.042,
        ),
      );

  static DlsTypography desktop() => const DlsTypography(
        displayLargeBold: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
          fontSize: 64,
          height: 0.97,
        ),
      );
}
