import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_teste_ifood/app/core/validators/password_validator.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  const PasswordTextFieldWidget({
    Key? key,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String) validator;

  @override
  _PasswordTextFieldWidgetState createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  FocusNode? focusNode;
  static final _keyPassword = GlobalKey();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Senha',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          style: GoogleFonts.montserrat(),
          obscureText: _obscureText,
          onChanged: widget.validator,
          focusNode: focusNode,
          key: _keyPassword,
          keyboardType: TextInputType.visiblePassword,
          validator: (value) {
            final validate = PasswordValidator(value: value);
            return validate();
          },
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            focusedBorder: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(),
            errorBorder: const OutlineInputBorder(),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }
}
