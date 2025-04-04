import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../widget/image/t_circular_image.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({
    super.key, required this.onPressed,
  });
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        image: 'assets/image/products/cattle/f.jpg',
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Raihanul Islam Rahat',
        style: Theme.of(context).textTheme.headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        'raihanulrahat8123@gmail.com',
        style: Theme.of(context).textTheme.bodyMedium!
            .apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
  }
}