# https://github.com/zeroclipboard/ZeroClipboard
ZeroClipboard.setDefaults {
  moviePath: '/assets/zero_clipboard/ZeroClipboard.swf',
  hoverClass: "active"
}

window.clip = new ZeroClipboard()

clip.on 'dataRequested', ( client, args ) ->
  if this.zeroDataRequested
    this.zeroDataRequested()
  else
    throw 'zeroDataRequested callback undefined'


clip.on 'mouseover', (client) ->
  if this.zeroMouseover
    this.zeroMouseover()

clip.on 'mouseout', (client) ->
  if this.zeroMouseout
    this.zeroMouseout()
