import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'aircondition_record.g.dart';

abstract class AirconditionRecord
    implements Built<AirconditionRecord, AirconditionRecordBuilder> {
  static Serializer<AirconditionRecord> get serializer =>
      _$airconditionRecordSerializer;

  @BuiltValueField(wireName: 'TVOC1')
  String? get tvoc1;

  @BuiltValueField(wireName: 'TVOC2')
  String? get tvoc2;

  @BuiltValueField(wireName: 'RADON')
  String? get radon;

  @BuiltValueField(wireName: 'Fault_type')
  DocumentReference? get faultType;

  @BuiltValueField(wireName: 'User')
  DocumentReference? get user;

  @BuiltValueField(wireName: 'IMG')
  DocumentReference? get img;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AirconditionRecordBuilder builder) => builder
    ..tvoc1 = ''
    ..tvoc2 = ''
    ..radon = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Aircondition');

  static Stream<AirconditionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AirconditionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AirconditionRecord._();
  factory AirconditionRecord(
          [void Function(AirconditionRecordBuilder) updates]) =
      _$AirconditionRecord;

  static AirconditionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAirconditionRecordData({
  String? tvoc1,
  String? tvoc2,
  String? radon,
  DocumentReference? faultType,
  DocumentReference? user,
  DocumentReference? img,
}) {
  final firestoreData = serializers.toFirestore(
    AirconditionRecord.serializer,
    AirconditionRecord(
      (a) => a
        ..tvoc1 = tvoc1
        ..tvoc2 = tvoc2
        ..radon = radon
        ..faultType = faultType
        ..user = user
        ..img = img,
    ),
  );

  return firestoreData;
}
