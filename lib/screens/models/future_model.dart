import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_exam_project/screens/models/api_get_data.dart';

final apiprovider = FutureProvider(
  (ref) => DataApi().getAllUser(),
);
