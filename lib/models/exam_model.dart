class ExamRecord {
  final String id;
  final String examType;
  final String examLocation;
  final String examDate;

  ExamRecord({
    required this.id,
    required this.examType,
    required this.examLocation,
    required this.examDate,
  });

  factory ExamRecord.fromJson(Map<String, dynamic> json) {
    return ExamRecord(
      id: json['_id'] ?? '',
      examType: json['exam_type'] ?? 'Unknown Exam',
      examLocation: json['exam_location'] ?? 'No Location Provided',
      examDate: json['exam_date'] ?? 'No Date Set',
    );
  }
}