//generated from app.quicktype.io
//DO NOT TOUCH

import 'dart:convert';

FoodSearch foodSearchFromJson(String str) =>
    FoodSearch.fromJson(json.decode(str));

String foodSearchToJson(FoodSearch data) => json.encode(data.toJson());

class FoodSearch {
  String? totalHits;
  String? currentPage;
  String? totalPages;
  List<int>? pageList;
  FoodSearchCriteria? foodSearchCriteria;
  List<Food>? foods;
  Aggregations? aggregations;

  FoodSearch({
    this.totalHits,
    this.currentPage,
    this.totalPages,
    this.pageList,
    this.foodSearchCriteria,
    this.foods,
    this.aggregations,
  });

  factory FoodSearch.fromJson(Map<String, dynamic> json) => FoodSearch(
        totalHits: json["totalHits"].toString(),
        currentPage: json["currentPage"].toString(),
        totalPages: json["totalPages"].toString(),
        pageList: json["pageList"] == null
            ? []
            : List<int>.from(json["pageList"].map((x) => x)),
        foodSearchCriteria: json["foodSearchCriteria"] == null
            ? null
            : FoodSearchCriteria.fromJson(json["foodSearchCriteria"]),
        foods: json["foods"] == null
            ? []
            : List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
        aggregations: json["aggregations"] == null
            ? null
            : Aggregations.fromJson(json["aggregations"]),
      );

  Map<String, dynamic> toJson() => {
        "totalHits": totalHits,
        "currentPage": currentPage,
        "totalPages": totalPages,
        "pageList":
            pageList == null ? [] : List<dynamic>.from(pageList!.map((x) => x)),
        "foodSearchCriteria": foodSearchCriteria?.toJson(),
        "foods": foods == null
            ? []
            : List<dynamic>.from(foods!.map((x) => x.toJson())),
        "aggregations": aggregations?.toJson(),
      };
}

class Aggregations {
  DataTypeClass? dataType;
  Nutrients? nutrients;

  Aggregations({
    this.dataType,
    this.nutrients,
  });

  factory Aggregations.fromJson(Map<String, dynamic> json) => Aggregations(
        dataType: json["dataType"] == null
            ? null
            : DataTypeClass.fromJson(json["dataType"]),
        nutrients: json["nutrients"] == null
            ? null
            : Nutrients.fromJson(json["nutrients"]),
      );

  Map<String, dynamic> toJson() => {
        "dataType": dataType?.toJson(),
        "nutrients": nutrients?.toJson(),
      };
}

class DataTypeClass {
  String? branded;
  String? surveyFndds;
  String? srLegacy;
  String? foundation;

  DataTypeClass({
    this.branded,
    this.surveyFndds,
    this.srLegacy,
    this.foundation,
  });

  factory DataTypeClass.fromJson(Map<String, dynamic> json) => DataTypeClass(
        branded: json["Branded"].toString(),
        surveyFndds: json["Survey (FNDDS)"].toString(),
        srLegacy: json["SR Legacy"].toString(),
        foundation: json["Foundation"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "Branded": branded,
        "Survey (FNDDS)": surveyFndds,
        "SR Legacy": srLegacy,
        "Foundation": foundation,
      };
}

class Nutrients {
  Nutrients();

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients();

  Map<String, dynamic> toJson() => {};
}

class FoodSearchCriteria {
  String? query;
  String? generalSearchInput;
  String? pageNumber;
  String? numberOfResultsPerPage;
  String? pageSize;
  bool? requireAllWords;

  FoodSearchCriteria({
    this.query,
    this.generalSearchInput,
    this.pageNumber,
    this.numberOfResultsPerPage,
    this.pageSize,
    this.requireAllWords,
  });

  factory FoodSearchCriteria.fromJson(Map<String, dynamic> json) =>
      FoodSearchCriteria(
        query: json["query"],
        generalSearchInput: json["generalSearchInput"],
        pageNumber: json["pageNumber"].toString(),
        numberOfResultsPerPage: json["numberOfResultsPerPage"].toString(),
        pageSize: json["pageSize"].toString(),
        requireAllWords: json["requireAllWords"],
      );

