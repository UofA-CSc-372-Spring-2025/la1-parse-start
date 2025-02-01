(* sample unit tests for LA1 *)
use "Unit.sml";

(**** Tests for lexer function ****)

val () =
  Unit.checkExpectWith (Unit.listString tokenToString)
  "lexer 'RECTANGLE 20 20 300 250 red'"
  (fn () => lexer "RECTANGLE 20 20 300 250 red")
  [TokenRECTANGLE, TokenNUM 20, TokenNUM 20, TokenNUM 300,
   TokenNUM 250, TokenCOLOR "red", TokenEOF]



val () = Unit.report()
val () = Unit.reportWhenFailures () (* put me at the _end_ *)
