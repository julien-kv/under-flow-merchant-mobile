import 'package:dartz/dartz.dart';
import 'package:merchant_app/app/common/api/response_getter.dart';

import '../../../common/api/api_client.dart';
import '../../../common/models/events.dart';
import '../../../common/service/network_service.dart';
import '../../../common/values/strings.dart';

class AllEventsRepository {
  static final AllEventsRepository instance = AllEventsRepository._();
  AllEventsRepository._();
  factory AllEventsRepository() => instance;

  final ApiClient api = NetworkService.networkService.api;
  Future<Either<String, List<Event>>> getEvents() async {
    List<Event> eventList = <Event>[];
    try {
      final apiResponse =
          await api.get(uri: "http://192.168.1.218:1337/events");
      if (apiResponse.isNotEmpty) {
        final events = apiResponse as List<dynamic>;
        eventList = events.map((event) {
          return Event.fromMap(event);
        }).toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      return const Left(Strings.error);
    }

    return right(eventList);
  }
}
