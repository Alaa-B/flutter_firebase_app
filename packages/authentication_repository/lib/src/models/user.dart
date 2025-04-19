import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    this.email,
    this.password,
    this.photo,
    this.name,
  });
  final String id;
  final String? email;
  final String? password;
  final String? photo;
  final String? name;
  static const empty = User(id: '');

  @override
  List<Object?> get props => [id, email, password, photo, name];
}
