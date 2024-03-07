import 'dart:io';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visual_components/app/widgets/auto_size_text.dart';
import 'package:visual_components/app/widgets/batery_page.dart';
import 'package:visual_components/app/widgets/brasil_fields_page.dart';
import 'package:visual_components/app/widgets/connect_page.dart';
import 'package:visual_components/app/widgets/gps_page.dart';
import 'package:visual_components/app/widgets/perrcent_widget.dart';
import 'package:path_provider/path_provider.dart' as path;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                if (context.locale.toString() == 'pt_BR') {
                  context.setLocale(Locale('en', 'US'));
                } else {
                  context.setLocale(Locale('pt', 'BR'));
                }
              },
              child: FaIcon(
                FontAwesomeIcons.flag,
              ),
            ),
          ],
          title: Text('APP_TITLE.tr').tr(),
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(color: Colors.red),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return PercentWidget();
                    }));
                  },
                  title: const Text('Indicador de Porcentagens'),
                  trailing: const FaIcon(
                    FontAwesomeIcons.percent,
                    color: Colors.red,
                  ),
                ),
                ListTile(
                  onTap: () {
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return PercentWidget();
                    // }));
                  },
                  title: const Text('Pagina Dio'),
                  trailing: const FaIcon(
                    FontAwesomeIcons.globe,
                    color: Colors.red,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return AutoSizeTextWidget();
                    }));
                  },
                  title: const Text('Pagina de texto'),
                  trailing: const FaIcon(
                    FontAwesomeIcons.textHeight,
                    color: Colors.red,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return AutoSizeTextWidget();
                    }));
                  },
                  title: const Text('Splash Screen'),
                  trailing: const FaIcon(
                    FontAwesomeIcons.mobileScreen,
                    color: Colors.red,
                  ),
                ),
                ListTile(
                  onTap: () {
                    var f = NumberFormat('###.0#', 'en_US');
                    var fBR = NumberFormat('###.0#', 'pt_BR');
                    var date = DateTime(2024, 03, 05);
                    print(DateFormat('EEEEE', 'pt_BR').format(date));
                    print(f.format(12.245));
                    print(fBR.format(12.245));
                  },
                  title: const Text('Internacionalização'),
                  trailing: const FaIcon(
                    FontAwesomeIcons.globe,
                    color: Colors.red,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const BateryPage();
                    }));
                  },
                  title: const Text('Informações de Bateria'),
                  trailing: const FaIcon(
                    FontAwesomeIcons.batteryHalf,
                    color: Colors.red,
                  ),
                ),
                ListTile(
                  onTap: () async {
                    await launchUrl(Uri.parse('https://dio.me'));
                  },
                  title: const Text('Abrir Site'),
                  trailing: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                ),
                ListTile(
                  onTap: () async {
                    Share.share(
                        'Olha só esta plataforma que top: https://dio.me');
                  },
                  title: const Text('Share'),
                  trailing: const FaIcon(
                    FontAwesomeIcons.share,
                    color: Colors.red,
                  ),
                ),
                ListTile(
                  onTap: () async {
                    var directory = await path.getTemporaryDirectory();
                    print(directory.path);
                  },
                  title: const Text('Path provider'),
                  trailing: const FaIcon(
                    FontAwesomeIcons.paste,
                    color: Colors.red,
                  ),
                ),
                ListTile(
                  onTap: () async {
                    PackageInfo packageInfo = await PackageInfo.fromPlatform();

                    String appName = packageInfo.appName;
                    String packageName = packageInfo.packageName;
                    String version = packageInfo.version;
                    String buildNumber = packageInfo.buildNumber;
                    print('''
  Nome do App: $appName
  Nome do pacote: $packageName,
  Versão do App: $version,
  Numero de Build: $buildNumber,
''');
                  },
                  title: const Text('Info Aplicativo'),
                  trailing: const FaIcon(
                    FontAwesomeIcons.circleInfo,
                    color: Colors.red,
                  ),
                ),
                ListTile(
                  onTap: () async {
                    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                    if (Platform.isAndroid) {
                      AndroidDeviceInfo androidInfo =
                          await deviceInfo.androidInfo;
                      print('Running on ${androidInfo.model}');
                    }
                  },
                  title: const Text('Device info'),
                  trailing: const FaIcon(
                    FontAwesomeIcons.info,
                    color: Colors.red,
                  ),
                ),
                ListTile(
                  onTap: () async {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const ConnectPage();
                    }));
                  },
                  title: const Text('Info Internet'),
                  trailing: const FaIcon(
                    FontAwesomeIcons.wifi,
                    color: Colors.red,
                  ),
                ),
                ListTile(
                  onTap: () async {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const GpsPage();
                    }));
                  },
                  title: const Text('Info Localização'),
                  trailing: const FaIcon(
                    FontAwesomeIcons.locationArrow,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: PageView(
          controller: pageController,
          children: [
            const BrasilFieldsPage(),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.purple,
            ),
          ],
        ),
        bottomNavigationBar: ConvexAppBar.badge(
          {
            0: '99+',
          },
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.add, title: 'Add'),
          ],
          onTap: (index) {
            pageController.jumpToPage(index);
          },
        ));
  }
}
