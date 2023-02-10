import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import "../app_state.dart";
import 'package:provider/provider.dart';
import "../router/ui_pages.dart";

class KLBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    if ((orientation == Orientation.landscape) && (height < 500)) {
      return Material(
        elevation: 8,
        child: Container(
          height: 20,
          color: Color(0xFF00338D),
          child: FittedBox(
            // Column
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TextButton(
                      child: Text("Support, Impressum & Datenschutz",
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Inter',
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                      onPressed: () {
                        var appState = context.read<AppState>();
                        appState.currentAction = PageAction(
                            state: PageState.addPage, page: ImprintPageConfig);
                      }),
                ])
              ],
            ),
          ),
        ),
      );
    }
    ;

    return Material(
      elevation: 8,
      child: Container(
        height: 60,
        color: Color(0xFF00338D),
        child: FittedBox(
          // Column
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: Text(
                    "© 2022 KaiserLions e.V. – Hilfsverein des Lions Club Kaiserslautern–Lutra",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton(
                    child: Text("Support, Impressum & Datenschutz",
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                            //fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    onPressed: () {
                      var appState = context.read<AppState>();
                      appState.currentAction = PageAction(
                          state: PageState.addPage, page: ImprintPageConfig);
                    }),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
