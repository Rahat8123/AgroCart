import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/text_strings.dart';

class formdivider extends StatelessWidget {
  const formdivider({
    super.key,
    required this.dark,
    required this.dividerText
  });
final String dividerText;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? TColors.darkGrey : TColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            dividerText,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white),
          ),
        ),
        Flexible(
          child: Divider(
            color: dark ? TColors.darkGrey : TColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}