// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MotelModelImpl _$$MotelModelImplFromJson(Map<String, dynamic> json) =>
    _$MotelModelImpl(
      name: json['fantasia'] as String,
      logo: json['logo'] as String,
      neighborhood: json['bairro'] as String,
      distance: (json['distancia'] as num).toDouble(),
      favoritesCount: (json['qtdFavoritos'] as num).toInt(),
      suites: (json['suites'] as List<dynamic>)
          .map((e) => SuiteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewsCount: (json['qtdAvaliacoes'] as num).toInt(),
      rating: (json['media'] as num).toDouble(),
    );

Map<String, dynamic> _$$MotelModelImplToJson(_$MotelModelImpl instance) =>
    <String, dynamic>{
      'fantasia': instance.name,
      'logo': instance.logo,
      'bairro': instance.neighborhood,
      'distancia': instance.distance,
      'qtdFavoritos': instance.favoritesCount,
      'suites': instance.suites,
      'qtdAvaliacoes': instance.reviewsCount,
      'media': instance.rating,
    };
