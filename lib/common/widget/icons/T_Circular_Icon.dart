import 'package:flutter/material.dart';
//import 'package:t_store/utils/constants/sizes.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TCircularIcon extends StatelessWidget {
  /// A custom Circular Icon widget with a background color.
  ///
  /// Properties:
  /// - Container [width], [height], & [backgroundColor].
  /// - Icon's (size), (color) & (onPressed).

  const TCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = TSizes.lg, // Fixed default size
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? size, // Set default width if not provided
      height: height ?? size, // Set default height if not provided
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.black.withOpacity(0.9)
                : TColors.white.withOpacity(0.9)),
        shape: BoxShape.circle, // Ensures the container is perfectly circular
      ),
      child: Center( // Ensures the icon is centered
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: color, size: size! * .8), // Adjusted size
          padding: EdgeInsets.zero, // Removes default padding
          constraints: const BoxConstraints(), // Removes extra constraints
        ),
      ),
    );
  }
}
