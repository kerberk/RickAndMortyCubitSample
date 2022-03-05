// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Locations _$$_LocationsFromJson(Map<String, dynamic> json) => _$_Locations(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      locations: (json['results'] as List<dynamic>)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LocationsToJson(_$_Locations instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.locations,
    };
