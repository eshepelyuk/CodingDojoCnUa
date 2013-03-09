argsparser = require "./argsParser.coffee"

describe 'parsing boolean args', ->
    it 'parsing one boolean arg', ->
        parser = new argsparser.ArgsParser {"l": {}}
        actualResult = parser.parse ["-l"]
        expect(actualResult.result).toBe true
        expect(actualResult.args["l"]).toBe true

    it 'parsing two boolean arg', ->
        parser = new argsparser.ArgsParser {"l": {}, "c": {}}
        actualResult = parser.parse ["-l", "-c"]
        expect(actualResult.result).toBe true
        expect(actualResult.args["l"]).toBe true
        expect(actualResult.args["c"]).toBe true
    it 'unexisted in command line elements present in schema', ->
        parser = new argsparser.ArgsParser {"l": {}, "d": {}}
        actualResult = parser.parse []
        expect(actualResult.result).toBe true
        expect(actualResult.args["l"]).toBe false
        expect(actualResult.args["d"]).toBe false
    it 'unexisted in schema element present in command line then result should be false', ->
        parser = new argsparser.ArgsParser {"l": {}, "d": {}}
        actualResult = parser.parse ["-c"]
        expect(actualResult.result).toBe false
        expect(actualResult.args).toEqual { l: false, d: false }
        expect(actualResult.errormsg).toBe "Command line have extra falg: -c"