  Map<String, dynamic> toJson() => {
        "query": query,
        "generalSearchInput": generalSearchInput,
        "pageNumber": pageNumber,
        "numberOfResultsPerPage": numberOfResultsPerPage,
        "pageSize": pageSize,
        "requireAllWords": requireAllWords,
      };
}

class Food {
  String? fdcId;
  String? description;
  DataTypeEnum? dataType;
  String? gtinUpc;
  DateTime? publishedDate;
  String? brandOwner;
  String? brandName;
  String? ingredients;
  MarketCountry? marketCountry;
  FoodCategory? foodCategory;
  DateTime? modifiedDate;
  DataSource? dataSource;
  String? packageWeight;
  ServingSizeUnit? servingSizeUnit;
  String? servingSize;
  List<TradeChannel>? tradeChannels;
  String? allHighlightFields;
  double? score;
  List<dynamic>? microbes;
  List<FoodNutrient>? foodNutrients;
  List<FinalFoodInputFood>? finalFoodInputFoods;
  List<FoodMeasure>? foodMeasures;
  List<dynamic>? foodAttributes;
  List<FoodAttributeType>? foodAttributeTypes;
  List<dynamic>? foodVersionIds;
  String? householdServingFullText;
  String? subbrandName;
  String? shortDescription;
  String? commonNames;
  String? additionalDescriptions;
  String? foodCode;
  String? foodCategoryId;
  String? ndbNumber;
  DateTime? mostRecentAcquisitionDate;

