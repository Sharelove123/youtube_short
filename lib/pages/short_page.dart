import 'package:youtube_short/data/short_data.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_short/models/short_model.dart';
import 'package:youtube_short/widgets/short_card.dart';

class ShortPage extends StatefulWidget {
  ShortPage({super.key});

  @override
  State<ShortPage> createState() => _ShortPageState();
}

class _ShortPageState extends State<ShortPage> {

  late VideoPlayerController _controller;
  static List<ShortDetailModel> short_data = ShortData().short_data;
  List<ShortCard> shorts = get_short();

  static get_short(){
      List data = <ShortCard>[];
      int current_loop = 0;
      for (var element in short_data) {
          data.add(ShortCard(video_path: element.video, title: element.title, channel_name: element.channel_name));
        current_loop++;
      }
      return data;
  }




  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: shorts.length,
            itemBuilder: ((context, index) {
            return shorts[index];
          })),
          
          Positioned(
            top: 4,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text('Shorts',style: TextStyle(fontSize: 27),),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.search_outlined,),iconSize: 27,),
                IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined),iconSize: 27,),
              ],
              ),
          )
        ],
  );
  }
}