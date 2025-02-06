// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MotelModelImpl _$$MotelModelImplFromJson(Map<String, dynamic> json) =>
    _$MotelModelImpl(
      name: json['name'] as String,
      logo: json['logo'] as String,
      neighborhood: json['neighborhood'] as String,
      distance: (json['distance'] as num).toDouble(),
      favoritesCount: (json['favoritesCount'] as num).toInt(),
      suites: (json['suites'] as List<dynamic>)
          .map((e) => SuiteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$MotelModelImplToJson(_$MotelModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'logo': instance.logo,
      'neighborhood': instance.neighborhood,
      'distance': instance.distance,
      'favoritesCount': instance.favoritesCount,
      'suites': instance.suites,
      'reviewsCount': instance.reviewsCount,
      'rating': instance.rating,
    };
