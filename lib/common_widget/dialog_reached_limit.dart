import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:test_de_leyes/common_widget/buttons.dart';
import 'package:test_de_leyes/common_widget/rate/review_dialog.dart';
import 'package:test_de_leyes/common_widget/rate/star.dart';

import '../../helpers/const.dart';
import '../../pages/menu/cubit/main_cubit.dart';

class DialogReachedLimit extends StatefulWidget {
  final String title, descriptions, text;

  const DialogReachedLimit(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.text})
      : super(key: key);

  @override
  _DialogReachedLimitState createState() => _DialogReachedLimitState();
}

class _DialogReachedLimitState extends State<DialogReachedLimit> {
  //final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(
        context,
      ),
    );
  }

  contentBox(context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  left: paddingDialog,
                  top: avatarRadius + paddingDialog,
                  right: paddingDialog,
                  bottom: paddingDialog),
              margin: const EdgeInsets.only(top: avatarRadius),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(paddingDialog),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 10),
                        blurRadius: 10),
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: GoogleFonts.creteRound(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 22),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Image(
                    image: AssetImage("assets/images/vip-card.png"),
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.descriptions,
                    style: GoogleFonts.creteRound(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MainButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/paywall");
                      },
                      text: "Ver Premium"),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Positioned(
              left: paddingDialog,
              right: paddingDialog,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: avatarRadius,
                child: ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(avatarRadius)),
                    child: Image.asset("assets/images/logo-leyes.png")),
              ),
            ),
          ],
        );
      },
    );
  }

  void checkRat(double rat) {}

  void setReviu(int rating, MainCubit bloc, BuildContext context) {
    bloc.setRate();
    //¡ bloc.add(DismissEvent());
    if (rating < 3) {
      Navigator.of(context).pop();
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return const CustomOpDialogBox(
                //AppLocalizations.of(context)?.start ??
                title: '¿Cómo podemos mejorar?',
                descriptions: "",
                text: "");
          });
    } else {
      /*  final InAppReview _inAppReview = InAppReview.instance;
      _inAppReview.requestReview();*/

      StoreRedirect.redirect(
        androidAppId: "com.test.leyes.oposiciones.estatutos.constitucion",
        iOSAppId: "",
      );

      Navigator.of(context).pop();
    }
  }
}
