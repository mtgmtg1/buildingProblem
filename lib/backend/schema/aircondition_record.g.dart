// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aircondition_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AirconditionRecord> _$airconditionRecordSerializer =
    new _$AirconditionRecordSerializer();

class _$AirconditionRecordSerializer
    implements StructuredSerializer<AirconditionRecord> {
  @override
  final Iterable<Type> types = const [AirconditionRecord, _$AirconditionRecord];
  @override
  final String wireName = 'AirconditionRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AirconditionRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.tvoc1;
    if (value != null) {
      result
        ..add('TVOC1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tvoc2;
    if (value != null) {
      result
        ..add('TVOC2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.radon;
    if (value != null) {
      result
        ..add('RADON')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.faultType;
    if (value != null) {
      result
        ..add('Fault_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('User')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.img;
    if (value != null) {
      result
        ..add('IMG')
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
  AirconditionRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AirconditionRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'TVOC1':
          result.tvoc1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'TVOC2':
          result.tvoc2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'RADON':
          result.radon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Fault_type':
          result.faultType = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'User':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'IMG':
          result.img = serializers.deserialize(value,
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

class _$AirconditionRecord extends AirconditionRecord {
  @override
  final String? tvoc1;
  @override
  final String? tvoc2;
  @override
  final String? radon;
  @override
  final DocumentReference<Object?>? faultType;
  @override
  final DocumentReference<Object?>? user;
  @override
  final DocumentReference<Object?>? img;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AirconditionRecord(
          [void Function(AirconditionRecordBuilder)? updates]) =>
      (new AirconditionRecordBuilder()..update(updates))._build();

  _$AirconditionRecord._(
      {this.tvoc1,
      this.tvoc2,
      this.radon,
      this.faultType,
      this.user,
      this.img,
      this.ffRef})
      : super._();

  @override
  AirconditionRecord rebuild(
          void Function(AirconditionRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AirconditionRecordBuilder toBuilder() =>
      new AirconditionRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AirconditionRecord &&
        tvoc1 == other.tvoc1 &&
        tvoc2 == other.tvoc2 &&
        radon == other.radon &&
        faultType == other.faultType &&
        user == other.user &&
        img == other.img &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, tvoc1.hashCode), tvoc2.hashCode),
                        radon.hashCode),
                    faultType.hashCode),
                user.hashCode),
            img.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AirconditionRecord')
          ..add('tvoc1', tvoc1)
          ..add('tvoc2', tvoc2)
          ..add('radon', radon)
          ..add('faultType', faultType)
          ..add('user', user)
          ..add('img', img)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AirconditionRecordBuilder
    implements Builder<AirconditionRecord, AirconditionRecordBuilder> {
  _$AirconditionRecord? _$v;

  String? _tvoc1;
  String? get tvoc1 => _$this._tvoc1;
  set tvoc1(String? tvoc1) => _$this._tvoc1 = tvoc1;

  String? _tvoc2;
  String? get tvoc2 => _$this._tvoc2;
  set tvoc2(String? tvoc2) => _$this._tvoc2 = tvoc2;

  String? _radon;
  String? get radon => _$this._radon;
  set radon(String? radon) => _$this._radon = radon;

  DocumentReference<Object?>? _faultType;
  DocumentReference<Object?>? get faultType => _$this._faultType;
  set faultType(DocumentReference<Object?>? faultType) =>
      _$this._faultType = faultType;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  DocumentReference<Object?>? _img;
  DocumentReference<Object?>? get img => _$this._img;
  set img(DocumentReference<Object?>? img) => _$this._img = img;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AirconditionRecordBuilder() {
    AirconditionRecord._initializeBuilder(this);
  }

  AirconditionRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tvoc1 = $v.tvoc1;
      _tvoc2 = $v.tvoc2;
      _radon = $v.radon;
      _faultType = $v.faultType;
      _user = $v.user;
      _img = $v.img;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AirconditionRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AirconditionRecord;
  }

  @override
  void update(void Function(AirconditionRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AirconditionRecord build() => _build();

  _$AirconditionRecord _build() {
    final _$result = _$v ??
        new _$AirconditionRecord._(
            tvoc1: tvoc1,
            tvoc2: tvoc2,
            radon: radon,
            faultType: faultType,
            user: user,
            img: img,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
