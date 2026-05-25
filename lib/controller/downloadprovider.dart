import 'package:flutter_riverpod/legacy.dart';
import 'package:netfix/model/model.dart';

class DownloadNotifier extends StateNotifier<List<Model>> {
  DownloadNotifier() : super([]);
  void addDownload(Model movie) {
    try {
      state = [...state, movie];
    } catch (e) {
      throw Exception(e);
    }
  }
}

final downloadProvider = StateNotifierProvider<DownloadNotifier, List<Model>>((
  ref,
) {
  return DownloadNotifier();
});
