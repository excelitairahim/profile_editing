import 'package:fashion_design/otp_verification/otp_verification_Page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter_countdown_timer/index.dart';

import 'package:flutter/material.dart';
class SendOTPScreen extends StatelessWidget {
  const SendOTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController mobileNumber = TextEditingController();
      int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
    var appSignatureID;
    void submit() async {
      if (mobileNumber.text == "") return;

      appSignatureID = await SmsAutoFill().getAppSignature;
      Map sendOtpData = {
        "mobile_number": mobileNumber.text,
        "app_signature_id": appSignatureID
      };
      print(sendOtpData);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VerifyOTPScreen(
                  txtFormText: mobileNumber.text,
                  appSingnatureID: appSignatureID,
                )),
      );
    }

    return Scaffold(
      backgroundColor: Colors.pink,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFC2C0C0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: mobileNumber,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Mobile Number",
                     
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: submit,
                child: const Text("Submit"),
              )
           
           , 
          CountdownTimer(
            endTime: endTime,
            widgetBuilder: (_, CurrentRemainingTime? time) {
              if (time == null) {
                return Text('Game over');
              }
              return Text(
                  'days: [ ${time.days} ], hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
            },
          ),
      
            ],
          ),
        ),
      ),
    );
  }
}
