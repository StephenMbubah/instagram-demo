import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source)async{
  final ImagePicker _imagePicker = ImagePicker();

  XFile? _file =await _imagePicker.pickImage(source: source);
// remember to come here in case of any wahala with the images
  _file !=null?  _file.readAsBytes(): print('No image selected');
}

showSnackBar(BuildContext context, String content){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(content)));
}