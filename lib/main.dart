import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_api/random/provider/random_provider.dart';
import 'package:random_api/random/view/home_screen.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RandomProvider(),
        )
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        routes: {'/': (context) => HomeScreen()},
      ),
    ),
  ));
}
