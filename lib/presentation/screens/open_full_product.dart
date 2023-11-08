import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/business_logic/localization_cubit/app_localization.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/widgets/defualtButton.dart';
import 'package:cars_app/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class OpenFullProduct extends StatelessWidget {
  const OpenFullProduct({
    required this.productPrice,
    required this.productTitle,
    required this.productImage,
    required this.productCode,
    required this.quantity,
    super.key
  });

   static var textEditingController=  TextEditingController();
   final String productTitle;
   final String productPrice;
   final String productImage;
   final String productCode;
   final num? quantity;



  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
      builder: (context,state){
          return Scaffold(
            backgroundColor: ColorManager.grey,
            appBar: AppBar(
              backgroundColor: ColorManager.primaryColor,
              elevation: 0.0,
              iconTheme: const IconThemeData(
                  color: Colors.white
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: ColorManager.primaryColor,

              ),
              titleSpacing: 0.0,
              title: Text(AppLocalizations.of(context)!.translate("product_details").toString(),style: GoogleFonts.cairo(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
              ),),

            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Material(
                      elevation: 5,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl:productImage,
                        height: MediaQuery.of(context).size.height*.28,
                        width: double.infinity,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>  Center(
                          child: Image.asset('assets/images/logo2.png',),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: MediaQuery.sizeOf(context).height*.1,
                        height: MediaQuery.sizeOf(context).height*.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,

                        ),
                        child: Text('$productPrice\$',style: GoogleFonts.cairo(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*.7,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(productTitle,style: GoogleFonts.cairo(
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),


                  SizedBox(height: MediaQuery.of(context).size.height*.01,),

                  Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Text(
                    '${AppLocalizations.of(context)!.translate("available").toString()}  ${(quantity!).toInt()}  ${AppLocalizations.of(context)!.translate("pieces").toString()} ',
                    style: GoogleFonts.cairo(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.black,
                    )),
                // Row(
                //   children: [
                //     Text('سعر القطعه: ',style: GoogleFonts.cairo(
                //         fontSize: 17,
                //         fontWeight: FontWeight.w600
                //     ),),
                //     Text('$productPrice\$',style: GoogleFonts.cairo(
                //         fontSize: 20,
                //         fontWeight: FontWeight.w500
                //     ),),
                //   ],
                // ),
              ),
                  SizedBox(height: MediaQuery.of(context).size.height*.01,),


                  Padding(
                padding:  EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.height*.28,
                        0,
                        MediaQuery.of(context).size.height*.01,
                        0
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: DefaultButton(
                              color: ColorManager.primaryColor,
                              color2: ColorManager.primaryColor,
                              buttonText: '+',
                              text_size: 20,
                              onPressed: (){

                                AppCubit.get(context).increaseProduct();

                              }
                          ),
                        ),

                        Container(
                          width: 50,
                          child: Text(
                            '${AppCubit.get(context).productNumber}',
                            style: const TextStyle(
                                fontSize: 20,
                                color: ColorManager.primaryColor
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        Expanded(
                          child: DefaultButton(
                              color: ColorManager.primaryColor,
                              color2: ColorManager.primaryColor,
                              buttonText: '-',
                              text_size: 20,
                              onPressed: (){
                                AppCubit.get(context).decreaseProduct();
                              }
                          ),
                        ),

                      ],
                    ),
                  ),



                  Container(
                    margin: const EdgeInsets.only(
                        top: 60,
                        left: 15,
                        right: 15
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(40)),
                    child: MaterialButton(
                        height: 50,
                        color: ColorManager.primaryColor,
                        textColor: Colors.white,

                  onPressed: (){
                    if( AppCubit.get(context).productNumber > quantity!){
                      customToast(title: "${AppLocalizations.of(context)!.translate("notAvailable")}", color: Colors.red);
                    }
                    else{
                        AppCubit.get(context).allFavorite.clear();
                        AppCubit.get(context)
                            .insertDatabase(
                                name: productTitle,
                                code: '${productCode}',
                                price: '${productPrice}',
                                number:  "${AppCubit.get(context).productNumber}",
                                image: "${productImage}",
                                context: context)
                            .then((value) {
                          customToast(
                              color: ColorManager.red,
                              title: AppLocalizations.of(context)!
                                  .translate('addedToCart')
                                  .toString());
                        }).then((value) {
                          AppCubit.get(context).productNumber = 1;

                          AppCubit.get(context).increaseCounter();
                          textEditingController.clear();
                        });
                      }
                    },
                  child: Text(AppLocalizations.of(context)!.translate('addedToCart').toString(),
                    style: GoogleFonts.cairo(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),)),
                )

                ],
              ),
            ),
          );
      },
    );
  }
}
