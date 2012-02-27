var decorator = require("../src/Decorator.js");

describe('', function () {
    it('Man has dirty hands', function () {
        var man = new decorator.Man();
        man.eat();
        expect(man.hungry).toBeFalsy();
        expect(man.hands).toEqual("dirty");
    });

    it('GentleMans hands are clean', function () {
//        var man = new decorator.Man();
        var gentleMan = new decorator.GentleMan();
        gentleMan.eat();
        expect(gentleMan.hungry).toBeFalsy();
        expect(gentleMan.hands).toEqual("clean");
    });

});
