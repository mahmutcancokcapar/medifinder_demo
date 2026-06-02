abstract final class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/';
  static const String filter = '/filter';
  static const String providerDetail = '/providers/:id';
  static String providerDetailPath(String id) => '/providers/$id';
}
