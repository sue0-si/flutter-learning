// model class
class ImageItem {
  String imageUrl;
  String id;

//<editor-fold desc="Data Methods">
  ImageItem({
    required this.imageUrl,
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageItem &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          id == other.id);

  @override
  int get hashCode => imageUrl.hashCode ^ id.hashCode;

  @override
  String toString() {
    return 'ImageItem{' + ' imageUrl: $imageUrl,' + ' id: $id,' + '}';
  }

  ImageItem copyWith({
    String? imageUrl,
    String? id,
  }) {
    return ImageItem(
      imageUrl: imageUrl ?? this.imageUrl,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': this.imageUrl,
      'id': this.id,
    };
  }

  factory ImageItem.fromMap(Map<String, dynamic> map) {
    return ImageItem(
      imageUrl: map['imageUrl'] as String,
      id: map['id'] as String,
    );
  }

//</editor-fold>
}