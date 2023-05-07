import 'dart:convert';

import 'package:empiregarage_mobile/models/response/brand.dart';
import 'package:empiregarage_mobile/services/car_service/car_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/colors.dart';
import '../../../models/notification.dart';
import '../../../models/response/booking.dart';
import '../../../services/notification/notification_service.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../widgets/add_new_car_successfully.dart';

class AddNewCar extends StatefulWidget {
  final Function(int) onAddCar;
  const AddNewCar({super.key, required this.onAddCar});

  @override
  State<AddNewCar> createState() => _AddNewCarState();
}

class _AddNewCarState extends State<AddNewCar> {
  var carModel = "";
  var carBrand = "";
  var carLisenceNo = "";

  List<BrandResponseModel> _brands = [];
  List<BrandResponseModel> _filteredBrands = [];
  List<ModelResponseModel> _models = [];
  List<ModelResponseModel> _filteredModels = [];

  _getBrands() async {
    var brands = await CarService().getBrand();
    setState(() {
      _brands = brands;
    });
  }

  _getModels(BrandResponseModel brand) {
    setState(() {
      _models = brand.models;
    });
  }

  _clearModel() {
    setState(() {
      _modelController.clear();
      carModel = "";
    });
  }

  @override
  void initState() {
    super.initState();
    _getBrands();
  }

  final _lisenceNoController = TextEditingController();
  final _brandController = TextEditingController();
  final _modelController = TextEditingController();

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = _lisenceNoController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Không được bỏ trống';
    }
    const pattern = r'[A-Za-z]{1,3}-[0-9]{1,5}';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(text)) {
      return 'Biển số xe không hợp lệ';
    }
    // return null if the text is valid
    return null;
  }

  String? get _errorBrandText {
    // at any time, we can get the text from _controller.value.text
    final text = _brandController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Không được bỏ trống';
    }
    // return null if the text is valid
    return null;
  }

  _popContext() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.loginScreenBackGround,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 52.h,
                  ),
                  Stack(alignment: Alignment.centerLeft, children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.blackTextColor,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Thêm phương tiện",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackTextColor,
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Biển số xe *",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _lisenceNoController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(26)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.loginScreenBackGround),
                                borderRadius: BorderRadius.circular(26)),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            filled: true,
                            hintText: "Nhập biển số xe của bạn",
                            errorText: _errorText,
                          ),
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightTextColor,
                          ),
                          onChanged: (value) {
                            setState(() {
                              carLisenceNo = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Hãng xe *",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: _brandController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(26)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.loginScreenBackGround),
                                    borderRadius: BorderRadius.circular(26)),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                filled: true,
                                hintText: "Nhập hãng xe",
                                errorText: _errorBrandText),
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightTextColor,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _filteredBrands = _brands
                                    .where((element) => element.name
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                              });
                            },
                          ),
                          suggestionsCallback: (pattern) async {
                            return _filteredBrands;
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion.name),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            setState(() {
                              _brandController.text = suggestion.name;
                              carBrand = suggestion.name;
                              _clearModel();
                            });
                            _getModels(suggestion);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Dòng xe",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: _modelController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(26)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.loginScreenBackGround),
                                  borderRadius: BorderRadius.circular(26)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              filled: true,
                              hintText: "Nhập dòng xe",
                            ),
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightTextColor,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _filteredModels = _models
                                    .where((element) => element.name
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList();
                              });
                            },
                          ),
                          suggestionsCallback: (pattern) async {
                            return _filteredModels;
                          },
                          itemBuilder: (context, suggestion) {
                            return ListTile(
                              title: Text(suggestion.name),
                            );
                          },
                          onSuggestionSelected: (suggestion) {
                            setState(() {
                              _modelController.text = suggestion.name;
                              carModel = suggestion.name;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_errorText != null || _errorBrandText != null) {
                              return;
                            }
                            var response = await CarService()
                                .addNewCar(carLisenceNo, carBrand, carModel);

                            // ignore: unnecessary_null_comparison
                            if (response == null ||
                                response.statusCode != 201) {
                              // ignore: use_build_context_synchronously
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => const AddNewCarSuccessfully());
                            } else {
                              var notificationModel = NotificationModel(
                                  isAndroiodDevice: true,
                                  title: "Empire Garage",
                                  body: "Your car has been created successful");
                              await NotificationService()
                                  .sendNotification(notificationModel);
                              // ignore: use_build_context_synchronously
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        title: Text(
                                          "Success To Add new car",
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.blueTextColor),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              _popContext();
                                              widget.onAddCar(
                                                  CarResponseModel.fromJson(
                                                          json.decode(
                                                              response.body))
                                                      .id);
                                            },
                                          ),
                                        ]);
                                  });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonColor,
                            fixedSize: Size.fromHeight(50.w),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          child: Text(
                            'Xác nhận',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
