import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/resource.dart';
import '../../domain/model/user.dart';
import '../provider/auth_provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _MiAccountAuthScreenState();
}

class _MiAccountAuthScreenState extends State<AuthScreen> {
  final controller = WebViewController();

  bool isLoading = false;
  void switchLoading() => setState(() => isLoading = !isLoading);

  void signIn({
    required String requestCode,
    required void Function(Resource<User> user) onSignIn,
  }) =>
      AuthProvider.signIn(requestCode).then(
        (user) {
          if (user is DataResource) {
            onSignIn(user);
          }
        },
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : PopScope(
                  canPop: false,
                  onPopInvokedWithResult: (didPop, result) async {
                    if (await controller.canGoBack()) {
                      controller.goBack();
                      return;
                    }

                    exit(0);
                  },
                  child: WebViewWidget(
                    controller: controller
                      ..setUserAgent('Mozilla/5.0 (Android)')
                      ..setJavaScriptMode(JavaScriptMode.unrestricted)
                      ..loadRequest(
                        Uri.https(
                          'account.xiaomi.com',
                          '/oauth2/authorize',
                          {
                            'skip_confirm': 'true',
                            'client_id': '2882303761517383915',
                            'pt': '0',
                            'scope': '1+6000+16001+20000',
                            'redirect_uri': 'https://hm.xiaomi.com/watch.do',
                            '_locale': 'en_US',
                            'response_type': 'code',
                          },
                        ),
                      )
                      ..setNavigationDelegate(
                        NavigationDelegate(
                          onUrlChange: (urlChange) {
                            final uri = Uri.parse(urlChange.url!);

                            final authority = uri.authority;

                            final parameters = uri.queryParameters;
                            final requestCode = parameters['code'];

                            if (authority == 'hm.xiaomi.com' &&
                                requestCode != null) {
                              switchLoading();

                              signIn(
                                requestCode: requestCode,
                                onSignIn: (user) {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/wearables',
                                    arguments: user.data,
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                  ),
                ),
        ),
        bottomNavigationBar: const BottomAppBar(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'HuaFetch',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Copyright (c) 2024 Timur Zhdikhanov',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
      );
}
