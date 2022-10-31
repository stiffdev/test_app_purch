import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:test_de_leyes/common_widget/rate/review_dialog.dart';
import 'package:test_de_leyes/common_widget/rate/star.dart';

import '../../helpers/const.dart';
import '../../pages/menu/cubit/main_cubit.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;

  const CustomDialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.text})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
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
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '',
                    //state.showOpDialog.toString(),
                    style: GoogleFonts.creteRound(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    widget.descriptions,
                    style: GoogleFonts.creteRound(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  StarWidget(
                    rating: 0,
                    onRatingChanged: (rating) {
                      //context.read<MainBloc>().add(DismissEvent());
                      setReviu(
                          rating.toInt(), context.read<MainCubit>(), context);
                      //Navigator.of(context).pop();
                      print(rating);
                    },
                  ),
                  const SizedBox(
                    height: 25,
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
