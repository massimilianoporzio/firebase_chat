import 'package:firebase_chat/features/signin/presentation/widgets/logo_widget.dart';
import 'package:firebase_chat/features/signin/presentation/widgets/third_party_login.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          LogoWidget(),
          Spacer(),
          ThirdPartyLoginWidget(),
        ],
      ),
    ));
  }
}