  Food({
    this.fdcId,
    this.description,
    this.dataType,
    this.gtinUpc,
    this.publishedDate,
    this.brandOwner,
    this.brandName,
    this.ingredients,
    this.marketCountry,
    this.foodCategory,
    this.modifiedDate,
    this.dataSource,
    this.packageWeight,
    this.servingSizeUnit,
    this.servingSize,
    this.tradeChannels,
    this.allHighlightFields,
    this.score,
    this.microbes,
    this.foodNutrients,
    this.finalFoodInputFoods,
    this.foodMeasures,
    this.foodAttributes,
    this.foodAttributeTypes,
    this.foodVersionIds,
    this.householdServingFullText,
    this.subbrandName,
    this.shortDescription,
    this.commonNames,
    this.additionalDescriptions,
    this.foodCode,
    this.foodCategoryId,
    this.ndbNumber,
    this.mostRecentAcquisitionDate,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        fdcId: json["fdcId"].toString(),
        description: json["description"],
        dataType: dataTypeEnumValues.map[json["dataType"]],
        gtinUpc: json["gtinUpc"],
        publishedDate: json["publishedDate"] == null
            ? null
            : DateTime.parse(json["publishedDate"]),
        brandOwner: json["brandOwner"],
        brandName: json["brandName"],
        ingredients: json["ingredients"],
        marketCountry: marketCountryValues.map[json["marketCountry"]],
        foodCategory: foodCategoryValues.map[json["foodCategory"]],
        modifiedDate: json["modifiedDate"] == null
            ? null
            : DateTime.parse(json["modifiedDate"]),
        dataSource: dataSourceValues.map[json["dataSource"]],
        packageWeight: json["packageWeight"],
        servingSizeUnit: servingSizeUnitValues.map[json["servingSizeUnit"]],
        servingSize: json["servingSize"].toString(),
        tradeChannels: json["tradeChannels"] == null
            ? []
            : List<TradeChannel>.from(
                json["tradeChannels"].map((x) => tradeChannelValues.map[x])),
        allHighlightFields: json["allHighlightFields"],
        score: json["score"]?.toDouble(),
        microbes: json["microbes"] == null
            ? []
            : List<dynamic>.from(json["microbes"].map((x) => x)),
        foodNutrients: json["foodNutrients"] == null
            ? []
            : List<FoodNutrient>.from(
                json["foodNutrients"].map((x) => FoodNutrient.fromJson(x))),
        finalFoodInputFoods: json["finalFoodInputFoods"] == null
            ? []
            : List<FinalFoodInputFood>.from(json["finalFoodInputFoods"]
                .map((x) => FinalFoodInputFood.fromJson(x))),
        foodMeasures: json["foodMeasures"] == null
            ? []
            : List<FoodMeasure>.from(
                json["foodMeasures"].map((x) => FoodMeasure.fromJson(x))),
        foodAttributes: json["foodAttributes"] == null
            ? []
            : List<dynamic>.from(json["foodAttributes"].map((x) => x)),
        foodAttributeTypes: json["foodAttributeTypes"] == null
            ? []
            : List<FoodAttributeType>.from(json["foodAttributeTypes"]
                .map((x) => FoodAttributeType.fromJson(x))),
        foodVersionIds: json["foodVersionIds"] == null
            ? []
            : List<dynamic>.from(json["foodVersionIds"].map((x) => x)),
        householdServingFullText: json["householdServingFullText"],
        subbrandName: json["subbrandName"],
        shortDescription: json["shortDescription"],
        commonNames: json["commonNames"],
        additionalDescriptions: json["additionalDescriptions"],
        foodCode: json["foodCode"].toString(),
        foodCategoryId: json["foodCategoryId"].toString(),
        ndbNumber: json["ndbNumber"].toString(),
        mostRecentAcquisitionDate: json["mostRecentAcquisitionDate"] == null
            ? null
            : DateTime.parse(json["mostRecentAcquisitionDate"]),
      );

  Map<String, dynamic> toJson() => {
        "fdcId": fdcId,
        "description": description,
        "dataType": dataTypeEnumValues.reverse[dataType],
        "gtinUpc": gtinUpc,
        "publishedDate":
            "${publishedDate?.year.toString().padLeft(4, '0')}-${publishedDate?.month.toString().padLeft(2, '0')}-${publishedDate?.day.toString().padLeft(2, '0')}",
        "brandOwner": brandOwner,
        "brandName": brandName,
        "ingredients": ingredients,
        "marketCountry": marketCountryValues.reverse[marketCountry],
        "foodCategory": foodCategoryValues.reverse[foodCategory],
        "modifiedDate":
            "${modifiedDate?.year.toString().padLeft(4, '0')}-${modifiedDate?.month.toString().padLeft(2, '0')}-${modifiedDate?.day.toString().padLeft(2, '0')}",
        "dataSource": dataSourceValues.reverse[dataSource],
        "packageWeight": packageWeight,
        "servingSizeUnit": servingSizeUnitValues.reverse[servingSizeUnit],
        "servingSize": servingSize,
        "tradeChannels": tradeChannels == null
            ? []
            : List<dynamic>.from(
                tradeChannels!.map((x) => tradeChannelValues.reverse[x])),
        "allHighlightFields": allHighlightFields,
        "score": score,
        "microbes":
            microbes == null ? [] : List<dynamic>.from(microbes!.map((x) => x)),
        "foodNutrients": foodNutrients == null
            ? []
            : List<dynamic>.from(foodNutrients!.map((x) => x.toJson())),
        "finalFoodInputFoods": finalFoodInputFoods == null
            ? []
            : List<dynamic>.from(finalFoodInputFoods!.map((x) => x.toJson())),
        "foodMeasures": foodMeasures == null
            ? []
            : List<dynamic>.from(foodMeasures!.map((x) => x.toJson())),
        "foodAttributes": foodAttributes == null
            ? []
            : List<dynamic>.from(foodAttributes!.map((x) => x)),
        "foodAttributeTypes": foodAttributeTypes == null
            ? []
            : List<dynamic>.from(foodAttributeTypes!.map((x) => x.toJson())),
        "foodVersionIds": foodVersionIds == null
            ? []
            : List<dynamic>.from(foodVersionIds!.map((x) => x)),
        "householdServingFullText": householdServingFullText,
        "subbrandName": subbrandName,
        "shortDescription": shortDescription,
        "commonNames": commonNames,
        "additionalDescriptions": additionalDescriptions,
        "foodCode": foodCode,
        "foodCategoryId": foodCategoryId,
        "ndbNumber": ndbNumber,
        "mostRecentAcquisitionDate":
            "${mostRecentAcquisitionDate?.year.toString().padLeft(4, '0')}-${mostRecentAcquisitionDate?.month.toString().padLeft(2, '0')}-${mostRecentAcquisitionDate?.day.toString().padLeft(2, '0')}",
      };
}

enum DataSource { LI }

final dataSourceValues = EnumValues({"LI": DataSource.LI});

enum DataTypeEnum { BRANDED, FOUNDATION, SR_LEGACY, SURVEY_FNDDS }

final dataTypeEnumValues = EnumValues({
  "Branded": DataTypeEnum.BRANDED,
  "Foundation": DataTypeEnum.FOUNDATION,
  "SR Legacy": DataTypeEnum.SR_LEGACY,
  "Survey (FNDDS)": DataTypeEnum.SURVEY_FNDDS
});

class FinalFoodInputFood {
  String? foodDescription;
  String? gramWeight;
  String? id;
  String? portionCode;
  PortionDescription? portionDescription;
  Unit? unit;
  String? rank;
  String? srCode;
  String? value;

