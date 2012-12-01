shapes = require "./shapes.coffee"
spriteMovement = require "./spriteMovement.coffee"

describe 'move sprite down', ->
    it 'should reduce it Y bottom coordinates by 1', ->
        sprite = {bottomY: 20}
        expect(spriteMovement.moveDown(sprite).bottomY).toBe 19
    it 'bottomY should not be below zero', ->
        sprite = {bottomY: 0}
        expect(spriteMovement.moveDown(sprite).bottomY).toBe 0

describe 'move sprite right', ->
    it 'should increase x coordinates by 1', ->
        sprite = {leftX: 0, rightX: 0}
        expect(spriteMovement.moveRight(sprite).leftX).toBe 1
        expect(sprite.rightX).toBe 1
    it 'rightX coordinate shoud not be GT 9', ->
        sprite = {rightX: 9, leftX: 5}
        expect(spriteMovement.moveRight(sprite).rightX).toBe 9
        expect(sprite.leftX).toBe 5


describe 'move sprite left', ->
    it 'should decrease x coordinates by 1', ->
        sprite = {leftX: 1, rightX: 1}
        expect(spriteMovement.moveLeft(sprite).leftX).toBe 0
        expect(sprite.rightX).toBe 0
    it 'leftX should not be LT 0', ->
        sprite = {leftX: 0, rightX: 5}
        expect(spriteMovement.moveLeft(sprite).leftX).toBe 0
        expect(sprite.rightX).toBe 5





