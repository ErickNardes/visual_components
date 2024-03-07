import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({super.key});

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  late StreamSubscription result;
  @override
  initState() {
    super.initState();

    result = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print(result);
    });
  }

  @override
  void dispose() {
    result.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Connect Internet'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final connectivityResult =
                      await (Connectivity().checkConnectivity());

                  print(connectivityResult);
                },
                child: Text('Checar Conexão'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
