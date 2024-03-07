import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:visual_components/app/my_app.dart';
import 'package:visual_components/app/widgets/splash_screen_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      child: MyAppPage(),
      supportedLocales: [const Locale('en', 'US'), const Locale('pt', 'BR')],
      path: 'assets/translations'));
}
