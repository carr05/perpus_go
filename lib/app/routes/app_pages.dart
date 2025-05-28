import 'package:get/get.dart';

import '../modules/buku/bindings/buku_binding.dart';
import '../modules/buku/views/buku_view.dart';
import '../modules/e-book/bindings/e_book_binding.dart';
import '../modules/e-book/views/e_book_view.dart';
import '../modules/editprofile/bindings/editprofile_binding.dart';
import '../modules/editprofile/views/editprofile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/katalog/bindings/katalog_binding.dart';
import '../modules/katalog/views/katalog_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/pdfviewer/bindings/pdfviewer_binding.dart';
import '../modules/pdfviewer/views/pdfviewer_view.dart';
import '../modules/peminjaman/bindings/peminjaman_binding.dart';
import '../modules/peminjaman/views/peminjaman_view.dart';
import '../modules/pengembalian/bindings/pengembalian_binding.dart';
import '../modules/pengembalian/views/pengembalian_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PEMINJAMAN,
      page: () => PeminjamanView(),
      binding: PeminjamanBinding(),
    ),
    GetPage(
      name: _Paths.PENGEMBALIAN,
      page: () => PengembalianView(),
      binding: PengembalianBinding(),
    ),
    GetPage(
      name: _Paths.E_BOOK,
      page: () => EbookView(),
      binding: EbookBinding(),
    ),
    GetPage(
      name: _Paths.KATALOG,
      page: () => KatalogBukuView(),
      binding: KatalogBukuBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfilView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.EDITPROFILE,
      page: () => EditProfileView(),
      binding: EditprofileBinding(),
    ),
    GetPage(
      name: _Paths.BUKU,
      page: () => BukuView(),
      binding: BukuBinding(),
    ),
    GetPage(
      name: _Paths.PDFVIEWER,
      page: () => PdfviewerView(),
      binding: PdfviewerBinding(),
    ),
  ];
}
