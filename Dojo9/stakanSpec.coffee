stakanModule = require "./stakan.coffee"
rotationeModule = require "./rotation.coffee"

describe 'move shape down in stakan', ->
  shape = undefined
  beforeEach -> shape = bottomY: 5
  it "should reduce bottomY by X times", ->
    expect(stakanModule.moveDown(shape, 3).bottomY).toBe 2
  it "should move down until in stakan", ->
    expect(stakanModule.moveDown(shape, 10).bottomY).toBe 0
  it "should not change coord if times < 0", ->
    expect(stakanModule.moveDown(shape, -5)).toEqual shape

describe 'move shape right in stakan', ->
  stakan = undefined
  beforeEach -> stakan = height: 10, width: 10
  it "should increase X coords by N", ->
    sprite = leftX: 1, rightX: 3
    actual = stakanModule.moveRight stakan, sprite, 3
    expect(actual.leftX).toBe 4
    expect(actual.rightX).toBe 6
  it "should move right until in stakan", ->
    sprite = leftX: 5, rightX: 8
    actual = stakanModule.moveRight stakan, sprite, 5
    expect(actual.leftX).toBe 7
    expect(actual.rightX).toBe 10
  it "should not change coord if times < 0", ->
    shape = leftX: 1, rightX: 3,
    actual = stakanModule.moveRight stakan, shape, -3
    expect(actual).toEqual shape

describe 'move shape left in stakan', ->
  shape = undefined
  beforeEach -> shape = leftX: 4, rightX: 6
  it 'should decrease X coords by N', ->
    actual = stakanModule.moveLeft shape, 3
    expect(actual.leftX).toBe 1
    expect(actual.rightX).toBe 3
  it "should move left until in stakan", ->
    actual = stakanModule.moveLeft shape, 5
    expect(actual.leftX).toBe 0
    expect(actual.rightX).toBe 2
  it "should not change coord if times < 0", ->
    expect(stakanModule.moveLeft shape, -3).toEqual shape

describe 'rotate in stakan', ->
  shape = stakan = undefined

  beforeEach ->
    stakan = width: 10
    shape = rightX: 2, leftX: 2, bottomY: 2

  it 'should delegate to rotation module clockwise', ->
    spyOn(rotationeModule, 'rotateClockwise').andReturn shape
    actual = stakanModule.rotate stakan, shape, "R", 2
    expect(rotationeModule.rotateClockwise.calls.length).toBe 2
    expect(rotationeModule.rotateClockwise.calls[0].args[0]).toEqual shape
    expect(rotationeModule.rotateClockwise.calls[1].args[0]).toEqual shape

  it 'should delegate to rotation module counter clockwise', ->
    spyOn(rotationeModule, 'rotateCounterClockwise').andReturn shape
    actual = stakanModule.rotate stakan, shape, "L", 2
    expect(rotationeModule.rotateCounterClockwise.calls.length).toBe 2
    expect(rotationeModule.rotateCounterClockwise.calls[0].args[0]).toEqual shape
    expect(rotationeModule.rotateCounterClockwise.calls[1].args[0]).toEqual shape

  it 'should return original shape when leftX is out of stakan', ->
    spyOn(rotationeModule, 'rotateClockwise').andReturn leftX: -1
    expect(stakanModule.rotate stakan, shape, "R").toEqual shape

  it 'should return original shape when rightX is out of stakan', ->
    spyOn(rotationeModule, 'rotateClockwise').andReturn rightX: 12
    expect(stakanModule.rotate stakan, shape, "R").toEqual shape

  it 'should return original shape when bottomY is out of stakan', ->
    spyOn(rotationeModule, 'rotateClockwise').andReturn bottomY: -2
    expect(stakanModule.rotate stakan, shape, "R").toEqual shape

