import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BateryPage extends StatefulWidget {
  const BateryPage({super.key});

  @override
  State<BateryPage> createState() => _BateryPageState();
}

class _BateryPageState extends State<BateryPage> {
  var batery = Battery();
  var statusNatery = 0;

  @override
  void initState() {
    super.initState();
    getStatusBatery();
    batery.onBatteryStateChanged.listen((event) {
      print(event);
    });
  }

  void getStatusBatery() async {
    statusNatery = (await batery.batteryLevel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Status da bateria: $statusNatery%'.toString()),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: LinearPercentIndicator(
            width: 170.0,
            animation: true,
            animationDuration: 1000,
            lineHeight: 20.0,
            percent: statusNatery / 100,
            center: Text('$statusNatery%'),
            linearStrokeCap: LinearStrokeCap.butt,
            progressColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
