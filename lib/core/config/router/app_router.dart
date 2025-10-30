import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:vibra/core/auth/auth_holder.dart';
import 'package:vibra/core/config/router/app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final AuthHolder _authHolder;

  AppRouter(this._authHolder);

  @override
  RouteType get defaultRouteType => RouteType.adaptive(enablePredictiveBackGesture: true);

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/login', page: LoginRoute.page, initial: !_authHolder.hasAuth),
    NamedRouteDef.shell(
      path: '/',
      name: 'Main',
      initial: _authHolder.hasAuth,
      children: [
        AutoRoute(path: '', page: HomeRoute.page),
        AutoRoute(path: 'album/:id', page: AlbumRoute.page),
      ],
    ),
  ];

  @override
  List<AutoRouteGuard> get guards => [
    AutoRouteGuard.simple((resolver, router) {
      if (!_authHolder.hasAuth && resolver.routeName != LoginRoute.name) {
        resolver.redirectUntil(LoginRoute());
      } else if (_authHolder.hasAuth && resolver.routeName == LoginRoute.name) {
        resolver.redirectUntil(HomeRoute());
      } else {
        resolver.next();
      }
    }),
  ];
}
