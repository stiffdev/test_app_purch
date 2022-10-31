import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:test_de_leyes/helpers/prefs.dart';

class PurchaseApi {
  static const apiKey =
      'goog_ZeRbeBqRylmBzEXxLAeFZtOxDOI'; //'goog_kuvShwXuCwNPinpHkLZLEDMreDr';
  static const app_user_id = 'appf13fa1d7d0'; //'shah-12345'; //appf13fa1d7d0
  static LogInResult? results;

  Future init() async {
    late PurchasesConfiguration configuration;
    await Purchases.setDebugLogsEnabled(true);
    configuration = PurchasesConfiguration(apiKey)..appUserID = app_user_id;
    Purchases.configure(configuration);
    results = await Purchases.logIn(app_user_id);
    /*print('id informing');
    print(results!.customerInfo.originalAppUserId);
    Purchases.purchaseProduct('coins_100');*/
    print(results!.customerInfo.activeSubscriptions.length);

    var suscriptions = results!.customerInfo.activeSubscriptions.length;

    print("user have ${suscriptions} active suscriptions");

    var prefs = PreferencesUser();
    if (suscriptions > 0) {
      print("is premium");
      prefs.premium = 1;
    } else {
      print("is not premium");
      prefs.premium = 0;
    }
  }

  static Future<List<Offering>> fetchOffers() async {
    try {
      CustomerInfo info;
      info = await Purchases.getCustomerInfo();
      print('customer information');
      print(info);
      var offerings = await Purchases.getOfferings();
      final current = offerings.current;
      print('current offerings ${offerings.current}');
      print('offerings $offerings');

      return current == null ? [] : [current];
    } on PlatformException catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future<List<Package>> fetchOfferts() async {
    List<Package> packages = [];
    final offerings = await PurchaseApi.fetchOffers();
    if (offerings.isEmpty) {
      print('No Plans Found');
    } else {
      final offer = offerings.first;
      packages = offerings
          .map((e) => offer.availablePackages)
          .expand((element) => element)
          .toList();
      print(offer);
      print('packages length ${packages.length}');
    }

    return packages;
  }

  static Future<void> infocli() async {
    List<Package> packages = [];
    Purchases.addCustomerInfoUpdateListener((customerInfo) {
      print('Listener added');
    });
    List list = [];
    print('active sub informing');
    print(PurchaseApi.results!.customerInfo);
    print(PurchaseApi.results!.customerInfo.activeSubscriptions.length);
    print(packages.length);
    if (PurchaseApi
            .results!.customerInfo.allPurchasedProductIdentifiers.length ==
        packages.length) {
      list.addAll(PurchaseApi.results!.customerInfo.activeSubscriptions);
      print("tamaniooooo ${PurchaseApi.results!.customerInfo.entitlements}");
    } else {
      // loadOffers(packages);
    }
  }

  static Future<bool> purchasePackage(Package package) async {
    var prefs = PreferencesUser();
    print("premiumm  valeeeeeee ${prefs.premium}");

    try {
      await Purchases.purchasePackage(package);
      print("comprando?");
      return true;
    } catch (e) {
      print(e.toString());
      print("no quiere comprar...");
      prefs.premium = 1;
      print("premium       ${prefs.premium}");
      return false;
    }
  }

  static restorePurchases() async {
    try {
      CustomerInfo customer = await Purchases.restorePurchases();

      var suscriptions = customer.activeSubscriptions.length;

      print("user have ${suscriptions} active suscriptions");

      var prefs = PreferencesUser();
      if (suscriptions > 0) {
        print("is premium");
        prefs.premium = 1;
      } else {
        print("is not premium");
        prefs.premium = 0;
      }
      // ... check restored purchaserInfo to see if entitlement is now active
    } on PlatformException catch (e) {
      // Error restoring purchases
    }
  }
}

class Coins {
  static const id10 = '';
}
