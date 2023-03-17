class OrderServicesResponseModel {
  int id;
  int status;
  String? code;
  Expert? expert;
  Car car;
  HealthCarRecord? healthCarRecord;
  Order order;
  List<OrderServiceDetails>? orderServiceDetails;

  OrderServicesResponseModel({
    required this.id,
    required this.status,
    this.expert,
    this.code,
    required this.car,
    this.healthCarRecord,
    required this.order,
    required this.orderServiceDetails,
  });

  factory OrderServicesResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderServicesResponseModel(
      id: json['id'],
      status: json['status'],
      code: json['code'],
      expert: json['expert'] != null ? Expert.fromJson(json['expert']) : null,
      car: Car.fromJson(json['car']),
      healthCarRecord: json['healthCarRecord'] != null
          ? HealthCarRecord.fromJson(json['healthCarRecord'])
          : null,
      order: Order.fromJson(json['order']),
      orderServiceDetails: json['orderServiceDetails'] != null
          ? List<OrderServiceDetails>.from(json['orderServiceDetails']
              .map((x) => OrderServiceDetails.fromJson(x)))
          : null,
    );
  }
}

class Expert {
  int id;
  String fullname;
  String? phone; // nullable property
  String email;
  String? gender; // nullable property

  Expert({
    required this.id,
    required this.fullname,
    this.phone,
    required this.email,
    this.gender,
  });

  factory Expert.fromJson(Map<String, dynamic> json) {
    return Expert(
      id: json['id'],
      fullname: json['fullname'],
      phone: json['phone'],
      email: json['email'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullname': fullname,
        'phone': phone,
        'email': email,
        'gender': gender,
      };
}

class Car {
  int id;
  String carLisenceNo;
  String carBrand;
  String carModel;

  Car({
    required this.id,
    required this.carLisenceNo,
    required this.carBrand,
    required this.carModel,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      carLisenceNo: json['carLisenceNo'],
      carBrand: json['carBrand'],
      carModel: json['carModel'],
    );
  }
}

class HealthCarRecord {
  int id;
  String? symptom;
  String createdAt;
  String updatedAt;

  HealthCarRecord({
    required this.id,
    this.symptom,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HealthCarRecord.fromJson(Map<String, dynamic> json) {
    return HealthCarRecord(
      id: json['id'],
      symptom: json['symptom'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class Order {
  int id;
  String createdAt;
  String updatedAt;
  User user;
  Transaction? transaction;

  Order({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.transaction,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      user: User.fromJson(json['user']),
      transaction: json['transaction'] != null
          ? Transaction.fromJson(json['transaction'])
          : null,
    );
  }
}

class User {
  String fullname;
  String phone;
  String? email;
  bool? gender;

  User({
    required this.fullname,
    required this.phone,
    this.email,
    this.gender,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullname: json['fullname'],
      phone: json['phone'],
      email: json['email'],
      gender: json['gender'],
    );
  }
}

class Transaction {
  int total;
  int paymentMethod;

  Transaction({
    required this.total,
    required this.paymentMethod,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      total: json['total'],
      paymentMethod: json['paymentMethod'],
    );
  }
}

class OrderServiceDetails {
  int? id;
  int? price;
  bool? isConfirmed;
  Item? item;

  OrderServiceDetails({this.id, this.price, this.isConfirmed, this.item});

  OrderServiceDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    isConfirmed = json['isConfirmed'];
    item = json['item'] != null ? Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['isConfirmed'] = isConfirmed;
    if (item != null) {
      data['item'] = item!.toJson();
    }
    return data;
  }

  Map<String, dynamic> toJsonLesser() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isConfirmed'] = isConfirmed;
    return data;
  }
}

class Item {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? description;
  String? photo;
  Category? category;

  Item(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.description,
      this.photo,
      this.category});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    description = json['description'];
    photo = json['photo'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['description'] = description;
    data['photo'] = photo;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}