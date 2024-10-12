import 'package:nb_utils/nb_utils.dart';
class FeesRecord {
  int id;
  double amount;
  double weaver;
  double fine;
  double paidAmount;
  double subTotal;
  double balance;
  String student;
  String recordClass;
  String section;
  String status;
  String date;

  FeesRecord({
    this.id,
    this.amount,
    this.weaver,
    this.fine,
    this.paidAmount,
    this.subTotal,
    this.balance,
    this.student,
    this.recordClass,
    this.section,
    this.status,
    this.date,
  });

  factory FeesRecord.fromJson(Map<String, dynamic> json) {
    return FeesRecord(
      id: json["id"],
      amount: json["amount"].toString().toDouble(),
      weaver: json["weaver"].toString().toDouble(),
      fine: json["fine"].toString().toDouble(),
      paidAmount: json["paid_amount"].toString().toDouble(),
      subTotal: json["sub_total"].toString().toDouble(),
      balance: json["balance"].toString().toDouble(),
      student: json["student"],
      recordClass: json["class"],
      section: json["section"],
      status: json["status"],
      date: json["date"],
    );
  }
}

class FeesRecordList {
  List<FeesRecord> feesRecords;

  FeesRecordList({this.feesRecords});

  factory FeesRecordList.fromJson(List<dynamic> json) {
    List<FeesRecord> feesRecordList = [];

    feesRecordList = json.map((i) => FeesRecord.fromJson(i)).toList();

    return FeesRecordList(feesRecords : feesRecordList);
  }
}
