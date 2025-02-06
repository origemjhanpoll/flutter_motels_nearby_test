// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuiteModelImpl _$$SuiteModelImplFromJson(Map<String, dynamic> json) =>
    _$SuiteModelImpl(
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      showAvailableQuantity: json['showAvailableQuantity'] as bool,
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryItems: (json['categoryItems'] as List<dynamic>)
          .map((e) => CategoryItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      periods: (json['periods'] as List<dynamic>)
          .map((e) => PeriodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SuiteModelImplToJson(_$SuiteModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'showAvailableQuantity': instance.showAvailableQuantity,
      'photos': instance.photos,
      'items': instance.items,
      'categoryItems': instance.categoryItems,
      'periods': instance.periods,
    };
