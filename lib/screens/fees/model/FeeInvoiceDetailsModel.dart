// To parse this JSON data, do
//
//     final feeInvoiceDetailsModel = feeInvoiceDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:nb_utils/nb_utils.dart';

FeeInvoiceDetailsModel feeInvoiceDetailsModelFromJson(String str) => FeeInvoiceDetailsModel.fromJson(json.decode(str));

String feeInvoiceDetailsModelToJson(FeeInvoiceDetailsModel data) => json.encode(data.toJson());

class FeeInvoiceDetailsModel {
    FeeInvoiceDetailsModel({
        this.invoiceInfo,
        this.invoiceDetails,
        this.banks,
        this.totalAmount,
        this.totalWeaver,
        this.totalPaidAmount,
        this.totalFine,
    });

    InvoiceInfo invoiceInfo;
    List<InvoiceDetail> invoiceDetails;
    List<FeeBank> banks;
    double totalAmount;
    double totalWeaver;
    double totalPaidAmount;
    double totalFine;

    factory FeeInvoiceDetailsModel.fromJson(Map<String, dynamic> json) => FeeInvoiceDetailsModel(
        invoiceInfo: InvoiceInfo.fromJson(json["invoiceInfo"]),
        invoiceDetails: List<InvoiceDetail>.from(json["invoiceDetails"].map((x) => InvoiceDetail.fromJson(x))),
        banks: List<FeeBank>.from(json["banks"].map((x) => FeeBank.fromJson(x))),
        totalAmount: json["totalAmount"].toString().toDouble(),
        totalWeaver: json["totalWeaver"].toString().toDouble(),
        totalPaidAmount: json["totalPaidAmount"].toString().toDouble(),
        totalFine: json["totalFine"].toString().toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "invoiceInfo": invoiceInfo.toJson(),
        "invoiceDetails": List<dynamic>.from(invoiceDetails.map((x) => x.toJson())),
        "banks": List<dynamic>.from(banks.map((x) => x.toJson())),
        "totalAmount": totalAmount,
        "totalWeaver": totalWeaver,
        "totalPaidAmount": totalPaidAmount,
        "totalFine": totalFine,
    };
}

class FeeBank {
    FeeBank({
        this.bankName,
        this.accountName,
        this.accountNumber,
        this.accountType,
    });

    String bankName;
    String accountName;
    String accountNumber;
    String accountType;

    factory FeeBank.fromJson(Map<String, dynamic> json) => FeeBank(
        bankName: json["bank_name"],
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        accountType: json["account_type"],
    );

    Map<String, dynamic> toJson() => {
        "bank_name": bankName,
        "account_name": accountName,
        "account_number": accountNumber,
        "account_type": accountType,
    };
}

class InvoiceDetail {
    InvoiceDetail({
        this.typeName,
        this.amount,
        this.weaver,
        this.fine,
        this.subTotal,
        this.total,
    });

    String typeName;
    double amount;
    double weaver;
    double fine;
    double subTotal;
    double total;

    factory InvoiceDetail.fromJson(Map<String, dynamic> json) => InvoiceDetail(
        typeName: json["typeName"],
        amount: json["amount"].toString().toDouble(),
        weaver: json["weaver"].toString().toDouble(),
        fine: json["fine"].toString().toDouble(),
        subTotal: json["sub_total"].toString().toDouble(),
        total: json["total"].toString().toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "typeName": typeName,
        "amount": amount,
        "weaver": weaver,
        "fine": fine,
        "sub_total": subTotal,
        "total": total,
    };
}

class InvoiceInfo {
    InvoiceInfo({
        this.id,
        this.invoiceId,
        this.studentId,
        this.classId,
        this.createDate,
        this.dueDate,
        this.paymentStatus,
        this.paymentMethod,
        this.bankId,
        this.type,
        this.schoolId,
        this.academicId,
        this.createdAt,
        this.updatedAt,
        this.recordId,
    });

    int id;
    String invoiceId;
    int studentId;
    int classId;
    DateTime createDate;
    DateTime dueDate;
    String paymentStatus;
    dynamic paymentMethod;
    dynamic bankId;
    String type;
    int schoolId;
    int academicId;
    DateTime createdAt;
    DateTime updatedAt;
    int recordId;

    factory InvoiceInfo.fromJson(Map<String, dynamic> json) => InvoiceInfo(
        id: json["id"],
        invoiceId: json["invoice_id"],
        studentId: json["student_id"].toString().toInt(),
        classId: json["class_id"].toString().toInt(),
        createDate: DateTime.parse(json["create_date"]),
        dueDate: DateTime.parse(json["due_date"]),
        paymentStatus: json["payment_status"],
        paymentMethod: json["payment_method"],
        bankId: json["bank_id"],
        type: json["type"],
        schoolId: json["school_id"].toString().toInt(),
        academicId: json["academic_id"].toString().toInt(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        recordId: json["record_id"].toString().toInt(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "invoice_id": invoiceId,
        "student_id": studentId,
        "class_id": classId,
        "create_date": "${createDate.year.toString().padLeft(4, '0')}-${createDate.month.toString().padLeft(2, '0')}-${createDate.day.toString().padLeft(2, '0')}",
        "due_date": "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
        "payment_status": paymentStatus,
        "payment_method": paymentMethod,
        "bank_id": bankId,
        "type": type,
        "school_id": schoolId,
        "academic_id": academicId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "record_id": recordId,
    };
}
