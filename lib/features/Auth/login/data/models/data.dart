class Data {
  String? id;
  String? name;
  String? email;

  Data({this.id, this.name, this.email});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
      };
}
