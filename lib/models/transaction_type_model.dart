class TransactionTypeModel {
  final int? id;
  final String? name;
  final String? code;
  final String? thumbnail;
  final String? action;

  TransactionTypeModel({
    this.id,
    this.name,
    this.code,
    this.thumbnail,
    this.action,
  });

  factory TransactionTypeModel.fromJson(Map<String, dynamic> json) {
    return TransactionTypeModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      action: json['action'],
      thumbnail: json['thumbnail'],
    );
  }
}
