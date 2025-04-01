
import 'package:flutter/cupertino.dart';

import '../../../../../common/widget/image_text_widget/vertical_image.dart';
import '../../../../../utils/constants/image_strings.dart';

class homecatagories extends StatelessWidget {
  const homecatagories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 7, // Changed from 6 to 8
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
            image: TImages.cattle, // Ensure you have 8 different icons
            title: 'Cattle',
            onTAp: () {},
          );
        },
      ),
    );
  }
}