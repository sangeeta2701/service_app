import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: "https://gifted-pike-visor.cyclic.app/api")
abstract class ApiClient{
  factory ApiClient(Dio dio) = _ApiClient;

  static ApiClient getServices(){
    final dio = Dio();
    return ApiClient(dio);
  }

  @GET("/services")
  Future<String> fetchServiceListApi();

  @GET("/vehicles")
  Future<String> fetchVehicleListApi();

  @GET("/bills")
  Future<String> fetchBillListApi();
}