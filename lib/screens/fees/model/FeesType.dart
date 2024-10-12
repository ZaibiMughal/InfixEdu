import 'package:nb_utils/nb_utils.dart';

class FeeType {
  int id;
  String name;
  dynamic description;
  int createdBy;
  int updatedBy;
  int schoolId;
  int academicId;
  DateTime createdAt;
  DateTime updatedAt;
  int feesGroupId;
  String type;
  dynamic courseId;

  FeeType({
    this.id,
    this.name,
    this.description,
    this.createdBy,
    this.updatedBy,
    this.schoolId,
    this.academicId,
    this.createdAt,
    this.updatedAt,
    this.feesGroupId,
    this.type,
    this.courseId,
  });

  factory FeeType.fromJson(Map<String, dynamic> json) {
    return FeeType(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      createdBy: json["created_by"].toString().toInt(),
      updatedBy: json["updated_by"].toString().toInt(),
      schoolId: json["school_id"].toString().toInt(),
      academicId: json["academic_id"].toString().toInt(),
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      feesGroupId: json["fees_group_id"].toString().toInt(),
      type: json["type"],
      courseId: json["course_id"],
    );
  }
}

class FeeTypeList {
  List<FeeType> feeTypes;

  FeeTypeList(this.feeTypes);

  factory FeeTypeList.fromJson(List<dynamic> json) {
    List<FeeType> feeTypeList = [];

    feeTypeList = json.map((i) => FeeType.fromJson(i)).toList();

    return FeeTypeList(feeTypeList);
  }
}
