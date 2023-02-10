@JS()
library stripe;

import 'dart:convert';
import 'package:js/js.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import "../app_state.dart";

Future<String> requestCheckoutRedirectURL(AppState appState) async {
  var amount = appState.amount ?? 0;
  var amountStr = amount.toString();

  var donationReceiptStr = appState.donationReceipt.toString();

  final response = await http.post(
      Uri.parse(
          'https://sqq0qpfr27.execute-api.eu-central-1.amazonaws.com/dev/checkout'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'amount': amountStr,
        'donationReceipt': donationReceiptStr,
        'purpose': appState.purpose ?? "",
        'name': appState.name ?? "",
        'street': appState.street ?? "",
        'zip_code': appState.zipCode ?? "",
        'city': appState.city ?? "",
        "country": appState.country ?? "",
        "email": appState.email ?? ""
      }));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print("Exception auf Server");
    throw Exception('Error');
  }
}

void redirectToCheckout(AppState appState) async {
  var redirectURL = await requestCheckoutRedirectURL(appState);
  html.window.open(redirectURL, "_self");
}
