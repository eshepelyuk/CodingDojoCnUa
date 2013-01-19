exports.rotateClockwise = (sprite) ->
  resSprite = {}
  resSprite.state = (sprite.state + 1) % 4
  if (1 == sprite.state)
    resSprite.rightX = sprite.rightX - 1
    resSprite.leftX = sprite.leftX
    resSprite.bottomY = sprite.bottomY - 2
  else if (2 == sprite.state)
    resSprite.rightX = sprite.rightX + 1
    resSprite.leftX = sprite.leftX
    resSprite.bottomY = sprite.bottomY + 2
  else if ( 3 == sprite.state)
    resSprite.rightX = sprite.rightX - 1
    resSprite.leftX = sprite.leftX
    resSprite.bottomY = sprite.bottomY
  else
    resSprite.rightX = sprite.rightX + 1
    resSprite.leftX = sprite.leftX
    resSprite.bottomY = sprite.bottomY


  return resSprite

exports.rotateCounterClockwise = (sprite) ->
  resSprite = {}
  resSprite.state = (sprite.state + 3) % 4
  if (3 == sprite.state)
    resSprite.rightX = sprite.rightX - 1
    resSprite.leftX = sprite.leftX
    resSprite.bottomY = sprite.bottomY - 2
  else if (2 == sprite.state)
    resSprite.rightX = sprite.rightX + 1
    resSprite.leftX = sprite.leftX
    resSprite.bottomY = sprite.bottomY + 2
  else if (1 == sprite.state)
    resSprite.rightX = sprite.rightX - 1
    resSprite.leftX = sprite.leftX
    resSprite.bottomY = sprite.bottomY
  else
    resSprite.rightX = sprite.rightX + 1
    resSprite.leftX = sprite.leftX
    resSprite.bottomY = sprite.bottomY
  return resSprite