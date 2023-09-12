import 'package:cached_network_image/cached_network_image.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../business_logic/app_cubit/app_cubit.dart';
import '../../business_logic/app_cubit/app_states.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.lightColor,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorManager.textColor),
            backgroundColor: ColorManager.primaryColor,
            elevation: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: ColorManager.lightColor,
            ),
            title: Text(
              'هوية التسوق',
              style: GoogleFonts.cairo(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: ColorManager.lightColor,
              ),
              textAlign: TextAlign.center,
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  cubit.deleteProducts(context).then((value) {
                    cubit.getUserProductsFromFireStore();
                    for (int i = 0; i < cubit.allFavorite.length; i++) {
                      cubit.addUserProductsToFireBase(
                          id: cubit.userModel!.uId!,
                          name: '${cubit.allFavorite[i]['name']}',
                          price: '${cubit.allFavorite[i]['price']}',
                          image: '${cubit.allFavorite[i]['image']}',
                          number: '${cubit.allFavorite[i]['number']}',
                          productId: '${cubit.allFavorite[i]['id']}',
                          code: '${cubit.allFavorite[i]['code']}');
                    }
                  });
                  },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * .02),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  width: MediaQuery.of(context).size.width * .25,
                  height: MediaQuery.of(context).size.width * .1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'استمرار',
                      style: GoogleFonts.cairo(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 10,),

            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                // CartItem(),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print(
                                AppCubit.get(context).allFavorite[index]['id']);
                            // AppCubit.get(context).deleteDatabase(
                            //     id: '${AppCubit.get(context).allFavorite[index]['id']}',
                            //     context: context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red),
                            child: Slidable(
                              startActionPane: ActionPane(
                                extentRatio: .20,
                                motion: const DrawerMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (buildContext) {
                                      print(AppCubit.get(context)
                                          .allFavorite[index]['id']);
                                      AppCubit.get(context).deleteDatabase(
                                          id: '${AppCubit.get(context).allFavorite[index]['id']}',
                                          context: context);
                                    },
                                    backgroundColor: Colors.red,
                                    label: 'حذف',
                                    icon: Icons.delete,
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                  ),
                                ],
                              ),
                              child: Material(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 10,
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  height:
                                  MediaQuery.of(context).size.height * .26,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: '${AppCubit.get(context).allFavorite[index]['image']}',
                                            height: 70,
                                            width: 70,
                                            placeholder: (context, url) => const Center(
                                              child: CircularProgressIndicator(
                                                color:ColorManager.red,
                                              ),
                                            ),
                                            errorWidget: (context, url, error) =>  Center(
                                              child: Image.asset('assets/images/logo1.PNG',),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                    AppCubit.get(context)
                                                        .allFavorite[index]
                                                    ['name'],
                                                    style: GoogleFonts.cairo(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color: ColorManager.black,
                                                    )),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.list_alt,
                                                      color: Colors.black,
                                                    ),
                                                    Text(
                                                      AppCubit.get(context)
                                                          .allFavorite[
                                                      index]['rate'],
                                                      style: GoogleFonts.cairo(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                        FontWeight.w600,
                                                        color:
                                                        ColorManager.black,
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
                                          Text(
                                              AppCubit.get(context)
                                                  .allFavorite[index]
                                              ['address'],
                                              style: GoogleFonts.cairo(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,
                                                color: ColorManager.black,
                                              )),
                                          const Spacer(),
                                          Text('${AppCubit.get(context)
                                              .allFavorite[index]
                                          ['price']}',
                                              style: GoogleFonts.cairo(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600,
                                                color: ColorManager.black,
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: AppCubit.get(context).allFavorite.length),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}