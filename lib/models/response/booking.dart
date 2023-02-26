class BookingResponseModel {
  BookingResponseModel({
    required this.id,
    required this.code,
    required this.date,
    required this.isArrived,
    required this.isActived,
    required this.user,
    required this.car,
  });

  int id;
  String code;
  String date;
  bool isArrived;
  bool isActived;
  UserSlimResponse user;
  CarResponseModel car;

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) {
    return BookingResponseModel(
      id: json['id'],
      code: json['code'],
      date: json['date'],
      isArrived: json['isArrived'],
      isActived: json['isActived'],
      user: UserSlimResponse.fromJson(json['user']),
      car: CarResponseModel.fromJson(json['car']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'date': date,
        'isArrived': isArrived,
        'isActived': isActived,
        'user': user,
        'car': car,
      };
}

class UserSlimResponse {
  UserSlimResponse({
    required this.fullname,
    required this.phone,
    required this.email,
    required this.gender,
  });

  String fullname;
  String phone;
  String email;
  bool gender;

  factory UserSlimResponse.fromJson(Map<String, dynamic> json) {
    return UserSlimResponse(
      fullname: json['fullname'],
      phone: json['phone'],
      email: json['email'],
      gender: json['gender'],
    );
  }
}

class CarResponseModel {
  CarResponseModel({
    required this.id,
    required this.carLisenceNo,
    required this.carBrand,
    required this.carModel,
  });

  int id;
  String carLisenceNo;
  String carBrand;
  String carModel;

  factory CarResponseModel.fromJson(Map<String, dynamic> json) {
    return CarResponseModel(
      id: json['id'],
      carLisenceNo: json['carLisenceNo'],
      carBrand: json['carBrand'],
      carModel: json['carModel'],
    );
  }
}
