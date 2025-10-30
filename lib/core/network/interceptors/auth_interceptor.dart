import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:vibra/core/auth/auth_holder.dart';

@LazySingleton()
class AuthInterceptor implements Interceptor {
  final AuthHolder _authHolder;

  const AuthInterceptor(this._authHolder);

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) async {
    var request = chain.request;

    if (_authHolder.hasAuth) {
      request = applyHeader(request, 'Authorization', 'Bearer ${_authHolder.token!.accessToken}');
    }

    return await chain.proceed(request);
  }
}
