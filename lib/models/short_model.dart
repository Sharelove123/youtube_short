
class ShortDetailModel{
  String? video;
  String? channel_name;
  String? title;
  ShortDetailModel({this.video,this.channel_name,this.title});
  
 static ShortDetailModel fromjson(json)=> ShortDetailModel(
      video : json['video'],
      channel_name : json['channel_name'],
      title : json['title'],
    );
}


