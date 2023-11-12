import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

pickVideo() async{
  final  picker = ImagePicker();
  XFile? videoFile;
  try{
    videoFile = await picker.pickVideo(source: ImageSource.gallery);
    return videoFile!.path;
  }catch(e){
    print("Log: Error Picking Video: $e");
  }
}