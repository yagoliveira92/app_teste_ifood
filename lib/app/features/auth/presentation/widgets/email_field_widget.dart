import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_teste_ifood/app/core/validators/email_validator.dart';

class EmailTextFieldWidget extends StatefulWidget {
  const EmailTextFieldWidget({
    Key? key,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String) validator;

  @override
  _EmailTextFieldWidgetState createState() => _EmailTextFieldWidgetState();
}

class _EmailTextFieldWidgetState extends State<EmailTextFieldWidget> {
  FocusNode? focusNode;
  static final _keyEmail = GlobalKey();

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
          'Usuário',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          onChanged: widget.validator,
          style: GoogleFonts.montserrat(),
          focusNode: focusNode,
          maxLength: 20,
          key: _keyEmail,
          keyboardType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.none,
          validator: (value) {
            final validate = EmailValidator(value: value);
            return validate();
          },
          controller: widget.controller,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person),
            focusedBorder: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
            errorBorder: OutlineInputBorder(),
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
