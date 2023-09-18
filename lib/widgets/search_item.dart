import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars_app/data/modles/product_model.dart';
import 'package:cars_app/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../business_logic/app_cubit/app_cubit.dart';
import '../styles/color_manager.dart';

class SearchItem extends StatelessWidget {
  int? index;
   SearchItem(this.mainProducts,{required index,super.key});

   MainProducts mainProducts;

  @override
  Widget build(BuildContext context) {
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
                CachedNetworkImage(
                  imageUrl:
                  '${AppCubit.get(context).products!.mainProducts![index!].imgUrl}',
                  height: 70,
                  width: 70,
                  placeholder: (context, url) =>
                  const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.red,
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      Center(
                        child: Image.asset(
                          'assets/images/logo1.PNG',
                        ),
                      ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(mainProducts
                              .productName!,
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
                // const Icon(
                //   Icons.qr_code,
                //   color: Colors.black,
                // ),
                // Text("{cubit.products!.mainProducts![index].productModelGuide}",
                //     style: GoogleFonts.cairo(
                //       fontSize: 15.0,
                //       fontWeight: FontWeight.w600,
                //       color: ColorManager.black,
                //     )),
                const Spacer(),
                Text(
                    '${mainProducts.wholePrice!}\$',
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
                  MediaQuery.of(context).size.width *
                      .15,
                  height:
                  MediaQuery.of(context).size.width *
                      .15,
                  padding: const EdgeInsets.all(2),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: 20,
                      ),
                      hintText: '0',
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                    controller: AppCubit.get(context)
                        .productsControllers[index!],
                    keyboardType: TextInputType.number,
                  ),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    AppCubit.get(context)
                        .allFavorite
                        .clear();
                    AppCubit.get(context)
                        .insertDatabase(
                        name:
                        '${mainProducts.productName}',
                        code:
                        '${mainProducts.productModelGuide}',
                        price:
                        '${mainProducts.wholePrice}\$',
                        number: AppCubit.get(context)
                            .productsControllers[
                        index!]
                            .text ==
                            ''
                            ? '1'
                            : AppCubit.get(context)
                            .productsControllers[
                        index!]
                            .text,
                        image:
                        '${mainProducts..imgUrl}',
                        context: context)
                        .then((value) {
                      customToast(
                          color: ColorManager.darkGrey,
                          title:
                          'تم اضافه المنتج في السله');
                    }).then((value) {
                      AppCubit.get(context).increaseCounter();
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(12),
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
  }
}
