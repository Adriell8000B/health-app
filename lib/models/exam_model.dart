class ExamRecord {
  final String title;
  final String location;
  final String date;

  ExamRecord({required this.title, required this.location, required this.date});

  factory ExamRecord.fromJson(Map<String, dynamic> json) {
    return ExamRecord(
      // The test API uses 'title' and 'body' fields
      title: json['title'] ?? 'No Title',
      location: json['body'].toString().substring(
        0,
        20,
      ), // Use first 20 chars of body
      date: "Post ID: ${json['id']}",
    );
  }
}
