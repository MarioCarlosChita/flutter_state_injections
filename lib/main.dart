import 'package:bloc_aplication/injections/injections.dart';
import 'package:bloc_aplication/pages/home/blocs/post_bloc.dart';
import 'package:bloc_aplication/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_context/one_context.dart';

void main() {
  setUpConfigurationInjection();
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => PostBloc())],
      child: MaterialApp(
        home: const HomePage(),
        builder: instance.get<OneContext>().builder,
        key: instance.get<OneContext>().key,
        debugShowCheckedModeBanner: false,
      )));
}
