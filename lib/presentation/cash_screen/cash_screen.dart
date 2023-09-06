import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_widget/ticket_widget.dart';

class CashScreen extends StatelessWidget {
  const CashScreen({super.key});


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorManager.textColor),
        backgroundColor: ColorManager.primaryColor,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: ColorManager.lightColor,
        ),
        title: Text(
          'إيصال',
          style: GoogleFonts.cairo(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: ColorManager.lightColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          elevation: 20,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            height: MediaQuery.of(context).size.height*.55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //   width: 120.0,
                    //   height: 25.0,
                    //
                    //   decoration: BoxDecoration(
                    //     color: ColorManager.textColor,
                    //     borderRadius: BorderRadius.circular(30.0),
                    //     border: Border.all(width: 1.0, color: ColorManager.primaryColor),
                    //   ),
                    //   child: const Center(
                    //     child: Text(
                    //       'ايصال',
                    //       style: TextStyle(color: ColorManager.white),
                    //     ),
                    //   ),
                    // ),
                    // Row(
                    //   children: const [
                    //     Text(
                    //       'LHR',
                    //       style: TextStyle(
                    //           color: Colors.black, fontWeight: FontWeight.bold),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.only(left: 8.0),
                    //       child: Icon(
                    //         Icons.flight_takeoff,
                    //         color: Colors.pink,
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.only(left: 8.0),
                    //       child: Text(
                    //         'ISL',
                    //         style: TextStyle(
                    //             color: Colors.black, fontWeight: FontWeight.bold),
                    //       ),
                    //     )
                    //   ],
                    // )
                  ],
                ),
                // const Padding(
                //   padding: EdgeInsets.only(top: 20.0),
                //   child: Text(
                //     'الايصال',
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 20.0,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
                //name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'الإسم: ${AppCubit.get(context).userModel!.userName}',
                        style: GoogleFonts.cairo(
                            color: ColorManager.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize:
                            MediaQuery.of(context).size.height *
                                .025),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * .01,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                //phone
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        'رقم الهاتف: ${AppCubit.get(context).userModel!.phoneNumber}',
                        style: GoogleFonts.cairo(
                            color: ColorManager.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize:
                            MediaQuery.of(context).size.height *
                                .025),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * .01,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.height * .01,
                ),
                // عدد المنتجات

                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        'عدد المشتريات: ${AppCubit.get(context).userProduct.length}',
                        style: GoogleFonts.cairo(
                            color: ColorManager.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize:
                            MediaQuery.of(context).size.height *
                                .025),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * .01,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //   child: Row(
                //     children: [
                //       Text(
                //         'سعر المشتريات: ${AppCubit.get(context).totalPrice}',
                //         style: GoogleFonts.cairo(
                //             color: ColorManager.textColor,
                //             fontWeight: FontWeight.w500,
                //             fontSize:
                //             MediaQuery.of(context).size.height *
                //                 .022),
                //       ),
                //       SizedBox(
                //         width: MediaQuery.of(context).size.height * .01,
                //       ),
                //     ],
                //   ),
                // ),


                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo1.PNG'),
                            fit: BoxFit.cover)),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}
