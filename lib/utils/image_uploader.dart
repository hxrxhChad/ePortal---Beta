import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

Future<String?> uploadPhoto() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
    allowMultiple: false,
  );

  if (result == null || result.files.isEmpty) {
    // No file selected
    return null;
  }

  PlatformFile file = result.files.single;

  Reference storageReference = FirebaseStorage.instance
      .ref()
      .child("photo/${DateTime.now().millisecondsSinceEpoch}.jpg");

  Uint8List fileBytes = file.bytes!;
  UploadTask uploadTask = storageReference.putData(fileBytes);

  TaskSnapshot snapshot = await uploadTask.whenComplete(() {});

  String downloadUrl = await snapshot.ref.getDownloadURL();

  return downloadUrl;
}
