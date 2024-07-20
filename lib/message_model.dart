import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MessageModel {
  int id;
  String message;
  bool is_me;
  MessageModel({
    required this.id,
    required this.message,
    required this.is_me,
  });

  MessageModel copyWith({
    int? id,
    String? message,
    bool? is_me,
  }) {
    return MessageModel(
      id: id ?? this.id,
      message: message ?? this.message,
      is_me: is_me ?? this.is_me,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'message': message,
      'is_me': is_me,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as int,
      message: map['message'] as String,
      is_me: map['is_me'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MessageModel(id: $id, message: $message, is_me: $is_me)';

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.message == message &&
      other.is_me == is_me;
  }

  @override
  int get hashCode => id.hashCode ^ message.hashCode ^ is_me.hashCode;
}
