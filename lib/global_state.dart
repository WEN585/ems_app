class Global_State {
  //only 1 user
  List user_list = [];
  List job_list = [];

  static Global_State instance = Global_State._();
  Global_State._();
}
