import 'package:flutter/material.dart';
import 'package:motocheck/home.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    title: 'MotoCheck',
    debugShowCheckedModeBanner: false,
    // ignore: prefer_const_constructors
    home: HomePage(),
  ));
}
