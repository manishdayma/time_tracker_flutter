// To parse this JSON data, do
//
//     final contractModel = contractModelFromMap(jsonString);

import 'dart:convert';

List<ContractModel> contractModelFromMap(String str) =>
    List<ContractModel>.from(
        json.decode(str).map((x) => ContractModel.fromMap(x)));

String contractModelToMap(List<ContractModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ContractModel {
  ContractModel({
    required this.contract,
    required this.active,
    required this.from,
    required this.to,
    required this.id,
  });

  String contract;
  bool active;
  String from;
  String to;
  String id;

  factory ContractModel.fromMap(Map<String, dynamic> json) => ContractModel(
        contract: json["contract"],
        active: json["active"],
        from: json["from"],
        to: json["to"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "contract": contract,
        "active": active,
        "from": from,
        "to": to,
        "id": id,
      };
}
