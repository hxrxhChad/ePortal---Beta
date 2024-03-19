// import 'package:exam/frontend/views/question.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'backend/database/index.dart';
import 'backend/state management/index.dart';
import 'utils/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final shared = Shared();
  final String authId = await shared.getShared('authId') ?? 'null';
  final String admin = await shared.getShared('admin') ?? 'null';
  debugPrint(' onAppStart ---> $authId   $admin');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(authId: authId, admin: admin));
}

class MyApp extends StatelessWidget {
  final String? authId;
  final String? admin;
  const MyApp({super.key, required this.authId, required this.admin});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => EyeCubit()),
      BlocProvider(create: (_) => AuthCubit()),
      BlocProvider(create: (_) => TestCubit()),
    ], child: App(authId: authId, admin: admin));
  }
}

class App extends StatelessWidget {
  final String? authId;
  final String? admin;
  App({super.key, required this.authId, required this.admin});

  final Routes route = Routes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Style.light,
      themeMode: ThemeMode.light,
      title: 'ePortal',
      initialRoute: authId == 'null'
          ? Routes.initial
          : admin != 'null'
              ? admin == 'Admin'
                  ? Routes.adminHome
                  : Routes.studentHome
              : Routes.initial,
      onGenerateRoute: Routes.onGenerateRoute,
      // navigatorKey: route.navigatorKey,
      // home: QuestionView(),
    );
  }
}
