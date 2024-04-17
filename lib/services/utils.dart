import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

screenHeight(context, {double? dividedBy}) {
  print(dividedBy);
  if (dividedBy != null) {
    return MediaQuery.of(context).size.height / dividedBy;
  } else {
    return MediaQuery.of(context).size.height;
  }
}

screenWidth(context, {double? dividedBy}) {
  print(dividedBy);
  if (dividedBy != null) {
    return MediaQuery.of(context).size.width / dividedBy;
  } else {
    return MediaQuery.of(context).size.width;
  }
}

datePicker(BuildContext context) async {
  return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2040));
}
