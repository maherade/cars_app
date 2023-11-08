import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/presentation/screens/open_full_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../business_logic/app_cubit/app_states.dart';
import '../../../business_logic/localization_cubit/app_localization.dart';
import '../../../styles/color_manager.dart';
import '../../../utiles/local/cash_helper.dart';
import '../../../widgets/toast.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        var list = AppCubit.get(context).search;
        return Scaffold(
            appBar: AppBar(
              titleSpacing: 0.0,
              iconTheme: const IconThemeData(color: ColorManager.primaryColor),
              backgroundColor: ColorManager.primaryColor,
              elevation: 0.0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: ColorManager.primaryColor,
              ),
              title: Container(
                height: 60,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onChanged: (value) {
                    cubit.getSearch(value);
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    hintText: AppLocalizations.of(context)!
                        .translate("search")
                        .toString(),
                    contentPadding: const EdgeInsets.only(top: 10),
                    hintStyle: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
              leadingWidth: 8,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_){
                          return OpenFullProduct(
                            productPrice: '${AppCubit.get(context).search[index]['WholePrice']}',
                            productCode: '${AppCubit.get(context).search[index]['productModelGuide']}',
                            productImage: '${AppCubit.get(context).search[index]['ImgUrl']}',
                            quantity: AppCubit.get(context).search[index]['quantity'],
                            productTitle: '${CashHelper.getData(
                                key: CashHelper.languageKey)
                                .toString() ==
                                "ar"?AppCubit.get(context)
                                .search[index]['ProductName']:AppCubit.get(context)
                                .search[index]['LatinName']}',
                          );
                        }));

                    },
                    child: Material(
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
                                      '${AppCubit.get(context).search[index]['ImgUrl']}',
                                  height: 70,
                                  width: 70,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: ColorManager.red,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Center(
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
                                      Text(
                                          CashHelper.getData(
                                                          key: CashHelper
                                                              .languageKey)
                                                      .toString() ==
                                                  "ar"
                                              ? AppCubit.get(context)
                                                  .search[index]['ProductName']
                                              : AppCubit.get(context)
                                                  .search[index]['LatinName'],
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
                                    '${AppCubit.get(context).search[index]['WholePrice']}\$',
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
                                  width: MediaQuery.of(context).size.width * .15,
                                  height: MediaQuery.of(context).size.width * .15,
                                  padding: const EdgeInsets.all(2),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintStyle: TextStyle(
                                        fontSize: 20,
                                      ),
                                      hintText: '1',
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
                                    AppCubit.get(context)
                                        .insertDatabase(
                                            name:
                                                '${AppCubit.get(context).products!.mainProducts![index].productName}',
                                            code:
                                                '${AppCubit.get(context).products!.mainProducts![index].productModelGuide}',
                                            price:
                                                '${AppCubit.get(context).products!.mainProducts![index].wholePrice}\$',
                                            number: AppCubit.get(context)
                                                        .productsControllers[
                                                            index]
                                                        .text ==
                                                    ''
                                                ? '1'
                                                : AppCubit.get(context)
                                                    .productsControllers[index]
                                                    .text,
                                            image:
                                                '${AppCubit.get(context).products!.mainProducts![index].imgUrl}',
                                            context: context)
                                        .then((value) {
                                      customToast(
                                        color: ColorManager.darkGrey,
                                        title: AppLocalizations.of(context)!
                                            .translate("addedToCart")
                                            .toString(),
                                      );
                                    }).then((value) {
                                      AppCubit.get(context).increaseCounter();
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  color: ColorManager.primaryColor,
                                  child: Text(
                                      AppLocalizations.of(context)!
                                          .translate("add")
                                          .toString(),
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
                    ),
                  );
                },
                itemCount: list.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
              ),
            ));
      },
      listener: (context, state) {},
    );
  }
}
