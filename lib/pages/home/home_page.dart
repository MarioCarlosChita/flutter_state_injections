import 'package:bloc_aplication/pages/home/widgets/home_list_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/post_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size _mediaDevice = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: _mediaDevice.width,
        height: _mediaDevice.height - 200,
        child: Center(
          child: BlocProvider(
            create: (_) => BlocProvider.of<PostBloc>(context),
            child: const HomeListPost(),
          ),
        ),
      ),
    );
  }
}
