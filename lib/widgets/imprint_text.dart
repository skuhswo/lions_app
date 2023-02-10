import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ImprintMainHeadlineText extends StatelessWidget {
  const ImprintMainHeadlineText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 20),
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 30.0,
          color: Color(0xFF00338D),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w900,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class ImprintMainHeadlineTextS extends StatelessWidget {
  const ImprintMainHeadlineTextS(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 30),
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 35.0,
          color: Color(0xFF00338D),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w900,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class ImprintHeadlineText extends StatelessWidget {
  const ImprintHeadlineText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 10),
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 20.0,
          color: Color(0xFF00338D),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class ImprintHeadlineTextS extends StatelessWidget {
  const ImprintHeadlineTextS(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 10),
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: 25.0,
          color: Color(0xFF00338D),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class ImprintText extends StatelessWidget {
  const ImprintText(this.text, {bool this.underline = false, Key? key})
      : super(key: key);

  final String text;
  final bool underline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
      child: Text(
        this.text,
        textAlign: TextAlign.start,
        style: TextStyle(
          decoration: (underline == true)
              ? TextDecoration.underline
              : TextDecoration.none,
          fontSize: 14.0,
          color: Color(0xFF00338D),
          fontFamily: 'Inter',
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

class ImprintTextS extends StatelessWidget {
  const ImprintTextS(this.text, {bool this.underline = false, Key? key})
      : super(key: key);

  final String text;
  final bool underline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
      child: Text(
        this.text,
        textAlign: TextAlign.start,
        style: TextStyle(
          decoration: (underline == true)
              ? TextDecoration.underline
              : TextDecoration.none,
          fontSize: 18.0,
          color: Color(0xFF00338D),
          fontFamily: 'Inter',
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
