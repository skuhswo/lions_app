import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "../app_state.dart";
import 'package:provider/provider.dart';
import "../router/ui_pages.dart";

class CustomAppbarWithBackButton extends StatelessWidget {
  final double width;
  final double height;
  final double statusbarHeightPadding;
  final bool includeBackButton;
  final bool navigateBackHome;
  final Widget child;
  late double topPadding;

  CustomAppbarWithBackButton({
    Key? key,
    required this.child,
    required this.width,
    required this.height,
    required this.statusbarHeightPadding,
    this.includeBackButton = false,
    this.navigateBackHome = false,
  }) : super(key: key) {
    topPadding = 60;
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    if ((orientation == Orientation.landscape) && (height < 500)) {
      return Stack(
        children: [
          child,
          Positioned(
            top: 5, //topPadding / 7,
            child: Container(
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (includeBackButton)
                    IconButton(
                        icon: Icon(
                          CupertinoIcons.back,
                          color: Color(0xFF00338D),
                        ),
                        onPressed: () {
                          var appState = context.read<AppState>();
                          if (!navigateBackHome) {
                            appState.currentAction = PageAction(
                                state: PageState.pop, page: DonationPageConfig);
                          } else {
                            appState.currentAction = PageAction(
                                state: PageState.replaceAll,
                                page: DonationPageConfig);
                          }
                        }),
                  Container(),
                  Row(children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(right: 12),
                      child: Image(
                          image: AssetImage("assets/images/LCI_emblem.png")),
                    ),
                  ])
                ],
              ),
            ),
          ),
        ],
      );
    }
    ;

    return Stack(
      children: [
        child,
        Positioned(
          left: -20,
          top: -45,
          child: Transform.rotate(
            angle: -0.02,
            child: Material(
              type: MaterialType.canvas,
              color: Color(0xFFEBB700),
              elevation: 4,
              child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        Color(0xFF00AB68),
                        Color(0xFF00AB68),
                      ], // Gradient from https://learnui.design/tools/gradient-generator.html
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  width: width * 1.25,
                  height: topPadding * 2.25),
            ),
          ),
        ),
        Positioned(
          left: -20,
          top: -110,
          child: Transform.rotate(
            angle: -0.07,
            child: Material(
              type: MaterialType.canvas,
              color: Color(0xFFEBB700),
              elevation: 6,
              child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        Color(0xFFFF5B35),
                        Color(0xFFEBB700),
                        Color(0xFFEBB700),
                        Color(0xFFEBB700),
                      ], // Gradient from https://learnui.design/tools/gradient-generator.html
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  width: width * 1.25,
                  height: topPadding * 3),
            ),
          ),
        ),
        Positioned(
          left: -5,
          top: -100,
          child: Transform.rotate(
            angle: 0.08,
            child: Material(
              type: MaterialType.canvas,
              color: Color(0xFF00338D),
              elevation: 8,
              child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        Color(0xff7A2582),
                        Color(0xff7A2582),
                        Color(0xFF00338D),
                        Color(0xFF407CCA),
                      ], // Gradient from https://learnui.design/tools/gradient-generator.html
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  width: width * 1.25,
                  height: topPadding * 3),
            ),
          ),
        ),
        Positioned(
          top: 5, //topPadding / 7,
          child: Container(
            width: width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (includeBackButton)
                  IconButton(
                      icon: Icon(
                        CupertinoIcons.back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        var appState = context.read<AppState>();
                        if (!navigateBackHome) {
                          appState.currentAction = PageAction(
                              state: PageState.pop, page: DonationPageConfig);
                        } else {
                          appState.currentAction = PageAction(
                              state: PageState.replaceAll,
                              page: DonationPageConfig);
                        }
                      }),
                Container(),
                Row(children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 10, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Lions Club',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        Text('Kaiserslautern–Lutra',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Colors.white,
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.only(right: 12),
                    child: Image(
                        image: AssetImage("assets/images/LCI_emblem.png")),
                  ),
                ])
              ],
            ),
          ),
        ),
      ],
    );
  }
}