  FinalFoodInputFood({
    this.foodDescription,
    this.gramWeight,
    this.id,
    this.portionCode,
    this.portionDescription,
    this.unit,
    this.rank,
    this.srCode,
    this.value,
  });

  factory FinalFoodInputFood.fromJson(Map<String, dynamic> json) =>
      FinalFoodInputFood(
        foodDescription: json["foodDescription"],
        gramWeight: json["gramWeight"].toString(),
        id: json["id"].toString(),
        portionCode: json["portionCode"],
        portionDescription:
            portionDescriptionValues.map[json["portionDescription"]],
        unit: unitValues.map[json["unit"]],
        rank: json["rank"].toString(),
        srCode: json["srCode"].toString(),
        value: json["value"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "foodDescription": foodDescription,
        "gramWeight": gramWeight,
        "id": id,
        "portionCode": portionCode,
        "portionDescription":
            portionDescriptionValues.reverse[portionDescription],
        "unit": unitValues.reverse[unit],
        "rank": rank,
        "srCode": srCode,
        "value": value,
      };
}

enum PortionDescription { NONE }

final portionDescriptionValues = EnumValues({"NONE": PortionDescription.NONE});

enum Unit { GM }

final unitValues = EnumValues({"GM": Unit.GM});

class FoodAttributeType {
  FoodAttributeTypeName? name;
  Description? description;
  String? id;
  List<FoodAttribute>? foodAttributes;

  FoodAttributeType({
    this.name,
    this.description,
    this.id,
    this.foodAttributes,
  });

