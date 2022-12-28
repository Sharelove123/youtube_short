import 'dart:ffi';

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class ShortCard extends StatefulWidget {
  final int? index;
  final String? video_path;
  final String? channel_name;
  final String? title;
  ShortCard({super.key,this.index,required this.video_path,required this.channel_name,required this.title});

  @override
  State<ShortCard> createState() => _ShortCardState();
}

  

class _ShortCardState extends State<ShortCard> {

  bool invisible_icon = true;
  IconData icon_short_state= Icons.pause;
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.video_path.toString())
    ..initialize().then((_){
        setState(() {
          _controller!.setLooping(true);
          _controller!.play();
        });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
  }


  change_state() async{
    if(_controller!.value.isPlaying){
      _controller!.pause();
      setState(() {
        invisible_icon = false;
        icon_short_state = Icons.pause;
      });
      await Future.delayed(const Duration(seconds:1),(){
        invisible_icon = true;
        setState(() {
        });
      });
    }else{
      _controller!.play();
      setState(() {
        invisible_icon = false;
        icon_short_state = Icons.play_arrow;
      });
      await Future.delayed(const Duration(seconds:1),(){
        invisible_icon = true;
        setState(() {
          
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => change_state(),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: VideoPlayer(_controller!),
          ),
         Align(
          alignment: Alignment.center,
          child: Offstage(
            offstage: invisible_icon,
            child: Card(
              color: Colors.transparent,
              elevation: 0.0,
              child: FloatingActionButton(
                child:Icon(icon_short_state,size: 50,),
                onPressed: (){},
                elevation: 0.0,
                backgroundColor: Colors.black,
                )
            ),
          ),
         )
         ,
          Positioned(
            top: MediaQuery.of(context).size.height/2-0,
            right:1,
            bottom: 0,
            child: Card(
              elevation: 0.0,
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 15,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up_alt),iconSize: 35,color: Colors.white,),
                  Text('Like',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w100),),
                  SizedBox(height: 3,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down_alt),iconSize: 35,color: Colors.white,),
                  Text('DisLike',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w100),),
                  SizedBox(height: 3,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.comment),iconSize: 35,color: Colors.white,),
                  Text('200',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w200),),
                  SizedBox(height: 3,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.send),iconSize: 35,color: Colors.white,),
                  Text('Share',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w100),),
                  SizedBox(height: 3,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz),iconSize: 35,color: Colors.white,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.face_sharp),iconSize: 45,color: Colors.white,),
                ],
              ),
            )
          ),
          Positioned(
            height: 75,
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Colors.transparent,
              elevation: 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 12,),
                      Text(widget.title.toString(),style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(height: 2,),
                  Row(children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.face_rounded),color: Colors.white,),
                    Text(widget.channel_name.toString(),style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600)),
                    SizedBox(width: 10,),
                    Container(
                      height: 30,
                      padding: EdgeInsets.all(6),
                      width: MediaQuery.of(context).size.width/5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.redAccent
                        ),
    
                        child: Text('Subscribe',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                      ),
                  ],),
                ],
              )
              ),
          ),
        ],
      ),
    );
  }
}