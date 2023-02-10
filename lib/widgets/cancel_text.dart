import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class CancelText1 extends StatelessWidget {
  const CancelText1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Die Zahlung wurde abgebrochen.',
      style: TextStyle(
        fontSize: 35.0,
        color: Color(0xFF00338D),
        fontFamily: 'Inter',
        fontWeight: FontWeight.w900,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class CancelText2 extends StatelessWidget {
  const CancelText2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Bei Fragen oder Problemem sprechen Sie uns bitte einfach an oder kontaktieren Sie uns unter:',
        style: TextStyle(
          fontSize: 18.0,
          color: Color(0xFF00338D),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w900,
        ),
        textAlign: TextAlign.center,
      ),
      InkWell(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
            child: Text(
              'online-spende@kaiserlions-hilfe.de',
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xFF00338D),
                fontFamily: 'Inter',
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          onTap: () => launch('mailto:online-spende@kaiserlions-hilfe.de')),
    ]);
  }
}
