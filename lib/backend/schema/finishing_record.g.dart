// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finishing_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FinishingRecord> _$finishingRecordSerializer =
    new _$FinishingRecordSerializer();

class _$FinishingRecordSerializer
    implements StructuredSerializer<FinishingRecord> {
  @override
  final Iterable<Type> types = const [FinishingRecord, _$FinishingRecord];
  @override
  final String wireName = 'FinishingRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FinishingRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.category;
    if (value != null) {
      result
        ..add('Category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.position;
    if (value != null) {
      result
        ..add('position')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.etc;
    if (value != null) {
      result
        ..add('ETC')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.positionDetail;
    if (value != null) {
      result
        ..add('position_detail')
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
  FinishingRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FinishingRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'position':
          result.position = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ETC':
          result.etc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'position_detail':
          result.positionDetail = serializers.deserialize(value,
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

class _$FinishingRecord extends FinishingRecord {
  @override
  final String? category;
  @override
  final String? position;
  @override
  final String? type;
  @override
  final String? etc;
  @override
  final String? positionDetail;
  @override
  final DocumentReference<Object?>? fault;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FinishingRecord([void Function(FinishingRecordBuilder)? updates]) =>
      (new FinishingRecordBuilder()..update(updates))._build();

  _$FinishingRecord._(
      {this.category,
      this.position,
      this.type,
      this.etc,
      this.positionDetail,
      this.fault,
      this.ffRef})
      : super._();

  @override
  FinishingRecord rebuild(void Function(FinishingRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FinishingRecordBuilder toBuilder() =>
      new FinishingRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FinishingRecord &&
        category == other.category &&
        position == other.position &&
        type == other.type &&
        etc == other.etc &&
        positionDetail == other.positionDetail &&
        fault == other.fault &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, category.hashCode), position.hashCode),
                        type.hashCode),
                    etc.hashCode),
                positionDetail.hashCode),
            fault.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FinishingRecord')
          ..add('category', category)
          ..add('position', position)
          ..add('type', type)
          ..add('etc', etc)
          ..add('positionDetail', positionDetail)
          ..add('fault', fault)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FinishingRecordBuilder
    implements Builder<FinishingRecord, FinishingRecordBuilder> {
  _$FinishingRecord? _$v;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _position;
  String? get position => _$this._position;
  set position(String? position) => _$this._position = position;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _etc;
  String? get etc => _$this._etc;
  set etc(String? etc) => _$this._etc = etc;

  String? _positionDetail;
  String? get positionDetail => _$this._positionDetail;
  set positionDetail(String? positionDetail) =>
      _$this._positionDetail = positionDetail;

  DocumentReference<Object?>? _fault;
  DocumentReference<Object?>? get fault => _$this._fault;
  set fault(DocumentReference<Object?>? fault) => _$this._fault = fault;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FinishingRecordBuilder() {
    FinishingRecord._initializeBuilder(this);
  }

  FinishingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _category = $v.category;
      _position = $v.position;
      _type = $v.type;
      _etc = $v.etc;
      _positionDetail = $v.positionDetail;
      _fault = $v.fault;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FinishingRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FinishingRecord;
  }

  @override
  void update(void Function(FinishingRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FinishingRecord build() => _build();

  _$FinishingRecord _build() {
    final _$result = _$v ??
        new _$FinishingRecord._(
            category: category,
            position: position,
            type: type,
            etc: etc,
            positionDetail: positionDetail,
            fault: fault,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
