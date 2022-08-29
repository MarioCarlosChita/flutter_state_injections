import 'package:bloc_aplication/injections/injections.dart';
import 'package:bloc_aplication/pages/home/blocs/post_event.dart';
import 'package:bloc_aplication/pages/home/blocs/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_context/one_context.dart';

import '../blocs/post_bloc.dart';

class HomeListPost extends StatefulWidget {
  const HomeListPost({Key? key}) : super(key: key);

  @override
  State<HomeListPost> createState() => _HomeListPostrState();
}

class _HomeListPostrState extends State<HomeListPost> {
  @override
  void initState() {
    _initialLoading();
    super.initState();
  }

  void _initialLoading() {
    BlocProvider.of<PostBloc>(context).add(PostEventLoadedListPosts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listener: (context, state) {
        if (state is PostStateNoInternet) {
          instance.get<OneContext>().showDialog(
              builder: (_) => AlertDialog(
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Verifica a sua Conexão com a  Internet",
                          style: TextStyle(fontSize: 12),
                        ),
                        TextButton(
                            onPressed: () => Navigator.of(_).pop(),
                            child: Text("Ok"))
                      ],
                    ),
                  ));
        }
      },
      builder: (context, state) {
        if (state is PostStateSucess) {
          return Text(state.lista.length.toString());
        }
        return Center(
          child: MaterialButton(
            color: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Text(
              "Tenta Novamente",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => _initialLoading(),
            minWidth: 120,
            height: 30,
          ),
        );
      },
    );
  }
}
