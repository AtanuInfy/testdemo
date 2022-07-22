import 'package:flutter/material.dart';

countryCodes() {
  List<Locale> contryCodes = const [
    Locale("ar", "AE"),
    Locale("cs", "CZ"),
    Locale("de", "DE"),
    Locale("en", "GB"),
    Locale("en", "US"),
    Locale("es", "ES"),
    Locale("es", "MX"),
    Locale("fr", "FR"),
    Locale("hr", "HR"),
    Locale("hu", "HU"),
    Locale("it", "IT"),
    Locale("ja", "JP"),
    Locale("ko", "KR"),
    Locale("nl", "BE"),
    Locale("pl", "PL"),
    Locale("pt", "BR"),
    Locale("ro", "RO"),
    Locale("sk", "SK"),
    Locale("sl", "SL"),
    Locale("sr", "RS"),
    Locale("zh", "CN"),
  ];
  return contryCodes;
}

class Constants {
  static const String locale = "locale";
  static const String storedUser = "user";
}
