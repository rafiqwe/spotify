import 'package:flutter/cupertino.dart';
import 'package:spotify/UI/artists/artist_page.dart';
import 'package:spotify/UI/create_account/create_account_page.dart';
import 'package:spotify/UI/intro/intro_page.dart';
import 'package:spotify/UI/splash/splash_page.dart';

class AppRoute {
  static String splash_page = '/';
  static String intro_page = '/intro';
  static String create_Account_page = '/create_account';
  static String artist_page = '/artist';

  static Map<String, Widget Function(BuildContext)> getRoute() => {
    splash_page: (context) => SplashPage(),
    intro_page: (context) => IntroPage(),
    create_Account_page: (context) => CreateAccountPage(),
    artist_page: (context) => ArtistPage(),
  };
}
