import 'package:flutter/services.dart';
import 'package:kaiserlions/widgets/Stripe.dart';
import 'package:provider/provider.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import "../app_state.dart";

final _formKey = GlobalKey<FormState>();
final _fontSize = 18.0;

class AddressTile extends StatefulWidget {
  const AddressTile({Key? key}) : super(key: key);

  @override
  State<AddressTile> createState() => _AddressTileState();
}

class _AddressTileState extends State<AddressTile> {
  final textControllerPurpose = TextEditingController();
  final textControllerName = TextEditingController();
  final textControllerStreet = TextEditingController();
  final textControllerZIPCode = TextEditingController();
  final textControllerCity = TextEditingController();
  final textControllerCountry = TextEditingController();
  final textControllerEmail = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autoValidate = false;

  @override
  void initState() {
    final AppState appState = Provider.of<AppState>(context, listen: false);

    super.initState();

    textControllerPurpose.text = appState.purpose ?? "";
    textControllerName.text = appState.name ?? "";
    textControllerStreet.text = appState.street ?? "";
    textControllerZIPCode.text = appState.zipCode ?? "";
    textControllerCity.text = appState.city ?? "";
    textControllerCountry.text = appState.country ?? "";
    textControllerEmail.text = appState.email ?? "";

    textControllerPurpose.addListener(() {
      AppState appState = Provider.of<AppState>(context, listen: false);
      appState.purpose = textControllerPurpose.text;
    });

    textControllerName.addListener(() {
      AppState appState = Provider.of<AppState>(context, listen: false);
      appState.name = textControllerName.text;
    });

    textControllerStreet.addListener(() {
      AppState appState = Provider.of<AppState>(context, listen: false);
      appState.street = textControllerStreet.text;
    });

    textControllerZIPCode.addListener(() {
      AppState appState = Provider.of<AppState>(context, listen: false);
      appState.zipCode = textControllerZIPCode.text;
    });

    textControllerCity.addListener(() {
      AppState appState = Provider.of<AppState>(context, listen: false);
      appState.city = textControllerCity.text;
    });

    textControllerCountry.addListener(() {
      AppState appState = Provider.of<AppState>(context, listen: false);
      appState.country = textControllerCountry.text;
    });

    textControllerEmail.addListener(() {
      AppState appState = Provider.of<AppState>(context, listen: false);
      appState.email = textControllerEmail.text;
    });
  }

  @override
  void dispose() {
    textControllerPurpose.dispose();
    textControllerName.dispose();
    textControllerStreet.dispose();
    textControllerZIPCode.dispose();
    textControllerCity.dispose();
    textControllerCountry.dispose();
    textControllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        constraints: BoxConstraints(
          maxWidth: 450,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xFF00338D),
              Color(0xFF407CCA),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Form(
            key: _formKey,
            child: AutofillGroup(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 20),
                      child: Text(
                        'Spendenzweck',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Inter',
                              color: Color(0xFFEBB700),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            //TextFormField
                            controller: textControllerPurpose,
                            onChanged: (_) => setState(() {}),
                            autofocus: false,
                            obscureText: false,
                            //inputFormatters: [FilteringTextInputFormatter.  .digitsOnly],
                            decoration: InputDecoration(
                              hintText:
                                  'Projekt oder sonstige Angabe (optional)',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                            ),
                            style: GoogleFonts.getFont('Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: _fontSize,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 20),
                      child: Text(
                        'Angaben für die Spendenquittung',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Inter',
                              color: Color(0xFFEBB700),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            //TextFormField
                            controller: textControllerName,
                            onChanged: (_) => setState(() {}),

                            autofocus: false,
                            obscureText: false,
                            //inputFormatters: [FilteringTextInputFormatter.  .digitsOnly],

                            autofillHints: [
                              AutofillHints.name,
                              AutofillHints.familyName,
                              AutofillHints.givenName,
                              AutofillHints.organizationName
                            ],

                            decoration: InputDecoration(
                              hintText: 'Name oder Firma',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                            ),
                            style: GoogleFonts.getFont('Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: _fontSize,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            //TextFormField
                            controller: textControllerStreet,
                            onChanged: (_) => setState(() {}),

                            autofocus: false,
                            obscureText: false,
                            //inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                            autofillHints: [
                              AutofillHints.fullStreetAddress,
                              AutofillHints.postalAddress,
                              AutofillHints.postalAddressExtended,
                              AutofillHints.streetAddressLevel1
                            ],

                            decoration: InputDecoration(
                              hintText: 'Strasse und Hausnummer',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                            ),
                            style: GoogleFonts.getFont('Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: _fontSize,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            keyboardType: TextInputType.streetAddress,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 30,
                          child: TextFormField(
                            //TextFormField
                            controller: textControllerZIPCode,
                            onChanged: (_) => setState(() {}),

                            autofocus: false,
                            obscureText: false,
                            // inputFormatters: [FilteringTextInputFormatter.,

                            autofillHints: [AutofillHints.postalCode],

                            decoration: InputDecoration(
                              hintText: 'PLZ',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                            ),
                            style: GoogleFonts.getFont('Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: _fontSize,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Spacer(flex: 2),
                        Expanded(
                          flex: 70,
                          child: TextFormField(
                            //TextFormField
                            controller: textControllerCity,
                            onChanged: (_) => setState(() {}),
                            autofocus: false,
                            obscureText: false,
                            autofillHints: [
                              AutofillHints.addressCity,
                            ],
                            decoration: InputDecoration(
                              hintText: 'Ort',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                            ),
                            style: GoogleFonts.getFont('Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: _fontSize,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            keyboardType: TextInputType.streetAddress,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            //TextFormField
                            controller: textControllerCountry,
                            onChanged: (_) => setState(() {}),

                            autofocus: false,
                            obscureText: false,
                            //inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                            autofillHints: [
                              AutofillHints.countryName,
                              AutofillHints.location
                            ],

                            decoration: InputDecoration(
                              hintText: 'Land',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                            ),
                            style: GoogleFonts.getFont('Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: _fontSize,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            keyboardType: TextInputType.streetAddress,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            //TextFormField
                            controller: textControllerEmail,
                            onChanged: (_) => setState(() {}),

                            autofillHints: [AutofillHints.email],

                            autofocus: false,
                            obscureText: false,
                            autovalidateMode: _autoValidate
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            validator: (input) => (input ?? "").isValidEmail()
                                ? null
                                : "Bitte geben Sie eine gültige Email-Adresse ein.",

                            //inputFormatters: [FilteringTextInputFormatter.allow(RegExp(""))],

                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                              hintText: 'E-Mail',
                              hintStyle: TextStyle(color: Colors.grey),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFFF5B35),
                                  width: 4,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFFF5B35),
                                  width: 4,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              fillColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                            ),
                            style: GoogleFonts.getFont('Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: _fontSize,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 25, 10, 20),
                    child: FFButtonWidget(
                      onPressed: () {
                        FocusManager.instance.primaryFocus!.unfocus();
                        if (_formKey.currentState!.validate()) {
                          var appState = context.read<AppState>();
                          redirectToCheckout(appState);
                          /*              var amount = donationData.amount;
                    if (amount != null) {
                      if (amount > 0)
                        redirectToCheckout(amount);
                    } */
                        } else {
                          setState(() {
                            _autoValidate = true;
                          });
                        }
                      },
                      text: 'Weiter',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50,
                        color: Color(0xFFAA2255),
                        textStyle: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Inter',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                        elevation: 10,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
