import 'package:firebase_chat/core/routes/names.dart';
import 'package:firebase_chat/features/welcome/presentation/pages/welcome_page.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const APP = AppRoutes.Application;
  //lista delle routes che uso con GetX
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomePage(),
    ),
  ];
}
