import 'package:flutter/material.dart';


class Messaging extends StatefulWidget {
  final int id;
  const Messaging({Key? key, required this.id}) : super(key: key);

  @override
  State<Messaging> createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
class Alert {
  final int id;
  final String? author;
  final String? date;
  final String? message;

  // final String? image;

  Alert(
      {required this.id, this.author, this.date, this.message,});