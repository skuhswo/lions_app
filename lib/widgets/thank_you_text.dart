import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

final _formKey = GlobalKey<FormState>();

class ThankYouText extends StatelessWidget {
  const ThankYouText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientText(
      'Herzlichen Dank für Ihre Unterstützung!',
      style: TextStyle(
        fontSize: 50.0,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w900,
      ),
      textAlign: TextAlign.center,
      colors: [
        Color(0xFF00AB68),
        Color(0xFF00338D),
        Color(0xFF7A2582),
        Color(0xFFFF5B35),
        Color(0xFFFBB700),
      ],
    );
  }
}
