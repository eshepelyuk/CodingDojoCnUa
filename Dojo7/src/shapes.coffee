exports.hello = (name) ->
    myName = "#{name} !!!"
    return "HELLO #{myName}"

l = [
    [
        [1, 0],
        [1, 0],
        [1, 1]
    ],
    [
        [1, 1, 1],
        [1, 0, 0]
    ],
    [
        [1, 1],
        [0, 1],
        [0, 1]
    ],

    [
        [0, 0, 1],
        [1, 1, 1]
    ]
]


Z = [
    [
        [1, 1, 0],
        [0, 1, 0],
        [0, 1, 1]
    ],
    [
        [0, 0, 1],
        [1, 1, 1],
        [1, 0, 0]
    ]
]

T = [
    [
        [1, 1, 1],
        [0, 1, 0]
    ],
    [
        [0, 1],
        [1, 1],
        [0, 1]
    ],
    [
        [0, 1, 0],
        [1, 1, 1]
    ],
    [
        [1, 0],
        [1, 1],
        [1, 0]
    ]
]


cube = [
    [1, 1],
    [1, 1]
]


ZReflected = [
    [
        [0, 1, 1],
        [0, 1, 0],
        [1, 1, 0]
    ]
    [
        [1, 0, 0],
        [1, 1, 1],
        [0, 0, 1]
    ]
]
LReflected = [
    [
        [0, 1],
        [0, 1],
        [1, 1]
    ],
    [
        [1, 0, 0],
        [1, 1, 1]
    ],
    [
        [1, 1],
        [1, 0],
        [1, 0]
    ],
    [
        [1, 1, 1],
        [0, 0, 1]
    ]
]

I = [
    [
        [1, 1, 1, 1 ]
    ]
    [
        [1],
        [1],
        [1],
        [1]
    ]
]


exports.getLShape = () ->
    return l

exports.getZShape = () ->
    return Z

exports.getTShape = () ->
    return T

exports.getLReflectedShape = () ->
    return LReflected

exports.getZReflectedShape = () ->
    return ZReflected

exports.getCubeShape = () ->
    return cube

exports.getIShape = () ->
    return I


exports.rotateL = (direction, count) ->
    if 'L' == direction then return l[(4 - count) % 4]
    return l[count % 4]

exports.rotateZ = (direction, count) ->
    return Z[count % 2]


exports.rotateT = (direction, count) ->
    if direction is 'L' then return T[4 - (count % 4)]
    return T[count % 4]

exports.rotateLReflected = (direction, count) ->
    if direction is 'L' then return LReflected[4 - (count % 4)]
    return LReflected[count%4]

exports.rotateZReflected = (direction, count) ->
    return ZReflected[count % 2]

exports.rotateCube = (direction, count) ->
    return cube

exports.rotateI = (direction, count) ->
    return I[count%2]

exports.rotate = (shape, direction, count) ->
    if 'L' is shape then return this.rotateL(direction, count)
    else if 'RL' then return this.rotateLReflected(direction, count)
    else if 'Z' then return this.rotateZ(direction,  count)