  factory FoodAttributeType.fromJson(Map<String, dynamic> json) =>
      FoodAttributeType(
        name: foodAttributeTypeNameValues.map[json["name"]],
        description: descriptionValues.map[json["description"]],
        id: json["id"].toString(),
        foodAttributes: json["foodAttributes"] == null
            ? []
            : List<FoodAttribute>.from(
                json["foodAttributes"].map((x) => FoodAttribute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": foodAttributeTypeNameValues.reverse[name],
        "description": descriptionValues.reverse[description],
        "id": id,
        "foodAttributes": foodAttributes == null
            ? []
            : List<dynamic>.from(foodAttributes!.map((x) => x.toJson())),
      };
}

enum Description {
  ADDITIONAL_DESCRIPTIONS_FOR_THE_FOOD,
  ADJUSTMENTS_MADE_TO_FOODS_INCLUDING_MOISTURE_CHANGES,
  GENERIC_ATTRIBUTES
}

final descriptionValues = EnumValues({
  "Additional descriptions for the food.":
      Description.ADDITIONAL_DESCRIPTIONS_FOR_THE_FOOD,
  "Adjustments made to foods, including moisture changes":
      Description.ADJUSTMENTS_MADE_TO_FOODS_INCLUDING_MOISTURE_CHANGES,
  "Generic attributes": Description.GENERIC_ATTRIBUTES
});

class FoodAttribute {
  String? value;
  String? id;
  String? sequenceNumber;
  FoodAttributeName? name;

  FoodAttribute({
    this.value,
    this.id,
    this.sequenceNumber,
    this.name,
  });

  factory FoodAttribute.fromJson(Map<String, dynamic> json) => FoodAttribute(
        value: json["value"],
        id: json["id"].toString(),
        sequenceNumber: json["sequenceNumber"].toString(),
        name: foodAttributeNameValues.map[json["name"]],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "id": id,
        "sequenceNumber": sequenceNumber,
        "name": foodAttributeNameValues.reverse[name],
      };
}

enum FoodAttributeName { WWEIA_CATEGORY_DESCRIPTION, WWEIA_CATEGORY_NUMBER }

final foodAttributeNameValues = EnumValues({
  "WWEIA Category description": FoodAttributeName.WWEIA_CATEGORY_DESCRIPTION,
  "WWEIA Category number": FoodAttributeName.WWEIA_CATEGORY_NUMBER
});

enum FoodAttributeTypeName { ADDITIONAL_DESCRIPTION, ADJUSTMENTS, ATTRIBUTE }

final foodAttributeTypeNameValues = EnumValues({
  "Additional Description": FoodAttributeTypeName.ADDITIONAL_DESCRIPTION,
  "Adjustments": FoodAttributeTypeName.ADJUSTMENTS,
  "Attribute": FoodAttributeTypeName.ATTRIBUTE
});

enum FoodCategory {
  CHEESE,
  CHEESE_SANDWICHES,
  DAIRY_AND_EGG_PRODUCTS,
  SAUSAGES_AND_LUNCHEON_MEATS
}

final foodCategoryValues = EnumValues({
  "Cheese": FoodCategory.CHEESE,
  "Cheese sandwiches": FoodCategory.CHEESE_SANDWICHES,
  "Dairy and Egg Products": FoodCategory.DAIRY_AND_EGG_PRODUCTS,
  "Sausages and Luncheon Meats": FoodCategory.SAUSAGES_AND_LUNCHEON_MEATS
});

class FoodMeasure {
  String? disseminationText;
  double? gramWeight;
  String? id;
  String? modifier;
  String? rank;
  MeasureUnit? measureUnitAbbreviation;
  MeasureUnit? measureUnitName;
  String? measureUnitId;

  FoodMeasure({
    this.disseminationText,
    this.gramWeight,
    this.id,
    this.modifier,
    this.rank,
    this.measureUnitAbbreviation,
    this.measureUnitName,
    this.measureUnitId,
  });

  factory FoodMeasure.fromJson(Map<String, dynamic> json) => FoodMeasure(
        disseminationText: json["disseminationText"],
        gramWeight: json["gramWeight"]?.toDouble(),
        id: json["id"].toString(),
        modifier: json["modifier"],
        rank: json["rank"].toString(),
        measureUnitAbbreviation:
            measureUnitValues.map[json["measureUnitAbbreviation"]],
        measureUnitName: measureUnitValues.map[json["measureUnitName"]],
        measureUnitId: json["measureUnitId"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "disseminationText": disseminationText,
        "gramWeight": gramWeight,
        "id": id,
        "modifier": modifier,
        "rank": rank,
        "measureUnitAbbreviation":
            measureUnitValues.reverse[measureUnitAbbreviation],
        "measureUnitName": measureUnitValues.reverse[measureUnitName],
        "measureUnitId": measureUnitId,
      };
}

enum MeasureUnit { UNDETERMINED }

final measureUnitValues =
    EnumValues({"undetermined": MeasureUnit.UNDETERMINED});

class FoodNutrient {
  String? nutrientId;
  String? nutrientName;
  String? nutrientNumber;
  UnitName? unitName;
  DerivationCode? derivationCode;
  String? derivationDescription;
  String? derivationId;
  double? value;
  String? foodNutrientSourceId;
  String? foodNutrientSourceCode;
  FoodNutrientSourceDescription? foodNutrientSourceDescription;
  String? rank;
  String? indentLevel;
  String? foodNutrientId;
  String? percentDailyValue;
  String? dataPoints;
  double? min;
  double? max;
  double? median;

  FoodNutrient({
    this.nutrientId,
    this.nutrientName,
    this.nutrientNumber,
    this.unitName,
    this.derivationCode,
    this.derivationDescription,
    this.derivationId,
    this.value,
    this.foodNutrientSourceId,
    this.foodNutrientSourceCode,
    this.foodNutrientSourceDescription,
    this.rank,
    this.indentLevel,
    this.foodNutrientId,
    this.percentDailyValue,
    this.dataPoints,
    this.min,
    this.max,
    this.median,
  });

  factory FoodNutrient.fromJson(Map<String, dynamic> json) => FoodNutrient(
        nutrientId: json["nutrientId"].toString(),
        nutrientName: json["nutrientName"],
        nutrientNumber: json["nutrientNumber"],
        unitName: unitNameValues.map[json["unitName"]],
        derivationCode: derivationCodeValues.map[json["derivationCode"]],
        derivationDescription: json["derivationDescription"],
        derivationId: json["derivationId"].toString(),
        value: json["value"]?.toDouble(),
        foodNutrientSourceId: json["foodNutrientSourceId"].toString(),
        foodNutrientSourceCode: json["foodNutrientSourceCode"],
        foodNutrientSourceDescription: foodNutrientSourceDescriptionValues
            .map[json["foodNutrientSourceDescription"]],
        rank: json["rank"].toString(),
        indentLevel: json["indentLevel"].toString(),
        foodNutrientId: json["foodNutrientId"].toString(),
        percentDailyValue: json["percentDailyValue"].toString(),
        dataPoints: json["dataPoints"].toString(),
        min: json["min"]?.toDouble(),
        max: json["max"]?.toDouble(),
        median: json["median"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "nutrientId": nutrientId,
        "nutrientName": nutrientName,
        "nutrientNumber": nutrientNumber,
        "unitName": unitNameValues.reverse[unitName],
        "derivationCode": derivationCodeValues.reverse[derivationCode],
        "derivationDescription": derivationDescription,
        "derivationId": derivationId,
        "value": value,
        "foodNutrientSourceId": foodNutrientSourceId,
        "foodNutrientSourceCode": foodNutrientSourceCode,
        "foodNutrientSourceDescription": foodNutrientSourceDescriptionValues
            .reverse[foodNutrientSourceDescription],
        "rank": rank,
        "indentLevel": indentLevel,
        "foodNutrientId": foodNutrientId,
        "percentDailyValue": percentDailyValue,
        "dataPoints": dataPoints,
        "min": min,
        "max": max,
        "median": median,
      };
}

enum DerivationCode {
  A,
  AS,
  BFFN,
  BFNN,
  BFZN,
  CAZN,
  LC,
  LCCD,
  LCCS,
  LCSL,
  MC,
  NC,
  NR,
  T,
  Z
}

final derivationCodeValues = EnumValues({
  "A": DerivationCode.A,
  "AS": DerivationCode.AS,
  "BFFN": DerivationCode.BFFN,
  "BFNN": DerivationCode.BFNN,
  "BFZN": DerivationCode.BFZN,
  "CAZN": DerivationCode.CAZN,
  "LC": DerivationCode.LC,
  "LCCD": DerivationCode.LCCD,
  "LCCS": DerivationCode.LCCS,
  "LCSL": DerivationCode.LCSL,
  "MC": DerivationCode.MC,
  "NC": DerivationCode.NC,
  "NR": DerivationCode.NR,
  "T": DerivationCode.T,
  "Z": DerivationCode.Z
});

enum FoodNutrientSourceDescription {
  ANALYTICAL_OR_DERIVED_FROM_ANALYTICAL,
  ASSUMED_ZERO,
  CALCULATED_BY_MANUFACTURER_NOT_ADJUSTED_OR_ROUNDED_FOR_NLEA,
  CALCULATED_FROM_NUTRIENT_LABEL_BY_NDL,
  CALCULATED_OR_IMPUTED,
  MANUFACTURER_S_ANALYTICAL_PARTIAL_DOCUMENTATION
}

final foodNutrientSourceDescriptionValues = EnumValues({
  "Analytical or derived from analytical":
      FoodNutrientSourceDescription.ANALYTICAL_OR_DERIVED_FROM_ANALYTICAL,
  "Assumed zero": FoodNutrientSourceDescription.ASSUMED_ZERO,
  "Calculated by manufacturer, not adjusted or rounded for NLEA":
      FoodNutrientSourceDescription
          .CALCULATED_BY_MANUFACTURER_NOT_ADJUSTED_OR_ROUNDED_FOR_NLEA,
  "Calculated from nutrient label by NDL":
      FoodNutrientSourceDescription.CALCULATED_FROM_NUTRIENT_LABEL_BY_NDL,
  "Calculated or imputed": FoodNutrientSourceDescription.CALCULATED_OR_IMPUTED,
  "Manufacturer's analytical; partial documentation":
      FoodNutrientSourceDescription
          .MANUFACTURER_S_ANALYTICAL_PARTIAL_DOCUMENTATION
});

enum UnitName { G, IU, KCAL, K_J, MG, UG }

final unitNameValues = EnumValues({
  "G": UnitName.G,
  "IU": UnitName.IU,
  "KCAL": UnitName.KCAL,
  "kJ": UnitName.K_J,
  "MG": UnitName.MG,
  "UG": UnitName.UG
});

enum MarketCountry { UNITED_STATES }

final marketCountryValues =
    EnumValues({"United States": MarketCountry.UNITED_STATES});

enum ServingSizeUnit { G, GRM }

final servingSizeUnitValues =
    EnumValues({"g": ServingSizeUnit.G, "GRM": ServingSizeUnit.GRM});

enum TradeChannel { NO_TRADE_CHANNEL }

final tradeChannelValues =
    EnumValues({"NO_TRADE_CHANNEL": TradeChannel.NO_TRADE_CHANNEL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
