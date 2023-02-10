import 'package:flutter/material.dart';
import 'router/ui_pages.dart';

enum PageState { none, addPage, addAll, addWidget, pop, replace, replaceAll }

class PageAction {
  PageState state;
  PageConfiguration? page;
  List<PageConfiguration>? pages;
  Widget? widget;

  PageAction(
      {this.state = PageState.none,
      this.page = null,
      this.pages = null,
      this.widget = null});
}

class AppState extends ChangeNotifier {
  int? amount;
  String? amountStr = "";
  bool donationReceipt = true;
  String? purpose;
  String? emailAddress;
  String? name;
  String? street;
  String? zipCode;
  String? city;
  String? country = "Deutschland";
  String? email;

  void changeAmountBy(int difference) {
    var newAmount = (amount ?? 0) + difference;
    if (newAmount >= 0) amount = newAmount;
    notifyListeners();
  }

  PageAction _currentAction = PageAction();
  PageAction get currentAction => _currentAction;
  set currentAction(PageAction action) {
    _currentAction = action;
    notifyListeners();
  }

  AppState();

  void resetCurrentAction() {
    _currentAction = PageAction();
  }
}
