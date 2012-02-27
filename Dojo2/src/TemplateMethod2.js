var HungryPerson = function () { //abstract class

    this.order = undefined;

    this.enterCafee = function () {
    };

    this.pay = function () {
    };

    this.eat = function() {
        this.enterCafee();
        this.makeOrder();
        this.pay();
    }
};
exports.getHungryMan = function (){
    var retval = new HungryPerson();
    retval.makeOrder = function() {
        this.order = "BEER&MEAT";
    };
    return retval;
};
exports.getHungryWoman = function (){
    var retval = new HungryPerson();
    retval.makeOrder = function() {
        this.order = "WINE&CHEESE";
    };
    return retval;
};

exports.getHungryPerson = function (){
    return new HungryPerson();
};

