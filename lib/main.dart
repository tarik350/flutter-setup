import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/config/routes/app_routes.dart';
import 'package:mobile_app/services/init_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppService();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('am', 'ET'), Locale('en', 'US')],
      path: 'assets/translations',
      saveLocale: true,
      startLocale: const Locale('am', 'ET'),
      fallbackLocale: const Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: UniqueKey(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: const [Locale('en', 'US'), Locale('am', 'ET')],
      locale: const Locale('am', 'ET'),
      theme: ThemeData(fontFamily: "Mulish"),
      home: ScreenUtilInit(
          designSize: const Size(360, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              routerConfig: _appRouter.config(),
              debugShowCheckedModeBanner: false,
            );
          }),
    );
  }
}
