import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../screens/donation_page.dart';
import '../screens/address_page.dart';
import '../screens/success_page.dart';
import '../screens/cancel_page.dart';
import '../screens/imprint_page.dart';
import '../screens/unknown_page.dart';
import '../app_state.dart';
import 'ui_pages.dart';

class KLRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  final List<Page> _pages = [];

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final AppState appState;

  KLRouterDelegate(this.appState) : navigatorKey = GlobalKey() {
    appState.addListener(() {
      notifyListeners();
    });
  }

  /// Getter for a list that cannot be changed
  List<MaterialPage> get pages => List.unmodifiable(_pages);

  /// Number of pages function
  int numPages() => _pages.length;

  @override
  PageConfiguration get currentConfiguration {
    buildPages();
    //print(_pages);
    return _pages.last.arguments as PageConfiguration;
  }


  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: buildPages(),
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (canPop()) {
      pop();
      return true;
    } else {
      return false;
    }
  }

  void _removePage(Page page) {  // (MaterialPage page) {
    if (page != null) {
      _pages.remove(page);
    }
  }

  void pop() {
    if (canPop()) {
      _removePage(_pages.last);
    }
  }

  bool canPop() {
    return _pages.length > 1;
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _removePage(_pages.last);
      return Future.value(true);
    }
    return Future.value(false);
  }

  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(
        child: child,
        key: ValueKey(pageConfig.key),
        name: pageConfig.path,
        arguments: pageConfig);
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );
  }

  void addPage(PageConfiguration? pageConfig) {
    if (pageConfig != null) {
      final shouldAddPage = _pages.isEmpty ||
          (_pages.last.arguments as PageConfiguration).uiPage !=
              pageConfig.uiPage;

      if (shouldAddPage) {
        switch (pageConfig.uiPage) {
          case KLPages.donation:
            _addPageData(DonationPage(), DonationPageConfig);
            break;
          case KLPages.address:
            _addPageData(AddressPage(), AddressPageConfig);
            break;
          case KLPages.success:
            _addPageData(SuccessPage(), SuccessPageConfig);
            break;
          case KLPages.cancel:
            _addPageData(CancelPage(), CancelPageConfig);
            break;
          case KLPages.imprint:
            _addPageData(ImprintPage(), ImprintPageConfig);
            break;
          case KLPages.unknown:
            _addPageData(UnknownPage(), UnknownPageConfig);
            break;
          default:
            break;
        }
      }
    }
  }

  void replace(PageConfiguration? newRoute) {
    if (newRoute != null) {
      if (_pages.isNotEmpty) {
        _pages.removeLast();
      }
      addPage(newRoute);
    }
  }

  void setPath(List<MaterialPage> path) {
    _pages.clear();
    _pages.addAll(path);
  }

  void replaceAll(PageConfiguration? newRoute) {
    if (newRoute != null) {
      setNewRoutePath(newRoute);
    }
  }

  void push(PageConfiguration newRoute) {
    addPage(newRoute);
  }

  void pushWidget(Widget? child, PageConfiguration? newRoute) {
    if (child != null && newRoute != null) {
      _addPageData(child, newRoute);
    }
  }

  void addAll(List<PageConfiguration>? routes) {
    if (routes != null) {
      _pages.clear();
      routes.forEach((route) {
        addPage(route);
      });
    }
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as PageConfiguration).uiPage !=
            configuration.uiPage;
    if (shouldAddPage) {
      _pages.clear();
      addPage(configuration);
    }
    return SynchronousFuture(null);
  }

  void _setPageAction(PageAction action) {
    switch (action.page?.uiPage) {
      case KLPages.donation:
        DonationPageConfig.currentPageAction = action;
        break;
      case KLPages.address:
        AddressPageConfig.currentPageAction = action;
        break;
      case KLPages.success:
        SuccessPageConfig.currentPageAction = action;
        break;
      case KLPages.cancel:
        CancelPageConfig.currentPageAction = action;
        break;
      case KLPages.imprint:
        ImprintPageConfig.currentPageAction = action;
        break;
      case KLPages.unknown:
        UnknownPageConfig.currentPageAction = action;
        break;
      default:
        break;
    }
  }

  List<Page> buildPages() {
      switch (appState.currentAction.state) {
        case PageState.none:
          break;
        case PageState.addPage:
          _setPageAction(appState.currentAction);
          addPage(appState.currentAction.page);
          break;
        case PageState.pop:
          pop();
          break;
        case PageState.replace:
          _setPageAction(appState.currentAction);
          replace(appState.currentAction.page);
          break;
        case PageState.replaceAll:
          _setPageAction(appState.currentAction);
          replaceAll(appState.currentAction.page);
          break;
        case PageState.addWidget:
          _setPageAction(appState.currentAction);
          pushWidget(appState.currentAction.widget, appState.currentAction.page);
          break;
        case PageState.addAll:
          addAll(appState.currentAction.pages);
          break;
      };
    appState.resetCurrentAction();
    return List.of(_pages);
  }


  void parseRoute(Uri uri) {
    if (uri.pathSegments.isEmpty) {
      setNewRoutePath(DonationPageConfig);
      return;
    }

    if (uri.pathSegments.length == 1) {
      final path = uri.pathSegments[0];
      switch (path) {
        case DonationPath:
          replaceAll(DonationPageConfig);
          break;
        case AddressPath:
          addPage(AddressPageConfig);
          break;
        case SuccessPath:
          setPath([
            _createPage(SuccessPage(), SuccessPageConfig),
            _createPage(DonationPage(), DonationPageConfig)
          ]);
          break;
        case CancelPath:
          setPath([
            _createPage(CancelPage(), CancelPageConfig),
            _createPage(DonationPage(), DonationPageConfig)
          ]);
          break;
        case ImprintPath:
          addPage(ImprintPageConfig);
          break;
        case UnknownPath:
          setPath([
            _createPage(UnknownPage(), UnknownPageConfig),
            _createPage(DonationPage(), DonationPageConfig)
          ]);
          break;
      }
    }
  }
}
