import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:torch_light/torch_light.dart';

 void main() {
  runApp(const MyApp());
  
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.purple
      ),
      home: const MyHomePage(),
    );
    
  }
}




class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future <void> torchLightOn() async {
    try{
      await TorchLight.enableTorch();

    }
    on EnableTorchExistentUserException  catch(e) {
      print(e);
    }
    on EnableTorchException  catch(e) {
      print(e);
    }
    on EnableTorchNotAvailableException  catch(e) {
      print(e);
    }

  }
   Future <void> torchLightOff() async {
    try{
      await TorchLight.disableTorch();

    }
 catch(e) {
      print(e);
    }
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Flash Light"),

      ),
      body:  Center(
        child: LiteRollingSwitch(
          colorOff: Colors.red,
          colorOn: Colors.green,
          iconOn: CupertinoIcons.lightbulb_fill,
          iconOff: CupertinoIcons.lightbulb_slash,
          textOff: "Off" ,
          textOn: "On",
          onChanged: (val){
            print(val);
            if(val){
              torchLightOn();
                          
            }
            else{
              torchLightOff();
            }
          },
        ),
      ),
    );
  }
}