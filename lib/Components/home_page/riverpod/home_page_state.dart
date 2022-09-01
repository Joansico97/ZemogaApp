import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:zemoga_app/Components/detail_page/riverpod/detail_page_state.dart';
import 'package:zemoga_app/models/models.dart';
import 'package:zemoga_app/services/services.dart';
import 'package:zemoga_app/utils/utils.dart';

part './home_page_events.dart';
part './home_page_model_state.dart';

final homePageState =
    StateNotifierProvider<_HomePageEvents, HomePageModelState>((ref) {
  return _HomePageEvents(ref);
});
