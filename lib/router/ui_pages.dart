import 'package:flutter/cupertino.dart';

import '../app_state.dart';

const String DonationPath = '/spende';
const String AddressPath = '/adresse';
const String SuccessPath = '/erfolg';
const String CancelPath = '/abbruch';
const String ImprintPath = '/impressum';
const String UnknownPath = '/404';

enum KLPages {
  donation,
  address,
  success,
  cancel,
  imprint,
  unknown
}

class PageConfiguration {
  final String key;
  final String path;
  final KLPages uiPage;
  PageAction? currentPageAction;

  PageConfiguration(
      {required this.key, required this.path, required this.uiPage, this.currentPageAction});
}

PageConfiguration DonationPageConfig =
  PageConfiguration(key: 'donation', path: DonationPath, uiPage: KLPages.donation, currentPageAction: null);
PageConfiguration AddressPageConfig =
  PageConfiguration(key: 'address', path: AddressPath, uiPage: KLPages.address, currentPageAction: null);
PageConfiguration SuccessPageConfig =
  PageConfiguration(key: 'success', path: CancelPath, uiPage: KLPages.success, currentPageAction: null);
PageConfiguration CancelPageConfig =
  PageConfiguration(key: 'cancel', path: CancelPath, uiPage: KLPages.cancel, currentPageAction: null);
PageConfiguration ImprintPageConfig =
  PageConfiguration(key: 'imprint', path: ImprintPath, uiPage: KLPages.imprint, currentPageAction: null);
PageConfiguration UnknownPageConfig =
  PageConfiguration(key: 'unknown', path: UnknownPath, uiPage: KLPages.unknown, currentPageAction: null);
