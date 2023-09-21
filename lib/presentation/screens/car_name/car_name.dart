import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/presentation/screens/car_model/car_model.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../business_logic/localization_cubit/app_localization.dart';

class CarName extends StatelessWidget {
  final String brandName;

   CarName({super.key, required this.brandName});

  static List<String> carNames = [
    'https://th.bing.com/th/id/OIP.TO45779tzyhiqY9n7ySUYAHaE6?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/OIP.7e0y0NmH_Sy9w5KOI-rdsgHaFS?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/OIP.Es_wK6HeWJQ4B9_nMn9PCQHaEA?pid=ImgDet&rs=1',
    'https://invygo-car-images.s3.ap-south-1.amazonaws.com/ac1a8cbc-b26f-4193-ad16-de1c5684bf2b_Corolla%202023%20silver.png',
    'https://img.freepik.com/free-photo/black-cabriolet-parked-port_114579-5232.jpg?w=740&t=st=1690366493~exp=1690367093~hmac=e60800627925a51353e8ac0d736ab2db1d02370d948866e2f0086a0541898f44',
    'https://img.freepik.com/free-photo/white-offroader-jeep-parking_114579-4007.jpg?w=740&t=st=1690366510~exp=1690367110~hmac=c319457f343749d6ada41e08303f9878e5dbd8a7a9065e880521dce93fe93aac',
    'https://img.freepik.com/free-photo/black-sport-car-highway-drive-sunset_114579-5064.jpg?w=740&t=st=1690366540~exp=1690367140~hmac=3fdb42a5dcecff8af9a986677b6145698d818128037648e11b57ce5f495eea6f',
    'https://img.freepik.com/free-photo/blue-sport-sedan-parked-yard_114579-5078.jpg?w=740&t=st=1690366458~exp=1690367058~hmac=6bb66f317c3048bf10b946728971b83c1ebd719a3835d430290b62fe99c55f58',
    'https://img.freepik.com/free-photo/grey-metallic-jeep-with-blue-stripe-it_114579-4080.jpg?w=740&t=st=1690366481~exp=1690367081~hmac=25db38645981f4e16bdc18d360e1da99c1bc11053ce34444915f6fee7452f1d3',
    'https://img.freepik.com/free-photo/black-cabriolet-parked-port_114579-5232.jpg?w=740&t=st=1690366493~exp=1690367093~hmac=e60800627925a51353e8ac0d736ab2db1d02370d948866e2f0086a0541898f44',
    'https://img.freepik.com/free-photo/white-offroader-jeep-parking_114579-4007.jpg?w=740&t=st=1690366510~exp=1690367110~hmac=c319457f343749d6ada41e08303f9878e5dbd8a7a9065e880521dce93fe93aac',
    'https://img.freepik.com/free-photo/black-sport-car-highway-drive-sunset_114579-5064.jpg?w=740&t=st=1690366540~exp=1690367140~hmac=3fdb42a5dcecff8af9a986677b6145698d818128037648e11b57ce5f495eea6f',
    'https://img.freepik.com/free-photo/blue-sport-sedan-parked-yard_114579-5078.jpg?w=740&t=st=1690366458~exp=1690367058~hmac=6bb66f317c3048bf10b946728971b83c1ebd719a3835d430290b62fe99c55f58',
    'https://img.freepik.com/free-photo/grey-metallic-jeep-with-blue-stripe-it_114579-4080.jpg?w=740&t=st=1690366481~exp=1690367081~hmac=25db38645981f4e16bdc18d360e1da99c1bc11053ce34444915f6fee7452f1d3',
    'https://img.freepik.com/free-photo/black-cabriolet-parked-port_114579-5232.jpg?w=740&t=st=1690366493~exp=1690367093~hmac=e60800627925a51353e8ac0d736ab2db1d02370d948866e2f0086a0541898f44'
  ];
  static List<String> nissan = [
    'https://th.bing.com/th/id/R.438ef83234dfec81a2fe412f6f1ade28?rik=%2btXrusCUmuApIQ&pid=ImgRaw&r=0',
    'https://www.motortrend.com/uploads/sites/10/2019/06/2019-nissan-versa-note-sv-5door-hatchback-angular-front.png',
    'https://th.bing.com/th/id/OIP.91PtGdHLQlyJmEfMHjXuAAHaFj?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/OIP.hru1774gxx-dTZhPIhiC9wHaEI?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/R.b604ab6218d6c17904086c45d2fe3bcb?rik=RgySdYD20yhEyQ&riu=http%3a%2f%2findigorentacar.com%2frentacarappQA%2fuploads%2fnissan+sunny.png&ehk=4b%2bU%2bYsRQArNaYNUwFYs4M44jskLNco1S7ps41N%2bQDc%3d&risl=&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/OIP.6mcpVSLSAr0xo9IjCccNggHaEK?pid=ImgDet&rs=1',
    'https://cars.usnews.com/static/images/Auto/izmo/Colors/nissan_15sentrasr7a_amethystgray.jpg',
  ];



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<String> nissanBrands = [
          AppLocalizations.of(context)!
              .translate("tima")
              .toString(),
          AppLocalizations.of(context)!
              .translate("virsa")
              .toString(),
          AppLocalizations.of(context)!
              .translate("rouge")
              .toString(),
          AppLocalizations.of(context)!
              .translate("navara")
              .toString(),
          AppLocalizations.of(context)!
              .translate("sunny")
              .toString(),
          AppLocalizations.of(context)!
              .translate("jouke")
              .toString(),

          AppLocalizations.of(context)!
              .translate("sintra")
              .toString(),
        ];

