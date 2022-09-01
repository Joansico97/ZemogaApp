import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:zemoga_app/models/models.dart';
import 'package:zemoga_app/services/services.dart';
import 'package:zemoga_app/utils/utils.dart';

part './detail_page_events.dart';

part './detail_page_model_state.dart';

final detailPageState =
    StateNotifierProvider<_DetailPageEvents, DetailPageModelState>((ref) {
  return _DetailPageEvents(ref);
});
