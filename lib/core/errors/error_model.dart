class ErrorModel {
  List<Error>? errors;

  ErrorModel({this.errors});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        errors: (json['errors'] as List<dynamic>?)
            ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'errors': errors?.map((e) => e.toJson()).toList(),
      };
}

class Error {
  String? type;
  String? value;
  String? msg;
  String? path;
  String? location;

  Error({this.type, this.value, this.msg, this.path, this.location});

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        type: json['type'] as String?,
        value: json['value'] as String?,
        msg: json['msg'] as String?,
        path: json['path'] as String?,
        location: json['location'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
        'msg': msg,
        'path': path,
        'location': location,
      };
}
