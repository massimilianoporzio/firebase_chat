import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/error_dialog.dart';
import '../cubit/signin_cubit.dart';
import '../widgets/logo_widget.dart';
import '../widgets/third_party_login.dart';

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
