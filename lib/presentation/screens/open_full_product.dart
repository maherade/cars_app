import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/localization_cubit/app_localization.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/utiles/local/cash_helper.dart';
import 'package:cars_app/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OpenFullProduct extends StatelessWidget {
  const OpenFullProduct({
    required this.productPrice,
    required this.productTitle,
    required this.productImage,
    required this.productCode,
    super.key
  });

   static var textEditingController=  TextEditingController();
   final String productTitle;
   final String productPrice;
   final String productImage;
   final String productCode;



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
         backgroundColor: ColorManager.primaryColor,
         elevation: 0.0,
         iconTheme: IconThemeData(
           color: Colors.white
         ),
         systemOverlayStyle: const SystemUiOverlayStyle(
           statusBarIconBrightness: Brightness.light,
           statusBarColor: ColorManager.primaryColor,

         ),
         titleSpacing: 0.0,
         title: Text('تفاصيل المنتجٍ',style: GoogleFonts.cairo(
           fontSize: 17,
           fontWeight: FontWeight.w500
         ),),

       ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl:'${productImage}',
                height: MediaQuery.of(context).size.height*.35,
                width: double.infinity,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) =>  Center(
                  child: Image.asset('assets/images/logo2.png',),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width*.7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(productTitle,style: GoogleFonts.cairo(
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                  ),),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('سعر القطعه: ',style: GoogleFonts.cairo(
                        fontSize: 17,
                        fontWeight: FontWeight.w600
                    ),),
                    Text('$productPrice\$',style: GoogleFonts.cairo(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('عدد القطع: ',style: GoogleFonts.cairo(
                          fontSize: 17,
                          fontWeight: FontWeight.w600
                      ),),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width*.4,
                      child: TextFormField(
                        decoration:
                        const InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 20,
                          ),
                          hintText: '1',
                        ),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20),
                        controller: textEditingController,
                        keyboardType:
                        TextInputType.number,
                      ),
                    ),

                  ],
                ),
              ),


              Container(
                margin: EdgeInsets.only(
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
                    AppCubit.get(context).allFavorite.clear();
                    AppCubit.get(context).insertDatabase(
                        name: productTitle,
                        code: '${productCode}',
                        price: '${productPrice}',
                        number: textEditingController.text == '' ? '1' : textEditingController.text,
                        image:"${productImage}",context: context).then((value) {
                      customToast(
                          color: ColorManager
                              .red,
                          title: AppLocalizations
                              .of(context)!
                              .translate(
                              'addedToCart')
                              .toString());
                    }).then((value) {
                      AppCubit.get(context)
                          .increaseCounter();
                      textEditingController.clear();

                    });
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
      ),
    );
  }
}
