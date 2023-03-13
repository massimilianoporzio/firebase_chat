import 'package:firebase_chat/core/errors/error_dialog.dart';
import 'package:firebase_chat/features/signin/presentation/widgets/logo_widget.dart';
import 'package:firebase_chat/features/signin/presentation/widgets/third_party_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/signin_cubit.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state.status == SigninStatus.error) {
          errorDialog(context, errorMsg: state.errMsg!);
        }
      },
      builder: (context, state) {
        if (state.status == SigninStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                LogoWidget(),
                Spacer(),
                ThirdPartyLoginWidget(),
              ],
            ),
          );
        }
      },
    ));
  }
}
