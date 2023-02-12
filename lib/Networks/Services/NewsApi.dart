import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'NewsApi.g.dart';

@RestApi(baseUrl: 'https://api.sampleapis.com')
abstract class NewsApi {
  factory NewsApi(Dio dio) = _NewsApi;
  @GET('/futurama/characters/15')
  Future<HttpResponse> getEvents();
}
