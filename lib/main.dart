import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wireapps_technical_test/practical_assignment.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //Initialize splashscreen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //HydratedStorage initialize for hydrated shared_blocs
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationSupportDirectory(),
  );
  await runZonedGuarded(() async => wireappsPracticalTest(storage: storage), onError);
}
void wireappsPracticalTest({required HydratedStorage storage}) {
  BlocOverrides.runZoned(
        () => HydratedBlocOverrides.runZoned(
          () => runApp(
        const PracticalAssignment(),
      ),
      storage: storage,
    ),
  );
}
void onError(dynamic object, StackTrace err) {
  developer.log(err.toString());
  developer.log(object.toString());
}


