import 'package:flutter/foundation.dart';
import 'package:localsend_app/util/auto_copy.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:test/test.dart';

void main() {
  test('auto-copies only eligible received images on Windows', () {
    bool shouldCopy({
      TargetPlatform platform = TargetPlatform.windows,
      bool enabled = true,
      bool favoritesOnly = false,
      bool senderIsFavorite = false,
      FileType fileType = FileType.image,
      String? filePath = r'C:\Downloads\photo.png',
    }) {
      return shouldAutoCopyReceivedImage(
        platform: platform,
        enabled: enabled,
        favoritesOnly: favoritesOnly,
        senderIsFavorite: senderIsFavorite,
        fileType: fileType,
        filePath: filePath,
      );
    }

    expect(shouldCopy(), isTrue);
    expect(shouldCopy(enabled: false), isFalse);
    expect(shouldCopy(favoritesOnly: true), isFalse);
    expect(shouldCopy(favoritesOnly: true, senderIsFavorite: true), isTrue);
    expect(shouldCopy(platform: TargetPlatform.android), isFalse);
    expect(shouldCopy(fileType: FileType.text), isFalse);
    expect(shouldCopy(filePath: null), isFalse);
  });
}
