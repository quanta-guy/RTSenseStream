import 'dart:convert';
import 'dart:typed_data';
import './websocket.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class VideoStream extends StatefulWidget {
  const VideoStream({Key? key}) : super(key: key);

  @override
  State<VideoStream> createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  String stat = "waiting for data";
  var newnum = "0.0";

  final WebSocket _socket = WebSocket("ws://localhost:5000");
  bool _isConnected = false;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    _getFirestoreData();

    
    timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer t) => 
              _getFirestoreData(), //add PF change mapping to dataclass extraction
            );
  }



  void connect(BuildContext context) async {
    _socket.connect();
    setState(() {
      _isConnected = true;    
    
    });

  }

  void disconnect() {
    _socket.disconnect();
  
  }
     dynamic _getFirestoreData()async{
  var firestore = FirebaseFirestore.instance;
  var data = await firestore.collection('dummy').doc("ZbaPltOoFsLE5F2Ynr2G").get();
  var x= data.data();
      setState(() {
              stat=  x!['Status'];
               newnum = stat.replaceAll(RegExp(r'[^0-9]'),'');
           
            });
               print(newnum);

return x!["Status"];
}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Driver Fatigue Analysis",style: TextStyle(fontFamily: 'Default',fontWeight: FontWeight.bold,fontSize: 32),),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            //Alert Page
         
            _isConnected
                ? StreamBuilder(
                    stream: _socket.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        
                        return const Center(
                          child: Text("Connection Closed !",style: TextStyle(fontFamily: 'Default',fontWeight: FontWeight.bold),),
                        );
                      }
                      //? Working for single frames
                      return SizedBox(
                        height: size.height/2 ,
                        width: size.width/2,
                        child: Image.memory(
                          Uint8List.fromList(
                            base64Decode(
                              snapshot.data
                            ),
                          ),
                          gaplessPlayback: true,
                          excludeFromSemantics: true,
                        ),
                      );
                    },
                  )
                : const Text("Initiate Connection",style: TextStyle(fontFamily: 'Default',fontWeight: FontWeight.bold)),Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => connect(context),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      backgroundColor: Colors.blue,
                      elevation: 5,
                    ),
                    child: const Text("Connect",style: TextStyle(fontFamily: 'Default',fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                ),
                ElevatedButton(
                  onPressed: disconnect,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    backgroundColor:Colors.blue,
                    elevation: 5,
                  ),
                  child: const Text("Disconnect",style: TextStyle(fontFamily: 'Default',fontWeight: FontWeight.bold,color: Colors.white)),

                ),

              ],

            ),
                  Text(stat),
                  Container(child: double.parse(newnum)<=40? const Text("You can continue driving",style: TextStyle(fontFamily: 'Default',fontWeight: FontWeight.bold,color: Colors.green,fontSize: 40))
:const Text("Please stop driving and take rest",style: TextStyle(fontFamily: 'Default',fontWeight: FontWeight.bold,color: Colors.red,fontSize: 40)),)
                  
          ]
                  
        ),
      ),
    );
  }

}


