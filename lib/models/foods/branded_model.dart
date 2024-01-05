//generated from app.quicktype.io (branded food)
//DO NOT TOUCH

import 'dart:convert';

BrandedFood brandedFoodFromJson(String str) =>
    BrandedFood.fromJson(json.decode(str));

String brandedFoodToJson(BrandedFood data) => json.encode(data.toJson());

class BrandedFood {
  String? discontinuedDate;
  List<dynamic>? foodComponents;
  List<FoodAttribute>? foodAttributes;
  List<dynamic>? foodPortions;
  String? fdcId;
  String? description;
  String? publicationDate;
  List<FoodNutrient>? foodNutrients;
  String? dataType;
  String? foodClass;
  String? modifiedDate;
  String? availableDate;
  String? brandOwner;
  String? brandName;
  String? dataSource;
  String? brandedFoodCategory;
  String? gtinUpc;
  String? ingredients;
  String? marketCountry;
  String? servingSize;
  String? servingSizeUnit;
  String? packageWeight;
  List<BrandedFood>? foodUpdateLog;
  Map<String, LabelNutrient>? labelNutrients;
  String? subbrandName;
  String? notaSignificantSourceOf;

  BrandedFood({
    this.discontinuedDate,
    this.foodComponents,
    this.foodAttributes,
    this.foodPortions,
    this.fdcId,
    this.description,
    this.publicationDate,
    this.foodNutrients,
    this.dataType,
    this.foodClass,
    this.modifiedDate,
    this.availableDate,
    this.brandOwner,
    this.brandName,
    this.dataSource,
    this.brandedFoodCategory,
    this.gtinUpc,
    this.ingredients,
    this.marketCountry,
    this.servingSize,
    this.servingSizeUnit,
    this.packageWeight,
    this.foodUpdateLog,
    this.labelNutrients,
    this.subbrandName,
    this.notaSignificantSourceOf,
  });

  factory BrandedFood.fromJson(Map<String, dynamic> json) => BrandedFood(
        discontinuedDate: json["discontinuedDate"],
        foodComponents: json["foodComponents"] == null
            ? []
            : List<dynamic>.from(json["foodComponents"]!.map((x) => x)),
        foodAttributes: json["foodAttributes"] == null
            ? []
            : List<FoodAttribute>.from(
                json["foodAttributes"]!.map((x) => FoodAttribute.fromJson(x))),
        foodPortions: json["foodPortions"] == null
            ? []
            : List<dynamic>.from(json["foodPortions"]!.map((x) => x)),
        fdcId: json["fdcId"].toString(),
        description: json["description"],
        publicationDate: json["publicationDate"],
        foodNutrients: json["foodNutrients"] == null
            ? []
            : List<FoodNutrient>.from(
                json["foodNutrients"]!.map((x) => FoodNutrient.fromJson(x))),
        dataType: json["dataType"],
        foodClass: json["foodClass"],
        modifiedDate: json["modifiedDate"],
        availableDate: json["availableDate"],
        brandOwner: json["brandOwner"],
        brandName: json["brandName"],
        dataSource: json["dataSource"],
        brandedFoodCategory: json["brandedFoodCategory"],
        gtinUpc: json["gtinUpc"],
        ingredients: json["ingredients"],
        marketCountry: json["marketCountry"],
        servingSize: json["servingSize"].toString(),
        servingSizeUnit: json["servingSizeUnit"],
        packageWeight: json["packageWeight"],
        foodUpdateLog: json["foodUpdateLog"] == null
            ? []
            : List<BrandedFood>.from(
                json["foodUpdateLog"]!.map((x) => BrandedFood.fromJson(x))),
        labelNutrients: Map.from(json["labelNutrients"]!).map((k, v) =>
            MapEntry<String, LabelNutrient>(k, LabelNutrient.fromJson(v))),
        subbrandName: json["subbrandName"],
        notaSignificantSourceOf: json["notaSignificantSourceOf"],
      );

