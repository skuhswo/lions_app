import 'package:provider/provider.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/thank_you_text.dart';
import 'package:lottie/lottie.dart';
import "../app_state.dart";
import "../router/ui_pages.dart";

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        body: CustomAppbarWithBackButton(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          statusbarHeightPadding: MediaQuery.of(context).padding.top,
          includeBackButton: false,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Stack(
                  alignment: AlignmentDirectional(0, 0),
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Lottie.asset(
                        "assets/lottie_animations/butterfly-hearts.json",
                        fit: BoxFit.cover,
                        repeat: true,
                        reverse: false,
                        animate: true,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context)
                              .copyWith(scrollbars: false),
                          child: SingleChildScrollView(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              constraints: BoxConstraints(
                                minHeight: height / 2,
                                maxWidth: 450, //viewportConstraints.maxHeight,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 50, 0, 50),
                                    child: ThankYouText(),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 25, 50, 20),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        var appState = context.read<AppState>();
                                        appState.currentAction = PageAction(
                                            state: PageState.replaceAll,
                                            page: DonationPageConfig);
                                      },
                                      text: 'Zur??ck zur Startseite',
                                      options: FFButtonOptions(
                                        //height: 50,
                                        //width: width /2,
                                        color: Color(0xFF407CCA),
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 20, 20),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
          //  ),
          //),
        ),
        //bottomNavigationBar: KLBottomNavigationBar()
      ),
    );
  }
}
