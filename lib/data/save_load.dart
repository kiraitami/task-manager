import 'dart:io';
import 'package:flutter_app_task_manager/screens/register_screen.dart';
import 'package:path_provider/path_provider.dart';

class saveLoad{
  static read() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/my_file.txt');
      String text = await file.readAsString();
      print(text);
    } catch (e) {
      print("Couldn't read file");
    }
  }

  static save( List<String> textToSave ) async {
    String realSave = "";
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/my_file.txt');
    for(int i = 0; i > textToSave.length; i++) {
      if(i != 0)
        realSave += "///";
      realSave += textToSave[i];
    }
    final text = realSave;
    await file.writeAsString(text);
    print('Saved');
  }
}

stringToList() {
  String readed = saveLoad.read();
  List<String> ids;
  if(readed != null)
    {
      ids = readed.split("///");
    }
}
