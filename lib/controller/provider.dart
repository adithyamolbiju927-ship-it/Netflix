import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netfix/model/model.dart';
import 'package:netfix/service/service.dart';

final serviceprovider = Provider<Service>((ref) {
  return Service();
});

final nowplayingpro = FutureProvider<List<Model>>((ref) async {
  try {
    final service = ref.watch(serviceprovider);
    return await service.getnowPlaying();
  } catch (e) {
    throw Exception(e);
  }
});

final toprateProvider = FutureProvider<List<Model>>((ref) async {
  try {
    // ignore: non_constant_identifier_names
    final Service = ref.watch(serviceprovider);
    return await Service.toprated();
  } catch (e) {
    throw Exception(e);
  }
});

final upcomingProvider = FutureProvider<List<Model>>((ref) async {
  try {
    // ignore: non_constant_identifier_names
    final Service = ref.watch(serviceprovider);
    return await Service.upcoming();
  } catch (e) {
    throw Exception(e);
  }
});

final tvshowprovider = FutureProvider<List<Model>>((ref) async {
  try {
    // ignore: non_constant_identifier_names
    final Service = ref.watch(serviceprovider);
    return await Service.tvshows();
  } catch (e) {
    throw Exception(e);
  }
});
