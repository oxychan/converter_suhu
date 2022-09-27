import 'package:flutter/material.dart';
import 'package:converter_suhu/convert.dart';
import 'package:converter_suhu/input_field.dart';
import 'package:converter_suhu/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  final inputController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  void _convert() {
    setState(() {
      if (_globalKey.currentState!.validate()) {
        _inputUser = double.parse(inputController.text);
        _reamur = _inputUser * (4 / 5);
        _kelvin = _inputUser + 273;
      }
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Konveter Suhu'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          child: Form(
            key: _globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InputField(
                  inputController: inputController,
                ),
                Result(
                  kelvin: _kelvin,
                  reamur: _reamur,
                ),
                Convert(
                  convertHandler: _convert,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}