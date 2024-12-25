import 'dart:math';

class Images {
  ///  Logo ///
  static String hey = 'assets/icon/hey.png';
  static String bg = 'assets/images/menu-bg.png';

  static String currentUser = 'assets/images/user-1.jpg';

  /// Avatars ///
  static List<String> avatars =
      List.generate(10, (index) => 'assets/avatar/${index + 1}.png');

  static List<String> dummy =
      List.generate(3, (index) => 'assets/images/dummy/dummy_${index + 1}.jpg');
  static List<String> shirt = List.generate(
      7, (index) => 'assets/images/products/shirt_${index + 1}.png');
  static List<String> tShirt = List.generate(
      5, (index) => 'assets/images/products/t_shirt_${index + 1}.jpg');

  static String randomImage(List<String> images) {
    return images[Random().nextInt(images.length)];
  }

  static String appleLogo = 'assets/images/logo/apple_logo.png';
  static String googleLogo = 'assets/images/logo/google_logo.png';
}
