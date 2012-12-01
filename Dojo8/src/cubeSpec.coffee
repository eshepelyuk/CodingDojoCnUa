shapes = require "./shapes.coffee"
describe 'rotate cube', ->
    it 'should return Cube rotated when shape Cube', ->
        cubeShape = {
        type: 'cube',
        state: 0,
        bottomY: null,
        leftX: null,
        rightX: null
        }

        expectedCubeShape = {
        type: 'cube',
        state: 0,
        bottomY: null,
        leftX: null,
        rightX: null
        }

        actual = shapes.rotateAnyShapeFromAnyPos(cubeShape, 'R', 1)
        expect(actual).toEqual expectedCubeShape
