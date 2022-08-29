


import '../../../models/post.dart';

abstract class PostState{}


class PostStateNoInternet extends PostState {}
class PostStateUnexpected extends PostState {}
class PostStateFormatBadRequest extends PostState {}
class PostStateLoading  extends  PostState{}
class PostStateSucess extends  PostState{
  final List<Post> lista;
  PostStateSucess({required this.lista});
}