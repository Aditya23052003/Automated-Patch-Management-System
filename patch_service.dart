import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/patch_model.dart';

class PatchService {
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<String> uploadPatchFile(File file, String fileName) async {
    final ref = _storage.ref().child('patches').child(fileName);
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

  Future<void> addPatch(Patch patch) async {
    await _db.collection('patches').add(patch.toMap());
  }

  Stream<List<Patch>> getPatches() {
    return _db.collection('patches').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Patch.fromMap(doc.id, doc.data())).toList());
  }
}
