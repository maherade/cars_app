import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/data/modles/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../business_logic/app_cubit/app_states.dart';
import '../../../styles/color_manager.dart';
import '../../../widgets/toast.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    AppCubit.get(context).getAllProductFromApi();
    super.initState();
  }

  void searchProducts( query) {
    List<MainProducts> product = AppCubit.get(context).allProducts;
    List<MainProducts> mainProducts = product;
    setState(() {
      mainProducts =
          product.where((element) => product.map((query) => String).contains(query)).toList();
    });
  }

  // void runFilter(String keyword) {
  //   List<MainProducts> results = [];
  //   if (keyword.isEmpty) {
  //     // if the search field is empty or only contains white-space, we'll display all users
  //
  //     // results = AppCubit.get(context).allProducts;
  //   } else {
  //     setState(() {
  //       results = AppCubit.get(context).allProducts;
  //     });
  //     // we use the toLowerCase() method to make it case-insensitive
  //   }
  //
  // }

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              titleSpacing: 0.0,
              iconTheme: const IconThemeData(color: ColorManager.white),
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
                    searchProducts(value);
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
                    hintText: 'بحث',
                    contentPadding: const EdgeInsets.only(top: 10),
                    hintStyle: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
              leadingWidth: 8,
            ),
            body: AppCubit.get(context).allProducts.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                    CachedNetworkImage(
                                      imageUrl:
                                          '${cubit.allProducts[index].imgUrl}',
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
                                          Text(
                                              cubit.allProducts[index]
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
                                        '${cubit.allProducts[index].wholePrice!}\$',
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
                                      width: MediaQuery.of(context).size.width *
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
                                            .productsControllers[index],
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
                                                    '${cubit.allProducts[index].productName}',
                                                code:
                                                    '${cubit.allProducts[index].productModelGuide}',
                                                price:
                                                    '${cubit.allProducts[index].wholePrice}\$',
                                                number: cubit
                                                            .productsControllers[
                                                                index]
                                                            .text ==
                                                        ''
                                                    ? '1'
                                                    : cubit
                                                        .productsControllers[
                                                            index]
                                                        .text,
                                                image:
                                                    '${cubit.allProducts[index].imgUrl}',
                                                context: context)
                                            .then((value) {
                                          customToast(
                                              color: ColorManager.darkGrey,
                                              title:
                                                  'تم اضافه المنتج في السله');
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
                      itemCount: cubit.allProducts.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                    ),
                  ));
      },
      listener: (context, state) {
        if (State is GetAllProductsFromApiSuccessState) {}
      },
    );
  }
}
