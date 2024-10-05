import 'package:flutter/material.dart';
import '../../../../../../shared/i18n/string_resource.dart';

import '../../../../../core/utilities/copy_text.dart';
import '../../../domain/model/wearable.dart';

class WearableCard extends StatelessWidget {
  const WearableCard({
    super.key,
    required this.wearable,
    required this.onAuthKeyCopyTap,
  });

  final Wearable wearable;
  final VoidCallback onAuthKeyCopyTap;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.watch_outlined),
              ),
              title: Text(wearable.macAddress!),
              subtitle: Text(
                'S/N: ${wearable.serialNumber}',
              ),
            ),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.code),
              ),
              title: Text(context.stringResource.firmwareVersion),
              subtitle: Text(wearable.firmwareVersion!),
            ),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.memory),
              ),
              title: Text(context.stringResource.hardwareVersion),
              subtitle: Text(wearable.hardwareVersion!),
            ),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.key),
              ),
              title: Text(context.stringResource.authKey),
              subtitle: Text(wearable.signedAuthKey!),
              trailing: IconButton(
                onPressed: () {
                  copyText(wearable.authKey!);
                  onAuthKeyCopyTap();
                },
                icon: const Icon(Icons.copy),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'deviceSource - ${wearable.deviceSource}, productionSource - ${wearable.productVersion}',
                style: const TextStyle(
                  fontSize: 10.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}
