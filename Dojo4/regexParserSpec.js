var regexParser = require("./regexParser.js");

describe('regex test', function () {
    it('when dot then return string as splitted by char to array', function () {
        var retval = regexParser.parse(".", "qwerty");
        expect(retval.length).toBe(6);
        expect(retval[0]).toBe("q");
        expect(retval[5]).toBe("y");
    });
    it('when regexp is digit then all digits should be returned as char array', function () {
        var retval = regexParser.parse("\\d", "q33w4er5ty5");
        expect(retval.length).toBe(5);
        expect(retval[0]).toBe("3");
        expect(retval[4]).toBe("5");
    });

    it('when regexp is pattern then return array of patterns', function () {
        var retval = regexParser.parse("as", "ehjfasjfkdjfasasfhfh");
        expect(retval.length).toBe(3);
        expect(retval[0]).toBe("as");
        expect(retval[2]).toBe("as");
    });

    it('when regexp is pattern and has inclusions in the begin and end then return array of patterns', function () {
        var retval = regexParser.parse("as", "asehjfasjfkdjfas");
        expect(retval.length).toBe(3);
        expect(retval[0]).toBe("as");
        expect(retval[2]).toBe("as");
    });

    it('when regexp is pattern and has inclusions in the begin and end then return array of patterns', function () {
        var retval = regexParser.parse("\\D", "a5bc");
        expect(retval.length).toBe(3);
        expect(retval[0]).toBe("a");
        expect(retval[1]).toBe("b");
        expect(retval[2]).toBe("c");
    });

    it('when regexp is pattern (z.) then return array of patterns', function () {
        var retval = regexParser.parse("z.", "zabczzqz");
        expect(retval.length).toBe(2);
        expect(retval[0]).toBe("za");
        expect(retval[1]).toBe("zz");
    });

    it('when regexp is pattern (z.) then return array of patterns', function () {
        var retval = regexParser.parse("5.", "561156");
        expect(retval.length).toBe(2);
        expect(retval[0]).toBe("56");
        expect(retval[1]).toBe("56");
    });

    it('when regexp is starting with ^ return array of one elem from beginning #1', function () {
        var retval = regexParser.parse("^q", "qwertyq");
        expect(retval.length).toBe(1);
        expect(retval[0]).toBe("q");
    });

    it('when regexp is starting with ^ return array of one elem from beginning #2', function () {
        var retval = regexParser.parse("^q", "wertyq");
        expect(retval.length).toBe(0);
    });

    it('when regexp is ending  with $ return array of one elem from beginning #1', function () {
        var retval = regexParser.parse("qq$", "qwertyqq");
        expect(retval.length).toBe(1);
        expect(retval[0]).toBe("qq");
    });

    it('when regexp is ending with $ return array of one elem from beginning #2', function () {
        var retval = regexParser.parse("q$", "qwerty");
        expect(retval.length).toBe(0);
    });
    it('when regexp have  quantificator {1,2} than char before it should be present at least one time #2', function () {
        var retval = regexParser.parse("q{1,2}", "qwertyqq6");
        expect(retval.length).toBe(2);
        expect(retval[0]).toBe("q");
        expect(retval[1]).toBe("qq");

    });

});