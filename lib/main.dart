import 'package:architecture_patterns/patterns_type/bloc/bloc/home_page/list/cubit.dart';
import 'package:architecture_patterns/patterns_type/bloc/pages/home_bloc.dart';
import 'package:architecture_patterns/patterns_type/getx/pages/mainx.dart';
import 'package:architecture_patterns/patterns_type/getx/pages/next.dart';
import 'package:architecture_patterns/patterns_type/getx/services/dependancy_injection.dart';
import 'package:architecture_patterns/patterns_type/introduction/home_page.dart';
import 'package:architecture_patterns/patterns_type/provider/pages/Create_page.dart';
import 'package:architecture_patterns/patterns_type/provider/pages/pro_home.dart';
import 'package:architecture_patterns/patterns_type/setState_pattern/pages/create.dart';
import 'package:architecture_patterns/patterns_type/setState_pattern/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async{
  await DIService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    //return MaterialApp(
    return GetMaterialApp(
     // home:  Homes(),
      //home:  HomeBloc(),
      //home:  MainX(),
      //home:  HomeX(),
      //home:  HomePage(),
      // routes: {
      //   SetStateCreatePage.id:(context)=> SetStateCreatePage(),
      //   ProviderCreatePage.id:(context)=> ProviderCreatePage(),
      //   GetXPage.id:(context)=> GetXPage(),
      // },
      // home: BlocProvider(
      //   create: (BuildContext context) => ListPostCubit(),
      //   child: HomePage(),
      // ),

      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => ListPostCubit()),
        BlocProvider(create: (context) => ListPostCubit()),
      ], child: HomeBloc()),
    );
      ///////////////////////////////////////////
      //GETX
      //initialBinding: ControllersBinding(),
      // getPages: [
      //   GetPage(
      //     name: MainPage.id,
      //     page: () => MainPage(),
      //     binding: ControllersBinding(),
      //   ),
      // ],

  }
}

