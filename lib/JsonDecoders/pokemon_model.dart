import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon_guides_app/Datas/pokemon_type.dart';

@JsonSerializable()
class PokemonModel {
  PokemonModel(
      this.name,
      this.id,
      this.imageUrl,
      this.xDescription,
      this.yDescription,
      this.height,
      this.category,
      this.weight,
      this.types,
      this.weaknesses,
      this.evolutions,
      this.abilities,
      this.hp,
      this.attack,
      this.defense,
      this.specialAttack,
      this.specialDefense,
      this.speed,
      this.total,
      this.genderMalePercentage,
      this.genderFemalePercentage,
      this.genderless,
      this.cycles,
      this.eggGroups,
      this.evolvedFrom,
      this.reason,
      this.baseExp,
      );

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);

  @JsonKey(disallowNullValue: true)
  final String name;

  @JsonKey(disallowNullValue: true)
  final String id;

  @JsonKey(name: 'imageurl', disallowNullValue: true)
  final String imageUrl;

  @JsonKey(name: 'xdescription', defaultValue: '')
  final String xDescription;

  @JsonKey(name: 'ydescription', defaultValue: '')
  final String yDescription;

  @JsonKey(defaultValue: '')
  final String height;

  @JsonKey(defaultValue: '')
  final String category;

  @JsonKey(defaultValue: '')
  final String weight;

  @JsonKey(name: 'typeofpokemon', disallowNullValue: true)
  final List<PokemonTypes>? types;

  @JsonKey(defaultValue: [])
  final List<String>? weaknesses;

  @JsonKey(defaultValue: [])
  final List<String>? evolutions;

  @JsonKey(defaultValue: [])
  final List<String>? abilities;

  @JsonKey(disallowNullValue: true)
  final num hp;

  @JsonKey(disallowNullValue: true)
  final num attack;

  @JsonKey(disallowNullValue: true)
  final num defense;

  @JsonKey(name: 'special_attack', disallowNullValue: true)
  final num specialAttack;

  @JsonKey(name: 'special_defense', disallowNullValue: true)
  final num specialDefense;

  @JsonKey(disallowNullValue: true)
  final num speed;

  @JsonKey(disallowNullValue: true)
  final num total;

  @JsonKey(name: 'male_percentage', disallowNullValue: true)
  final String genderMalePercentage;

  @JsonKey(name: 'female_percentage', disallowNullValue: true)
  final String genderFemalePercentage;

  @JsonKey(disallowNullValue: true)
  final num genderless;

  @JsonKey(defaultValue: '')
  final String cycles;

  @JsonKey(name: 'egg_groups', disallowNullValue: true)
  final String eggGroups;

  @JsonKey(name: 'evolvedfrom')
  final String evolvedFrom;

  @JsonKey(defaultValue: '')
  final String reason;

  @JsonKey(name: 'base_exp', defaultValue: '0')
  final String baseExp;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const [
    'name',
    'id',
    'imageurl',
    'typeofpokemon',
    'hp',
    'attack',
    'defense',
    'special_attack',
    'special_defense',
    'speed',
    'total',
    'male_percentage',
    'female_percentage',
    'genderless',
    'egg_groups'
  ]);
  return PokemonModel(
    json['name'] as String,
    json['id'] as String,
    json['imageurl'] as String,
    (json['xdescription'] ?? '') as String,
    (json['ydescription'] ?? '') as String,
    (json['height']?? '') as String,
    (json['category'] ?? '') as String,
    (json['weight'] ?? '') as String,
    (json['typeofpokemon'] as List).map((e) => PokemonTypesX.parse(e as String)).toList(),
    (json['weaknesses'] as List).map((e) => e as String).toList(),
    (json['evolutions'] as List).map((e) => e as String).toList(),
    (json['abilities'] as List).map((e) => e as String).toList(),
    json['hp'] as num,
    json['attack'] as num,
    json['defense'] as num,
    json['special_attack'] as num,
    json['special_defense'] as num,
    json['speed'] as num,
    json['total'] as num,
    (json['male_percentage'] ?? '') as String,
    (json['female_percentage'] ?? '') as String,
    json['genderless'] as num,
    (json['cycles'] ?? '') as String,
    json['egg_groups'] as String,
    json['evolvedfrom'] as String,
    (json['reason'] ?? '') as String,
    (json['base_exp'] ?? '0') as String,
  );
}

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('id', instance.id);
  writeNotNull('imageurl', instance.imageUrl);
  val['xdescription'] = instance.xDescription;
  val['ydescription'] = instance.yDescription;
  val['height'] = instance.height;
  val['category'] = instance.category;
  val['weight'] = instance.weight;
  writeNotNull('typeofpokemon', instance.types);
  val['weaknesses'] = instance.weaknesses;
  val['evolutions'] = instance.evolutions;
  val['abilities'] = instance.abilities;
  writeNotNull('hp', instance.hp);
  writeNotNull('attack', instance.attack);
  writeNotNull('defense', instance.defense);
  writeNotNull('special_attack', instance.specialAttack);
  writeNotNull('special_defense', instance.specialDefense);
  writeNotNull('speed', instance.speed);
  writeNotNull('total', instance.total);
  writeNotNull('male_percentage', instance.genderMalePercentage);
  writeNotNull('female_percentage', instance.genderFemalePercentage);
  writeNotNull('genderless', instance.genderless);
  val['cycles'] = instance.cycles;
  writeNotNull('egg_groups', instance.eggGroups);
  val['evolvedfrom'] = instance.evolvedFrom;
  val['reason'] = instance.reason;
  val['base_exp'] = instance.baseExp;
  return val;
}
