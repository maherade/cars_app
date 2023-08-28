import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/presentation/product_screen/widgets/company_widget.dart';
import 'package:cars_app/presentation/screens/car_name/car_name.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/widgets/brand_item.dart';
import 'package:cars_app/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  var numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                'البحث عن طريق العلامه التجاريه',
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
                  Text(
                    '0',
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
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .17,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (_){
                        //   return const CarName(brandName: ,);
                        // }));
                      },
                      child: CompanyWidget(index: index),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 15,
                    );
                  },
                  itemCount: AppCubit.get(context).companyNames.length),
            ),
            const Text('منتجات',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.black,
                )),
            const SizedBox(
              height: 15,
            ),
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
                        height: MediaQuery.of(context).size.height * .35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const Image(
                                  image: NetworkImage(
                                      'https://macknmall.com/media/codazon_cache/brand/250x/wysiwyg/Bosch-1.png'),
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
                                          'جاملغ بدون زرف نيسان فيرسا 2015-2019 سه كن ماليزيا',
                                          style: GoogleFonts.cairo(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                            color: ColorManager.black,
                                          )),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.list_alt,
                                            color: Colors.black,
                                          ),
                                          Text(
                                            '3',
                                            style: GoogleFonts.cairo(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
                                              color: ColorManager.black,
                                            ),
                                          )
                                        ],
                                      )
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
                                Text('كود NTEFS',
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    )),
                                const Spacer(),
                                Text('22\$',
                                    style: GoogleFonts.cairo(
                                      fontSize: 25.0,
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
                                      MediaQuery.of(context).size.width * .18,
                                  height:
                                      MediaQuery.of(context).size.width * .15,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintStyle: const TextStyle(
                                        fontSize: 22,
                                      ),
                                      hintText: '0',
                                      border: InputBorder.none,
                                      enabled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.black)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.black)),
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
                                            'جاملغ بدون زرف نيسان فيرسا 2015-2019 سه كن ماليزيا',
                                        code: 'كود NTEFS',
                                        price: '22\$',
                                        number: '3',
                                        image:
                                            'https://macknmall.com/media/codazon_cache/brand/250x/wysiwyg/Bosch-1.png',
                                        context: context);
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
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}
