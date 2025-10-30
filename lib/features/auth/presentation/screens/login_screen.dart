import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibra/core/config/router/app_router.gr.dart';
import 'package:vibra/features/auth/presentation/providers/auth_provider.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authAsync = ref.watch(authProvider);

    return Scaffold(
      body: Center(
        child: authAsync.when(
          error: (err, _) => Text('Error: $err'),
          loading: () => CircularProgressIndicator(),
          data: (token) {
            if (token != null && !token.isExpired) {
              return ElevatedButton(
                onPressed: () {
                  context.router.replace(HomeRoute());
                },
                child: Text('Continue to Home'),
              );
            }

            return ElevatedButton.icon(
              icon: Icon(Icons.login),
              label: Text('Login with Spotify'),
              onPressed: () {
                ref.read(authProvider.notifier).login();
              },
            );
          },
        ),
      ),
    );
  }
}
