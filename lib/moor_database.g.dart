// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Zaehler extends DataClass implements Insertable<Zaehler> {
  final int id;
  final int value;
  Zaehler({@required this.id, @required this.value});
  factory Zaehler.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return Zaehler(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      value: intType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<int>(value);
    }
    return map;
  }

  ZaehlerEntryCompanion toCompanion(bool nullToAbsent) {
    return ZaehlerEntryCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory Zaehler.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Zaehler(
      id: serializer.fromJson<int>(json['id']),
      value: serializer.fromJson<int>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'value': serializer.toJson<int>(value),
    };
  }

  Zaehler copyWith({int id, int value}) => Zaehler(
        id: id ?? this.id,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('Zaehler(')
          ..write('id: $id, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, value.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Zaehler && other.id == this.id && other.value == this.value);
}

class ZaehlerEntryCompanion extends UpdateCompanion<Zaehler> {
  final Value<int> id;
  final Value<int> value;
  const ZaehlerEntryCompanion({
    this.id = const Value.absent(),
    this.value = const Value.absent(),
  });
  ZaehlerEntryCompanion.insert({
    this.id = const Value.absent(),
    this.value = const Value.absent(),
  });
  static Insertable<Zaehler> custom({
    Expression<int> id,
    Expression<int> value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (value != null) 'value': value,
    });
  }

  ZaehlerEntryCompanion copyWith({Value<int> id, Value<int> value}) {
    return ZaehlerEntryCompanion(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ZaehlerEntryCompanion(')
          ..write('id: $id, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $ZaehlerEntryTable extends ZaehlerEntry
    with TableInfo<$ZaehlerEntryTable, Zaehler> {
  final GeneratedDatabase _db;
  final String _alias;
  $ZaehlerEntryTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedIntColumn _value;
  @override
  GeneratedIntColumn get value => _value ??= _constructValue();
  GeneratedIntColumn _constructValue() {
    return GeneratedIntColumn('value', $tableName, false,
        defaultValue: const Constant(0));
  }

  @override
  List<GeneratedColumn> get $columns => [id, value];
  @override
  $ZaehlerEntryTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'zaehler_entry';
  @override
  final String actualTableName = 'zaehler_entry';
  @override
  VerificationContext validateIntegrity(Insertable<Zaehler> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Zaehler map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Zaehler.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ZaehlerEntryTable createAlias(String alias) {
    return $ZaehlerEntryTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ZaehlerEntryTable _zaehlerEntry;
  $ZaehlerEntryTable get zaehlerEntry =>
      _zaehlerEntry ??= $ZaehlerEntryTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [zaehlerEntry];
}
