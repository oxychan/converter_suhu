import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.inputController,
  }) : super(key: key);

  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      validator: (value) =>
          (value == null || value.isEmpty) ? 'Input the field' : null,
      decoration: const InputDecoration(
        hintText: 'Masukkan Suhu Dalam Cecius',
        labelText: 'Suhu (Celcius)',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
