// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fault_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FaultListRecord> _$faultListRecordSerializer =
    new _$FaultListRecordSerializer();

class _$FaultListRecordSerializer
    implements StructuredSerializer<FaultListRecord> {
  @override
  final Iterable<Type> types = const [FaultListRecord, _$FaultListRecord];
  @override
  final String wireName = 'FaultListRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FaultListRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('User')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.photo;
    if (value != null) {
      result
        ..add('photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(bool)])));
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
  FaultListRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FaultListRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'User':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'photo':
          result.photo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(bool)]))!
              as BuiltList<Object?>);
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

class _$FaultListRecord extends FaultListRecord {
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? photo;
  @override
  final BuiltList<bool>? type;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FaultListRecord([void Function(FaultListRecordBuilder)? updates]) =>
      (new FaultListRecordBuilder()..update(updates))._build();

  _$FaultListRecord._({this.user, this.photo, this.type, this.ffRef})
      : super._();

  @override
  FaultListRecord rebuild(void Function(FaultListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FaultListRecordBuilder toBuilder() =>
      new FaultListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FaultListRecord &&
        user == other.user &&
        photo == other.photo &&
        type == other.type &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, user.hashCode), photo.hashCode), type.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FaultListRecord')
          ..add('user', user)
          ..add('photo', photo)
          ..add('type', type)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FaultListRecordBuilder
    implements Builder<FaultListRecord, FaultListRecordBuilder> {
  _$FaultListRecord? _$v;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _photo;
  String? get photo => _$this._photo;
  set photo(String? photo) => _$this._photo = photo;

  ListBuilder<bool>? _type;
  ListBuilder<bool> get type => _$this._type ??= new ListBuilder<bool>();
  set type(ListBuilder<bool>? type) => _$this._type = type;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FaultListRecordBuilder() {
    FaultListRecord._initializeBuilder(this);
  }

  FaultListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _photo = $v.photo;
      _type = $v.type?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FaultListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FaultListRecord;
  }

  @override
  void update(void Function(FaultListRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FaultListRecord build() => _build();

  _$FaultListRecord _build() {
    _$FaultListRecord _$result;
    try {
      _$result = _$v ??
          new _$FaultListRecord._(
              user: user, photo: photo, type: _type?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'type';
        _type?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FaultListRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
