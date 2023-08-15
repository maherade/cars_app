import 'package:cars_app/business_logic/app_cubit/app_cubit.dart';
import 'package:cars_app/business_logic/app_cubit/app_states.dart';
import 'package:cars_app/presentation/product_screen/product_screen.dart';
import 'package:cars_app/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CarModel extends StatelessWidget {
  const CarModel({super.key});

  static List<String> carNames=[
    'https://img.freepik.com/free-photo/white-offroader-jeep-parking_114579-4007.jpg?w=740&t=st=1690366510~exp=1690367110~hmac=c319457f343749d6ada41e08303f9878e5dbd8a7a9065e880521dce93fe93aac',
    'https://img.freepik.com/free-photo/black-sport-car-highway-drive-sunset_114579-5064.jpg?w=740&t=st=1690366540~exp=1690367140~hmac=3fdb42a5dcecff8af9a986677b6145698d818128037648e11b57ce5f495eea6f',
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
    return  BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.primaryColor,
            title: Text(
              'نيسان - فيرسا',
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

               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                   child: GridView.count(
                     crossAxisCount: 3,
                     childAspectRatio: 1/1.4,
                     crossAxisSpacing: 5,
                     mainAxisSpacing: 15,
                     children: List.generate(4, (index) => GestureDetector(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (_){
                           return  ProductScreen();
                         }));
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
                               image: NetworkImage('${carNames[index]}'),
                               height: MediaQuery.of(context).size.height*.15,
                               width: MediaQuery.of(context).size.height*.25,
                               fit: BoxFit.cover,
                             ),

                             SizedBox(height: MediaQuery.of(context).size.height*.02,),
                             Text(
                               '2015 - 2019',
                               style: GoogleFonts.cairo(
                                 fontSize: 15.0,
                                 fontWeight: FontWeight.w600,
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



              ],
            ),
          ),
        );
      },
    );
  }
}
