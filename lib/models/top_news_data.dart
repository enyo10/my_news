class TopNews {
  final String url;
  final String uri;
  final int id;
  final int assetId;
  final String publishedDate;
  final String updateDate;
  final String section;
  final String title;
  final List<dynamic> multimedia;

  TopNews(
      {this.url,
      this.uri,
      this.id,
      this.assetId,
      this.publishedDate,
      this.updateDate,
      this.section,
      this.title,
      this.multimedia});

  factory TopNews.fromJson(Map<String, dynamic> json) {
    return TopNews(
      title: json['title'],
      url: json['url'],
      uri: json['uri'],
      id: json['id'],
      assetId: json['asset_id'],
      publishedDate: json['published_date'],
      updateDate: json['update_date'],
      section: json['section'],
      multimedia: json['multimedia'],
    );
  }
}

/*
{
"section": "world",
"subsection": "asia",
"title": "China Is Collecting DNA From Tens of Millions of Men and Boys, Using U.S. Equipment",
"abstract": "Even children are pressed into giving blood samples to build a sweeping genetic database that will add to Beijing’s growing surveillance capabilities, raising questions about abuse and privacy.",
"url": "https://www.nytimes.com/2020/06/17/world/asia/China-DNA-surveillance.html",
"uri": "nyt://article/c003302f-3b47-5418-b3a9-cb5e2643b71d",
"byline": "By Sui-Lee Wee",
"item_type": "Article",
"updated_date": "2020-06-17T14:40:14-04:00",
"created_date": "2020-06-17T06:00:14-04:00",
"published_date": "2020-06-17T06:00:14-04:00",
"material_type_facet": "",
"kicker": "",
"des_facet": [
"Surveillance of Citizens by Government",
"Forensic Science",
"Genetics and Heredity",
"Tests (Medical)",
"DNA (Deoxyribonucleic Acid)",
"Privacy",
"Human Rights and Human Rights Violations"
],
"org_facet": [
"Thermo Fisher Scientific Inc",
"Ministry of Public Security of the People's Republic of China"
],
"per_facet": [

],
"geo_facet": [
"China"
],
"multimedia": [
{
"url": "https://static01.nyt.com/images/2020/06/18/business/18china-dna-sub/18china-dna-sub-superJumbo.jpg",
"format": "superJumbo",
"height": 1152,
"width": 2048,
"type": "image",
"subtype": "photo",
"caption": "",
"copyright": "Erik Carter"
},
{
"url": "https://static01.nyt.com/images/2020/06/18/business/18china-dna-sub/18china-dna-sub-thumbStandard.jpg",
"format": "Standard Thumbnail",
"height": 75,
"width": 75,
"type": "image",
"subtype": "photo",
"caption": "",
"copyright": "Erik Carter"
},
{
"url": "https://static01.nyt.com/images/2020/06/18/business/18china-dna-sub/18china-dna-sub-thumbLarge.jpg",
"format": "thumbLarge",
"height": 150,
"width": 150,
"type": "image",
"subtype": "photo",
"caption": "",
"copyright": "Erik Carter"
},
{
"url": "https://static01.nyt.com/images/2020/06/18/business/18china-dna-sub/18china-dna-sub-mediumThreeByTwo210.jpg",
"format": "mediumThreeByTwo210",
"height": 140,
"width": 210,
"type": "image",
"subtype": "photo",
"caption": "",
"copyright": "Erik Carter"
},
{
"url": "https://static01.nyt.com/images/2020/06/18/business/18china-dna-sub/18china-dna-sub-articleInline.jpg",
"format": "Normal",
"height": 107,
"width": 190,
"type": "image",
"subtype": "photo",
"caption": "",
"copyright": "Erik Carter"
}
],
"short_url": "https://nyti.ms/2N7xBHa"
},
*/
