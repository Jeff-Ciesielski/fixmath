{.compile: "libfixmath/libfixmath/fix16.c".}
{.compile: "libfixmath/libfixmath/fix16_exp.c".}
{.compile: "libfixmath/libfixmath/fix16_sqrt.c".}
{.compile: "libfixmath/libfixmath/fix16_str.c".}
{.compile: "libfixmath/libfixmath/fix16_trig.c".}
{.compile: "libfixmath/libfixmath/fract32.c".}
{.compile: "libfixmath/libfixmath/uint32.c".}

import os
const ThisPath* = currentSourcePath.splitPath.head

{.passC: "-I"&ThisPath&"/libfixmath/libfixmath/".}

type
  fix16* = distinct int32

# Basic arithmetic
proc f16Add(a, b: fix16): fix16 {.importc: "fix16_add", header: "fixmath.h", cdecl.}
proc f16Sub(a, b: fix16): fix16 {.importc: "fix16_sub", header: "fixmath.h", cdecl.}
proc f16Mul(a, b: fix16): fix16 {.importc: "fix16_mul", header: "fixmath.h", cdecl.}
proc f16Div(a, b: fix16): fix16 {.importc: "fix16_div", header: "fixmath.h", cdecl.}
proc f16Mod(a, b: fix16): fix16 {.importc: "fix16_mod", header: "fixmath.h", cdecl.}

# Saturated arithmetic
proc satAdd(a, b: fix16): fix16 {.importc: "fix16_sadd", header: "fixmath.h", cdecl.}
proc satSub(a, b: fix16): fix16 {.importc: "fix16_ssub", header: "fixmath.h", cdecl.}
proc satMul(a, b: fix16): fix16 {.importc: "fix16_smul", header: "fixmath.h", cdecl.}
proc satDiv(a, b: fix16): fix16 {.importc: "fix16_sdiv", header: "fixmath.h", cdecl.}

# Math functions
proc abs*(x: fix16): fix16 {.importc: "fix16_abs", header: "fixmath.h", cdecl.}
proc floor*(x: fix16): fix16 {.importc: "fix16_floor", header: "fixmath.h", cdecl.}
proc ceil*(x: fix16): fix16 {.importc: "fix16_ceil", header: "fixmath.h", cdecl.}
proc min*(x, y: fix16): fix16 {.importc: "fix16_min", header: "fixmath.h", cdecl.}
proc max*(x, y: fix16): fix16 {.importc: "fix16_max", header: "fixmath.h", cdecl.}
proc clamp*(x, lo, hi: fix16): fix16 {.importc: "fix16_clamp", header: "fixmath.h", cdecl.}

# Trig Functions
proc sinParabola*(inAngle: fix16): fix16 {.importc: "fix16_sin_parabola", header: "fixmath.h", cdecl.}
proc sin*(inAngle: fix16): fix16 {.importc: "fix16_sin", header: "fixmath.h", cdecl.}
proc cos*(inAngle: fix16): fix16 {.importc: "fix16_cos", header: "fixmath.h", cdecl.}
proc tan*(inAngle: fix16): fix16 {.importc: "fix16_tan", header: "fixmath.h", cdecl.}
proc asin*(inValue: fix16): fix16 {.importc: "fix16_asin", header: "fixmath.h", cdecl.}
proc acos*(inValue: fix16): fix16 {.importc: "fix16_acos", header: "fixmath.h", cdecl.}
proc atan*(inValue: fix16): fix16 {.importc: "fix16_atan", header: "fixmath.h", cdecl.}
proc atan2*(inY, inX: fix16): fix16 {.importc: "fix16_atan2", header: "fixmath.h", cdecl.}
proc radToDeg*(radians: fix16): fix16 {.importc: "fix16_rad_to_deg", header: "fixmath.h", cdecl.}
proc degToRad*(degrees: fix16): fix16 {.importc: "fix16_deg_to_rad", header: "fixmath.h", cdecl.}

# Additional functions
proc sqrt*(inValue: fix16): fix16 {.importc: "fix16_sqrt", header: "fixmath.h", cdecl.}
proc square*(x: fix16): fix16 {.importc: "fix16_sq", header: "fixmath.h", cdecl.}
proc exp*(inValue: fix16): fix16 {.importc: "fix16_exp", header: "fixmath.h", cdecl.}
proc log*(inValue: fix16): fix16 {.importc: "fix16_log", header: "fixmath.h", cdecl.}
proc log2*(x: fix16): fix16 {.importc: "fix16_log2", header: "fixmath.h", cdecl.}
proc slog2*(x: fix16): fix16 {.importc: "fix16_slog2", header: "fixmath.h", cdecl.}

# Utility functions
proc toString*(value: fix16, buf: cstring, decimals: int): void {.importc: "fix16_to_str", header: "fixmath.h", cdecl.}
converter toFix16*(a: int): fix16 {.importc: "fix16_from_int", header: "fixmath.h", cdecl.}
converter toFix16*(a: float): fix16 {.importc: "fix16_from_float", header: "fixmath.h", cdecl.}
converter toInt*(a: fix16): int {.importc: "fix16_to_int", header: "fixmath.h", cdecl.}
converter toFloat*(a: fix16): float {.importc: "fix16_to_float", header: "fixmath.h", cdecl.}


proc `+`*(a, b: fix16): fix16 =
  result = f16Add(a, b)

proc `-`*(a, b: fix16): fix16 =
  result = f16Sub(a, b)

proc `*`*(a, b: fix16): fix16 =
  result = f16Mul(a, b)

proc `/`*(a, b: fix16): fix16 =
  result = f16Div(a, b)

proc `%`*(a, b: fix16): fix16 =
  result = f16Mod(a, b)

proc `|+|`*(a, b: fix16): fix16 =
  result = satAdd(a, b)

proc `|-|`*(a, b: fix16): fix16 =
  result = satSub(a, b)

proc `|*|`*(a, b: fix16): fix16 =
  result = satMul(a, b)

proc `|/|`*(a, b: fix16): fix16 =
  result = satDiv(a, b)

proc `!=`*(a, b: fix16): bool =
  cast[int32](a) != cast[int32](b)

proc `==`*(a, b: fix16): bool =
  cast[int32](a) == cast[int32](b)

proc `>`*(a, b: fix16): bool =
  cast[int32](a) > cast[int32](b)

proc `<`*(a, b: fix16): bool =
  cast[int32](a) < cast[int32](b)

proc `>=`*(a, b: fix16): bool =
  cast[int32](a) >= cast[int32](b)

proc `<=`*(a, b: fix16): bool =
  cast[int32](a) <= cast[int32](b)

proc `$`*(a: fix16): string =
  # The longest string that toString returns is 13 bytes long
  result = newString(13)
  toString(a, result.cstring, 7)

when isMainModule:
  let a: fix16 = 1
  let b: fix16 = 2.2
  let c = (0xffff).toFix16

  echo "A: ", a
  echo "B: ", b
  echo "added: ", a + b
  echo "subtracted: ", a - b
  echo "multiplied: ", a * b
  echo "divided: ", a / b
  echo "Saturated Add: ", c |+| c
  echo "A > B: ", a > b
  echo "A < B: ", a < b
  echo "A < 2: ", a < 2
  echo "2 < A: ", 2 < a
