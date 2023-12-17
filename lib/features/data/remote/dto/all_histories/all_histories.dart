import 'package:space_x_task/features/domain/model/histories/histories_model.dart';

class AllHistoriesResponseDto extends HistoryModel {
  int? id;
  String? title;
  String? eventDateUtc;
  int? eventDateUnix;
  int? flightNumber;
  String? details;
  Links? links;

  AllHistoriesResponseDto(
      {this.id,
      this.title,
      this.eventDateUtc,
      this.eventDateUnix,
      this.flightNumber,
      this.details,
      this.links});

  AllHistoriesResponseDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    eventDateUtc = json['event_date_utc'];
    eventDateUnix = json['event_date_unix'];
    flightNumber = json['flight_number'];
    details = json['details'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;

    linksUrl = LinksModel();
    linksUrl?.wikipedia = links?.wikipedia;
    linksUrl?.reddit = links?.reddit;
    linksUrl?.article = links?.article;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['event_date_utc'] = this.eventDateUtc;
    data['event_date_unix'] = this.eventDateUnix;
    data['flight_number'] = this.flightNumber;
    data['details'] = this.details;
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    return data;
  }
}

class Links extends LinksModel {
  String? reddit;
  String? article;
  String? wikipedia;

  Links({this.reddit, this.article, this.wikipedia});

  Links.fromJson(Map<String, dynamic> json) {
    reddit = json['reddit'];
    article = json['article'];
    wikipedia = json['wikipedia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reddit'] = this.reddit;
    data['article'] = this.article;
    data['wikipedia'] = this.wikipedia;
    return data;
  }
}
