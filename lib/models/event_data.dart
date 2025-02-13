class EventData{
  static const String collectionName = "EventDataCollection";
  String eventId;
  String eventTitle;
  String eventImg;
  String eventCt;
  String eventDesc;
  DateTime eventDate;
  bool Favorite;

  EventData({ this.eventId ="",
    required this.eventTitle,
    required this.eventImg,required this.eventCt,
    required this.eventDesc,
    required this.eventDate,this.Favorite = false});
  factory EventData.fromFirestore(Map<String,dynamic> json)=>
      EventData(eventId:json[ "eventId"],
          eventTitle: json["eventTitle"],
          eventImg:json[" eventImg"],
          eventCt:json[" eventCt"],
          eventDesc: json["eventDesc"],
          eventDate:DateTime.fromMillisecondsSinceEpoch(json["eventDate"]) ,
          Favorite:json[" Favorite"]);

  Map<String,dynamic> toFireStore(){
    return {
      "eventId" : eventId,
      "eventTitle":eventTitle,
      "eventDesc": eventDesc,
      "eventCt": eventCt,
      "eventImg": eventImg,
      "eventDate": eventDate.millisecondsSinceEpoch,
      "Favorite": Favorite,
    };
  }
}