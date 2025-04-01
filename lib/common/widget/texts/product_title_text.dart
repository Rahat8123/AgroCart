import 'package:flutter/material.dart';

class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key,
    required this.title,
    this.smallsize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left, required bool smallSize,
  });

  final String title;
  final bool smallsize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallsize
          ? Theme.of(context).textTheme.labelLarge // Assuming `bodyText2` is smaller
          : Theme.of(context).textTheme.titleSmall, // Default for larger text
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
