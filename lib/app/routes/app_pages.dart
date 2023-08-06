import '../../app/modules/map_screen_module/map_screen_page.dart';
import '../../app/modules/map_screen_module/map_screen_bindings.dart';
import '../../app/modules/bill_detail_module/bill_detail_page.dart';
import '../../app/modules/bill_detail_module/bill_detail_bindings.dart';
import '../../app/modules/invoice_detail_module/invoice_detail_page.dart';
import '../../app/modules/invoice_detail_module/invoice_detail_bindings.dart';
import '../../app/modules/notification_screen_module/notification_screen_page.dart';
import '../../app/modules/notification_screen_module/notification_screen_bindings.dart';
import '../../app/modules/add_payment_info_screen_module/add_payment_info_screen_page.dart';
import '../../app/modules/add_payment_info_screen_module/add_payment_info_screen_bindings.dart';
import '../../app/modules/bill_creation_module/bill_creation_page.dart';
import '../../app/modules/bill_creation_module/bill_creation_bindings.dart';
import '../../app/modules/upgrade_plan_screen_module/upgrade_plan_screen_page.dart';
import '../../app/modules/upgrade_plan_screen_module/upgrade_plan_screen_bindings.dart';
import '../../app/modules/account_edit_screen_module/account_edit_screen_page.dart';
import '../../app/modules/account_edit_screen_module/account_edit_screen_bindings.dart';
import '../../app/modules/settings_feed_screen_module/settings_feed_screen_page.dart';
import '../../app/modules/settings_feed_screen_module/settings_feed_screen_bindings.dart';
import '../../app/modules/invoices_feed_screen_module/invoices_feed_screen_page.dart';
import '../../app/modules/invoices_feed_screen_module/invoices_feed_screen_bindings.dart';
import '../../app/modules/bills_feed_screen_module/bills_feed_screen_page.dart';
import '../../app/modules/bills_feed_screen_module/bills_feed_screen_bindings.dart';
import '../../app/modules/home_screen_module/home_screen_page.dart';
import '../../app/modules/home_screen_module/home_screen_bindings.dart';
import '../../app/modules/fill_profile_screen_module/fill_profile_screen_page.dart';
import '../../app/modules/fill_profile_screen_module/fill_profile_screen_bindings.dart';
import '../../app/modules/verification_screen_module/verification_screen_page.dart';
import '../../app/modules/verification_screen_module/verification_screen_bindings.dart';
import '../../app/modules/registration_screen_module/registration_screen_page.dart';
import '../../app/modules/registration_screen_module/registration_screen_bindings.dart';
import '../../app/modules/splash_screen_module/splash_screen_bindings.dart';
import '../../app/modules/splash_screen_module/splash_screen_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';
/**
 * GetX Generator - fb.com/htngu.99
 * */

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.REGISTRATION_SCREEN,
      page: () => RegistrationScreenPage(),
      binding: RegistrationScreenBinding(),
    ),
    GetPage(
      name: Routes.VERIFICATION_SCREEN,
      page: () => VerificationScreenPage(),
      binding: VerificationScreenBinding(),
    ),
    GetPage(
      name: Routes.FILL_PROFILE_SCREEN,
      page: () => FillProfileScreenPage(),
      binding: FillProfileScreenBinding(),
    ),
    GetPage(
      name: Routes.HOME_SCREEN,
      page: () => HomeScreenPage(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: Routes.BILLS_FEED_SCREEN,
      page: () => BillsFeedScreenPage(),
      binding: BillsFeedScreenBinding(),
    ),
    GetPage(
      name: Routes.INVOICES_FEED_SCREEN,
      page: () => InvoicesFeedScreenPage(),
      binding: InvoicesFeedScreenBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS_FEED_SCREEN,
      page: () => SettingsFeedScreenPage(),
      binding: SettingsFeedScreenBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT_EDIT_SCREEN,
      page: () => AccountEditScreenPage(),
      binding: AccountEditScreenBinding(),
    ),
    GetPage(
      name: Routes.UPGRADE_PLAN_SCREEN,
      page: () => UpgradePlanScreenPage(),
      binding: UpgradePlanScreenBinding(),
    ),
    GetPage(
      name: Routes.BILL_CREATION,
      page: () => BillCreationPage(),
      binding: BillCreationBinding(),
    ),
    GetPage(
      name: Routes.ADD_PAYMENT_INFO_SCREEN,
      page: () => AddPaymentInfoScreenPage(),
      binding: AddPaymentInfoScreenBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATION_SCREEN,
      page: () => NotificationScreenPage(),
      binding: NotificationScreenBinding(),
    ),
    GetPage(
      name: Routes.INVOICE_DETAIL,
      page: () => InvoiceDetailPage(),
      binding: InvoiceDetailBinding(),
    ),
    GetPage(
      name: Routes.BILL_DETAIL,
      page: () => BillDetailPage(),
      binding: BillDetailBinding(),
    ),
    GetPage(
      name: Routes.MAP_SCREEN,
      page: () => MapScreenPage(),
      binding: MapScreenBinding(),
    ),
  ];
}
