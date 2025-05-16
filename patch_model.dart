class Patch {
  final String id;
  final String title;
  final String description;
  final String fileUrl;
  final String uploadedBy;
  final DateTime uploadedAt;

  Patch({
    required this.id,
    required this.title,
    required this.description,
    required this.fileUrl,
    required this.uploadedBy,
    required this.uploadedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'fileUrl': fileUrl,
      'uploadedBy': uploadedBy,
      'uploadedAt': uploadedAt.toIso8601String(),
    };
  }

  factory Patch.fromMap(String id, Map<String, dynamic> map) {
    return Patch(
      id: id,
      title: map['title'],
      description: map['description'],
      fileUrl: map['fileUrl'],
      uploadedBy: map['uploadedBy'],
      uploadedAt: DateTime.parse(map['uploadedAt']),
    );
  }
}
