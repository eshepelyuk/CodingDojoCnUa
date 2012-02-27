var singleton = require("../src/Singleton.js");

var myInstance = {
    name:"singleton"
};

describe('', function () {
    it('singleton instances are the same ', function () {
        var s1 = singleton.getInstance();
        var s2 = singleton.getInstance();

        expect(s1).toBe(s2);
        expect(s1.name).toEqual(s2.name);
    });

    it('singleton instance not the same as local', function () {
        var s1 = singleton.getInstance();

        expect(s1).not.toBe(myInstance);
        expect(s1).toEqual(myInstance);
    });

    it('variable is local', function () {
        //var s1 = instance;

        expect(singleton.instance).toBeUndefined();
    });
});