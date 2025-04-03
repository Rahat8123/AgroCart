import 'package:agrocart/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'add_new_address.dart';

class UserAddresScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     floatingActionButton: FloatingActionButton(onPressed: () => Get.to(()=> const AddNewAddressScreen()),
     backgroundColor: TColors.primary,
     child: const Icon(Iconsax.add,color:TColors.white),
     ),
     appBar: TAppBar(
       showBackArrow:true,
       title:Text('Address',style:Theme.of(context).textTheme.headlineSmall),
     ),
     body: const SingleChildScrollView(
       child: Padding(
         padding: EdgeInsets.all(TSizes.defaultSpace),
         child: Column(
           children: [
             TSingleAddress(selectedAddress: false),
             TSingleAddress(selectedAddress: true),
           ],
         ), // Column
       ), // Padding
     ),

   );
  }

}