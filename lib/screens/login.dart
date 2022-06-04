import 'package:election/models/bioMetric_auth.dart';
import 'package:election/models/main_model.dart';
import 'package:election/models/user_model.dart';
import 'package:election/screens/candidates.dart';
import 'package:election/shared/fonts_colors.dart';
import 'package:election/shared/helper_methods.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ssnController = TextEditingController();

  GlobalKey<FormState> userNameKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  GlobalKey<FormState> ssnKey = GlobalKey<FormState>();  

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Icon fingerPrintIcon = Icon(Icons.fingerprint, color: Colors.white, size: 50.0);

  bool showFingerPrint = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backGroundImage(),
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Center(
                child: Text(
                  '\nLogin as ${MainData.userType.toString().split('.')[1]}',
                  style: whiteLargeText,
                ),
              ),
                Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                color: Colors.white30,
                child: MainData.userType == UserType.judge ? _buildJudge() : _buidlVooter()
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildJudge() {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        field(
          'ssn',
          Icons.person,
          userNameController,
          userNameKey,
          false
        ),
        field(
          'password',
          Icons.lock,
          passwordController,
          passwordKey,
          true,
          onFieldSub: () async {
            if (passwordController.text.isNotEmpty) {
              showFingerPrint = true;
              if (passwordController.text.isNotEmpty && userNameController.text.isNotEmpty) {
                bool _valid =  await authenticateWithBiometrics();
                if (_valid) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    snack('Success', Colors.green)
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (_) {return CandidatesScreen();}));
                } else {
                  return ScaffoldMessenger.of(context).showSnackBar(
                    snack('Error', Colors.red)
                  );
                }
              }
            } else {
              showFingerPrint = false;
            }
            setState(() {
              
            });
          }
        ),
        showFingerPrint ? fingerPrintIcon : SizedBox()
      ]
    );
  }

  _buidlVooter() {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        field(
          'ssn',
          Icons.card_membership,
          ssnController,
          ssnKey,
          false,
          onFieldSub: () async {
            if (ssnController.text.isNotEmpty) {
              showFingerPrint = true;
              bool _valid =  await authenticateWithBiometrics();
              if (_valid) {
                return ScaffoldMessenger.of(context).showSnackBar(
                  snack('Success', Colors.green)
                );
              } else {
                return ScaffoldMessenger.of(context).showSnackBar(
                  snack('Error', Colors.red)
                );
              }
            } else {
              showFingerPrint = false;
            }
            setState(() {
              
            });
          }
        ),
        showFingerPrint ? fingerPrintIcon : SizedBox()
      ]
    );
  }


}