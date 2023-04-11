import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static Future<XFile?> pickImageFromGalley() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  static Future<XFile?> pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image;
  }
}
