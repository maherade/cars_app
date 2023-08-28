import 'package:carousel_slider/carousel_slider.dart';
import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/presentation/screens/car_name/car_name.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/widgets/default_text_field.dart';
import 'package:cars_app/widgets/recomended_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/brand_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(color: ColorManager.textColor),
          backgroundColor: ColorManager.primaryColor,
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: ColorManager.lightColor,
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Image(
                    image: AssetImage('assets/images/ecar.png'),
                    height: 50,
                    width: 50,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: 50,
                    child: DefaultTextField(
                      prefixIcon: Icons.search,
                      hintText: 'اجراء البحث..؟',
                      controller: searchController,
                      textInputType: TextInputType.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: BlocConsumer<AppCubit,AppStates>(builder: (context, state) {
          return  Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: CarouselSlider(
                items: AppCubit.get(context).carouselImage.map((e) {
                  return Image(
                    image: NetworkImage(e),
                    width: double.infinity,
                    fit: BoxFit.fill,
                  );
                }).toList(),
                options: CarouselOptions(
                    height: MediaQuery.sizeOf(context).height*.25,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    viewportFraction: 1,
                    scrollDirection: Axis.horizontal,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true),
            ),
              ),
             SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.14,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return  CarName(brandName: '',);
                            }));
                          },
                          child: BrandItem(index: index),
                        );
                      },
                      separatorBuilder: (context,index){
                        return const SizedBox(width: 15,);
                      },
                      itemCount: AppCubit.get(context).companyNames.length
                  ),
                ),

                 Text(
                    'المنتج الموصي بيه',
                    style: GoogleFonts.cairo(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.black,
                    )),

                const SizedBox(height: 5,),

                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return const RecommendedItem();
                      },
                      separatorBuilder: (context,index){
                        return const SizedBox(width: 10,);
                      },
                      itemCount: 10
                  ),
                ),

                ],
            ),
          );
        }, listener: (context, state) {

        },),
      ),
//Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 CarouselSlider(
//                   items: AppCubit.get(context).carouselImage.map((e) {
//                     return Image(
//                       image: NetworkImage(e),
//                       width: double.infinity,
//                       fit: BoxFit.fill,
//                     );
//                   }).toList(),
//                   options: CarouselOptions(
//                       height: 220,
//                       initialPage: 0,
//                       enableInfiniteScroll: true,
//                       reverse: false,
//                       autoPlay: true,
//                       viewportFraction: 1,
//                       scrollDirection: Axis.horizontal,
//                       autoPlayAnimationDuration: const Duration(seconds: 1),
//                       autoPlayInterval: const Duration(seconds: 3),
//                       autoPlayCurve: Curves.fastOutSlowIn,
//                       enlargeCenterPage: true),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * .02,
//                 ),
//                 SizedBox(
//                   height:150,
//                   child: ListView.builder(
//                       shrinkWrap: true,
//                       physics: const ClampingScrollPhysics(),
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: BrandItem(index: index),
//                         );
//                       },
//                       itemCount: AppCubit.get(context).brandNames.length),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * .02,
//                 ),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Text(
//                     'المنتج الموصي بيه',
//                     style: GoogleFonts.cairo(
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.w600,
//                       color: ColorManager.black,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * .01,
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child:  ListView.separated(
//                       shrinkWrap: true,
//                       physics: const ClampingScrollPhysics(),
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             print('Hello');
//                           },
//                           child: const  RecommendedItem(),
//                         );
//                       },
//                       separatorBuilder: (context, index) {
//                         return const SizedBox(
//                           width: 15,
//                         );
//                       },
//                       itemCount: AppCubit.get(context).brandNames.length),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * .01,
//                 ),
//               ],
//             ),
//           )

//       Container(
//         color: ColorManager.lightColor2,
//           child: Column(
//             children: [
//               Container(
//                 color: ColorManager.primaryColor,
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 height: MediaQuery.of(context).size.height*.1,
//                 child: Row(
//                   children: [
//
//                      const Image(
//                        image: AssetImage('assets/images/ecar.png') ,
//                        height: 50,
//                        width: 50,
//                      ),
//                      const SizedBox(width: 15,),
//                      Expanded(
//                        child: DefaultTextField(
//                          prefixIcon: Icons.search,
//                         hintText: 'اجراء البحث..؟',
//                          controller: searchController,
//                          textInputType: TextInputType.text,
//
//                        ),
//                      )
//                   ],
//                 ),
//               ),
//
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12)
//                         ),
//                         child: CarouselSlider(
//                           items: AppCubit.get(context).carouselImage.map((e) {
//                             return Image(
//                               image: NetworkImage(e),
//                               width: double.infinity,
//                               fit: BoxFit.fitWidth,
//
//                             );
//                           }).toList(),
//                           options: CarouselOptions(
//                               height: 220,
//                               initialPage: 0,
//                               enableInfiniteScroll: true,
//                               reverse: false,
//                               autoPlay: true,
//                               viewportFraction: 1,
//                               scrollDirection: Axis.horizontal,
//                               autoPlayAnimationDuration: const Duration(seconds: 1),
//                               autoPlayInterval: const Duration(seconds: 3),
//                               autoPlayCurve: Curves.fastOutSlowIn,
//                               enlargeCenterPage: true
//
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.height*.02,),
//                       Expanded(
// flex: 1,
//                         child: ListView.separated(
//                             shrinkWrap: true,
//                             physics: const ClampingScrollPhysics(),
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (context,index){
//                               return GestureDetector(
//                                 onTap: (){
//                                    print('Hello');
//                                 },
//                                 child: BrandItem(index: index),
//                               );
//                             },
//                             separatorBuilder: (context,index){
//                               return const SizedBox(width: 15,);
//                             },
//                             itemCount: AppCubit.get(context).brandNames.length
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.topRight,
//                         child: Text(
//                           'المنتج الموصي بيه',
//                           style: GoogleFonts.cairo(
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.w600,
//                             color: ColorManager.black,
//                           ),
//                         ),
//                       ),
//                        Expanded(
//                          flex: 2,
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceAround,
//                            children: [
//                              Expanded(child: RecommendedItem()),
//                              SizedBox(width: MediaQuery.of(context).size.height*.01,),
//                              Expanded(child: RecommendedItem()),
//                            ],
//                          ),
//                        ),
//                     ],
//                   ),
//                 ),
//               )
//
//
//             ],
//           )
//
//       ),
    );
  }
}
