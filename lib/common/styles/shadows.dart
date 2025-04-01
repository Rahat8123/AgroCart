import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';

class TShadowStyle {
  /// **Vertical Product Shadow**
  static final BoxShadow verticalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1), // ✅ Fixed: `dorkGrey` → `darkGrey`
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  /// **Horizontal Product Shadow**
  static final BoxShadow horizontalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(2, 0), // ✅ Fixed: Horizontal shadow
  );
}
