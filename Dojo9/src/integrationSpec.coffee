stakan = require "./stakan.coffee"
rotation = require "./rotation.coffee"

describe 'integration test', ->
  it '', ->
    spyOn(rotation, 'rotateClockwise').andReturn {leftX: 5, rightX: 8, bottomY: 3}
    spyOn(rotation, 'rotateCounterClockwise').andReturn {leftX: 6, rightX: 8, bottomY: 2}

    stakanSprite = {width: 10, height: 10}

    starting = {leftX: 2, rightX: 4, bottomY: 6}
    expected = { leftX: 6, rightX: 8, bottomY: 2}

    actual = stakan.moveDown starting
    actual = stakan.moveDown actual
    actual = stakan.moveDown actual

    actual = stakan.moveRight stakan, actual
    actual = stakan.moveRight stakan, actual
    actual = stakan.moveRight stakan, actual

    expect(actual).toEqual {leftX: 5, rightX: 7, bottomY: 3}

    actual = stakan.rotate stakanSprite, actual, 'R'

    actual = stakan.moveDown actual

    expect(actual).toEqual {leftX: 5, rightX: 8, bottomY: 2}

    actual = stakan.rotate stakanSprite, actual, 'L'

    expect(actual).toEqual expected