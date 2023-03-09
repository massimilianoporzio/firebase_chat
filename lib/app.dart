import 'package:firebase_chat/core/routes/pages.dart';
import 'package:firebase_chat/core/services/service_locator.dart';
import 'package:firebase_chat/features/welcome/presentation/cubit/welcome_cubit.dart';
import 'package:firebase_chat/features/welcome/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WelcomeCubit>(
          create: (context) => sl(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        // home: const Scaffold(
        //     body: Center(
        //   child: WelcomePage(),
        // )),
      ),
    );
  }
}
