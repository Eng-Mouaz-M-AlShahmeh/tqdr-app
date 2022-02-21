// Developed by: Eng Mouaz M. Al-Shahmeh
class InvoiceModel {
  int? id;
  String? amount;
  String? remainingAmount;
  String? isPaid;
  String? status;
  String? serviceProviderId;
  String? createdAt;
  String? updatedAt;

  // ignore: sort_constructors_first
  InvoiceModel({
    this.id,
    this.amount,
    this.remainingAmount,
    this.isPaid,
    this.status,
    this.serviceProviderId,
    this.createdAt,
    this.updatedAt,
  });

  // ignore: sort_constructors_first
  InvoiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'].toString();
    remainingAmount = json['remaining_amount'].toString();
    isPaid = json['is_paid'].toString();
    status = json['status'].toString();
    serviceProviderId = json['service_provider_id'].toString();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['remaining_amount'] = remainingAmount;
    data['is_paid'] = isPaid;
    data['status'] = status;
    data['service_provider_id'] = serviceProviderId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

}
