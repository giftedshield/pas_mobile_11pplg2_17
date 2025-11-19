import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_17/routes/pages.dart';
import 'package:pas_mobile_11pplg2_17/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

  bottomNavigationBarTheme: const BottomNavigationBarThemeData( //warna
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
  ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 150, 127, 190),
        ),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splashScreenPage, // TOD: ke splash screen
      getPages: AppPages.pages,
    );
  }
}
