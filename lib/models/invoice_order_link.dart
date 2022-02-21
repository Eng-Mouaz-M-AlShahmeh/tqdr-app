// Developed by: Eng Mouaz M. Al-Shahmeh
class InvoiceOrderLinkModel {
  int? id;
  String? amount;
  String? customerName;
  String? customerPhone;
  String? storeId;
  String? storeName;
  String? link;
  String? status;
  String? createdAt;
  String? updatedAt;

  // ignore: sort_constructors_first
  InvoiceOrderLinkModel({
    this.id,
    this.amount,
    this.customerName,
    this.customerPhone,
    this.storeId,
    this.storeName,
    this.link,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  // ignore: sort_constructors_first
  InvoiceOrderLinkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'].toString();
    customerName = json['customer_name'].toString();
    customerPhone = json['customer_phone'].toString();
    storeId = json['store_id'].toString();
    storeName = json['store_name'].toString();
    link = json['link'].toString();
    status = json['status'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['customer_name'] = customerName;
    data['customer_phone'] = customerPhone;
    data['store_id'] = storeId;
    data['store_name'] = storeName;
    data['link'] = link;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

}
