import 'package:dio/dio.dart';
import 'package:newsapi/Cubit/NewsState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapi/Networks/Services/NewsApi.dart';
import '../Networks/Model/NewsModel.dart';
class NewsCubit extends Cubit<NewState> {
  NewsCubit() : super(InitialState());
  final api = NewsApi(Dio(BaseOptions(
      contentType: 'application/json', validateStatus: ((status) => true))));
  Future fetchEvents() async {
    try {
      emit(LoadingState());
      print('renjhh');
      final res=await api.getEvents();
      print(res.response.statusCode);
      if(res.response.statusCode==200) {
        print(res.data);
        NewsModel model = NewsModel.fromJson(res.data);
        emit(NewsLoadedState(model));
        print(res.data);
      }
      else {
        Map<String, dynamic>? msg = res.data;
        emit(ErrorState(msg?['error'] ?? ''));
      }
    } catch (ex) {
        emit(ErrorState(
            "Can't fetch posts, please check your internet connection!"));
    }
  }
}
