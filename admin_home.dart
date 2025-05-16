import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../services/patch_service.dart';
import '../models/patch_model.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final PatchService patchService = PatchService();
  final titleCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  File? selectedFile;

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  void uploadPatch() async {
    if (selectedFile == null) return;
    final fileUrl = await patchService.uploadPatchFile(
        selectedFile!, selectedFile!.path.split('/').last);
    final patch = Patch(
      id: '',
      title: titleCtrl.text,
      description: descCtrl.text,
      fileUrl: fileUrl,
      uploadedBy: "admin@example.com",
      uploadedAt: DateTime.now(),
    );
    await patchService.addPatch(patch);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Patch uploaded")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleCtrl, decoration: InputDecoration(labelText: "Title")),
            TextField(controller: descCtrl, decoration: InputDecoration(labelText: "Description")),
            ElevatedButton(onPressed: pickFile, child: Text("Pick Patch File")),
            ElevatedButton(onPressed: uploadPatch, child: Text("Upload Patch")),
          ],
        ),
      ),
    );
  }
}
