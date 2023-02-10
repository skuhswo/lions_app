import 'package:kaiserlions/widgets/address_tile.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/bottom_navigation_bar.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

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
            navigateBackHome: true,
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
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight:
                                      height, //viewportConstraints.maxHeight,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 100, 0, 100),
                                      child: AddressTile(),
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
          bottomNavigationBar: KLBottomNavigationBar()),
    );
  }
}
