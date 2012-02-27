var templateMethod = require("../src/TemplateMethod2.js");

describe('', function () {
    it('order for hungry man is undefined', function () {
        var man = new templateMethod.getHungryMan();
        expect(man.order).toBeUndefined();
    });

    it('order for men is BEER&MEAT ufter eat', function () {
        var man = new templateMethod.getHungryMan();
        man.eat();
        expect(man.order).toEqual("BEER&MEAT");
    });

    it('order for hungry woman is undefined', function () {
        var woman = new templateMethod.getHungryWoman();
        expect(woman.order).toBeUndefined();
    });

    it('order for woman is WINE&CHEESE ufter eat', function () {
        var woman = new templateMethod.getHungryWoman();
        woman.eat();
        expect(woman.order).toEqual("WINE&CHEESE");
    });

});
