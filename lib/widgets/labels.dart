import 'package:flutter/material.dart';

class Labels extends StatelessWidget {

  final String route;
  final String message;
  final String submessage;

  const Labels({Key? key, required this.route, required this.message, required this.submessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
          Text(message, style: const TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300)),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              )
            ),
            onPressed: (){
              Navigator.pushNamed(context, route);
            },
            child: Text(submessage, style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold))
          )
        ],
      ),
    );
  }
}