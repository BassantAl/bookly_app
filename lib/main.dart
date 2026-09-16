import 'package:clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch/constants.dart';
import 'package:clean_arch/core/utils/app_router.dart';
import 'package:clean_arch/hive_registrar.g.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_ce_flutter/adapters.dart';

void main()async {
  runApp(const Bookly());
  Hive.initFlutter();
  Hive.registerAdapters(BookEntityAdapter());
  await Hive.openBox(kFeatureBox);
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}
