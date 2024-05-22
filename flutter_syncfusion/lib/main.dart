import 'package:flutter/material.dart';
import 'package:flutter_syncfusion/app/data/routes/pages.dart';
import 'package:flutter_syncfusion/app/data/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage();
  runApp(GetMaterialApp(
    initialRoute: Routes.HOME,
    debugShowCheckedModeBanner: false,
    getPages: Pages.pages,
  ));
}
