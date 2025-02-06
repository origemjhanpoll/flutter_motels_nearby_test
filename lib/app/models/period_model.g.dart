// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PeriodModelImpl _$$PeriodModelImplFromJson(Map<String, dynamic> json) =>
    _$PeriodModelImpl(
      formattedTime: json['formattedTime'] as String,
      time: json['time'] as String,
      price: (json['price'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      hasCourtesy: json['hasCourtesy'] as bool,
      discount: json['discount'] == null
          ? null
          : DiscountModel.fromJson(json['discount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PeriodModelImplToJson(_$PeriodModelImpl instance) =>
    <String, dynamic>{
      'formattedTime': instance.formattedTime,
      'time': instance.time,
      'price': instance.price,
      'totalPrice': instance.totalPrice,
      'hasCourtesy': instance.hasCourtesy,
      'discount': instance.discount,
    };
