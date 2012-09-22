shapes = require "./shapes.coffee"

#describe 'testEnv', ->
#    it 'it fails', ->
#        expect(shapes.hello('Slava')).not.toBe "HELO Slava"
#    it 'it works', ->
#        expect(shapes.hello('Slava')).not.toBe "HELO Slava !!!"

describe 'rotate L right', ->
    it 'should return L letter rotated to 90 degress right when directon = R and count = 1', ->
        expect(shapes.rotateL('R', 1)).toBe shapes.getLShape()[1]

    it 'should return L letter rotated to 180 degress right when direction = R and count = 2', ->
        expect(shapes.rotateL('R', 2)).toBe shapes.getLShape()[2]

    it 'should return L letter rotated to 900 degress right when direction = R and count = 10', ->
        expect(shapes.rotateL('R', 10)).toBe shapes.getLShape()[2]

describe 'rotate L left', ->
    it 'should return L letter rotated to 90 degress left when directon = L and count = 1', ->
        expect(shapes.rotateL('L', 1)).toBe shapes.getLShape()[3]
    it 'should return L letter rotated to 180 degress left when directon = L and count = 2', ->
        expect(shapes.rotateL('L', 2)).toBe shapes.getLShape()[2]
    it 'should return L letter rotated to 1800 degress left when directon = L and count = 20', ->
        expect(shapes.rotateL('L', 20)).toBe shapes.getLShape()[0]

describe 'rotate Z right', ->
    it 'should return Z letter rotated to 90 degress right when directon = R and count = 1', ->
        expect(shapes.rotateZ('R', 1)).toBe shapes.getZShape()[1]
    it 'should return Z letter rotated to 180 degress right when directon = R and count = 2', ->
        expect(shapes.rotateZ('R', 3)).toBe shapes.getZShape()[1]

describe 'rotate Z left', ->
    it 'should return Z letter rotated to 90 degress left when directon = L and count = 1', ->
        expect(shapes.rotateZ('L', 1)).toBe shapes.getZShape()[1]

describe 'rotate T right', ->
    it 'should return T letter rotated to 90 degress right when directon = R and count = 1', ->
        expect(shapes.rotateT('R', 1)).toBe shapes.getTShape()[1]
    it 'should return T letter rotated to 180 degress right when directon = R and count = 13', ->
        expect(shapes.rotateT('R', 13)).toBe shapes.getTShape()[1]
describe 'rotate T left', ->
    it 'should return T letter rotated to 90 degress left when directon = L and count = 1', ->
        expect(shapes.rotateT('L', 1)).toBe shapes.getTShape()[3]
    it 'should return T letter rotated to 1170 degress left when directon = L and count = 13', ->
        expect(shapes.rotateT('L', 13)).toBe shapes.getTShape()[3]
    it 'should return T letter rotated to 270 degress left when directon = L and count = 3', ->
        expect(shapes.rotateT('L', 3)).toBe shapes.getTShape()[1]

describe 'rotate L Reflected right', ->
    it 'should return LReflected rotated to 180 degress right when direction = R and count = 2', ->
        expect(shapes.rotateLReflected('R', 2)).toBe shapes.getLReflectedShape()[2]
    it 'should return LReflected rotated to 900 degress right when direction = R and count = 10', ->
        expect(shapes.rotateLReflected('R', 10)).toBe shapes.getLReflectedShape()[2]

describe 'rotate L Reflected left', ->
    it 'should return LReflected rotated to 90 degs left when dir = L and count = 1', ->
        expect(shapes.rotateLReflected('L', 1)).toBe shapes.getLReflectedShape()[3]
    it 'should return LReflected rotated to 900 degs left when dir = L and count = 0', ->
        expect(shapes.rotateLReflected('L', 10)).toBe shapes.getLReflectedShape()[2]

describe 'rotate Z Reflected right', ->
    it 'should return ZReflected rotated to 90 degs right when dir = R and count = 1', ->
        expect(shapes.rotateZReflected('R', 1)).toBe shapes.getZReflectedShape()[1]
    it 'should return ZReflected rotated to 900 degs right when dir = R and count = 10', ->
        expect(shapes.rotateZReflected('R', 10)).toBe shapes.getZReflectedShape()[0]

describe 'rotate Z Reflected left', ->
    it 'should return ZReflected rotate to 90 degs left when dir = L and count = 1', ->
        expect(shapes.rotateZReflected('L', 1)).toBe shapes.getZReflectedShape()[1]
    it 'should return ZReflected rotate to 900 degs left when dir = L and count = 10', ->
        expect(shapes.rotateZReflected('L', 11)).toBe shapes.getZReflectedShape()[1]

describe 'rotate cube', ->
    it 'should return the same cube', ->
        expect(shapes.rotateCube('L', 100)).toBe shapes.getCubeShape()

describe 'rotate I right', ->
    it 'should return I rotated 180 degress right when direction = R and count = 2', ->
        expect(shapes.rotateI('R', 2)).toBe shapes.getIShape()[0]

describe 'rotate I left', ->
    it 'should return I rotated 1170 degress left when direction = L and count = 13', ->
        expect(shapes.rotateI('L', 13)).toBe shapes.getIShape()[1]


describe 'rotate shapes', ->
    it 'should return L rotated when shape L', ->
#        L = [
#            [1,0],
#            [1,0],
#            [1,1]
#        ]
        actual = shapes.rotate('L', 'R', 1)

        expect(actual.length).toBe 2
        expect(actual[0].length).toBe 3

    it 'shold return Rotated RL when shape RL', ->
        actual = shapes.rotate('RL', 'R', 1)
        expect(actual.length).toBe 2
        expect(actual[0].length).toBe 3

    it 'should return Z rotated when shape Z', ->
        actual = shapes.rotate('Z', 'R', 1)
        expect(actual.length).toBe 3
        expect(actual[0].length).toBe 3
