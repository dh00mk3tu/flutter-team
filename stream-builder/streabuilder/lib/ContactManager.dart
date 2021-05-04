
List<dynamic> DATA = ["bread","mohan","anirudh","covid","cars","rockets","camaro","gtr35","lamp","mouse"];

class ContactManager {
  Stream<List<dynamic>> get contactList async*{
    for(var i =0; i<DATA.length; i++){
      await Future.delayed(Duration(seconds: 1));
      yield DATA.sublist(0, i+1);
    }
  }

}