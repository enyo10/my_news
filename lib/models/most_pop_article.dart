class MostPopArticle {
  final String url;
  final String uri;
  final int id;
  final int assetId;
  final String publishedDate;
  final String updateDate;
  final String section;
  final String title;
  final List<dynamic> media;

  MostPopArticle(
      {this.url,
      this.uri,
      this.id,
      this.assetId,
      this.publishedDate,
      this.updateDate,
      this.section,
      this.title,
      this.media});

  factory MostPopArticle.fromJson(Map<String, dynamic> json) {
    return MostPopArticle(
      title: json['title'],
      url: json['url'],
      uri: json['uri'],
      id: json['id'],
      assetId: json['asset_id'],
      publishedDate: json['published_date'],
      updateDate: json['update_date'],
      section: json['section'],
      media: json['media'],
    );
  }
}

/*{
"status": "OK",
"copyright": "Copyright (c) 2020 The New York Times Company.  All Rights Reserved.",
"num_results": 20,
"results": [
{
"uri": "nyt://article/ded6b3ba-9183-571d-81d0-a2deccc19ec9",
"url": "https://www.nytimes.com/2020/05/31/us/george-floyd-investigation.html",
"id": 100000007166215,
"asset_id": 100000007166215,
"source": "New York Times",
"published_date": "2020-05-31",
"updated": "2020-06-16 09:45:05",
"section": "U.S.",
"subsection": "",
"nytdsection": "u.s.",
"adx_keywords": "Police Brutality, Misconduct and Shootings;Murders, Attempted Murders and Homicides;Black People;Black Lives Matter Movement;George Floyd Protests (2020);Chauvin, Derek (1976- );Floyd, George (d 2020);Police Department (Minneapolis, Minn);Minneapolis (Minn)",
"column": null,
"byline": "By Evan Hill, Ainara Tiefenthäler, Christiaan Triebert, Drew Jordan, Haley Willis and Robin Stein",
"type": "Article",
"title": "8 Minutes and 46 Seconds: How George Floyd Was Killed in Police Custody",
"abstract": "The Times has reconstructed the death of George Floyd on May 25. Security footage, witness videos and official documents show how a series of actions by officers turned fatal.",
"des_facet": [
"Police Brutality, Misconduct and Shootings",
"Murders, Attempted Murders and Homicides",
"Black People",
"Black Lives Matter Movement",
"George Floyd Protests (2020)"
],
"org_facet": [
"Police Department (Minneapolis, Minn)"
],
"per_facet": [
"Chauvin, Derek (1976- )",
"Floyd, George (d 2020)"
],
"geo_facet": [
"Minneapolis (Minn)"
],
"media": [],
"eta_id": 0
},

{
"uri": "nyt://article/b316ddae-bf03-5de8-b9e6-a796d0471430",
"url": "https://www.nytimes.com/2020/06/01/us/floyd-protests-live.html",
"id": 100000007166503,
"asset_id": 100000007166503,
"source": "New York Times",
"published_date": "2020-06-01",
"updated": "2020-06-03 12:38:45",
"section": "U.S.",
"subsection": "",
"nytdsection": "u.s.",
"adx_keywords": "Police Brutality, Misconduct and Shootings;Demonstrations, Protests and Riots;George Floyd Protests (2020);United States;Minneapolis (Minn)",
"column": null,
"byline": "",
"type": "Article",
"title": "Tear Gas Clears Path for Trump to Visit Church",
"abstract": "Police officers used flash grenades to disperse a crowd so the president could visit for a photo opportunity. And in New York, protesters and looters defied a curfew.",
"des_facet": [
"Police Brutality, Misconduct and Shootings",
"Demonstrations, Protests and Riots",
"George Floyd Protests (2020)"
],
"org_facet": [],
"per_facet": [],
"geo_facet": [
"United States",
"Minneapolis (Minn)"
],
"media": [],
"eta_id": 0
},

]
}*/
