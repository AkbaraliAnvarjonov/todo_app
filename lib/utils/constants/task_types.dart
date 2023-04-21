import 'dart:ui';

import 'package:todo_app/data/models/type_model.dart';

List<TypeModel> taskTypes = [
  TypeModel(
      color: const Color(0xFFF9C229),
      icon: "assets/icons/types/personal_icon.svg",
      name: "Personal"),
  TypeModel(
      color: const Color(0xFF1ED102),
      icon: "assets/icons/types/work_icon.svg",
      name: "Work"),
  TypeModel(
      color: const Color(0xFFD10263),
      icon: "assets/icons/types/meeting_icon.svg",
      name: "Meeting"),
  TypeModel(
      color: const Color(0xFFEC6C0B),
      icon: "assets/icons/types/shopping_icon.svg",
      name: "Shopping"),
  TypeModel(
      color: const Color(0xFF09ACCE),
      icon: "assets/icons/types/party_icon.svg",
      name: "Party"),
  TypeModel(
      color: const Color(0xFFBF0080),
      icon: "assets/icons/types/study_icon.svg",
      name: "Study"),
];
