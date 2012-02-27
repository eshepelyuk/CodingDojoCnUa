var HungryPerson = function () { //abstract class

    this.order = undefined;

    this.enterCafee = function () {
    };

    this.pay = function () {
    };

    this.makeOrder = function () {
    };

    this.eat = function() {
        this.enterCafee();
        this.makeOrder();
        this.pay();
    }
};
exports.HungryPerson = HungryPerson;




var HungryMan = function () {
};
exports.HungryMan = HungryMan;

HungryMan.prototype = new HungryPerson();
HungryMan.prototype.makeOrder = function(){
    this.order = "BEER&MEAT";
};






var HungryWoman = function () {
};
exports.HungryWoman = HungryWoman;

HungryWoman.prototype = new HungryPerson();
HungryWoman.prototype.makeOrder = function(){
    this.order = "WINE&CHEESE";
};
