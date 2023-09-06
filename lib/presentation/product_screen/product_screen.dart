import 'dart:math';

import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/presentation/product_screen/widgets/company_widget.dart';
import 'package:cars_app/presentation/screens/car_name/car_name.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/utiles/local/cash_helper.dart';
import 'package:cars_app/widgets/brand_item.dart';
import 'package:cars_app/widgets/default_text_field.dart';
import 'package:cars_app/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  var numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
      builder: (context,state){
        var cubit=AppCubit.get(context);
        return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              titleSpacing: 0.0,
              backgroundColor: ColorManager.primaryColor,
              elevation: 0.0,
              iconTheme: const IconThemeData(color: Colors.white),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: Colors.transparent,
              ),
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      'المنتجات',
                      style: GoogleFonts.cairo(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * .02),
                    decoration: BoxDecoration(
                        color: Colors.red, borderRadius: BorderRadius.circular(12)),
                    width: MediaQuery.of(context).size.width * .25,
                    height: MediaQuery.of(context).size.width * .1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CashHelper.getData(key: 'counter')==null?
                        Text(
                          '0',
                          style: GoogleFonts.cairo(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.white,
                          )):
                            Text(
                            '${cubit.allFavorite.length}',
                            style: GoogleFonts.cairo(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: ColorManager.white,
                           ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          color: Colors.white,
                          width: 2,
                        ),
                        const Icon(
                          Icons.card_travel,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            body:  Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Container(
                  //   height: MediaQuery.of(context).size.height * .17,
                  //   child: ListView.separated(
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) {
                  //         return GestureDetector(
                  //           onTap: () {
                  //             // Navigator.push(context, MaterialPageRoute(builder: (_){
                  //             //   return const CarName(brandName: ,);
                  //             // }));
                  //           },
                  //           child: CompanyWidget(index: index),
                  //         );
                  //       },
                  //       separatorBuilder: (context, index) {
                  //         return const SizedBox(
                  //           width: 15,
                  //         );
                  //       },
                  //       itemCount: AppCubit.get(context).companyNames.length),
                  // ),

                  const SizedBox(
                    height: 15,
                  ),
                  cubit.myProducts.isNotEmpty?
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: MediaQuery.of(context).size.height * .32,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                       Image(
                                        image: AssetImage(
                                            cubit.partNames.elementAt(Random().nextInt(cubit.partNames.length))),
                                        height: 70,
                                        width: 70,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                                cubit.products!.mainProducts![index].productName!,
                                                style: GoogleFonts.cairo(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.black,
                                                )),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.qr_code,
                                        color: Colors.black,
                                      ),
                                      Text(cubit.products!.mainProducts![index].barcode ==null? 'F0010-23250':cubit.products!.mainProducts![index].barcode!,
                                          style: GoogleFonts.cairo(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                            color: ColorManager.black,
                                          )),
                                      const Spacer(),
                                      Text('${cubit.products!.mainProducts![index].wholePrice!}\$',
                                          style: GoogleFonts.cairo(
                                            fontSize: 21.0,
                                            fontWeight: FontWeight.w600,
                                            color: ColorManager.black,
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width * .15,
                                        height:
                                        MediaQuery.of(context).size.width * .15,
                                        padding: const EdgeInsets.all(2),

                                        child: TextFormField(
                                          decoration:  const InputDecoration(

                                            hintStyle: TextStyle(
                                              fontSize: 20,
                                            ),
                                            hintText: '0',

                                          ),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 20),
                                          controller: AppCubit.get(context)
                                              .productsControllers[index],
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      const Spacer(),
                                      MaterialButton(
                                        onPressed: () {
                                          AppCubit.get(context).allFavorite.clear();
                                          AppCubit.get(context).insertDatabase(
                                              name:
                                              '${cubit.products!.mainProducts![index].productName}',
                                              code: cubit.products!.mainProducts![index].barcode ==null?'F0010-23250':'${cubit.products!.mainProducts![index].barcode}',
                                              price: '${cubit.products!.mainProducts![index].wholePrice}\$',
                                              number: cubit.productsControllers[index].text==''?'1':cubit.productsControllers[index].text,
                                              image:
                                              cubit.partNames.elementAt(Random().nextInt(cubit.partNames.length)),
                                              context: context).then((value) {
                                            customToast(color: ColorManager.darkGrey,title: 'تم اضافه المنتج في السله');
                                          }).then((value) {
                                            cubit.increaseCounter();
                                          });
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        color: ColorManager.primaryColor,
                                        child: Text('اضافه',
                                            style: GoogleFonts.cairo(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
                                              color: ColorManager.white,
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
                        itemCount: cubit.myProducts.length),
                  ):
                  const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.textColor,
                    ),
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
}
