class Local {
  // Attributes

  final String name;
  final String value;
  final String time;

  // Constructor

  Local({
    required this.name,
    required this.value,
    required this.time,
  });

  // convert Json to an car object object
  factory Local.fromJson(Map<String, dynamic> json) {
    return Local(
      name: json["name"].toString(),
      value: json["value"].toString(),
      time: json["time"].toString(),
    );
  }
}
