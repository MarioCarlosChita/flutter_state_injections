

import 'package:bloc_aplication/injections/injections.dart';
import 'package:bloc_aplication/pages/home/blocs/post_state.dart';
import 'package:bloc_aplication/services/post_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit  extends Cubit<PostState>{

  PostCubit():super(PostStateLoading());

  void onListPosts() async{
    final _response =  await instance.get<PostServive>().listar();
  }

}