import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/presentation/product_screen/product_screen.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CarModel extends StatelessWidget {
  final String brandName;
  final String brandModel;
  const CarModel({super.key,required this.brandName,required this.brandModel});

  static List<String> carNames=[
    'https://th.bing.com/th/id/OIP.yKfI3VjPfM00suoyrvVh1gHaFj?pid=ImgDet&w=474&h=355&rs=1',
    'https://th.bing.com/th/id/R.c98af2dee08626c298a3c85052d9d35e?rik=Rv%2bHUgeKFG5XdA&riu=http%3a%2f%2fimages.hgmsites.net%2fmed%2f2008-toyota-land-cruiser-4wd-4dr-gs-white_100053025_m.jpg&ehk=DjxS%2fXmNk19LNHPY5MRdCWwO5uRB970k2F5Xyc%2fVLyY%3d&risl=&pid=ImgRaw&r=0',
    'https://img.freepik.com/free-photo/blue-sport-sedan-parked-yard_114579-5078.jpg?w=740&t=st=1690366458~exp=1690367058~hmac=6bb66f317c3048bf10b946728971b83c1ebd719a3835d430290b62fe99c55f58',
    'https://img.freepik.com/free-photo/grey-metallic-jeep-with-blue-stripe-it_114579-4080.jpg?w=740&t=st=1690366481~exp=1690367081~hmac=25db38645981f4e16bdc18d360e1da99c1bc11053ce34444915f6fee7452f1d3',
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

  @override
  Widget build(BuildContext context) {
    var cubit=AppCubit.get(context);
    return  BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.primaryColor,
            title: Text(
              '${brandModel} - ${brandName}',
              style: GoogleFonts.cairo(
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
                color: ColorManager.white,
              ),
              textAlign: TextAlign.center,
            ),
            elevation: 0.0,
            titleSpacing: 0.0,
            iconTheme: IconThemeData(
              color: Colors.white
            ),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: Colors.transparent,
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
                color: Colors.white
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [


                brandName=='نيسان' && brandModel=='التيما'?
                Expanded(
                 child: Padding(
                   padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                   child: GridView.count(
                     crossAxisCount: 3,
                     childAspectRatio: 1/1.4,
                     crossAxisSpacing: 5,
                     mainAxisSpacing: 15,
                     children: List.generate(AppCubit.get(context).timaStart.length, (index) => GestureDetector(
                       onTap: (){
                         AppCubit.get(context).getProductFromApi(
                             factory: brandName,
                             productModel: brandModel,
                             fromDate: AppCubit.get(context).timaStart[index],
                             toDate: AppCubit.get(context).timaEnd[index]
                         ).then((value) {
                           Navigator.push(context, MaterialPageRoute(builder: (_){
                             return  ProductScreen();
                           }));
                         });

                       },
                       child: Container(
                         clipBehavior: Clip.antiAliasWithSaveLayer,
                         decoration: BoxDecoration(
                           color: ColorManager.lightColor2,
                           borderRadius: BorderRadius.circular(10)
                         ),
                         child: Column(
                           children: [

                             Image(
                               image: NetworkImage(cubit.timaCars[index]),
                               height: MediaQuery.of(context).size.height*.15,
                               width: MediaQuery.of(context).size.height*.25,
                               fit: BoxFit.cover,
                             ),

                             SizedBox(height: MediaQuery.of(context).size.height*.02,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   AppCubit.get(context).timaStart[index],
                                   style: GoogleFonts.cairo(
                                     fontSize: 15.0,
                                     fontWeight: FontWeight.w600,
                                     color: ColorManager.black,
                                   ),
                                   textAlign: TextAlign.center,
                                 ),
                                 Text(
                                   '  - ',
                                   style: GoogleFonts.cairo(
                                     fontSize: 15.0,
                                     fontWeight: FontWeight.w600,
                                     color: ColorManager.black,
                                   ),
                                   textAlign: TextAlign.center,
                                 ),
                                 Text(
                                   AppCubit.get(context).timaEnd[index],
                                   style: GoogleFonts.cairo(
                                     fontSize: 15.0,
                                     fontWeight: FontWeight.w600,
                                     color: ColorManager.black,
                                   ),
                                   textAlign: TextAlign.center,
                                 ),
                               ],
                             )
                           ],
                         ),
                       ),
                     )),
                   ),
                 ),
               ):
                brandName=='نيسان' && brandModel=='فيرسا'?
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1/1.4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 15,
                      children: List.generate(AppCubit.get(context).versaStart.length, (index) => GestureDetector(
                        onTap: (){
                          AppCubit.get(context).getProductFromApi(
                              factory: brandName,
                              productModel: brandModel,
                              fromDate: AppCubit.get(context).versaStart[index],
                              toDate: AppCubit.get(context).versaEnd[index]
                          ).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return  ProductScreen();
                            }));
                          });
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              color: ColorManager.lightColor2,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [

                              Image(
                                image: NetworkImage(cubit.versaCars[index]),
                                height: MediaQuery.of(context).size.height*.15,
                                width: MediaQuery.of(context).size.height*.25,
                                fit: BoxFit.cover,
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height*.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppCubit.get(context).versaStart[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '  - ',
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    AppCubit.get(context).versaEnd[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                ):
                brandName=='نيسان' && brandModel=='روج'?
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1/1.4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 15,
                      children: List.generate(AppCubit.get(context).rogStart.length, (index) => GestureDetector(
                        onTap: (){
                          AppCubit.get(context).getProductFromApi(
                              factory: brandName,
                              productModel: brandModel,
                              fromDate: AppCubit.get(context).rogStart[index],
                              toDate: AppCubit.get(context).rogEnd[index]
                          ).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return  ProductScreen();
                            }));
                          });
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              color: ColorManager.lightColor2,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [

                              Image(
                                image: NetworkImage(cubit.rougeCars[index]),
                                height: MediaQuery.of(context).size.height*.15,
                                width: MediaQuery.of(context).size.height*.25,
                                fit: BoxFit.cover,
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height*.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppCubit.get(context).rogStart[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '  - ',
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    AppCubit.get(context).rogEnd[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                ):
                brandName=='نيسان' && brandModel=='نافارا'?
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1/1.4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 15,
                      children: List.generate(AppCubit.get(context).navaraStart.length, (index) => GestureDetector(
                        onTap: (){
                          AppCubit.get(context).getProductFromApi(
                              factory: brandName,
                              productModel: brandModel,
                              fromDate: AppCubit.get(context).navaraStart[index],
                              toDate: AppCubit.get(context).navaraEnd[index]
                          ).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return  ProductScreen();
                            }));
                          });
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              color: ColorManager.lightColor2,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [

                              Image(
                                image: NetworkImage(cubit.nafaraCars[index]),
                                height: MediaQuery.of(context).size.height*.15,
                                width: MediaQuery.of(context).size.height*.25,
                                fit: BoxFit.cover,
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height*.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppCubit.get(context).navaraStart[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '  - ',
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    AppCubit.get(context).navaraEnd[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                ):
                brandName=='نيسان' && brandModel=='سني هندي'?
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1/1.4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 15,
                      children: List.generate(AppCubit.get(context).sanyStart.length, (index) => GestureDetector(
                        onTap: (){
                          AppCubit.get(context).getProductFromApi(
                              factory: brandName,
                              productModel: brandModel,
                              fromDate: AppCubit.get(context).sanyStart[index],
                              toDate: AppCubit.get(context).sanyEnd[index]
                          ).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return  ProductScreen();
                            }));
                          });
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              color: ColorManager.lightColor2,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [

                              Image(
                                image: NetworkImage(cubit.sunnyCars[index]),
                                height: MediaQuery.of(context).size.height*.15,
                                width: MediaQuery.of(context).size.height*.25,
                                fit: BoxFit.cover,
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height*.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppCubit.get(context).sanyStart[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '  - ',
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    AppCubit.get(context).sanyEnd[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                ):
                brandName=='نيسان' && brandModel=='جوك'?
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1/1.4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 15,
                      children: List.generate(AppCubit.get(context).gocStart.length, (index) => GestureDetector(
                        onTap: (){
                          AppCubit.get(context).getProductFromApi(
                              factory: brandName,
                              productModel: brandModel,
                              fromDate: AppCubit.get(context).gocStart[index],
                              toDate: AppCubit.get(context).gocEnd[index]
                          ).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return  ProductScreen();
                            }));
                          });
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              color: ColorManager.lightColor2,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [

                              Image(
                                image: NetworkImage(cubit.jokCars[index]),
                                height: MediaQuery.of(context).size.height*.15,
                                width: MediaQuery.of(context).size.height*.25,
                                fit: BoxFit.cover,
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height*.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppCubit.get(context).gocStart[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '  - ',
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    AppCubit.get(context).gocEnd[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                ):
                brandName=='نيسان' && brandModel=='سينترا'?
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1/1.4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 15,
                      children: List.generate(AppCubit.get(context).santraStart.length, (index) => GestureDetector(
                        onTap: (){
                          AppCubit.get(context).getProductFromApi(
                              factory: brandName,
                              productModel: brandModel,
                              fromDate: AppCubit.get(context).santraStart[index],
                              toDate: AppCubit.get(context).santraEnd[index]
                          ).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return  ProductScreen();
                            }));
                          });
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              color: ColorManager.lightColor2,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [

                              Image(
                                image: NetworkImage(cubit.cintraCars[index]),
                                height: MediaQuery.of(context).size.height*.15,
                                width: MediaQuery.of(context).size.height*.25,
                                fit: BoxFit.cover,
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height*.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppCubit.get(context).santraStart[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '  - ',
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    AppCubit.get(context).santraEnd[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                ):
                brandName=='تويوتا' && brandModel=='لاندكروز'?
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1/1.4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 15,
                      children: List.generate(AppCubit.get(context).landStart.length, (index) => GestureDetector(
                        onTap: (){
                          AppCubit.get(context).getProductFromApi(
                              factory: brandName,
                              productModel: brandModel,
                              fromDate: AppCubit.get(context).landStart[index],
                              toDate: AppCubit.get(context).landEnd[index],
                          ).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return  ProductScreen();
                            }));
                          });
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              color: ColorManager.lightColor2,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [

                              Image(
                                image: NetworkImage(cubit.landCars[index]),
                                height: MediaQuery.of(context).size.height*.15,
                                width: MediaQuery.of(context).size.height*.25,
                                fit: BoxFit.cover,
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height*.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppCubit.get(context).landStart[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '  - ',
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    AppCubit.get(context).landEnd[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                ):
                brandName=='تويوتا' && brandModel=='كامري'?
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1/1.4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 15,
                      children: List.generate(AppCubit.get(context).kamaryStart.length, (index) => GestureDetector(
                        onTap: (){
                          AppCubit.get(context).getProductFromApi(
                              factory: brandName,
                              productModel: brandModel,
                              fromDate: AppCubit.get(context).kamaryStart[index],
                              toDate: AppCubit.get(context).kamaryEnd[index]
                          ).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return  ProductScreen();
                            }));
                          });
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              color: ColorManager.lightColor2,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [

                              Image(
                                image: NetworkImage(cubit.camryCars[index]),
                                height: MediaQuery.of(context).size.height*.15,
                                width: MediaQuery.of(context).size.height*.25,
                                fit: BoxFit.cover,
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height*.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppCubit.get(context).kamaryStart[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '  - ',
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    AppCubit.get(context).kamaryEnd[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                ):
                brandName=='تويوتا' && brandModel=='برادو'?
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1/1.4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 15,
                      children: List.generate(AppCubit.get(context).bradoEnd.length, (index) => GestureDetector(
                        onTap: (){
                          AppCubit.get(context).getProductFromApi(
                              factory: brandName,
                              productModel: brandModel,
                              fromDate: AppCubit.get(context).bradoStart[index],
                              toDate: AppCubit.get(context).bradoEnd[index]
                          ).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return  ProductScreen();
                            }));
                          });
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              color: ColorManager.lightColor2,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [

                              Image(
                                image: NetworkImage(cubit.bradoCars[index]),
                                height: MediaQuery.of(context).size.height*.15,
                                width: MediaQuery.of(context).size.height*.25,
                                fit: BoxFit.cover,
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height*.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppCubit.get(context).bradoStart[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '  - ',
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    AppCubit.get(context).bradoEnd[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                ):
                brandName=='تويوتا' && brandModel=='كورلا'?
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1/1.4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 15,
                      children: List.generate(AppCubit.get(context).koraStart.length, (index) => GestureDetector(
                        onTap: (){
                          AppCubit.get(context).getProductFromApi(
                              factory: brandName,
                              productModel: brandModel,
                              fromDate: AppCubit.get(context).koraStart[index],
                              toDate: AppCubit.get(context).koraEnd[index]
                          ).then((value) {
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              return  ProductScreen();
                            }));
                          });
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              color: ColorManager.lightColor2,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [

                              Image(
                                image: NetworkImage(cubit.crollaCars[index]),
                                height: MediaQuery.of(context).size.height*.15,
                                width: MediaQuery.of(context).size.height*.25,
                                fit: BoxFit.cover,
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height*.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppCubit.get(context).koraStart[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '  - ',
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    AppCubit.get(context).koraEnd[index],
                                    style: GoogleFonts.cairo(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorManager.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                ):
                Container()


              ],
            ),
          ),
        );
      },
    );
  }
}
