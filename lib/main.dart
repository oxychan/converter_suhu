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
  double _result = 0;
  List<Widget> resultList = [];
  var temperatureUnits = ["Kelvin", "Reamur", "Fahrenheit"];
  String selected = 'Kelvin';

  final inputController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  void _convert() {
    setState(() {
      if (_globalKey.currentState!.validate()) {
        _inputUser = double.parse(inputController.text);

        switch (selected) {
          case "Kelvin":
            {
              _result = _inputUser + 273;
              resultList.add(
                ListTile(
                  leading: const CircleAvatar(
                    child: Text("K"),
                  ),
                  title: Text('$_inputUser celcius => $_result Kelvin'),
                ),
              );
            }
            break;

          case "Reamur":
            {
              _result = 4 / 5 * _inputUser;
              resultList.add(
                ListTile(
                  leading: const CircleAvatar(
                    child: Text("R"),
                  ),
                  title: Text('$_inputUser Celcius => $_result Reamur'),
                ),
              );
            }
            break;

          case "Fahrenheit":
            {
              _result = (9 / 5 * _inputUser) + 32;
              resultList.add(
                ListTile(
                  leading: const CircleAvatar(
                    child: Text("R"),
                  ),
                  title: Text('$_inputUser Celcius => $_result Fahrenheit'),
                ),
              );
            }
            break;
        }
      }
    });
  }

  _dropDownChanged(value) {
    setState(() {
      selected = value.toString();
      _convert();
    });
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
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InputField(
                        inputController: inputController,
                      ),
                      DropdownButton<String>(
                        items: temperatureUnits.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: selected,
                        onChanged: _dropDownChanged,
                      ),
                      Result(
                        result: _result,
                      ),
                      Convert(
                        convertHandler: _convert,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 25),
                        child: const Text(
                          'Riwayat Konversi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: resultList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: resultList[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
