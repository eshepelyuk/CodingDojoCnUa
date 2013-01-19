stakan = require "./stakan.coffee"

describe 'integration test', ->
  it 'should move and rotate correct way', ->
    stakanSprite = width: 10, height: 10

    starting = leftX: 2, rightX: 4, bottomY: 6, state: 0
    expected = leftX: 5, rightX: 7, bottomY: 2, state: 0

    actual = stakan.moveDown starting
    actual = stakan.moveDown actual
    actual = stakan.moveDown actual

    actual = stakan.moveRight stakan, actual
    actual = stakan.moveRight stakan, actual
    actual = stakan.moveRight stakan, actual

    expect(actual).toEqual leftX: 5, rightX: 7, bottomY: 3, state: 0

    actual = stakan.rotate stakanSprite, actual, 'R'

    actual = stakan.moveDown actual

    expect(actual).toEqual leftX: 5, rightX: 8, bottomY: 2, state: 1

    actual = stakan.rotate stakanSprite, actual, 'L'

    expect(actual).toEqual expected