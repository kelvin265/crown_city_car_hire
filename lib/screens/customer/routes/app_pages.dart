// @dart=2.9
import 'package:get/get.dart';

import '../core.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: Routes.HOME, page: () => MainView(), binding: MainBinding()),
    GetPage(
        name: Routes.SEARCH, page: () => MainView(), binding: MainBinding()),
    GetPage(
        name: Routes.PROFILE, page: () => MainView(), binding: MainBinding()),
    GetPage(
        name: Routes.AVAILABLE_CARS,
        page: () => AvailableCarsView(),
        binding: AvailableCarsBinding()),
    GetPage(
        name: Routes.BOOK_CAR,
        page: () => BookCarView(),
        binding: BookCarBinding()),
    GetPage(
        name: Routes.EDIT_PROFILE,
        page: () => EditprofileView(),
        binding: EditProfileBinding()),
  ];
}
