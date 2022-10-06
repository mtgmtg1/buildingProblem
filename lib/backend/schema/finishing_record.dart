import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'finishing_record.g.dart';

abstract class FinishingRecord
    implements Built<FinishingRecord, FinishingRecordBuilder> {
  static Serializer<FinishingRecord> get serializer =>
      _$finishingRecordSerializer;

  @BuiltValueField(wireName: 'Category')
  String? get category;

  String? get position;

  String? get type;

  @BuiltValueField(wireName: 'ETC')
  String? get etc;

  @BuiltValueField(wireName: 'position_detail')
  String? get positionDetail;

  DocumentReference? get fault;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FinishingRecordBuilder builder) => builder
    ..category = ''
    ..position = ''
    ..type = ''
    ..etc = ''
    ..positionDetail = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Finishing');

  static Stream<FinishingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FinishingRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FinishingRecord._();
  factory FinishingRecord([void Function(FinishingRecordBuilder) updates]) =
      _$FinishingRecord;

  static FinishingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFinishingRecordData({
  String? category,
  String? position,
  String? type,
  String? etc,
  String? positionDetail,
  DocumentReference? fault,
}) {
  final firestoreData = serializers.toFirestore(
    FinishingRecord.serializer,
    FinishingRecord(
      (f) => f
        ..category = category
        ..position = position
        ..type = type
        ..etc = etc
        ..positionDetail = positionDetail
        ..fault = fault,
    ),
  );

  return firestoreData;
}
