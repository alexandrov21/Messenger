import 'package:flutter/material.dart';

import '../models/all_dialogs_model.dart';

abstract class AllDialogsMock {
  static List<AllDialogsModel> allDialogs = [
    AllDialogsModel(
      'Ol',
      'Olenka',
      'go Kharkiv',
      Colors.pinkAccent,
    ),
    AllDialogsModel(
      'Vl',
      'Vladik',
      'flutter the best',
      Colors.blue,
    ),
    AllDialogsModel(
      'Di',
      'Dimon',
      'Vladik is late',
      Colors.redAccent,
    ),
    AllDialogsModel(
      'Si',
      'Simon',
      'Lanos racing',
      Colors.green,
    ),
    AllDialogsModel(
      'Gc',
      'GeyClub',
      'dvddfeffcdcdfefefefe',
      Colors.orange,
    ),
  ];
}
