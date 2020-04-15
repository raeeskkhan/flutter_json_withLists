class EmployeeData {
  final String status;
  final List<Data> dataSet;

  EmployeeData({this.status, this.dataSet});

  factory EmployeeData.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    print(list.runtimeType);
    List<Data> listOfData = list.map((i) => Data.fromJson(i)).toList();

    return EmployeeData(
      status: parsedJson['status'],
      dataSet: listOfData,
    );
  }
}

//class FullDataSet {
//  String status;
//  var listOfData;
//
//  FullDataSet({this.status, this.listOfData});
//
//  factory FullDataSet.fromJson(Map<String, dynamic> json) {
//    print(json["data"]);
//    return FullDataSet(
//      status: json["status"],
//      listOfData: ListOfData.fromJson(json["data"]),
//    );
//  }
//}
//
//class ListOfData {
//  final List<Data> dataSet;
//
//  ListOfData({this.dataSet});
//
//  factory ListOfData.fromJson(List<dynamic> parsedJson) {
//    List<Data> dataSet = new List<Data>();
//
//    dataSet = parsedJson.map((i) => Data.fromJson(i)).toList();
//
//    return new ListOfData(dataSet: dataSet);
//  }
//}

class Data {
  String id;
  String employeeName;
  String employeeSalary;
  String employeeAge;
  String profileImage;

  Data(
      {this.id,
      this.employeeName,
      this.employeeSalary,
      this.employeeAge,
      this.profileImage});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      employeeSalary: json["employee_salary"],
      employeeAge: json["employee_age"],
      employeeName: json["employee_name"],
      profileImage: json["profile_image"],
    );
  }
}
