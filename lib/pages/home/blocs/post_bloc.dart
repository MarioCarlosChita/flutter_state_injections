import 'dart:io';

import 'package:bloc_aplication/core/errors/failure.dart';
import 'package:bloc_aplication/injections/injections.dart';
import 'package:bloc_aplication/pages/home/blocs/post_event.dart';
import 'package:bloc_aplication/pages/home/blocs/post_state.dart';
import 'package:bloc_aplication/services/post_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostStateLoading()) {
    on<PostEventLoadedListPosts>(_loadPostList);
  }

  void _loadPostList(event, emit) async {
    try {
      final responseBody = await instance.get<PostServive>().listar();
      emit(PostStateSucess(lista: responseBody));
    } on NoInternetException {
      emit(PostStateNoInternet());
    } on FormatBadException {
      emit(PostStateFormatBadRequest());
    } on UnexpectedErrorException {
      emit(PostStateUnexpected());
    }
  }
}
