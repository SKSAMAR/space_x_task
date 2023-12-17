class HistoryModel {
  int? id;
  String? title;
  String? eventDateUtc;
  int? eventDateUnix;
  int? flightNumber;
  String? details;
  LinksModel? linksUrl;

  HistoryModel(
      {this.id,
      this.title,
      this.eventDateUtc,
      this.eventDateUnix,
      this.flightNumber,
      this.details,
      this.linksUrl});
}

class LinksModel {
  String? reddit;
  String? article;
  String? wikipedia;
  LinksModel({this.reddit, this.article, this.wikipedia});
}
