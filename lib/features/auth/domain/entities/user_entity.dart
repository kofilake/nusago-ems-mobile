import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String username;
  final String email;

  const UserEntity({required this.username, required this.email});

  @override
  List<Object?> get props => [username, email];
}
