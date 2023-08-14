import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/color_manager.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(12)),
          child: Slidable(
            startActionPane: ActionPane(
              extentRatio: .20,
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (buildContext) {
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
              borderRadius: BorderRadius.circular(12),
              color: ColorManager.lightColor2,
              elevation: 10,
              child: Container(
                height:
                MediaQuery
                    .sizeOf(context)
                    .height * .15,
                decoration: BoxDecoration(
                    color: ColorManager.primaryColor,
                    borderRadius:
                    BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [

                      //TODO
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/lex.png'),
                        radius: 35,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                                "تويوا كرولا 20",
                                style: GoogleFonts.cairo(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w700,
                                  color: ColorManager.lightColor,
                                ),
                                textAlign: TextAlign.center),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "200 دولار",
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w700,
                                      color: ColorManager.lightColor,
                                    ),
                                    textAlign: TextAlign.center),
                                Text(
                                    "50 قطعة",
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w700,
                                      color: ColorManager.lightColor,
                                    ),
                                    textAlign: TextAlign.center),

                              ],
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
