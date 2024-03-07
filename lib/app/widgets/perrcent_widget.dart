import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentWidget extends StatefulWidget {
  const PercentWidget({super.key});

  @override
  State<PercentWidget> createState() => _PercentWidgetState();
}

class _PercentWidgetState extends State<PercentWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 13.0,
            animation: true,
            percent: 0.7,
            center: const Text(
              "70.0%",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: const Text(
              "Sales this week",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.purple,
          ),
          const Divider(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: LinearPercentIndicator(
              width: 170.0,
              animation: true,
              animationDuration: 1000,
              lineHeight: 20.0,
              leading: const Text("left content"),
              trailing: const Text("right content"),
              percent: 0.2,
              center: const Text("20.0%"),
              linearStrokeCap: LinearStrokeCap.butt,
              progressColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
