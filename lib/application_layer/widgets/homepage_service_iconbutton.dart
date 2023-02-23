import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/colors.dart';

class HomePageServiceIconButton extends StatelessWidget {
  const HomePageServiceIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: GestureDetector(
                  onTap: () {
                    //TODO
                  },
                  child: InkWell(
                      child: Image.asset(
                    "assets/image/icon-logo/homeservice-logo-rescue.png",
                    height: 40.h,
                    width: 40.w,
                  )),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Cứu hộ',
                style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTextColor,
                    fontFamily: 'SFProDisplay'),
              ),
            ]),
          ),
          SizedBox(
            width: 40.w,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: GestureDetector(
                onTap: () {
                  //TODO
                },
                child: InkWell(
                    child: Image.asset(
                  "assets/image/icon-logo/homeservice-logo-care.png",
                  height: 40.h,
                  width: 40.w,
                )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Cứu hộ',
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTextColor,
                  fontFamily: 'SFProDisplay'),
            ),
          ]),
          SizedBox(
            width: 40.w,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: GestureDetector(
                onTap: () {
                  //TODO
                },
                child: InkWell(
                    child: Image.asset(
                  "assets/image/icon-logo/homeservice-logo-fixing.png",
                  height: 40.h,
                  width: 40.w,
                )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Cứu hộ',
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTextColor,
                  fontFamily: 'SFProDisplay'),
            ),
          ]),
          SizedBox(
            width: 40.w,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: GestureDetector(
                onTap: () {
                  //TODO
                },
                child: InkWell(
                    child: Image.asset(
                  "assets/image/icon-logo/homeservice-logo-rescue.png",
                  height: 40.h,
                  width: 40.w,
                )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Cứu hộ',
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTextColor,
                  fontFamily: 'SFProDisplay'),
            ),
          ]),
          SizedBox(
            width: 40.w,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: GestureDetector(
                onTap: () {
                  //TODO
                },
                child: InkWell(
                    child: Image.asset(
                  "assets/image/icon-logo/homeservice-logo-maintanace.png",
                  height: 40.h,
                  width: 40.w,
                )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Cứu hộ',
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTextColor,
                  fontFamily: 'SFProDisplay'),
            ),
          ]),
          SizedBox(
            width: 40.w,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: GestureDetector(
                onTap: () {
                  //TODO
                },
                child: InkWell(
                    child: Image.asset(
                  "assets/image/icon-logo/homeservice-logo-accessary.png",
                  height: 40.h,
                  width: 40.w,
                )),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Cứu hộ',
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTextColor,
                  fontFamily: 'SFProDisplay'),
            ),
          ]),
        ],
      ),
    );
  }
}
