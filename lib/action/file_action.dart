import 'package:path/path.dart' as p;
import 'dart:io';

class FileAction
{
  static void writeToFile({String dataJson, String fileName})
  {
    final String path = p.join('data', fileName);
    final File file = File(path);
    file.writeAsStringSync(dataJson, mode: FileMode.writeOnly);
  }

  static Future<String> readFromFile({String fileName}) async
  {
    final String path = p.join('data', fileName);
    final File file = File(path);
    if(await file.exists())
    {
      final String dataJson = file.readAsStringSync();
      return dataJson;
    }
    else
    {
      return null;
    }
  }
}