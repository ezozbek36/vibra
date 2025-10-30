import 'dart:convert';

import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:vibra/core/auth/pkce_helper.dart';
import 'package:vibra/core/config/env/env.dart';

@lazySingleton
class SpotifyAuthRemoteDataSource {
  static const _tokenUrl = 'https://accounts.spotify.com/api/token';

  Future<Map<String, dynamic>> authorize() async {
    final verifier = PKCEHelper.generateCodeVerifier();
    final challenge = PKCEHelper.generateCodeChallenge(verifier);

    final authUri = Uri.https('accounts.spotify.com', '/authorize', {
      'client_id': Env.spotifyClientId,
      'response_type': 'code',
      'redirect_uri': Env.spotifyRedirectUri,
      'code_challenge_method': 'S256',
      'code_challenge': challenge,
      'scope': 'user-read-private user-read-email',
    });

    final result = await FlutterWebAuth2.authenticate(
      url: authUri.toString(),
      callbackUrlScheme: 'dev.ezozbek.vibra',
      options: FlutterWebAuth2Options(useWebview: false),
    );

    final code = Uri.parse(result).queryParameters['code'];

    if (code == null) throw Exception('Authorization code not found');

    final res = await http.post(
      Uri.parse(_tokenUrl),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'client_id': Env.spotifyClientId,
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': Env.spotifyRedirectUri,
        'code_verifier': verifier,
      },
    );

    if (res.statusCode != 200) {
      throw Exception('Token exchange failed: ${res.body}');
    }

    return jsonDecode(res.body);
  }
}