  Map<String, dynamic> toJson() => {
        "discontinuedDate": discontinuedDate,
        "foodComponents": foodComponents == null
            ? []
            : List<dynamic>.from(foodComponents!.map((x) => x)),
        "foodAttributes": foodAttributes == null
            ? []
            : List<dynamic>.from(foodAttributes!.map((x) => x.toJson())),
        "foodPortions": foodPortions == null
            ? []
            : List<dynamic>.from(foodPortions!.map((x) => x)),
        "fdcId": fdcId,
        "description": description,
        "publicationDate": publicationDate,
        "foodNutrients": foodNutrients == null
            ? []
            : List<dynamic>.from(foodNutrients!.map((x) => x.toJson())),
        "dataType": dataType,
        "foodClass": foodClass,
        "modifiedDate": modifiedDate,
        "availableDate": availableDate,
        "brandOwner": brandOwner,
        "brandName": brandName,
        "dataSource": dataSource,
        "brandedFoodCategory": brandedFoodCategory,
        "gtinUpc": gtinUpc,
        "ingredients": ingredients,
        "marketCountry": marketCountry,
        "servingSize": servingSize,
        "servingSizeUnit": servingSizeUnit,
        "packageWeight": packageWeight,
        "foodUpdateLog": foodUpdateLog == null
            ? []
            : List<dynamic>.from(foodUpdateLog!.map((x) => x.toJson())),
        "labelNutrients": Map.from(labelNutrients!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "subbrandName": subbrandName,
        "notaSignificantSourceOf": notaSignificantSourceOf,
      };
}

class FoodAttribute {
  String? id;
  String? value;
  String? name;

  FoodAttribute({
    this.id,
    this.value,
    this.name,
  });

  factory FoodAttribute.fromJson(Map<String, dynamic> json) => FoodAttribute(
        id: json["id"].toString(),
        value: json["value"].toString(),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "name": name,
      };
}

class FoodNutrient {
  Type? type;
  Nutrient? nutrient;
  FoodNutrientDerivation? foodNutrientDerivation;
  String? id;
  double? amount;

  FoodNutrient({
    this.type,
    this.nutrient,
    this.foodNutrientDerivation,
    this.id,
    this.amount,
  });

  factory FoodNutrient.fromJson(Map<String, dynamic> json) => FoodNutrient(
        type: typeValues.map[json["type"]]!,
        nutrient: json["nutrient"] == null
            ? null
            : Nutrient.fromJson(json["nutrient"]),
        foodNutrientDerivation: json["foodNutrientDerivation"] == null
            ? null
            : FoodNutrientDerivation.fromJson(json["foodNutrientDerivation"]),
        id: json["id"].toString(),
        amount: json["amount"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "nutrient": nutrient?.toJson(),
        "foodNutrientDerivation": foodNutrientDerivation?.toJson(),
        "id": id,
        "amount": amount,
      };
}

class FoodNutrientDerivation {
  String? id;
  Code? code;
  String? description;

  FoodNutrientDerivation({
    this.id,
    this.code,
    this.description,
  });

  factory FoodNutrientDerivation.fromJson(Map<String, dynamic> json) =>
      FoodNutrientDerivation(
        id: json["id"].toString(),
        code: codeValues.map[json["code"]]!,
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": codeValues.reverse[code],
        "description": description,
      };
}

enum Code { LCCD, LCCS }

final codeValues = EnumValues({"LCCD": Code.LCCD, "LCCS": Code.LCCS});

class Nutrient {
  String? id;
  String? number;
  String? name;
  String? rank;
  String? unitName;

  Nutrient({
    this.id,
    this.number,
    this.name,
    this.rank,
    this.unitName,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) => Nutrient(
        id: json["id"].toString(),
        number: json["number"],
        name: json["name"],
        rank: json["rank"].toString(),
        unitName: json["unitName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "name": name,
        "rank": rank,
        "unitName": unitName,
      };
}

enum Type { FOOD_NUTRIENT }

final typeValues = EnumValues({"FoodNutrient": Type.FOOD_NUTRIENT});

class LabelNutrient {
  double? value;

  LabelNutrient({
    this.value,
  });

  factory LabelNutrient.fromJson(Map<String, dynamic> json) => LabelNutrient(
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
