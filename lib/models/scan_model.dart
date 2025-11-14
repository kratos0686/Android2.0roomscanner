class ScanModel {
  final String id;
  final String userId;
  final String title;
  final DateTime timestamp;
  final String? thumbnailUrl;
  final String? modelUrl;
  final Map<String, dynamic>? metadata;

  ScanModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.timestamp,
    this.thumbnailUrl,
    this.modelUrl,
    this.metadata,
  });

  factory ScanModel.fromJson(Map<String, dynamic> json) {
    return ScanModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      thumbnailUrl: json['thumbnailUrl'] as String?,
      modelUrl: json['modelUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'timestamp': timestamp.toIso8601String(),
      'thumbnailUrl': thumbnailUrl,
      'modelUrl': modelUrl,
      'metadata': metadata,
    };
  }
}
