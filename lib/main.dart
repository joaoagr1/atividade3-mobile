import 'package:flutter/material.dart';

void main() {
  runApp(BankApp());
}

class BankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BankHomePage(),
    );
  }
}

class BankHomePage extends StatefulWidget {
  @override
  _BankHomePageState createState() => _BankHomePageState();
}

class _BankHomePageState extends State<BankHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _operationController = TextEditingController();

  List<String> _operations = [];

  void _addOperation() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _operations.add(_operationController.text);
        _operationController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicação Bancária'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Formulário simples
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _operationController,
                    decoration: InputDecoration(labelText: 'Nova operação bancária'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira uma operação';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _addOperation,
                    child: Text('Adicionar Operação'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // ListView dinâmico
            Expanded(
              child: ListView.builder(
                itemCount: _operations.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_operations[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
