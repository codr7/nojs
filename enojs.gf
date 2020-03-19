use: abc...
use: image (new-rgba set)
use: io (ARGS OUT Byte length new-buffer slurp to-byte write)
use: math (div sqrt)
use: png (encode)
use: zip (add close)

let: zb new-buffer
let: z zip.new-writer(zb)
ARGS for: (z add($) write(slurp($)))
close(z)

let: zl length(zb)
let: zls to-string(zl)

let: lb (
  new-buffer
  .. write(to-byte(length(zls)))
  .. write(zls)
)

let: px (length(lb) +(zl) div(4) +1)
let: h sqrt(px)
let: w (h +1)

let: img new-rgba(w h)
let: in (iter(lb)~(iter(zb)))

method: b (; Byte) {next(in) .. is(NIL) ?: (_ to-byte(0)) ()}

w for: {
  let: x $
  h for: (img set(x $ b b b b))
}

img png.encode(OUT)