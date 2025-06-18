import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nawel/core/app_router/app_routes.dart';
import 'package:nawel/features/home/data/data_source/local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   await Hive.initFlutter();
  await StorageService.init(); 
  final prefs = await SharedPreferences.getInstance();
  final isFirstTime = prefs.getBool('isFirstTime') ?? true;
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
 

  runApp(MyApp(isFirstTime: isFirstTime,isLoggedIn: isLoggedIn,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isFirstTime,
    required this.isLoggedIn,
  });

   // This widget is the root of your application.
  final bool isFirstTime;
   final bool isLoggedIn;
  @override
  Widget build(BuildContext context) {
    final router = AppRoutes.createRouter(isFirstTime,isLoggedIn);
    return ScreenUtilInit(
      designSize: Size(375, 1160),
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
