import 'package:dartz/dartz.dart';
import 'package:merchant_app/app/common/models/event.dart';

import '../../../common/api/api_client.dart';
import '../../../common/service/network_service.dart';
import '../../../common/values/strings.dart';

class EventDetailrepository {
  static final EventDetailrepository instance = EventDetailrepository._();
  EventDetailrepository._();
  factory EventDetailrepository() => instance;

  final ApiClient api = NetworkService.networkService.api;
}
