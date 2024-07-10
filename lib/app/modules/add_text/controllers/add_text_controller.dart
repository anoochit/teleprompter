import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTextController extends GetxController {
  TextEditingController titleTextController = TextEditingController();
  TextEditingController contentTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
