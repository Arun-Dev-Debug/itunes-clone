class ItunesData {
  int? resultCount;
  List<Results> results = <Results>[];

  ItunesData({this.resultCount, required this.results});

  ItunesData.fromJson(Map<String, dynamic> json) {
    resultCount = json['resultCount'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resultCount'] = resultCount;
    data['results'] = results.map((v) => v.toJson()).toList();
      return data;
  }
}

class Results {
  String? wrapperType;
  String? kind;
  int? collectionId;
  int? trackId;
  String? artistName;
  String? collectionName;
  String? trackName;
  String? collectionCensoredName;
  String? trackCensoredName;
  int? collectionArtistId;
  String? collectionArtistViewUrl;
  String? collectionViewUrl;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  double? trackPrice;
  double? trackRentalPrice;
  double? collectionHdPrice;
  double? trackHdPrice;
  double? trackHdRentalPrice;
  String? releaseDate;
  String? collectionExplicitness;
  String? trackExplicitness;
  int? trackCount;
  int? trackNumber;
  int? trackTimeMillis;
  String? country;
  String? currency;
  String? primaryGenreName;
  String? contentAdvisoryRating;
  String? shortDescription;
  String? longDescription;
  bool? hasITunesExtras;
  int? artistId;
  String? artistViewUrl;
  String? copyright;
  String? description;
  int? discCount;
  int? discNumber;
  bool? isStreamable;
  String? feedUrl;
  String? artworkUrl600;
  List<String>? genreIds;
  List<String>? genres;

  Results(
      {this.wrapperType,
        this.kind,
        this.collectionId,
        this.trackId,
        this.artistName,
        this.collectionName,
        this.trackName,
        this.collectionCensoredName,
        this.trackCensoredName,
        this.collectionArtistId,
        this.collectionArtistViewUrl,
        this.collectionViewUrl,
        this.trackViewUrl,
        this.previewUrl,
        this.artworkUrl30,
        this.artworkUrl60,
        this.artworkUrl100,
        this.collectionPrice,
        this.trackPrice,
        this.trackRentalPrice,
        this.collectionHdPrice,
        this.trackHdPrice,
        this.trackHdRentalPrice,
        this.releaseDate,
        this.collectionExplicitness,
        this.trackExplicitness,
        this.trackCount,
        this.trackNumber,
        this.trackTimeMillis,
        this.country,
        this.currency,
        this.primaryGenreName,
        this.contentAdvisoryRating,
        this.shortDescription,
        this.longDescription,
        this.hasITunesExtras,
        this.artistId,
        this.artistViewUrl,
        this.copyright,
        this.description,
        this.discCount,
        this.discNumber,
        this.isStreamable,
        this.feedUrl,
        this.artworkUrl600,
        this.genreIds,
        this.genres});

  Results.fromJson(Map<String, dynamic> json) {
    wrapperType = json['wrapperType'];
    kind = json['kind'];
    collectionId = json['collectionId'];
    trackId = json['trackId'];
    artistName = json['artistName'];
    collectionName = json['collectionName'];
    trackName = json['trackName'];
    collectionCensoredName = json['collectionCensoredName'];
    trackCensoredName = json['trackCensoredName'];
    collectionArtistId = json['collectionArtistId'];
    collectionArtistViewUrl = json['collectionArtistViewUrl'];
    collectionViewUrl = json['collectionViewUrl'];
    trackViewUrl = json['trackViewUrl'];
    previewUrl = json['previewUrl'];
    artworkUrl30 = json['artworkUrl30'];
    artworkUrl60 = json['artworkUrl60'];
    artworkUrl100 = json['artworkUrl100'];

    // Handle int to double conversion
    collectionPrice = json['collectionPrice']?.toDouble();
    trackPrice = json['trackPrice']?.toDouble();
    trackRentalPrice = json['trackRentalPrice']?.toDouble();
    collectionHdPrice = json['collectionHdPrice']?.toDouble();
    trackHdPrice = json['trackHdPrice']?.toDouble();
    trackHdRentalPrice = json['trackHdRentalPrice']?.toDouble();

    releaseDate = json['releaseDate'];
    collectionExplicitness = json['collectionExplicitness'];
    trackExplicitness = json['trackExplicitness'];
    trackCount = json['trackCount'];
    trackNumber = json['trackNumber'];
    trackTimeMillis = json['trackTimeMillis'];
    country = json['country'];
    currency = json['currency'];
    primaryGenreName = json['primaryGenreName'];
    contentAdvisoryRating = json['contentAdvisoryRating'];
    shortDescription = json['shortDescription'];
    longDescription = json['longDescription'];
    hasITunesExtras = json['hasITunesExtras'];
    artistId = json['artistId'];
    artistViewUrl = json['artistViewUrl'];
    copyright = json['copyright'];
    description = json['description'];
    discCount = json['discCount'];
    discNumber = json['discNumber'];
    isStreamable = json['isStreamable'];
    feedUrl = json['feedUrl'];
    artworkUrl600 = json['artworkUrl600'];
    genreIds = json['genreIds'] != null ? List<String>.from(json['genreIds']) : null;
    genres = json['genres'] != null ? List<String>.from(json['genres']) : null;
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wrapperType'] = wrapperType;
    data['kind'] = kind;
    data['collectionId'] = collectionId;
    data['trackId'] = trackId;
    data['artistName'] = artistName;
    data['collectionName'] = collectionName;
    data['trackName'] = trackName;
    data['collectionCensoredName'] = collectionCensoredName;
    data['trackCensoredName'] = trackCensoredName;
    data['collectionArtistId'] = collectionArtistId;
    data['collectionArtistViewUrl'] = collectionArtistViewUrl;
    data['collectionViewUrl'] = collectionViewUrl;
    data['trackViewUrl'] = trackViewUrl;
    data['previewUrl'] = previewUrl;
    data['artworkUrl30'] = artworkUrl30;
    data['artworkUrl60'] = artworkUrl60;
    data['artworkUrl100'] = artworkUrl100;
    data['collectionPrice'] = collectionPrice;
    data['trackPrice'] = trackPrice;
    data['trackRentalPrice'] = trackRentalPrice;
    data['collectionHdPrice'] = collectionHdPrice;
    data['trackHdPrice'] = trackHdPrice;
    data['trackHdRentalPrice'] = trackHdRentalPrice;
    data['releaseDate'] = releaseDate;
    data['collectionExplicitness'] = collectionExplicitness;
    data['trackExplicitness'] = trackExplicitness;
    data['trackCount'] = trackCount;
    data['trackNumber'] = trackNumber;
    data['trackTimeMillis'] = trackTimeMillis;
    data['country'] = country;
    data['currency'] = currency;
    data['primaryGenreName'] = primaryGenreName;
    data['contentAdvisoryRating'] = contentAdvisoryRating;
    data['shortDescription'] = shortDescription;
    data['longDescription'] = longDescription;
    data['hasITunesExtras'] = hasITunesExtras;
    data['artistId'] = artistId;
    data['artistViewUrl'] = artistViewUrl;
    data['copyright'] = copyright;
    data['description'] = description;
    data['discCount'] = discCount;
    data['discNumber'] = discNumber;
    data['isStreamable'] = isStreamable;
    data['feedUrl'] = feedUrl;
    data['artworkUrl600'] = artworkUrl600;
    data['genreIds'] = genreIds;
    data['genres'] = genres;
    return data;
  }
}
