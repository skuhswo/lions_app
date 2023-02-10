import 'package:flutter/material.dart';
import 'ui_pages.dart';

class KLParser extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {

    final uri = Uri.parse(routeInformation.location ?? "");
    // Handle '/'
    if (uri.pathSegments.isEmpty) {
      return DonationPageConfig;
    }

    final path = '/' + uri.pathSegments[0];
    switch (path) {
      case DonationPath:
        return DonationPageConfig;
      case AddressPath:
        return AddressPageConfig;
      case SuccessPath:
        return SuccessPageConfig;
      case CancelPath:
        return CancelPageConfig;
      case ImprintPath:
        return ImprintPageConfig;
      case UnknownPath:
        return UnknownPageConfig;
      default:
        return DonationPageConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage) {
      case KLPages.donation:
        return const RouteInformation(location: DonationPath);
      case KLPages.address:
        return const RouteInformation(location: AddressPath);
      case KLPages.success:
        return const RouteInformation(location: SuccessPath);
      case KLPages.cancel:
        return const RouteInformation(location: CancelPath);
      case KLPages.imprint:
        return const RouteInformation(location: ImprintPath);
      case KLPages.unknown:
        return const RouteInformation(location: UnknownPath);
      default: return const RouteInformation(location: DonationPath);
    }
  }
}