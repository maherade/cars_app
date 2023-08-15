import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/widgets/cart_item.dart';
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
    return  BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        var cubit=AppCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.lightColor,
          appBar: AppBar(
            titleSpacing: 0.0,
            iconTheme: const IconThemeData(color: ColorManager.textColor),
            backgroundColor: ColorManager.primaryColor,
            elevation: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: ColorManager.lightColor,
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorManager.lightColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'العربة',
              style: GoogleFonts.cairo(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: ColorManager.lightColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          body:  Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                // CartItem(),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context,index){
                        return Slidable(
                          startActionPane: ActionPane(
                            extentRatio: .20,
                            motion: const DrawerMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (buildContext) {
                                  print(AppCubit.get(context).allFavorite[index]['id']);
                                  AppCubit.get(context).deleteDatabase(id: '${AppCubit.get(context).allFavorite[index]['id']}', context: context);
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
                              height: MediaQuery.of(context).size.height*.26,
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
                                        image: NetworkImage('${AppCubit.get(context).allFavorite[index]['image']}'),
                                        height: 70,
                                        width: 70,
                                      ),
                                      const SizedBox(width: 15,),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                                AppCubit.get(context).allFavorite[index]['name'],
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
                                                Text(AppCubit.get(context).allFavorite[index]['rate'],style: GoogleFonts.cairo(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.black,
                                                ),)
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
                                          AppCubit.get(context).allFavorite[index]['address'],
                                          style: GoogleFonts.cairo(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                            color: ColorManager.black,
                                          )),
                                      const Spacer(),
                                      Text(
                                          '22\$',
                                          style: GoogleFonts.cairo(
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w600,
                                            color: ColorManager.black,
                                          )),

                                    ],
                                  ),

                                  const SizedBox(height: 10,),

                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context,index){
                        return const SizedBox(height: 15,);
                      },
                      itemCount: AppCubit.get(context).allFavorite.length
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
