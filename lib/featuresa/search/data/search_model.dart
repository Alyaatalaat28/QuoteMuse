class SearchModel {
  Info? iInfo;
  int? count;
  int? totalCount;
  int? page;
  int? totalPages;
  List<Results>? results;


  SearchModel.fromJson(Map<String, dynamic> json) {
    iInfo =
        json['__info__'] != null ? new Info.fromJson(json['__info__']) : null;
    count = json['count'];
    totalCount = json['totalCount'];
    page = json['page'];
    totalPages = json['totalPages'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  
}

class Info {
  Search? search;

  Info.fromJson(Map<String, dynamic> json) {
    search =
        json['$search'] != null ? new Search.fromJson(json['$search']) : null;
  }


}

class Search {
  QueryString? queryString;


  Search.fromJson(Map<String, dynamic> json) {
    queryString = json['queryString'] != null
        ? new QueryString.fromJson(json['queryString'])
        : null;
  }

}

class QueryString {
  String? query;
  String? defaultPath;

  QueryString.fromJson(Map<String, dynamic> json) {
    query = json['query'];
    defaultPath = json['defaultPath'];
  }

 
}

class Results {
  String? sId;
  String? content;
  String? author;
  List<String>? tags;
  String? authorId;
  String? authorSlug;
  int? length;
  String? dateAdded;
  String? dateModified;

  Results.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    content = json['content'];
    author = json['author'];
    tags = json['tags'].cast<String>();
    authorId = json['authorId'];
    authorSlug = json['authorSlug'];
    length = json['length'];
    dateAdded = json['dateAdded'];
    dateModified = json['dateModified'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['content'] = this.content;
    data['author'] = this.author;
    data['tags'] = this.tags;
    data['authorId'] = this.authorId;
    data['authorSlug'] = this.authorSlug;
    data['length'] = this.length;
    data['dateAdded'] = this.dateAdded;
    data['dateModified'] = this.dateModified;
    return data;
  }

  
}
