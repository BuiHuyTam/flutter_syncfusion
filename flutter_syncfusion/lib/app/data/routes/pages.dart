import 'package:flutter_syncfusion/app/data/modules/home/binding.dart';
import 'package:flutter_syncfusion/app/data/modules/home/home_page.dart';
import 'package:get/get.dart';
import './routes.dart';

abstract class Pages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
  ];
}
