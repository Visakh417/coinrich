import 'package:coinrich/providers/coin_provider.dart';
import 'package:coinrich/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CoinProvider>(create: (_) => CoinProvider()),
      ],
      child: MaterialApp(
        title: 'CoinRich',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // primarySwatch: const Color(0xff000000),\
            appBarTheme:
                const AppBarTheme(backgroundColor: AppColors.primaryColor),
            primaryColor: AppColors.primaryColor,
            textTheme: TextTheme(
              headlineLarge: GoogleFonts.roboto(
                  fontSize: 24,
                  color: AppColors.text,
                  fontWeight: FontWeight.w500),
              headlineMedium: GoogleFonts.roboto(
                  fontSize: 18,
                  color: AppColors.accentColor,
                  fontWeight: FontWeight.w600),
              bodyMedium: GoogleFonts.roboto(
                  fontSize: 16,
                  color: AppColors.text,
                  fontWeight: FontWeight.w400),
              bodySmall: GoogleFonts.roboto(
                  fontSize: 14,
                  color: AppColors.subText,
                  fontWeight: FontWeight.w400),
            )),
        home: const HomeScreen(),
      ),
    );
  }
}