        List<String> toyotaBrands = [
          AppLocalizations.of(context)!
              .translate("landcruz")
              .toString(),
          AppLocalizations.of(context)!
              .translate("camri")
              .toString(),
          AppLocalizations.of(context)!
              .translate("brado")
              .toString(),
          AppLocalizations.of(context)!
              .translate("crolla")
              .toString(),
        ];
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: ColorManager.lightColor),
            backgroundColor: ColorManager.primaryColor,
            title: Text(
              ' $brandName',
              style: GoogleFonts.cairo(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
                color: ColorManager.white,
              ),
              textAlign: TextAlign.center,
            ),
            elevation: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                brandName ==
                    AppLocalizations.of(context)!
                        .translate("nissan")
                        .toString() ||
                    brandName ==
                        AppLocalizations.of(context)!
                            .translate("toyota")
                            .toString()
                    ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10),
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1 / 1.4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 15,
                      children: List.generate(
                          brandName ==
                              AppLocalizations.of(context)!
                                  .translate("nissan")
                                  .toString()
                              ? nissanBrands
                              .length
                              : toyotaBrands
                              .length,
                              (index) =>
                              GestureDetector(
                                onTap: () {
                                  brandName ==
                                      AppLocalizations.of(context)!
                                          .translate("nissan")
                                          .toString()
                                      ? Navigator.push(context,
                                      MaterialPageRoute(builder: (_) {
                                        return CarModel(
                                          brandName: brandName,
                                          brandModel:
                                          nissanBrands[index],
                                        );
                                      }))
                                      : Navigator.push(context,
                                                MaterialPageRoute(builder: (_) {
                                                return CarModel(
                                                  brandName: brandName,
                                                  brandModel:
                                                      toyotaBrands[index],
                                                );
                                              }));
                                      },
                                      child: Container(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        decoration: BoxDecoration(
                                            color: ColorManager.lightColor2,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Image(
                                              image: brandName ==
                                                  AppLocalizations.of(
                                                      context)!
                                                      .translate("nissan")
                                                      .toString()
                                                  ? NetworkImage(nissan[index])
                                                  : NetworkImage(
                                                  carNames[index]),
                                              height: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height *
                                                  .15,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height *
                                                  .25,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(
                                              height: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .height *
                                                  .02,
                                            ),
                                            brandName ==
                                                AppLocalizations.of(
                                                    context)!
                                                    .translate("nissan")
                                                    .toString()
                                                ? Text(
                                              nissanBrands[index],
                                              style: GoogleFonts.cairo(
                                                fontSize: 15.0,
                                                fontWeight:
                                                FontWeight.w600,
                                                color: ColorManager.black,
                                              ),
                                              textAlign: TextAlign.center,
                                                  )
                                                : Text(
                                                    toyotaBrands[index],
                                                    style: GoogleFonts.cairo(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: ColorManager.black,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                          ],
                                        ),
                                      ),
                                    )),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        );
      },
    );
  }
}
