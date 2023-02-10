import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/bottom_navigation_bar.dart';
import "../widgets/imprintTexts.dart";

class ImprintPage extends StatelessWidget {
  const ImprintPage({Key? key}) : super(key: key);

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
            includeBackButton: true,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Stack(
                    alignment: AlignmentDirectional(0, 0),
                    children: [
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
                                  maxWidth:
                                      450, //viewportConstraints.maxHeight,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: height * 0.15,
                                    ),
                                    /*Lottie.asset(
                                      'lottie_animations/lottie_file.json',
                                      width: width * 0.5,
                                      //height: 200,
                                      fit: BoxFit.fill,
                                      repeat: true,
                                      reverse: false,
                                      animate: true,
                                    ),*/
                                  ].followedBy(imprintTexts).toList(),
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
          ),
          bottomNavigationBar: KLBottomNavigationBar()),
    );
  }
}
