(* la1-parse.sml *)
(* Name:                                    *)
(* Time spent on HW6:
*)

(* Collaborators and references:
*)

use "Unit.sml"; (* for Unit.listString *)

exception Fail of string

(* Token datatype *)
datatype token =
    TokenCIRCLE
  | TokenLINE
  | TokenRECTANGLE
  | TokenNUM of int
  | TokenCOLOR of string
  | TokenEOF

(* Function to convert a token to its string representation *)
fun tokenToString _ = "Implement me"

(* lexer takes a string and returns a list of tokens *)
(* hint: consider using String.tokens *)
fun lexer input_str = [] (* Implement me *)

(* Abstract Syntax Tree (AST) datatype *)
datatype ast =
    Program of ast list
  | StmtCircle of int * int * int * string
  | StmtLine of int * int * int * int * string
  | StmtRectangle of int * int * int * int * string

(* Function to convert an AST node to its string representation *)
fun astToString _ = "Implement me"

(* match expected token, otherwise throw exception *)
(* Implementation provided for you.  *)
(* Why do we use a case statement instead of function pattern clauses? *)
fun match tokens expect =
  case tokens of
    [] => raise Fail ("Parse error: expected " ^ tokenToString expect 
                      ^ ", but got empty list")
  | given :: ts =>
      if given = expect then ts
      else raise Fail ("Parse error: expected " ^ tokenToString expect 
                       ^ ", but found " ^ tokenToString given)

(* stmt ::= CIRCLE NUMBER NUMBER NUMBER STRING
           | LINE NUMBER NUMBER NUMBER NUMBER STRING
           | RECTANGLE NUMBER NUMBER NUMBER NUMBER STRING *)
(* Input is a list of tokens and output is a tuple of the ast for this
   statement and a list of the remaining tokens *)
fun parseStmt _ = (StmtCircle (1,2,3,"blue"),[]) (*Implement me*)
(* Possible function clauses to include.
  | parseStmt (tok::ts) = raise Fail ("Parse error in parseStmt at " ^ tokenToString tok)
  | parseStmt [] = raise Fail ("Parse error in parseStmt, no tokens left")
*)

(* stmts ::= stmt stmts | epsilon *)
(* Input is a list of tokens and output is a tuple of a list of 
   asts and a list of the remaining tokens *)
fun parseStmts _ = ([], []) (* Implement me *)
 
(* Function for "program" non-terminal.  Evalutes to an AST. *)
(* program ::= stmts EOF *)
(* Implementation has been provided. Feel free to change. *)
fun parseProgram [TokenEOF] = Program []
  | parseProgram ts =
    let
        val (stmts, ts1) = parseStmts ts
        val _ = match ts1 TokenEOF
    in
        Program stmts
    end

(* Function that performs recursive descent parsing and creates AST *)
fun parser tokens = parseProgram tokens

(* SVG output functions, only svgCircle is provided.  You might want others. *)
fun svgCircle (cx, cy, r, fill) =
    "<circle cx=\"" ^ Int.toString cx ^
    "\" cy=\"" ^ Int.toString cy ^
    "\" r=\"" ^ Int.toString r ^
    "\" fill=\"" ^ fill ^ "\" />";

(* codegen function *)
fun svgGen (Program stmts) = 
      "<svg xmlns=\"http://www.w3.org/2000/svg\">\n"
      ^ String.concatWith "\n" (List.map svgGen stmts)
      ^ "\n</svg>\n"
  | svgGen _ = "Implement me"

