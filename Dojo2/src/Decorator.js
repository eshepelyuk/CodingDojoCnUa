var Person = function () { //abstract class
    this.hands = "dirty";
    this.hungry = true;
    this.eat = function () {throw new TypeError()};
};

var Man = function () {};
Man.prototype = new Person();
Man.prototype.eat= function() {
    this.hungry = false;
};

var GentleMan = function() {
    this.man = new Man();
};
GentleMan.prototype = new Person();
GentleMan.prototype.eat = function(){
    this.hands = "clean";
    this.t.eat();
    this.hungry = this.man.hungry;
};

exports.Person = Person;
exports.Man = Man;
exports.GentleMan = GentleMan;
