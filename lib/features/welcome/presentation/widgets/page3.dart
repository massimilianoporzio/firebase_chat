import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/routes/names.dart';
import '../cubit/welcome_cubit.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  _handleSignIn(BuildContext context) {
    context.read<WelcomeCubit>().saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            "assets/images/banner3.png",
          ),
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BlocBuilder<WelcomeCubit, WelcomeState>(
            builder: (context, state) {
              if (state.status == WelcomeStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          Positioned(
            bottom: 90,
            child: ElevatedButton(
              onPressed: () {
                print("LOGIN");
                _handleSignIn(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                side: const MaterialStatePropertyAll(
                    BorderSide(color: Colors.white)),
              ),
              child: const Text("Login"),
            ),
          )
        ],
      ),
    );
  }
}
