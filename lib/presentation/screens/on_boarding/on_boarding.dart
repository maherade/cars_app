import 'package:cars_app/business_logic/localization_cubit/app_localization.dart';
import 'package:cars_app/data/modles/onbaording_model.dart';
import 'package:cars_app/presentation/screens/login_screen/login_screen.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:cars_app/utiles/local/cash_helper.dart';
import 'package:cars_app/widgets/defualtButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  static var pageController = PageController();

  static List<OnBoardingModel> onBoardingData = [
    OnBoardingModel(
        title: 'تطبيق يكسبك فلوس وانت علي دربك',
        describtion: ' طريقة سهلة في استقبال الطلبات طلبات توصلك وين ما كنت تواصل مع العميل مباشرةً',
        image: 'assets/images/car2.svg'),
    OnBoardingModel(
        title: 'مميزات التطبيق لأصحاب المشاريع المنزلية',
        describtion: 'تتبع طلبك بكل سهولة نضمن لك سلامة منتجاتك مندوبك متوفر علي مدار الساعة الإستلام من باب بيتك',
        image: 'assets/images/car1.svg'),
    OnBoardingModel(
        title: '#حط_طلبك_يوصل_لك',
        describtion: ' سجل كمندوب واكسب فلوس في وقت فراغك و عيش حياتك',
        image: 'assets/images/car2.svg'),
  ];

  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                  itemBuilder: (context,index){
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).height*.03),
                      child: Column(
                        children: [

                          SizedBox(height: MediaQuery.of(context).size.height*.12,),

                          Align(
                            alignment: Alignment.topCenter,
                            child: SvgPicture.asset(
                              color: ColorManager.textColor,
                              onBoardingData[index].image!,
                              height: MediaQuery.of(context).size.height*.2,
                              width: MediaQuery.of(context).size.height*.3,
                              ),

                          ),

                          SizedBox(height: MediaQuery.sizeOf(context).height*.1,),

                          Text(
                            onBoardingData[index].title!,
                            style: GoogleFonts.cairo(
                              fontSize: 21.0,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.darkGrey,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: MediaQuery.sizeOf(context).height*.04,),

                          Text(
                            onBoardingData[index].describtion!,
                            style: GoogleFonts.cairo(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                              color: ColorManager.darkGrey,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: MediaQuery.sizeOf(context).height*.045,),

                          SmoothPageIndicator(
                            controller: pageController,  // PageController
                            count:  3,
                            effect: const ExpandingDotsEffect(
                                dotColor: Colors.grey,
                                dotHeight: 8,
                                activeDotColor: ColorManager.textColor
                            ),   // your preferred effect

                          ),

                          const Spacer(),

                          DefaultButton(
                            buttonText: AppLocalizations.of(context)!.translate('getStarted').toString(),
                          onPressed: () {

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const LoginScreen()));

                          },
                          color: ColorManager.textColor,
                          color2: ColorManager.red,
                        ),

                          SizedBox(height: MediaQuery.sizeOf(context).height*.07,),
                        ],
                      ),
                    );
                  },
                  itemCount: 3,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
