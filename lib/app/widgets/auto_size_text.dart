import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizeTextWidget extends StatefulWidget {
  const AutoSizeTextWidget({super.key});

  @override
  State<AutoSizeTextWidget> createState() => _AutoSizeTextWidgetState();
}

class _AutoSizeTextWidgetState extends State<AutoSizeTextWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AutoSize Text'),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {});
              },
              controller: controller,
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: AutoSizeText(maxLines: 5, controller.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
