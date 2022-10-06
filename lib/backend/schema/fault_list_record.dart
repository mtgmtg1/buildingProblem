import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'fault_list_record.g.dart';

abstract class FaultListRecord
    implements Built<FaultListRecord, FaultListRecordBuilder> {
  static Serializer<FaultListRecord> get serializer =>
      _$faultListRecordSerializer;

  @BuiltValueField(wireName: 'User')
  DocumentReference? get user;

  String? get photo;

  BuiltList<bool>? get type;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FaultListRecordBuilder builder) => builder
    ..photo = ''
    ..type = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fault_list');

  static Stream<FaultListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FaultListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FaultListRecord._();
  factory FaultListRecord([void Function(FaultListRecordBuilder) updates]) =
      _$FaultListRecord;

  static FaultListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFaultListRecordData({
  DocumentReference? user,
  String? photo,
}) {
  final firestoreData = serializers.toFirestore(
    FaultListRecord.serializer,
    FaultListRecord(
      (f) => f
        ..user = user
        ..photo = photo
        ..type = null,
    ),
  );

  return firestoreData;
}
