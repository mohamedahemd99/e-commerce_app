import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/base/model/base_model.dart';
import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/constants/enums/request_types.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NetworkManager {
  static NetworkManager? instance = NetworkManager.init();
  NetworkManager() {
    NetworkManager.init();
  }
  late final Dio dio;

  NetworkManager.init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      // contentType: ApiConstants.json,
    ));
  }
  Future request<T extends BaseModel>({
    required ReqTypes method,
    required String path,
    dynamic data,
    required T model,
    Map<String, dynamic>? queryParameters,
    bool isBaseResponse = true,
    isFile = false,
  }) async {
    data ??= <String, dynamic>{};
    try {
      EasyLoading.show(dismissOnTap: false);

      var body = data is Map || data is FormData ? data : data.toJson();

      var response = await dio.request(path,
          data: body,
          queryParameters: queryParameters,
          options: Options(
            contentType: 'application/x-www-form-urlencoded',
            method: method.name,
          ));

      if (response.statusCode == 200) {
        if (response.data is List) {
          var list = <T>[];
          for (var element in (response.data as List)) {
            list.add(model.fromJson(element));
          }
          log('$path ${method.name} data ${response.data}');
          EasyLoading.dismiss();

          return list.isNotEmpty ? list : model;
        }
        log('$path ${method.name} data ${response.data}');
        EasyLoading.dismiss();

        return model.fromJson(response.data);
      } else {
        log('$path ${method.name} FAILED | Status Code: ${response.statusCode} | Status Message: ${response.statusMessage}');
        EasyLoading.dismiss();

        return null;
      }
    } on DioError catch (dioError) {
      log('$path ${method.name} DIO ERROR | Error : $dioError');
      EasyLoading.dismiss();

      return null;
    } catch (error) {
      log('$path ${method.name} ERROR | Error : $error');
      EasyLoading.dismiss();

      return null;
    }
  }
}
