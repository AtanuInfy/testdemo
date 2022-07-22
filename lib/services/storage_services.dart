import 'package:ItemOptix/data/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class StorageServices {
  StorageServices();
  GetStorage localStore = GetStorage();
  getlocale(BuildContext context) {
    String locale = localStore.read(Constants.locale) ?? "";
    String langCode = "";
    String countryCode = "";

    if (locale != "") {
      List code = locale.split("-");
      langCode = code[0];
      countryCode = code[1];
      Locale getLocale = Locale(langCode, countryCode);
      context.setLocale(getLocale);
      return getLocale;
    } else {
      return context.locale;
    }
  }

  void setLocale(String locale, BuildContext context) {
    var storedLocale = localStore.read(Constants.locale) ?? "";
    if (storedLocale == "" || storedLocale != locale) {
      localStore.write(Constants.locale, locale);
      getlocale(context);
    }
  }

  void saveLocally(String key, dynamic value) {
    localStore.write(key, value);
  }
}
