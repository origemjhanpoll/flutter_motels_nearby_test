// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseModelImpl _$$ResponseModelImplFromJson(Map<String, dynamic> json) =>
    _$ResponseModelImpl(
      success: json['sucesso'] as bool,
      data: DataModel.fromJson(json['data'] as Map<String, dynamic>),
      messages:
          (json['mensagem'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ResponseModelImplToJson(_$ResponseModelImpl instance) =>
    <String, dynamic>{
      'sucesso': instance.success,
      'data': instance.data,
      'mensagem': instance.messages,
    };
