import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<T?> showDialog<T extends Object?>({
    required BuildContext context,
    required Widget dialog,
  }) {
    return showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 250),
      barrierDismissible: true,
      barrierLabel: "",
      transitionBuilder: (
        context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        child,
      ) {
        final CurvedAnimation curvedAnimation =
            CurvedAnimation(parent: animation, curve: Curves.easeOutBack);

        return FadeTransition(
          opacity: curvedAnimation,
          child: ScaleTransition(scale: curvedAnimation, child: child),
        );
      },
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) =>
          dialog,
    );
  }

  static Future<List<XFile>?> imagePicker(
      bool isMulti, ImageSource source) async {
    final picker = ImagePicker();
    var allows = [
      'jpg',
      'jpeg',
      'png',
    ];

    if (isMulti && source == ImageSource.gallery) {
      return await picker.pickMultiImage();
    }
    final image = await picker.pickImage(source: source);

    if (image != null) {
      var a = (image.path.split('.').last);
      if (!allows.contains(a)) {
        throw ("Lỗi file");
      } else {
        return [image];
      }
    } else {
      return null;
    }
  }
}
