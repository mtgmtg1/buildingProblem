import 'dart:io';
import 'dart:typed_data';

import 'package:c_h_m_s_app/auth/auth_util.dart';
import 'package:c_h_m_s_app/backend/backend.dart';
import 'package:c_h_m_s_app/flutter_flow/flutter_flow_theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) {
        return Dialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            child: UnconstrainedBox(
              child: Container(
                width: 327,
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).customColor1,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      '로딩중..',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF8C8E8D)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
              ),
            ));
      });
}

extension loadingExtend<T> on Future {
  Future<T> load(BuildContext context) async {
    showLoadingDialog(context);
    whenComplete(() {
      Navigator.pop(context);
    });
    catchError((e) {});

    return await this;
  }
}

class ImageUrlModel {
  String fileName;
  String url;
  ImageUrlModel({required this.fileName, required this.url});

  Map<String, dynamic> toJson() {
    return {'fileName': this.fileName, 'url': this.url};
  }

  static ImageUrlModel fromJson(Map<String, dynamic> json) {
    return ImageUrlModel(fileName: json['fileName'], url: json['url']);
  }
}

enum UploadState { fileExist, success, failed }

class TiFileTestWidget extends StatefulWidget {
  @override
  _TiFileTestWidgetState createState() => _TiFileTestWidgetState();
}

class _TiFileTestWidgetState extends State<TiFileTestWidget> {
  DocumentReference<Map> documentRef =
      FirebaseFirestore.instance.collection('image_url').doc(currentUserUid);
  List<dynamic>? imageUrlList;
  List<PlatformFile> pathList = [];
  List<ImageUrlModel> imageUrlModelList = [];
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      loadImageUrl().load(context);
    });
  }

  Future<UploadState> uploadFile() async {
    try {
      for (PlatformFile path in pathList) {
        String fileName = path.name;
        if (isExist(fileName)) {
          return UploadState.fileExist;
        }
      }

      for (PlatformFile path in pathList) {
        String fileName = path.name;

        Reference storageReference = FirebaseStorage.instance
            .ref()
            .child('users/$currentUserUid/uploads/$fileName');

        await storageReference.putFile(File(path.path!));
        String uploadUrl = await storageReference.getDownloadURL();
        await addImageUrl(fileName, uploadUrl);
      }
      return UploadState.success;
    } catch (e) {
      return UploadState.failed;
    }
  }

  void showExceptionDialog(String title, String msg) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              child: UnconstrainedBox(
                child: Container(
                  width: 327,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        msg,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF8C8E8D)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Center(
                              child: Text(
                            '확인',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                          margin: EdgeInsets.only(
                              left: 24, right: 24, bottom: 24, top: 45),
                          height: 56,
                          decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).customColor1,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                ),
              ));
        });
  }

  bool isExist(String fileName) {
    for (ImageUrlModel imageUrlModel in imageUrlModelList) {
      if (imageUrlModel.fileName == fileName) {
        return true;
      }
    }
    return false;
  }

  Future<void> loadImageUrl() async {
    DocumentSnapshot snapshot = await documentRef.get();
    if (snapshot.data() != null) {
      List<dynamic> datas =
          (snapshot.data() as Map<String, dynamic>)['datas'] as List<dynamic>;
      imageUrlModelList =
          datas.map((json) => ImageUrlModel.fromJson(json)).toList();
    }
  }

  Future<void> addImageUrl(String fileName, String url) async {
    imageUrlModelList.add(ImageUrlModel(fileName: fileName, url: url));
    Map<String, dynamic> datas = {
      'datas': imageUrlModelList.map((model) => model.toJson()).toList()
    };
    print(datas);
    await documentRef.set(datas);
  }

  void _resetState() {
    if (!mounted) {
      return;
    }
    setState(() {
      pathList = [];
    });
  }

  Future<void> pickFiles() async {
    _resetState();
    try {
      pathList = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: true,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: ['jpg'],
      ))!
          .files;
    } on PlatformException catch (e) {
    } catch (e) {}
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(25),
            child: Text(
              '전자통합관리시스템',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Divider(
            height: 0,
            color: Color(0xFFE2E3E4),
            thickness: 0.5,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 24),
            child: Text(
              '파일 목록',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF686777)),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 400,
            child: pathList.isEmpty
                ? Center(
                    child: Text(
                    '파일을 선택해주세요.',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF686777)),
                  ))
                : ListView(children: [
                    ...List.generate(
                        pathList.length,
                        (index) => Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 16, left: 16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 16),
                                            width: 64,
                                            height: 64,
                                            decoration: BoxDecoration(
                                                // color: Color(0xFFF8F8FA),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: FileImage(File(
                                                        pathList[index]
                                                            .path!))),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  width: 158,
                                                  child: Text(
                                                    pathList[index].name,
                                                    style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black),
                                                  )),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              SizedBox(
                                                  width: 158,
                                                  child: Text(
                                                    pathList[index].path!,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xFF686777)),
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              pathList.removeAt(index);
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(right: 22),
                                            child: Icon(
                                              Icons.close,
                                              color: Color(0xFF686777),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  child: Divider(
                                    height: 0,
                                    color: Color(0xFFE2E3E4),
                                    thickness: 0.5,
                                  ),
                                )
                              ],
                            ))
                  ]),
          ),
          GestureDetector(
            onTap: () {
              pickFiles().load(context);
            },
            child: Container(
              child: Center(
                  child: Text(
                '파일 선택',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 24),
              height: 56,
              decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).customColor1,
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          GestureDetector(
            onTap: () async {
              UploadState state = await uploadFile().load(context);
              if (state == UploadState.success) {
                showExceptionDialog('업로드 성공', '파일 업로드에 성공하였습니다.');
              }
              if (state == UploadState.fileExist) {
                showExceptionDialog('에러 발생', '중복되는 파일명이 있습니다.');
              }
              if (state == UploadState.failed) {
                showExceptionDialog('에러 발생', '파일 업로드에 실패하였습니다.');
              }
            },
            child: Container(
              child: Center(
                  child: Text(
                '업로드',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: FlutterFlowTheme.of(context).customColor1),
              )),
              margin: EdgeInsets.only(left: 16, right: 16),
              height: 56,
              decoration: BoxDecoration(
                  color: Color(0xFFF8F8FA),
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      )),
    );
  }
}
