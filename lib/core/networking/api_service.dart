import 'package:dio/dio.dart';
import 'package:docapp/feature/signup/data/model/sign_up_response.dart';
import 'package:retrofit/http.dart';

import '../../feature/login/data/model/login_request_body.dart';
import '../../feature/login/data/model/login_response.dart';
import '../../feature/signup/data/model/sign_up_request_body.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
  @POST(ApiConstants.signup)
  Future<SignupResponse>signup(
      @Body() SignupRequestBody signUpRequestBody
      );
}


