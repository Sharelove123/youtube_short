import 'package:youtube_short/models/short_model.dart';

class ShortData{
  final List<ShortDetailModel> short_data = get_data_object();
  static List<ShortDetailModel> get_data_object(){
    const data = [
      {'video':'assets/videos/first_video.mp4','channel_name':'first_channel','title':'This is first_video title'},
      {'video':'assets/videos/second_video.mp4','channel_name':'second_channel','title':'This is second_video title'},
      {'video':'assets/videos/third_video.mp4','channel_name':'third_channel','title':'This is third_video title'},
      {'video':'assets/videos/forth_video.mp4','channel_name':'forth_channel','title':'This is forth_video title'},
      {'video':'assets/videos/fifth_video.mp4','channel_name':'fifth_channel','title':'This is fifth_video title'},
      {'video':'assets/videos/sixth_video.mp4','channel_name':'sixth_video','title':'This is sixth_video title'},
    ];
    return data.map<ShortDetailModel>(ShortDetailModel.fromjson).toList();
  }
}