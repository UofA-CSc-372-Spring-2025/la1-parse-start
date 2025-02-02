(* sample unit tests for LA1 *)
(* Usage:
    cat la1-parse.sml la1-tests.sml > cat.sml
    poly --script cat.sml
*)

(**** Tests for lexer function ****)

val () =
  Unit.checkExpectWith (Unit.listString tokenToString)
  "lexer 'RECTANGLE 20 20 300 250 red'"
  (fn () => lexer "RECTANGLE 20 20 300 250 red")
  [TokenRECTANGLE, TokenNUM 20, TokenNUM 20, TokenNUM 300,
   TokenNUM 250, TokenCOLOR "red", TokenEOF]



val () = Unit.report()
val () = Unit.reportWhenFailures () (* put me at the _end_ *)
