import 'package:flutter_motels_nearby_test/app/models/data_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
    @JsonKey(name: 'sucesso') required bool success,
    @JsonKey(name: 'data') required DataModel data,
    @JsonKey(name: 'mensagem') required List<String> messages,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}
