import 'package:flutter/material.dart';
import '../models/patch_model.dart';
import '../services/patch_service.dart';

class UserHome extends StatelessWidget {
  final PatchService patchService = PatchService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Available Patches")),
      body: StreamBuilder<List<Patch>>(
        stream: patchService.getPatches(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          final patches = snapshot.data!;
          return ListView.builder(
            itemCount: patches.length,
            itemBuilder: (context, index) {
              final patch = patches[index];
              return ListTile(
                title: Text(patch.title),
                subtitle: Text(patch.description),
                trailing: Icon(Icons.download),
                onTap: () => launchUrl(Uri.parse(patch.fileUrl)),
              );
            },
          );
        },
      ),
    );
  }
}
