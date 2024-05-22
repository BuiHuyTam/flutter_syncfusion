import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_syncfusion/app/data/model/weather_data.dart';
import 'package:flutter_syncfusion/app/data/provider/api_provider.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TrackballBehavior trackballBehavior;
  final RxBool _loading = true.obs;
  final RxDouble latitude = 0.0.obs;
  final RxDouble longtitude = 0.0.obs;
  final RxInt currentIndex = 0.obs;
  late TabController tabController;
  RxBool loading() => _loading;
  RxDouble getLattitude() => latitude;
  RxDouble getLongtitude() => longtitude;
  final weatherData = WeatherData().obs;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: "Daily"),
    const Tab(
      text: "Monthly",
    )
  ];

  WeatherData getWeatherData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (_loading.isTrue) {
      determineLocation();
    }
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  determineLocation() async {
    final bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled!");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission is denied!");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permission are permanently denied, we cannot request permissions");
    }
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.medium)
        .then((value) {
      latitude.value = value.latitude;
      longtitude.value = value.longitude;
      return FetchWeather()
          .getData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _loading.value = false;
      });
    });
  }
}
