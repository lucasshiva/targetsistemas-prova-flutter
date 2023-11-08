import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PrivacyPolicyText extends StatelessWidget {
  const PrivacyPolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrlString("https://google.com.br"),
      child: Text(
        "Política de Privacidade",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
      ),
    );
  }
}
