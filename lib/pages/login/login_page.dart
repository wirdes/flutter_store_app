import 'package:flutter/material.dart';
import 'package:flutter_store_app/pages/login/components/background.dart';
import 'package:flutter_store_app/pages/login/components/rounded_button.dart';
import 'package:flutter_store_app/pages/login/components/rounded_input_field.dart';
import 'package:flutter_store_app/utils/routes.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:flutter_store_app/app_colors.dart';

import 'package:snippet_coder_utils/ProgressHUD.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAPIcallProcess = false;
  String phone = "";
  GlobalKey<FormState> globalFromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ProgressHUD(
          child: Form(
            key: globalFromKey,
            child: _firstSide(size),
          ),
          key: UniqueKey(),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
        ),
      ),
    );
  }

  Background _firstSide(Size size) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            // SvgPicture.asset(
            //   "assets/icons/Kazan.svg",
            //   height: size.height * 0.28,
            // ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              keyboardType: TextInputType.number,
              icon: Icons.phone,
              hintText: "Telefon",
              onChanged: (value) {
                phone = value;
              },
            ),
            RoundedButton(
              text: "Giriş Yap",
              press: () {
                // setState(() {
                //   isAPIcallProcess = true;
                // });
                Navigator.pushNamed(context, AppRoutes.homeRoute);
                _showMyDialog("Store App", "Giriş Yapıldı");
              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog(String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: const Color(0x01000000),
      builder: (BuildContext context) {
        return Opacity(
          opacity: 1,
          child: AlertDialog(
            title: Center(
                child: Text(
              title,
              style: const TextStyle(color: appPrimaryColor),
            )),
            content: SingleChildScrollView(
              child: Text(
                message,
                style: const TextStyle(color: appPrimaryColor),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Tamam"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
