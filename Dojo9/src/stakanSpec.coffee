stakan = require "./stakan.coffee"
rotation = require "./rotation.coffee"

xdescribe 'move sprite down', ->
    it 'should reduce it Y bottom coordinates by 1 x times', ->
      sprite = {bottomY: 20}
      expect(stakan.moveDown(sprite, 3).bottomY).toBe 17
    it 'should move down until in stakan', ->
      sprite = {bottomY: 3}
      expect(stakan.moveDown(sprite, 5).bottomY).toBe 0
    it 'should not change coord if count < 0', ->
      sprite = {bottomY: 3}
      expect(stakan.moveDown(sprite, -5)).toEqual sprite

xdescribe 'move sprite right', ->
  it 'should increase x coordinates by 3', ->
    sprite = {leftX:0, rightX:0}
    stakan = {height:10, width:10}

    actual = stakan.moveRight(stakan,sprite, 3)
    expect(actual.leftX).toBe 3
    expect(actual.rightX).toBe 3
  it 'rightX coordinate shoud not be GT 9',  ->
    sprite = {rightX:3, leftX:1}
    stakan = {height:10, width:5}

    actual = stakan.moveRight(stakan,sprite, 16)
    expect(actual.rightX).toBe 5
    expect(actual.leftX).toBe 3
  it 'should not change coord if count < 0',  ->
    sprite = {rightX:3, leftX:1}
    stakan = {height:10, width:5}

    actual = stakan.moveRight(stakan,sprite, -3)
    expect(actual).toEqual sprite

xdescribe 'move sprite left', ->
  it 'should decrease x coordinates by 3', ->
    sprite = {leftX:4, rightX:6}
    actual = stakan.moveLeft(sprite,3)
    expect(actual.leftX).toBe 1
    expect(actual.rightX).toBe 3
  it 'leftX should not be LT 0', ->
    sprite = {leftX:2, rightX:5}
    actual = stakan.moveLeft(sprite,3)
    expect(actual.leftX).toBe 0
    expect(actual.rightX).toBe 3
  it 'should not change coord if count < 0', ->
    sprite = {leftX:2, rightX:5}
    actual = stakan.moveLeft(sprite,-3)
    expect(actual).toEqual sprite

describe 'rotate clockwise', ->
  it 'should call shape rotate CW', ->
    shape = {rightX: 2, leftX: 2, bottomY: 2}
    spyOn(rotation, 'rotateClockwise').andReturn shape

    actual = stakan.rotate {width:100}, shape, "R", 2
    expect(rotation.rotateClockwise.calls.length).toBe 2
    expect(rotation.rotateClockwise.calls[0].args[0]).toEqual shape
    expect(rotation.rotateClockwise.calls[1].args[0]).toEqual shape
  it 'should call shape rotate CCW', ->
    shape = {rightX: 2, leftX: 2, bottomY: 2}
    spyOn(rotation, 'rotateCounterClockwise').andReturn shape

    actual = stakan.rotate {width:100}, shape, "L", 2
    expect(rotation.rotateCounterClockwise.calls.length).toBe 2
    expect(rotation.rotateCounterClockwise.calls[0].args[0]).toEqual shape
    expect(rotation.rotateCounterClockwise.calls[1].args[0]).toEqual shape

  it 'should return original shape when leftX is out of stakan', ->
    shape = {rightX: 2, leftX: 2, bottomY: 2}
    spyOn(rotation, 'rotateClockwise').andReturn {rightX: 2, leftX: -1, bottomY: 2}
    expect(stakan.rotate {width:100}, shape, "R").toEqual shape
  it 'should return original shape when rightX is out of stakan', ->
    shape = {rightX: 2, leftX: 2, bottomY: 2}
    spyOn(rotation, 'rotateClockwise').andReturn {rightX: 12, leftX: 1, bottomY: 2}
    expect(stakan.rotate {width:10}, shape, "R").toEqual shape
  it 'should return original shape when bottomY is out of stakan', ->
    shape = {rightX: 2, leftX: 2, bottomY: 2}
    spyOn(rotation, 'rotateClockwise').andReturn {rightX: 2, leftX: 1, bottomY: -2}
    expect(stakan.rotate {width:10}, shape, "R").toEqual shape

