
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widget/image_text_widget/vertical_image.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../sub_catagory/sub_catagory.dart';

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
            onTAp: () =>Get.to(()=>const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}