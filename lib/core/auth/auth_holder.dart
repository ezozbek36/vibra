import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

typedef TokenData = ({String accessToken, String refreshToken, DateTime expiresAt});

@singleton
class AuthHolder with ChangeNotifier {
  static const _accessKey = 'spotify_access_token';
  static const _refreshKey = 'spotify_refresh_token';
  static const _expiresKey = 'spotify_expires_at';

  final FlutterSecureStorage _storage;

  TokenData? _token;

  TokenData? get token => _token;

  bool get hasAuth => _token != null && DateTime.now().isBefore(_token!.expiresAt);

  AuthHolder(this._storage);

  @preResolve
  @factoryMethod
  static Future<AuthHolder> create(FlutterSecureStorage storage) async {
    final holder = AuthHolder(storage);
    await holder._loadFromDisk();
    return holder;
  }

  Future<void> _loadFromDisk() async {
    final access = await _storage.read(key: _accessKey);
    final refresh = await _storage.read(key: _refreshKey);
    final expiresStr = await _storage.read(key: _expiresKey);

    if (access != null && expiresStr != null) {
      _token = (accessToken: access, refreshToken: refresh ?? '', expiresAt: DateTime.tryParse(expiresStr) ?? DateTime.now());
    }
  }

  Future<void> updateAccessToken(String newToken, DateTime expiresAt) async {
    if (_token != null) {
      _token = (
        accessToken: newToken,
        refreshToken: _token!.refreshToken,
        expiresAt: expiresAt,
      );
    } else {
      _token = (
        accessToken: newToken,
        refreshToken: '',
        expiresAt: expiresAt,
      );
    }

    await _storage.write(key: _accessKey, value: newToken);
    await _storage.write(key: _expiresKey, value: expiresAt.toIso8601String());

    notifyListeners();
  }

  Future<void> saveTokens(TokenData data) async {
    _token = data;
    await _storage.write(key: _accessKey, value: data.accessToken);
    await _storage.write(key: _refreshKey, value: data.refreshToken);
    await _storage.write(
      key: _expiresKey,
      value: data.expiresAt.toIso8601String(),
    );

    notifyListeners();
  }

  Future<void> clear() async {
    _token = null;
    await _storage.deleteAll();
    notifyListeners();
  }
}
