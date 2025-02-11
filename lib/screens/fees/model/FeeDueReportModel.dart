// To parse this JSON data, do
//
//     final feesDueReportModel = feesDueReportModelFromJson(jsonString);

import 'dart:convert';

import 'package:nb_utils/nb_utils.dart';

FeesDueReportModel feesDueReportModelFromJson(String str) =>
    FeesDueReportModel.fromJson(json.decode(str));

String feesDueReportModelToJson(FeesDueReportModel data) =>
    json.encode(data.toJson());

class FeesDueReportModel {
  FeesDueReportModel({
    this.feesDues,
  });

  List<FeesDue> feesDues;

  factory FeesDueReportModel.fromJson(Map<String, dynamic> json) =>
      FeesDueReportModel(
        feesDues: List<FeesDue>.from(json["feesDues"]
            .map((x) => x == null ? null : FeesDue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "feesDues": List<dynamic>.from(
            feesDues.map((x) => x?.toJson())),
      };
}

class FeesDue {
  FeesDue({
    this.admissionNo,
    this.rollNo,
    this.name,
    this.dueDate,
    this.amount,
    this.paid,
    this.waiver,
    this.fine,
    this.balance,
  });

  String admissionNo;
  String rollNo;
  String name;
  String dueDate;
  double amount;
  double paid;
  double waiver;
  double fine;
  double balance;

  factory FeesDue.fromJson(Map<String, dynamic> json) => FeesDue(
        admissionNo: json["admission_no"].toString(),
        rollNo: json["roll_no"].toString(),
        name: json["name"].toString(),
        dueDate: json["due_date"].toString(),
        amount: json["amount"].toString().toDouble(),
        paid: json["paid"].toString().toDouble(),
        waiver: json["waiver"].toString().toDouble(),
        fine: json["fine"].toString().toDouble(),
        balance: json["balance"].toString().toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "admission_no": admissionNo,
        "roll_no": rollNo,
        "name": name,
        "due_date": dueDate,
        "amount": amount,
        "paid": paid,
        "waiver": waiver,
        "fine": fine,
        "balance": balance,
      };
}
