class ResponseGetter {
  ResponseGetter._();

  static dynamic getResponseFromAPIResponse(
      {required Map apiResponse, required String apiName}) {
    return apiResponse["data"][apiName];
  }
}
