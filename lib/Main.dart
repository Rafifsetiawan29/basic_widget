import 'package:basic_widget/Splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:basic_widget/todo/services/theme_services.dart';
import 'package:basic_widget/todo/ui/theme.dart';

import 'todo/db/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Builder(
        builder: (context) {
          return GetMaterialApp(
            theme: Themes.light,
            darkTheme: Themes.dark,
            themeMode: ThemeServices().theme,
            home: const SplashScreenPage(),
          );
        },
      ),
    );
  }
}
