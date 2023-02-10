import 'package:flutter/services.dart';
import 'package:kaiserlions/widgets/Stripe.dart';
import 'package:provider/provider.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import "../app_state.dart";
import '../router/ui_pages.dart';

final _formKey = GlobalKey<FormState>();

class DonationTile extends StatefulWidget {
  const DonationTile({Key? key}) : super(key: key);
  @override
  State<DonationTile> createState() => _DonationTileState();
}

class _DonationTileState extends State<DonationTile> {
  final textController = TextEditingController();
  //bool checkboxListTileValue = true;
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _autoValidate = false;

  void changeValue(int delta) {
    int value = 0;
    try {
      value = int.parse(textController.text);
    } catch (e) {}
    int newValue = value + delta;
    if (newValue > 0) {
      setState(() {
        //animateToNewValue(newValue);
        FocusScope.of(context).unfocus();
        textController.text = newValue.toString();
      });
    } else {
      resetValue();
    }
  }

  void resetValue() {
    setState(() {
      FocusScope.of(context).unfocus();
      textController.text = "";
    });
  }

  void animateToNewValue(int newValue) {
    for (int i = 0; i <= newValue; i++) {
      print(newValue);

      textController.text = newValue.toString();
    }
  }

  @override
  void initState() {
    final AppState appState = Provider.of<AppState>(context, listen: false);

    super.initState();

    textController.text = appState.amount?.toString() ?? "";

    textController.addListener(() {
      AppState appState = Provider.of<AppState>(context, listen: false);
      appState.amountStr = textController.text;
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    //var height = size.height;
    //var width = size.width;

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
              //            Color(0xFF407CCA),
              //   Color(0xff7A2582),
              //Color(0xff7A2582),
              Color(0xFF00338D),
              //Color(0xFF0d2140),
              Color(0xFF407CCA),
              //            Color(0xff1f005c),
              // Color(0xff5b0060),
              //Color(0xffac255e),
              //Color(0xffca485c),
              //Color(0xffe16b5c),
              //Color(0xfff39060),
              //Color(0xffffb56b),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            //tileMode: TileMode.mirror,
          ),
          //borderRadius: const BorderRadius.circular(10),
          //shape: BoxShape.rectangle,
        ),
        /*decoration: BoxDecoration(
          color: Color(0xFF00338D),
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle,
        ),*/
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 20),
                    child: Text(
                      'Meine Spende',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: Color(0xFFEBB700),
                            fontSize: 30,
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
                          controller: textController,
                          onChanged: (_) => setState(() {}), // (_) =>
                          // EasyDebounce.debounce(
                          //   'textController',
                          //   Duration(milliseconds: 2000),
                          //       () => setState(() {}),
                          // ),
                          autofocus: false,
                          obscureText: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],

                          autovalidateMode: _autoValidate
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,
                          validator: (input) {
                            print("Text: " + textController.text);
                            if (textController.text != "") {
                              var value = int.parse(textController.text);
                              if (value > 0) {
                                return null;
                              } else
                                return "Bitte geben Sie den Spendenbetrag ein.";
                            } else
                              return "Bitte geben Sie den Spendenbetrag ein.";
                          },

                          decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            hintText: 'Betrag',
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFF5B35),
                                width: 4,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFFF5B35),
                                width: 4,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            suffixIcon: Icon(
                              Icons.euro,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          ),
                          style: GoogleFonts.getFont('Inter',
                              fontWeight: FontWeight.w300,
                              fontSize: 30,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Consumer<AppState>(
                          builder: (context, donationData, child) {
                        return IconButton(
                          onPressed: () {
                            if (textController.text != "") {
                              resetValue();
                              setState(() {
                                _autoValidate = false;
                              });
                            }
                          },
                          icon: Icon(Icons.cancel),
                          color: (donationData.amountStr != "")
                              ? Color(0xFFFF5B35)
                              : Colors.grey,
                          iconSize: 30,
                        );
                      }),
                    ],
                  ),
                ),
                Wrap(
                  //mainAxisSize: MainAxisSize.max,
                  //mainAxisAlignment:
                  //MainAxisAlignment.center,
                  children: [
                    Wrap(children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
                        child: FFButtonWidget(
                          onPressed: () {
                            changeValue(100);
                          },
                          text: '+100€',
                          options: FFButtonOptions(
                            width: 80,
                            height: 35,
                            color: Color(0xFFEBB700),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00338D)),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
                        child: FFButtonWidget(
                          onPressed: () {
                            changeValue(10);
                          },
                          text: '+10€',
                          options: FFButtonOptions(
                            width: 80,
                            height: 35,
                            color: Color(0xFFEBB700),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00338D)),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
                        child: FFButtonWidget(
                          onPressed: () {
                            changeValue(5);
                          },
                          text: '+5€',
                          options: FFButtonOptions(
                            width: 80,
                            height: 35,
                            color: Color(0xFFEBB700),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00338D)),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 12,
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        unselectedWidgetColor: Color(0xFF95A1AC),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: context.read<AppState>().donationReceipt,
                            onChanged: (newValue) => setState(() => context
                                .read<AppState>()
                                .donationReceipt = newValue!),

                            //tileColor: Color(0xFFF5F5F5),
                            activeColor: Color(0xFFAA2255),
                            checkColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            //dense: true,
                            //controlAffinity:
                            //ListTileControlAffinity
                            //    .leading,
                            //contentPadding:
                            //EdgeInsetsDirectional
                            //    .fromSTEB(
                            //    10, 10, 10, 10),
                          ),
                          Flexible(
                            child: Text(
                              'Ich möchte eine Spendenquittung erhalten oder einen Spendenzweck angeben.',
                              maxLines: 2,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        fontSize: 15,
                                      ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 25, 10, 20),
                  child: FFButtonWidget(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        var value = int.parse(textController.text);
                        var appState = context.read<AppState>();
                        appState.amount = value;
                        // appState.donationReceipt = checkboxListTileValue;
                        if (appState.donationReceipt == true) {
                          appState.currentAction = PageAction(
                              state: PageState.addPage,
                              page: AddressPageConfig);
                          //_selected = "address";
                          //notifyListeners();
                          //Navigator.push(
                          //    context,
                          //    MaterialPageRoute(builder: (context) => const AddressPage())
                          //);
                        } else {
                          redirectToCheckout(appState);
                        }
                      } else {
                        setState(() {
                          _autoValidate = true;
                        });
                      }
                    },
                    text: 'Spenden',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60,
                      color: Color(0xFFAA2255),
                      textStyle: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 30,
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
    );
  }
}
