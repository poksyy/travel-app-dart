class Films {
  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;
  final String url;

  Films(this.title, this.episodeId, this.openingCrawl, this.director, this.producer ,this.releaseDate, this.url);

  String getUrl(){
    return url;
  }

  String getTitle() {
    return title;
  }

  int getEpisodeId(){
    return episodeId;
  }

  String getOpeningCrawl(){
    return openingCrawl;
  }

  String getProducer() {
    return producer;
  }

  String getReleaseDate(){
    return releaseDate;
  }

  String getDirector() {
    return director;
  }
  
}
