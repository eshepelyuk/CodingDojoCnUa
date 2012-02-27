var templateMethod = require("../src/TemplateMethod1.js");

describe('', function () {
    it('order for hungry man is undefined', function () {
        var man = new templateMethod.HungryMan();
        expect(man.order).toBeUndefined();
    });

    it('order for men is BEER&MEAT ufter eat', function () {
        var man = new templateMethod.HungryMan();
        man.eat();
        expect(man.order).toEqual("BEER&MEAT");
    });

    it('order for hungry woman is undefined', function () {
        var woman = new templateMethod.HungryWoman();
        expect(woman.order).toBeUndefined();
    });

    it('order for woman is WINE&CHEESE ufter eat', function () {
        var woman = new templateMethod.HungryWoman();
        woman.eat();
        expect(woman.order).toEqual("WINE&CHEESE");
    });

    it('order for person does not change after eat', function () {
        var person = new templateMethod.HungryPerson();
        person.eat();
        expect(person.order).toBeUndefined();
    });
});
