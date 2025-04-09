import 'package:agrocart/common/brand/brand_show_case.dart';
import 'package:agrocart/common/widget/appbar/tapbar.dart';
import 'package:agrocart/common/widget/layout/grid_layout.dart';
import 'package:agrocart/features/shop/brand/all_brand.dart';
import 'package:agrocart/features/shop/screens/home/widgets/catagory_tab.dart';
import 'package:agrocart/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/brand/T_Breand_Card/T_Brand_card.dart';
import '../../../../common/brandmodel/brandmodel.dart';
import '../../../../common/widget/Container/TRounded_COntainer.dart';
import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/custom_Shape/containers/search_container.dart';
import '../../../../common/widget/image/t_circular_image.dart';
import '../../../../common/widget/products.cart/cart_menu_icon.dart';
import '../../../../common/widget/section_heading/sectionheading.dart';
import '../../../../common/widget/texts/t_brand_title_text_with_verified_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
              iconColor: TColors.white,
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 440, // Space between Appbar and TabBar
                automaticallyImplyLeading: false,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// Search bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ), // TSearchContainer
                      const SizedBox(height: TSizes.spaceBtwSections),

                      /// Featured Brands Section
                      TSectionHeading(title: 'Featured Brands', onPressed: () {

                      Get.to(()=>const AllBrandsScreen());}),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      /// -- Brands GRID
                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (context, index) {
                          return TBrandCard(
                            brand: BrandModel(
                              name: "Acme",
                              image: TImages.nikeLogo,
                              productsCount: 50,
                            ),
                            showBorder: true,
                          );
                        },
                      ), // TGridLayout
                    ],
                  ), // ListView
                ),
                bottom: const TTabBar(tabs: [
                  Tab(child: Text('Cattle')),
                  Tab(child: Text('Poultry')),
                  Tab(child: Text('Fish')),
                  Tab(child: Text('Agri')),
                  Tab(child: Text('Pets & Birds')),
                  Tab(child: Text('Gardening')),
                  Tab(child: Text('Feedmill')),
                ]),
              ), // SliverAppBar
            ];
          },

          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    TCategoryTab(),
                    TCategoryTab(),
                    TCategoryTab(),
                    TCategoryTab(),
                    TCategoryTab(),
                    TCategoryTab(),
                    TCategoryTab(),
                  ],
                ),
              ),
            ],
          ),
        ), // NestedScrollView
      ),
    );
  }
}
