import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibra/core/auth/auth_holder.dart';
import 'package:vibra/core/config/di/injection.dart';
import 'package:vibra/core/config/router/app_router.dart';
import 'package:vibra/core/theme/theme.dart';

class VibraApp extends ConsumerStatefulWidget {
  const VibraApp({super.key});

  @override
  ConsumerState<VibraApp> createState() => _VibraAppState();
}

class _VibraAppState extends ConsumerState<VibraApp> {
  late final AppRouter _router = getIt<AppRouter>();
  late final AuthHolder _authHolder = getIt<AuthHolder>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Vibra',
      theme: VibraTheme.light,
      darkTheme: VibraTheme.dark,
      debugShowCheckedModeBanner: false,
      routerConfig: _router.config(reevaluateListenable: _authHolder),
    );
  }
}
