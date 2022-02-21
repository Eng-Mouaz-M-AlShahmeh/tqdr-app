// Developed by: Eng Mouaz M. Al-Shahmeh
class InvoiceOrderModel {
  int? id;
  String? amount;
  String? customerPhone;
  String? invoiceId;
  String? storeId;
  String? createdAt;
  String? updatedAt;

  // ignore: sort_constructors_first
  InvoiceOrderModel({
    this.id,
    this.amount,
    this.customerPhone,
    this.invoiceId,
    this.storeId,
    this.createdAt,
    this.updatedAt,
  });

  // ignore: sort_constructors_first
  InvoiceOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'].toString();
    customerPhone = json['customer_phone'].toString();
    invoiceId = json['invoice_id'].toString();
    storeId = json['store_id'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['customer_phone'] = customerPhone;
    data['invoice_id'] = invoiceId;
    data['store_id'] = storeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

}
