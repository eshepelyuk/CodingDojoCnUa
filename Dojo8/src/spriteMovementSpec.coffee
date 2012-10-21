shapes = require "./shapes.coffee"
spriteMovement = require "./spriteMovement.coffee"

describe 'move sprite down', ->
    it 'should reduce it Y bottom coordinates by 1', ->
      sprite = {bottomY:20}
      expect(spriteMovement.moveDown(sprite).bottomY).toBe 19
    it 'bottomY should not be below zero', ->
      sprite = {bottomY:0}
      expect(spriteMovement.moveDown(sprite).bottomY).toBe 0


