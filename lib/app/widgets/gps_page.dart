import 'package:flutter/material.dart';

class GpsPage extends StatefulWidget {
  const GpsPage({super.key});

  @override
  State<GpsPage> createState() => _GpsPageState();
}

class _GpsPageState extends State<GpsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Localização'),
        ),
        body: Container(
            child:
                TextButton(onPressed: () {}, child: Text('Obter localização'))),
      ),
    );
  }
}
