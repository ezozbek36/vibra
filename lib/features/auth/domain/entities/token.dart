import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;

  const Token({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  @override
  List<Object?> get props => [accessToken, refreshToken, expiresAt];
}
