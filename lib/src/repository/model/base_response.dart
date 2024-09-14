import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

class BaseResponse<T> {
  BaseResponse({required this.statusCode, this.datas = const [], this.error});

  final int statusCode;
  final List<T> datas;
  final Err? error;

  BaseResponse<T> copyWith({
    int? statusCode,
    List<T>? datas,
    Err? error,
  }) =>
      BaseResponse(
        statusCode: statusCode ?? this.statusCode,
        datas: datas ?? this.datas,
        error: error ?? this.error,
      );
}

@JsonSerializable()
class Err {
  Err({required this.status, required this.code, required this.message});

  final String status;
  final String code;
  final String message;

  factory Err.fromJson(dynamic json) => _$ErrFromJson(json);
}
