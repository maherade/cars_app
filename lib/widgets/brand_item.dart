import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../business_logic/app_cubit/app_cubit.dart';
import '../business_logic/localization_cubit/app_localization.dart';
import '../presentation/screens/car_name/car_name.dart';
import '../styles/color_manager.dart';

class BrandItem extends StatelessWidget {
  int index;

  BrandItem({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    List<String> brandNames = [
      'تويوتا',
      'نيسان',
      'فولكس واجن',
      'ميتسوبيشي',
      'فورد',
      'شنجان',
      'BMW',
      'مرسيدس',
      'أودي',
      'شيري',
      'هفال',
      'شيفروليه',
      'سوزوكي',
      'مازدا',
    ];


    List<String> brandNamesString = [
      AppLocalizations.of(context)!.translate('toyota').toString(),
      AppLocalizations.of(context)!.translate('nissan').toString(),
      AppLocalizations.of(context)!.translate('wolex').toString(),
      AppLocalizations.of(context)!.translate('mitsubeshi').toString(),
      AppLocalizations.of(context)!.translate('ford').toString(),
      AppLocalizations.of(context)!.translate('shangan').toString(),
      'BMW',
      AppLocalizations.of(context)!.translate('mercides').toString(),
      AppLocalizations.of(context)!.translate('audi').toString(),
      AppLocalizations.of(context)!.translate('cheri').toString(),
      AppLocalizations.of(context)!.translate('haval').toString(),
      AppLocalizations.of(context)!.translate('chevrolet').toString(),
      AppLocalizations.of(context)!.translate('suzuki').toString(),
      AppLocalizations.of(context)!.translate('mazda').toString(),
    ];




    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return CarName(
            brandName: brandNames[index],
            brandNameString: brandNamesString[index],
          );
        }));
      },
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .1,
            width: MediaQuery.of(context).size.width * .2,
            decoration: BoxDecoration(
                border: Border.all(color: ColorManager.primaryColor),
                borderRadius: BorderRadius.circular(50)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: CachedNetworkImage(
              imageUrl: AppCubit.get(context).brandImages[index],
              fit: BoxFit.contain,
            )
          ),
          Text(
            brandNamesString[index],
            style: GoogleFonts.cairo(
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
              color: ColorManager.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
