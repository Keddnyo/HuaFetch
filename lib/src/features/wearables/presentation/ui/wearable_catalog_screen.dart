import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../shared/i18n/string_resource.dart';
import '../../../auth/domain/model/user.dart';
import '../../../auth/presentation/provider/auth_provider.dart';
import '../../data/api/wearable_api.dart';
import '../../data/repository/wearable_repository.dart';
import 'widgets/wearable_card.dart';

class WearableCatalogScreen extends StatelessWidget {
  const WearableCatalogScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(context.stringResource.appName),
          actions: [
            IconButton(
              onPressed: () {
                WebViewCookieManager().clearCookies();
                AuthProvider.signOut(user.loginToken!);
                Navigator.pushReplacementNamed(context, 'null');
              },
              icon: const Icon(Icons.logout),
            ),
            IconButton(
              onPressed: () => launchUrl(
                Uri.https(
                  'github.com',
                  '/Keddnyo/HuaFetch',
                ),
              ),
              icon: const Icon(Icons.code),
            ),
            IconButton(
              onPressed: () => showAboutDialog(
                context: context,
                applicationVersion: '1.0.0',
                applicationIcon: Image.asset(
                  'assets/icon.png',
                  width: 72.0,
                  height: 72.0,
                ),
                applicationLegalese: context.stringResource.legalese,
              ),
              icon: const Icon(Icons.info_outline),
            )
          ],
        ),
        body: FutureBuilder(
          future: WearableRepository(
            api: WearableApi(
              userId: user.id!,
              appToken: user.appToken!,
            ),
          ).getWearables(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final wearableList = snapshot.data!;
            final wearableListSize = wearableList.length;

            if (wearableList.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    context.stringResource.emptyWearableList,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 512.0,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: WearableCard(
                  wearable: wearableList[index],
                  onAuthKeyCopyTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          context.stringResource.authKeyCopyMessage,
                        ),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
              ),
              itemCount: wearableListSize,
            );
          },
        ),
      );
}
