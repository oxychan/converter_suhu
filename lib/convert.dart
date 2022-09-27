import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  const Convert({
    Key? key,
    required this.convertHandler,
  }) : super(key: key);

  final void Function()? convertHandler;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(
            50), // fromHeight use double.infinity as width and given value is the height),
      ),
      onPressed: convertHandler,
      child: const Text('Konversi Suhu'),
    );
  }
}
