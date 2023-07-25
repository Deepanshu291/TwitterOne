import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fwitter/Components/Loader.dart';
import 'package:fwitter/Components/error.dart';
import 'package:fwitter/Features/Home/view/HomeView.dart';
import 'package:fwitter/Features/auth/controller/auth_controller.dart';
import 'package:fwitter/Features/auth/view/login_view.dart';
import 'package:fwitter/utils/apptheme.dart';

void main() {
  runApp(const ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      theme: AppTheme.theme,
      home: ref.watch(currenUserAccountProvider).when(
          data: (user) {
            print(user);
            if (user != null) {
              return const HomeView();
            }
            return LoginView();
          },
          error: (error, stackTrace) {
            ErrorPage(error: error.toString());
          },
          loading: () => const Loading_Page()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}
