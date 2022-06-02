import 'dart:convert';

class CourseModel {
  static List<Course> courses = [];
}

class Course {
  final int courseId;
  final String title;
  final String author;
  final String courseType;
  final String about;
  final String rating;
  final String duration;
  final String courseLink;

  Course(
    this.courseId,
    this.title,
    this.author,
    this.courseType,
    this.about,
    this.rating,
    this.duration,
    this.courseLink,
  );

  Course copyWith({
    int? courseId,
    String? title,
    String? author,
    String? courseType,
    String? about,
    String? rating,
    String? duration,
    String? courseLink,
  }) {
    return Course(
      courseId ?? this.courseId,
      title ?? this.title,
      author ?? this.author,
      courseType ?? this.courseType,
      about ?? this.about,
      rating ?? this.rating,
      duration ?? this.duration,
      courseLink ?? this.courseLink,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'courseId': courseId});
    result.addAll({'title': title});
    result.addAll({'author': author});
    result.addAll({'courseType': courseType});
    result.addAll({'about': about});
    result.addAll({'rating': rating});
    result.addAll({'duration': duration});
    result.addAll({'courseLink': courseLink});

    return result;
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      map['courseId']?.toInt() ?? 0,
      map['title'] ?? '',
      map['author'] ?? '',
      map['courseType'] ?? '',
      map['about'] ?? '',
      map['rating'] ?? '',
      map['duration'] ?? '',
      map['courseLink'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Course(courseId: $courseId, title: $title, author: $author, courseType: $courseType, about: $about, rating: $rating, duration: $duration, courseLink: $courseLink)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Course &&
        other.courseId == courseId &&
        other.title == title &&
        other.author == author &&
        other.courseType == courseType &&
        other.about == about &&
        other.rating == rating &&
        other.duration == duration &&
        other.courseLink == courseLink;
  }

  @override
  int get hashCode {
    return courseId.hashCode ^
        title.hashCode ^
        author.hashCode ^
        courseType.hashCode ^
        about.hashCode ^
        rating.hashCode ^
        duration.hashCode ^
        courseLink.hashCode;
  }
}
