import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrasilFieldsPage extends StatefulWidget {
  const BrasilFieldsPage({super.key});

  @override
  State<BrasilFieldsPage> createState() => _BrasilFieldsPageState();
}

class _BrasilFieldsPageState extends State<BrasilFieldsPage> {
  final cepController = TextEditingController();
  final cpfController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            TextFormField(
              controller: cepController,
              decoration: const InputDecoration(label: Text('CEP')),
              keyboardType: TextInputType.number,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
            ),
            TextFormField(
              controller: cpfController,
              decoration: const InputDecoration(label: Text('CPF')),
              keyboardType: TextInputType.number,
              inputFormatters: [
                // obrigatório
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  print(CPFValidator.isValid(cpfController.text));
                },
                child: Text('Continuar'))
          ],
        ));
  }
}
