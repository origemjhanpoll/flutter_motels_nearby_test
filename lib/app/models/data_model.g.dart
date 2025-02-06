// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataModelImpl _$$DataModelImplFromJson(Map<String, dynamic> json) =>
    _$DataModelImpl(
      page: (json['page'] as num).toInt(),
      itemsPerPage: (json['itemsPerPage'] as num).toInt(),
      totalSuites: (json['totalSuites'] as num).toInt(),
      totalMotels: (json['totalMotels'] as num).toInt(),
      radius: (json['radius'] as num).toDouble(),
      maxPages: (json['maxPages'] as num).toDouble(),
      motels: (json['motels'] as List<dynamic>)
          .map((e) => MotelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataModelImplToJson(_$DataModelImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'itemsPerPage': instance.itemsPerPage,
      'totalSuites': instance.totalSuites,
      'totalMotels': instance.totalMotels,
      'radius': instance.radius,
      'maxPages': instance.maxPages,
      'motels': instance.motels,
    };
