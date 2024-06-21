import 'package:flutter/material.dart';

class Username extends StatefulWidget {
  Username({super.key});

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  final TextEditingController emailMobileInput = TextEditingController();
  final _emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  final _phoneRegex = r'^\d{10}$';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailMobileInput,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email or Phone',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email or Phone cannot be empty';
        }
        if (!RegExp(_emailRegex).hasMatch(value) &&
            !RegExp(_phoneRegex).hasMatch(value)) {
          return 'Please enter a valid Email or Phone';
        }
        return null;
      },
    );
  }
}
