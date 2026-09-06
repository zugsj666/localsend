import 'package:flutter/foundation.dart';
import 'package:localsend_isolates/model/file_type.dart';

bool shouldAutoCopyReceivedImage({
  required TargetPlatform platform,
  required bool enabled,
  required bool favoritesOnly,
  required bool senderIsFavorite,
  required FileType fileType,
  required String? filePath,
}) {
  return platform == TargetPlatform.windows &&
      enabled &&
      (!favoritesOnly || senderIsFavorite) &&
      fileType == FileType.image &&
      filePath != null &&
      filePath.isNotEmpty;
}
