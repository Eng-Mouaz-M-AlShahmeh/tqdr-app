// Developed by: Eng Mouaz M. Al-Shahmeh
class ServiceProviderModel {
  int? id;
  String? username;
  String? password;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  int? tqdrServicePrice;
  int? tqdrServiceVATPercentage;
  String? avatar;
  int? profitPercentage;
  int? profitFixedAmount;
  String? storeName;
  String? nighborhood;
  String? locationURL;
  int? status;
  int? active;
  String? createdAt;
  String? updatedAt;

  // ignore: sort_constructors_first
  ServiceProviderModel({
    this.id,
    this.username,
    this.password,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.tqdrServicePrice,
    this.tqdrServiceVATPercentage,
    this.avatar,
    this.profitPercentage,
    this.profitFixedAmount,
    this.storeName,
    this.nighborhood,
    this.locationURL,
    this.status,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  // ignore: sort_constructors_first
  ServiceProviderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    email = json['email'];
    tqdrServicePrice = json['tqdr_service_price'];
    tqdrServiceVATPercentage = json['tqdr_service_vat_percentage'];
    avatar = json['avatar'];
    profitPercentage = json['profit_percentage'];
    profitFixedAmount = json['profit_fixed_amount'];
    storeName = json['storeName'];
    nighborhood = json['nighborhood'];
    locationURL = json['locationURL'];
    status = json['status'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['tqdr_service_price'] = tqdrServicePrice;
    data['tqdrServiceVATPercentage'] = tqdrServiceVATPercentage;
    data['avatar'] = avatar;
    data['profitPercentage'] = profitPercentage;
    data['profitFixedAmount'] = profitFixedAmount;
    data['storeName'] = storeName;
    data['nighborhood'] = nighborhood;
    data['locationURL'] = locationURL;
    data['status'] = status;
    data['active'] = active;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
