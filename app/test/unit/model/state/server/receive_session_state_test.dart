import 'package:localsend_app/model/state/server/receive_session_state.dart';
import 'package:localsend_app/model/state/server/receiving_file.dart';
import 'package:localsend_isolates/model/device.dart';
import 'package:localsend_isolates/model/dto/file_dto.dart';
import 'package:localsend_isolates/model/file_type.dart';
import 'package:localsend_isolates/model/session_status.dart';
import 'package:test/test.dart';

void main() {
  ReceiveSessionState sessionWith(FileDto file) => ReceiveSessionState(
    sessionId: 'session',
    status: SessionStatus.waiting,
    sender: Device.empty,
    senderAlias: 'sender',
    files: {
      file.id: ReceivingFile(file: file, token: null, desiredName: null, path: null, savedToGallery: false, errorMessage: null),
    },
    startTime: null,
    endTime: null,
    destinationDirectory: '',
    cacheDirectory: '',
    saveToGallery: false,
    createdDirectories: {},
  );

  test('distinguishes a message preview from a regular text file', () {
    const text = '中文\nEnglish 😀';
    const message = FileDto(
      id: 'message',
      fileName: 'message.txt',
      size: 19,
      fileType: FileType.text,
      hash: null,
      preview: text,
      metadata: null,
    );
    const textFile = FileDto(
      id: 'file',
      fileName: 'notes.txt',
      size: 19,
      fileType: FileType.text,
      hash: null,
      preview: null,
      metadata: null,
    );

    expect(sessionWith(message).message, text);
    expect(sessionWith(textFile).message, isNull);
  });
}
