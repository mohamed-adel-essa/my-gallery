import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'core/constants/app_routes.dart';
import 'core/constants/app_theme.dart';
import 'core/helpers/erro_builder.dart';
import 'core/serrvices/api_service.dart';
import 'core/serrvices/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() => StorageService.init(), permanent: true);
  Get.put(ApiService(), permanent: true);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        builder: (BuildContext context, Widget? child) {
          setErroBuilder();
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!);
        },
        debugShowCheckedModeBanner: false,
        title: 'My Gallery',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: appTheme,
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.routes,
      );
    });
  }
}
