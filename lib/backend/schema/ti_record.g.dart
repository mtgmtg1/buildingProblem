// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ti_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TiRecord> _$tiRecordSerializer = new _$TiRecordSerializer();

class _$TiRecordSerializer implements StructuredSerializer<TiRecord> {
  @override
  final Iterable<Type> types = const [TiRecord, _$TiRecord];
  @override
  final String wireName = 'TiRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TiRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.position;
    if (value != null) {
      result
        ..add('Position')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.num;
    if (value != null) {
      result
        ..add('num')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fault;
    if (value != null) {
      result
        ..add('fault')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TiRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TiRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Position':
          result.position = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'num':
          result.num = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'fault':
          result.fault = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TiRecord extends TiRecord {
  @override
  final String? position;
  @override
  final String? num;
  @override
  final DocumentReference<Object?>? fault;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TiRecord([void Function(TiRecordBuilder)? updates]) =>
      (new TiRecordBuilder()..update(updates))._build();

  _$TiRecord._({this.position, this.num, this.fault, this.ffRef}) : super._();

  @override
  TiRecord rebuild(void Function(TiRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TiRecordBuilder toBuilder() => new TiRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TiRecord &&
        position == other.position &&
        num == other.num &&
        fault == other.fault &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, position.hashCode), num.hashCode), fault.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TiRecord')
          ..add('position', position)
          ..add('num', num)
          ..add('fault', fault)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TiRecordBuilder implements Builder<TiRecord, TiRecordBuilder> {
  _$TiRecord? _$v;

  String? _position;
  String? get position => _$this._position;
  set position(String? position) => _$this._position = position;

  String? _num;
  String? get num => _$this._num;
  set num(String? num) => _$this._num = num;

  DocumentReference<Object?>? _fault;
  DocumentReference<Object?>? get fault => _$this._fault;
  set fault(DocumentReference<Object?>? fault) => _$this._fault = fault;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TiRecordBuilder() {
    TiRecord._initializeBuilder(this);
  }

  TiRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _position = $v.position;
      _num = $v.num;
      _fault = $v.fault;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TiRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TiRecord;
  }

  @override
  void update(void Function(TiRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TiRecord build() => _build();

  _$TiRecord _build() {
    final _$result = _$v ??
        new _$TiRecord._(
            position: position, num: num, fault: fault, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
