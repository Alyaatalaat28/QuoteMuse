class QuotesModel {
  String? sId;
  String? content;
  String? author;
  List<String>? tags;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;


  QuotesModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    author = json['author'];
    tags = json['tags'].cast<String>();
    authorSlug = json['authorSlug'];
    length = json['length'];
    dateAdded = json['dateAdded'];
    dateModified = json['dateModified'];
  }

   @override
  String toString() {
    return 'QuotesModel{sId: $sId, content: $content, author: $author, tags: $tags, authorSlug: $authorSlug, length: $length, dateAdded: $dateAdded, dateModified: $dateModified}';
  }
}
