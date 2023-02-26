import 'package:empiregarage_mobile/application_layer/screens/login/login_screen.dart';
import 'package:empiregarage_mobile/services/authen_firebase_services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../../common/colors.dart';

class OtpConfirmation extends StatefulWidget {
  final String countryCode;
  final String phoneNumber;
  const OtpConfirmation(
      {Key? key, required this.countryCode, required this.phoneNumber})
      : super(key: key);

  @override
  State<OtpConfirmation> createState() => _OtpConfirmationState();
}

class _OtpConfirmationState extends State<OtpConfirmation> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var otpCode = "";
    bool resentOTP = false;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.loginScreenBackGround,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 52.h,
                ),
                Text(
                  "Xác nhận OTP",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Chúng tôi đã gửi mã OTP tới SĐT",
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Pinput(
                  length: 6,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  // ignore: avoid_print
                  onCompleted: (pin) => print(pin),
                  onChanged: (value) {
                    otpCode = value;
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => AppAuthentication()
                            .confirmOTP(otpCode, auth, context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonColor,
                          fixedSize: Size.fromHeight(50.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Xác thực',
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: Text(
                        "Sửa số điện thoại ?",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackTextColor,
                          fontFamily: 'SFProDisplay',
                        ),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () async {
                        if (!resentOTP) {
                          await AppAuthentication().sendOTP(
                            context,
                            widget.countryCode,
                            widget.phoneNumber,
                          );
                          setState(() {
                            resentOTP == true;
                          });
                        }
                      },
                      child: Text(
                        "Gửi lại mã",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackTextColor,
                          fontFamily: 'SFProDisplay',
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
