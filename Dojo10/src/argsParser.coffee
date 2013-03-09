class ArgsParser

    constructor: (@schema) ->

    parse: (args)->
        parsRes = {"result": true, "errormsg": "", "args": {}}


        for oneParm of @schema
            parsRes.args[oneParm] = false

        for arg in args
            param = arg.substr(1,arg.length)
            if @schema[param]
                parsRes.args[param] = true
            else
                parsRes.result = false
                parsRes.errormsg = "Command line have extra falg: " + arg
                break
        parsRes

exports.ArgsParser = ArgsParser