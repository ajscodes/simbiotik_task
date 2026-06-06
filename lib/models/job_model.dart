class JobModel {
  final String title;
  final String companyName;
  final String location;
  final String description;
  final String url;
  bool isBookmarked;

  JobModel({
    required this.title,
    required this.companyName,
    required this.location,
    required this.description,
    required this.url,
    this.isBookmarked = false,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      title: json['title'] ?? 'No Title provided',
      companyName: json['company_name'] ?? 'Unknown Company',
      location: json['location'] ?? 'Unknown Location',
      description: json['description'] ?? 'No Description provided',
      url: json['url'] ?? '',
    );
  }
}
