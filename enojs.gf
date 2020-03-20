#!/usr/local/bin/gfoo

use: abc...
use: image (new-rgba set)
use: io (ARGS OUT Byte bytes length new-buffer slurp to-byte write)
use: iter (~ next)
use: math (div sqrt)
use: zip (add close)

let: zb new-buffer
let: z zip.new-writer(zb)
ARGS for: (z add($) write($ slurp))
close(z)

let: zl length(zb)
let: zls to-string(zl)

let: lb (
  new-buffer
  .. write(zls length to-byte)
  .. write(zls)
)

define: PX-BYTES 4

let: px (lb length +(zl) div(PX-BYTES) +1)
let: h sqrt(px)
let: w (h +1)

let: img new-rgba(w h)
let: in (lb bytes ~(zb bytes) ~(0 to-byte iter.value))

w for: {
  let: x $
  h for: (img set(x $ next(in) next(in) next(in) next(in)))
}

img png.encode(OUT)