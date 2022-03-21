class Event {
  late int id; 
  String content;
  late bool completed;
  late DateTime createdAt;
  late DateTime updatedAt;

  //Constructor
  Event(this.content) {
    id = 0;
    completed =false;
    createdAt = DateTime.now();
    updatedAt = DateTime.now();
  }

  join(){
    completed = true;
  }
  exist(){
    return true;
  }


}