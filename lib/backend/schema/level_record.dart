import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'level_record.g.dart';

abstract class LevelRecord implements Built<LevelRecord, LevelRecordBuilder> {
  static Serializer<LevelRecord> get serializer => _$levelRecordSerializer;

  DocumentReference? get fault;

  @BuiltValueField(wireName: 'Num1')
  String? get num1;

  @BuiltValueField(wireName: 'Num2')
  String? get num2;

  @BuiltValueField(wireName: 'Num3')
  String? get num3;

  @BuiltValueField(wireName: 'Num4')
  String? get num4;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LevelRecordBuilder builder) => builder
    ..num1 = ''
    ..num2 = ''
    ..num3 = ''
    ..num4 = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Level');

  static Stream<LevelRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LevelRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LevelRecord._();
  factory LevelRecord([void Function(LevelRecordBuilder) updates]) =
      _$LevelRecord;

  static LevelRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLevelRecordData({
  DocumentReference? fault,
  String? num1,
  String? num2,
  String? num3,
  String? num4,
}) {
  final firestoreData = serializers.toFirestore(
    LevelRecord.serializer,
    LevelRecord(
      (l) => l
        ..fault = fault
        ..num1 = num1
        ..num2 = num2
        ..num3 = num3
        ..num4 = num4,
    ),
  );

  return firestoreData;
}
