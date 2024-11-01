import 'package:flutter/material.dart';

class PostureError extends StatelessWidget {
  const PostureError({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(height: size.height/2 ,width: size.width/2,child:Image.asset('/assets/images/PostureError.gif'),);
  }
}

class FatigueError extends StatelessWidget {
  const FatigueError({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(height: size.height/2 ,width: size.width/2,child:Image.asset('/assets/images/FatigueError.gif'),);
  }
}