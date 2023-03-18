import 'package:flutter/material.dart';
import 'package:purchases_flutter/models/package_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../purchases/purchases.dart';

class PaywallPage extends StatefulWidget {
  @override
  State<PaywallPage> createState() => _PaywallPageState();
}

class _PaywallPageState extends State<PaywallPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // PurchaseApi.fetchOffers();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BoldText(
                      boldText: 'Hazte Pro🚀',
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.grey,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomListTile(
                    titleText: 'Sin Anuncios',
                    subtitleText: 'Céntrate en lo importante: tu aprendizaje'),
                CustomListTile(
                    titleText: 'Tests Premium ilimitados',
                    subtitleText:
                        'Los simulacros y exámenes más completos sin límites'),
                CustomListTile(
                    titleText: 'Repaso de Errores',
                    subtitleText:
                        'Practica las preguntas que más te cuesten y lleva un registro de tu progreso'),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => launchUrl(
                    Uri.parse('https://sites.google.com/view/iosleyes/home'),
                    mode: LaunchMode.externalApplication,
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: 'Política de privacidad',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => launchUrl(
                    Uri.parse(
                        'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/'),
                    mode: LaunchMode.externalApplication,
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: 'Link a EULA',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder<List<Package>>(
                  future: PurchaseApi.fetchOfferts(),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<List<Package>> snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        //print(snapshot.data!.length as List<Package>);

                        List<Package> list = snapshot.data!;
                        return Column(
                          children: [
                            Container(
                              //height: 60.0,
                              child: GestureDetector(
                                onTap: () async {
                                  // _launchURL(instagramUrl);
                                  await PurchaseApi.fetchOffers();
                                },
                                child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF7B4EFF),
                                            Color(0xFF41C2FF),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                    child: Stack(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: (() async {
                                            var t = await PurchaseApi
                                                .purchasePackage(list[0]);
                                            if (t) {
                                              Navigator.pushReplacementNamed(
                                                  context, '/menu2');
                                            }
                                          }),
                                          child: Container(
                                              constraints: const BoxConstraints(
                                                  maxWidth: 300.0,
                                                  minHeight: 60.0),
                                              alignment: Alignment.center,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            3, 8, 3, 3),
                                                    child: Text(
                                                      '\€4.99 ',
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Pago Mensual',
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.white),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(3.0),
                                                    child: Text(
                                                      'El precio de dos refrescos en una terraza',
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              // height: 60.0,
                              child: GestureDetector(
                                onTap: () {
                                  // _launchURL(instagramUrl);
                                },
                                child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF7B4EFF),
                                            Color(0xFF41C2FF),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                              height: 25,
                                              width: 80,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5)),
                                                color: Color(0xFF69F0AE),
                                              ),
                                              child: Column(
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text('20%',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                      )),
                                                ],
                                              )),
                                        ),
                                        GestureDetector(
                                          onTap: (() async =>
                                              await PurchaseApi.purchasePackage(
                                                  list[1])),
                                          child: Container(
                                              constraints: BoxConstraints(
                                                  maxWidth: 300.0,
                                                  minHeight: 60.0),
                                              alignment: Alignment.center,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            3, 8, 3, 3),
                                                    child: Text(
                                                      '\€12.99 ',
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Pago Trimestral',
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.white),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(3.0),
                                                    child: Text(
                                                      'El precio de una entrada de cine y palomitas',
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              // height: 60.0,
                              child: GestureDetector(
                                onTap: () {
                                  // _launchURL(instagramUrl);
                                },
                                child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            // Color(0xFFED74CE),
                                            // Color(0xFF522AEA),
                                            Color(0xFF7B4EFF),
                                            Color(0xFF41C2FF),
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                              height: 25,
                                              width: 80,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5)),
                                                color: Color(0xFF69F0AE),
                                              ),
                                              child: Column(
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text('50%',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                      )),
                                                ],
                                              )),
                                        ),
                                        GestureDetector(
                                          onTap: (() async =>
                                              await PurchaseApi.purchasePackage(
                                                  list[2])),
                                          child: Container(
                                              constraints: BoxConstraints(
                                                  maxWidth: 300.0,
                                                  minHeight: 60.0),
                                              alignment: Alignment.center,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            3, 8, 3, 3),
                                                    child: Text(
                                                      '\€29.99',
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Pago Anual',
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.white),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(3.0),
                                                    child: Text(
                                                      'El precio de una cena en un restaurante',
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              )),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Text('Empty data');
                      }
                    } else {
                      return Text('');
                    }
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Cancela cuando quieras *'),
                SizedBox(
                  height: 5,
                ),
                TextButton(
                    child: Text("¿Por qué pagar por una app?",
                        style: TextStyle(fontSize: 18)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(12)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 102, 12, 212)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 102, 12, 212))))),
                    onPressed: () => Navigator.pushNamed(context, '/copy')),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    // PurchaseApi.restorePurchases();
                  },
                  child: Text(
                    'Restaurar compras',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                )

/*
try {
  PurchaserInfo restoredInfo = await Purchases.restoreTransactions();
  // ... check restored purchaserInfo to see if entitlement is now active
} on PlatformException catch (e) {
  // Error restoring purchases
}
                */
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String titleText;
  final String subtitleText;

  const CustomListTile({required this.titleText, required this.subtitleText})
      : assert(titleText != null),
        assert(subtitleText != null),
        super();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.check_circle,
        color: Color(0xFF7C4DFF),
      ),
      title: Text(
        titleText,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitleText,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
      ),
    );
  }
}

class BoldText extends StatelessWidget {
  final String boldText;

  const BoldText({required this.boldText})
      : assert(boldText != null),
        super();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        boldText,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
