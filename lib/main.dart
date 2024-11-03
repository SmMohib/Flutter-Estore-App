import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/const/color.dart';
import 'package:practice/pages/auth/login.dart';
import 'package:practice/pages/search/search.dart';
import 'package:practice/pages/account/account.dart';
import 'package:practice/providers/global_state.dart';
import 'package:practice/widgets/bottomNev.dart';
import 'package:practice/widgets/cart_icon_with_badge.dart';
import 'package:practice/pages/favorites/favorites.dart';
import 'package:practice/pages/home.dart';
import 'package:practice/pages/cart/cart.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Store',
      theme: ThemeData(
      
        scaffoldBackgroundColor: secondaryColor,
        primaryColor: primaryColor, // Primary color
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: whiteColor, 
          background: primaryColor
        ),
      ),
      home: BottomNev(),
    );
  }
}