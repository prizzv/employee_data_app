import 'dart:convert';

class Employee {
  String id;
  String name;
  String organizationName;
  String position;
  int age;
  DateTime joiningDate;
  DateTime? leavingDate;
  int v;
  bool active;

  Employee({
    required this.id,
    required this.name,
    required this.organizationName,
    required this.position,
    required this.age,
    required this.joiningDate,
    this.leavingDate,
    required this.v,
    required this.active,
  });

  factory Employee.fromRawJson(String str) =>
      Employee.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["_id"],
        name: json["name"],
        organizationName: json["organizationName"],
        position: json["position"],
        age: json["age"],
        joiningDate: DateTime.parse(json["joining_date"]),
        leavingDate: json["leaving_date"] == null
            ? null
            : DateTime.parse(json["leaving_date"]),
        v: json["__v"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "organizationName": organizationName,
        "position": position,
        "age": age,
        "joining_date": joiningDate.toIso8601String(),
        "leaving_date": leavingDate?.toIso8601String(),
        "__v": v,
        "active": active,
      };
}
