import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:netfix/model/model.dart';
import 'package:netfix/service/service.dart';

final searchMoveProvider = StateProvider((re) => '');

final searchProvider = FutureProvider<List<Model>>((ref) async {
  try {
    final query = ref.watch(searchMoveProvider);

    if (query.isEmpty) return [];

    final repostory = Service();
    return await repostory.serchMovie(query);
  } catch (e) {
    throw Exception(e);
  }
});
