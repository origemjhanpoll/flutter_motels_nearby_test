import 'package:flutter_motels_nearby_test/app/repositories/motels_repository.dart';
import 'package:flutter_motels_nearby_test/app/services/api_client.dart';
import 'package:flutter_motels_nearby_test/app/viewmodel/motels_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final di = GetIt.instance;

Future<void> init() async {
  di.registerLazySingleton<http.Client>(() => http.Client());
  di.registerLazySingleton<ApiClient>(() => ApiClient(client: http.Client()));
  di.registerLazySingleton<MotelsRepository>(
      () => MotelsRepository(di<ApiClient>()));
  di.registerFactory<MotelsViewModel>(
      () => MotelsViewModel(di<MotelsRepository>()));
}
