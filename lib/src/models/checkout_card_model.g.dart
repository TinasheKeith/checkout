// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_card_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCheckoutCardCollection on Isar {
  IsarCollection<CheckoutCard> get checkoutCards => this.collection();
}

const CheckoutCardSchema = CollectionSchema(
  name: r'CheckoutCard',
  id: 4183310218502530287,
  properties: {
    r'cardNumber': PropertySchema(
      id: 0,
      name: r'cardNumber',
      type: IsarType.string,
    ),
    r'cardType': PropertySchema(
      id: 1,
      name: r'cardType',
      type: IsarType.byte,
      enumMap: _CheckoutCardcardTypeEnumValueMap,
    ),
    r'expirationDate': PropertySchema(
      id: 2,
      name: r'expirationDate',
      type: IsarType.string,
    )
  },
  estimateSize: _checkoutCardEstimateSize,
  serialize: _checkoutCardSerialize,
  deserialize: _checkoutCardDeserialize,
  deserializeProp: _checkoutCardDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _checkoutCardGetId,
  getLinks: _checkoutCardGetLinks,
  attach: _checkoutCardAttach,
  version: '3.1.0+1',
);

int _checkoutCardEstimateSize(
  CheckoutCard object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cardNumber.length * 3;
  bytesCount += 3 + object.expirationDate.length * 3;
  return bytesCount;
}

void _checkoutCardSerialize(
  CheckoutCard object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cardNumber);
  writer.writeByte(offsets[1], object.cardType.index);
  writer.writeString(offsets[2], object.expirationDate);
}

CheckoutCard _checkoutCardDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CheckoutCard(
    cardNumber: reader.readString(offsets[0]),
    cardType:
        _CheckoutCardcardTypeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
            CheckoutCardType.visa,
    expirationDate: reader.readString(offsets[2]),
  );
  object.id = id;
  return object;
}

P _checkoutCardDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_CheckoutCardcardTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          CheckoutCardType.visa) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CheckoutCardcardTypeEnumValueMap = {
  'visa': 0,
  'mastercard': 1,
  'americanExpress': 2,
  'discover': 3,
  'unionPay': 4,
  'unknown': 5,
};
const _CheckoutCardcardTypeValueEnumMap = {
  0: CheckoutCardType.visa,
  1: CheckoutCardType.mastercard,
  2: CheckoutCardType.americanExpress,
  3: CheckoutCardType.discover,
  4: CheckoutCardType.unionPay,
  5: CheckoutCardType.unknown,
};

Id _checkoutCardGetId(CheckoutCard object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _checkoutCardGetLinks(CheckoutCard object) {
  return [];
}

void _checkoutCardAttach(
    IsarCollection<dynamic> col, Id id, CheckoutCard object) {
  object.id = id;
}

extension CheckoutCardQueryWhereSort
    on QueryBuilder<CheckoutCard, CheckoutCard, QWhere> {
  QueryBuilder<CheckoutCard, CheckoutCard, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CheckoutCardQueryWhere
    on QueryBuilder<CheckoutCard, CheckoutCard, QWhereClause> {
  QueryBuilder<CheckoutCard, CheckoutCard, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CheckoutCardQueryFilter
    on QueryBuilder<CheckoutCard, CheckoutCard, QFilterCondition> {
  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      cardNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      cardNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      cardNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      cardNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      cardNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      cardNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      cardNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      cardNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cardNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      cardNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      cardNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cardNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      cardTypeEqualTo(CheckoutCardType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cardType',
        value: value,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      cardTypeGreaterThan(
    CheckoutCardType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cardType',
        value: value,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      cardTypeLessThan(
    CheckoutCardType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cardType',
        value: value,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      cardTypeBetween(
    CheckoutCardType lower,
    CheckoutCardType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cardType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      expirationDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expirationDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      expirationDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expirationDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      expirationDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expirationDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      expirationDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expirationDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      expirationDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expirationDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      expirationDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expirationDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      expirationDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expirationDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      expirationDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expirationDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      expirationDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expirationDate',
        value: '',
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition>
      expirationDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expirationDate',
        value: '',
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CheckoutCardQueryObject
    on QueryBuilder<CheckoutCard, CheckoutCard, QFilterCondition> {}

extension CheckoutCardQueryLinks
    on QueryBuilder<CheckoutCard, CheckoutCard, QFilterCondition> {}

extension CheckoutCardQuerySortBy
    on QueryBuilder<CheckoutCard, CheckoutCard, QSortBy> {
  QueryBuilder<CheckoutCard, CheckoutCard, QAfterSortBy> sortByCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.asc);
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterSortBy>
      sortByCardNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.desc);
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterSortBy> sortByCardType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardType', Sort.asc);
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterSortBy> sortByCardTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardType', Sort.desc);
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterSortBy>
      sortByExpirationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationDate', Sort.asc);
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterSortBy>
      sortByExpirationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationDate', Sort.desc);
    });
  }
}

extension CheckoutCardQuerySortThenBy
    on QueryBuilder<CheckoutCard, CheckoutCard, QSortThenBy> {
  QueryBuilder<CheckoutCard, CheckoutCard, QAfterSortBy> thenByCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.asc);
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterSortBy>
      thenByCardNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardNumber', Sort.desc);
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterSortBy> thenByCardType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardType', Sort.asc);
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterSortBy> thenByCardTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cardType', Sort.desc);
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterSortBy>
      thenByExpirationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationDate', Sort.asc);
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterSortBy>
      thenByExpirationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationDate', Sort.desc);
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension CheckoutCardQueryWhereDistinct
    on QueryBuilder<CheckoutCard, CheckoutCard, QDistinct> {
  QueryBuilder<CheckoutCard, CheckoutCard, QDistinct> distinctByCardNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QDistinct> distinctByCardType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cardType');
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCard, QDistinct> distinctByExpirationDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expirationDate',
          caseSensitive: caseSensitive);
    });
  }
}

extension CheckoutCardQueryProperty
    on QueryBuilder<CheckoutCard, CheckoutCard, QQueryProperty> {
  QueryBuilder<CheckoutCard, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CheckoutCard, String, QQueryOperations> cardNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardNumber');
    });
  }

  QueryBuilder<CheckoutCard, CheckoutCardType, QQueryOperations>
      cardTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cardType');
    });
  }

  QueryBuilder<CheckoutCard, String, QQueryOperations>
      expirationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expirationDate');
    });
  }
}
