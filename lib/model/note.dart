class Note{
   int _id;
   String _title;
   String _description;
   String _date;
   int _priority;
   Note(this._title,this._date,this._priority,[this._description]);
   Note.withID(this._id,this._title,this._date,this._priority,[this._description]);

   int get priority => _priority;

   String get date => _date;

   String get description => _description;

   String get title => _title;

   int get id => _id;

   set priority(int value) {
     _priority = value;
   }

   set date(String value) {
     _date = value;
   }

   set description(String value) {
     _description = value;
   }

   set title(String value) {
     _title = value;
   }


}