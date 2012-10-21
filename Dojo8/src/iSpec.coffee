shapes = require "./shapes.coffee"
describe 'rotate I', ->
    it 'should return I rotated to right from pos 0 to 1', ->
        shape = {
        type: 'I',
        state: 0,
        bottomY: null,
        leftX: null,
        rightX: null
        }

        expectedShape = {
        type: 'I',
        state: 1,
        bottomY: null,
        leftX: null,
        rightX: null
        }

        actual = shapes.rotateAnyShapeFromAnyPos(shape, 'R', 1)
        expect(actual).toEqual expectedShape


    it 'should return I rotated to right from pos 1 to 0', ->
        shape = {
        type: 'I',
        state: 1,
        bottomY: null,
        leftX: null,
        rightX: null
        }

        expectedShape = {
        type: 'I',
        state: 0,
        bottomY: null,
        leftX: null,
        rightX: null
        }

        actual = shapes.rotateAnyShapeFromAnyPos(shape, 'R', 1)
        expect(actual).toEqual expectedShape

    it 'should return I rotated to left from pos 0 to 1', ->
        shape = {
        type: 'I',
        state: 0,
        bottomY: null,
        leftX: null,
        rightX: null
        }

        expectedShape = {
        type: 'I',
        state: 1,
        bottomY: null,
        leftX: null,
        rightX: null
        }

        actual = shapes.rotateAnyShapeFromAnyPos(shape, 'L', 1)
        expect(actual).toEqual expectedShape


