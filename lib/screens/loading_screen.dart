import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override void initState() {
    super.initState();
    getlocation();
  }
  
  
  void getlocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Проверяем, включены ли службы геолокации
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Если службы геолокации выключены, можете вывести диалоговое окно с запросом включения
      // или перенаправить пользователя в настройки устройства.
      return;
    }

    // Запрашиваем разрешение на использование местоположения
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Если пользователь отказал в предоставлении разрешения, вы можете предпринять соответствующие действия
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Пользователь навсегда отклонил разрешение, вы можете предпринять соответствующие действия
      return;
    }

    // Теперь, когда у нас есть разрешение, мы можем получить местоположение
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
