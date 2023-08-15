import 'package:carousel_slider/carousel_slider.dart';
import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/presentation/screens/car_name/car_name.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/brand_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static var searchController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Container(
      color: ColorManager.lightColor2,
        child: Column(
          children: [
            Container(
              color: ColorManager.primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: MediaQuery.of(context).size.height*.1,
              child: Row(
                children: [

                   const Image(
                     image: AssetImage('assets/images/ecar.png') ,
                     height: 50,
                     width: 50,
                   ),
                   const SizedBox(width: 15,),
                   Expanded(
                     child: DefaultTextField(
                       prefixIcon: Icons.search,
                      hintText: 'اجراء البحث..؟',
                       controller: searchController,
                       textInputType: TextInputType.text,

                     ),
                   )
                ],
              ),
            ),

            CarouselSlider(
              items: AppCubit.get(context).carouselImage.map((e) {
                return Image(
                  image: NetworkImage(e),
                  width: double.infinity,
                  fit: BoxFit.cover,

                );
              }).toList(),
              options: CarouselOptions(
                  height: 220,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  viewportFraction: 1,
                  scrollDirection: Axis.horizontal,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true

              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height*.02,),

            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                         print('Hello');
                      },
                      child: BrandItem(index: index),
                    );
                  },
                  separatorBuilder: (context,index){
                    return const SizedBox(width: 15,);
                  },
                  itemCount: AppCubit.get(context).brandNames.length
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Text(
                'المنتج الموصي بيه',
                style: GoogleFonts.cairo(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: ColorManager.black,
                ),
              ),
            ),

          ],
        )

    );
  }
}
