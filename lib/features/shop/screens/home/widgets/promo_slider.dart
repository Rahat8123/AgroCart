import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widget/custom_Shape/containers/circular_container.dart';
import '../../../../../common/widget/image/Rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controller/home_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        /// Image Carousel
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners
              .map((banner) => TRoundedImage(imageUrl: banner))
              .toList(),
        ),

        const SizedBox(height: TSizes.spaceBtwItems),

        /// Carousel Indicator Dots
        Center(
          child: Obx(
                () => Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                banners.length,
                    (i) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TCircularContainer(
                    width: 20,
                    height: 4,
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}