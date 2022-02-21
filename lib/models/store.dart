// Developed by: Eng Mouaz M. Al-Shahmeh
class StoreModel {
  int? id;
  String? username;
  String? password;
  String? storeName;
  String? webUrl;
  String? logo;
  String? coverImage;
  String? email;
  String? phone;
  String? description;
  String? facebook;
  String? twitter;
  String? instagram;
  String? linkedin;
  String? youtube;
  int? status;
  String? createdAt;
  String? updatedAt;

  // ignore: sort_constructors_first
  StoreModel({
    this.id,
    this.username,
    this.password,
    this.storeName,
    this.webUrl,
    this.logo,
    this.coverImage,
    this.phone,
    this.email,
    this.description,
    this.facebook,
    this.twitter,
    this.instagram,
    this.linkedin,
    this.youtube,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  // ignore: sort_constructors_first
  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    storeName = json['store_name'];
    webUrl = json['web_url'];
    logo = json['logo'];
    coverImage = json['cover_image'];
    phone = json['phone'];
    email = json['email'];
    description = json['description'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    instagram = json['instagram'];
    linkedin = json['linkedin'];
    youtube = json['youtube'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['store_name'] = storeName;
    data['web_url'] = webUrl;
    data['logo'] = logo;
    data['cover_image'] = coverImage;
    data['phone'] = phone;
    data['email'] = email;
    data['description'] = description;
    data['facebook'] = facebook;
    data['twitter'] = twitter;
    data['instagram'] = instagram;
    data['linkedin'] = linkedin;
    data['youtube'] = youtube;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
