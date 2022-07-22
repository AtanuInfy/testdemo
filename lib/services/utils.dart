parseUrl(String url) {
  String base = url.replaceRange(0, 18, '');
  // print("base: $base");
  return base;
}
