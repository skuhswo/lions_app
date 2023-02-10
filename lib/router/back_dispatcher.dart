import 'package:flutter/material.dart';
import 'router_delegate.dart';

class KLBackButtonDispatcher extends RootBackButtonDispatcher {
  final KLRouterDelegate _routerDelegate;

  KLBackButtonDispatcher(this._routerDelegate)
      : super();

  @override
  Future<bool> didPopRoute() {
    return _routerDelegate.popRoute();
  }
}
