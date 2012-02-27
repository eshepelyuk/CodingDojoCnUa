var factoryMethod = require("../src/FactoryMethod.js");


describe('', function () {
    it('', function () {
        var fm1 = factoryMethod.factoryMethod("P");
        var fm2 = factoryMethod.factoryMethod("C");

        expect(fm1).not.toBe(fm2);
//        expect(fm1).toEqual(fm2);
    });

    it('if C then return Colbasa', function () {
        //var fm1 = factoryMethod.factoryMethod("P");
        var fm2 = factoryMethod.factoryMethod("C");

        expect(fm2.name).toEqual('Colbaza');
        expect(fm2 instanceof factoryMethod.Colbaza).toBeTruthy();
    });

    it('if Pr then return Product', function () {
        var fm2 = factoryMethod.factoryMethod("Pr");

        expect(fm2.name).toEqual('Product');
        expect(fm2 instanceof factoryMethod.Product).toBeTruthy();
    });

    it('if Pz then return Pizza', function () {
        var fm2 = factoryMethod.factoryMethod("Pz");

        expect(fm2.name).toEqual('Pizza');
        expect(fm2 instanceof factoryMethod.Pizza).toBeTruthy();
    });
});