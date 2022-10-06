import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'ti_record.g.dart';

abstract class TiRecord implements Built<TiRecord, TiRecordBuilder> {
  static Serializer<TiRecord> get serializer => _$tiRecordSerializer;

  @BuiltValueField(wireName: 'Position')
  String? get position;

  String? get num;

  DocumentReference? get fault;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TiRecordBuilder builder) => builder
    ..position = ''
    ..num = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Ti');

  static Stream<TiRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TiRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TiRecord._();
  factory TiRecord([void Function(TiRecordBuilder) updates]) = _$TiRecord;

  static TiRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTiRecordData({
  String? position,
  String? num,
  DocumentReference? fault,
}) {
  final firestoreData = serializers.toFirestore(
    TiRecord.serializer,
    TiRecord(
      (t) => t
        ..position = position
        ..num = num
        ..fault = fault,
    ),
  );

  return firestoreData;
}
