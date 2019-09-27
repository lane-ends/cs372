package.things;
import java_cup.runtime.*; 

%%
%class Scanner
%implements sym
%debug
%cup
%unicode

%{
   private Symbol createSymbol(int type, Object value){
       return new Symbol(type, -1, -1, value);
   }
%}

    LineTerminator = \r|\n|\r\n
    WhiteSpace = {LineTerminator} | [ \t\f]
    Identifier = [a-zA-Z][a-zA-Z0-9]*
    Int = [1-9][0-9]* | 0

%%

<YYINITIAL> {
    //keywords
    "int"       { return createSymbol(sym.INT, "int"); }
    "("         { return createSymbol(sym.LPAREN, "("); }
    ")"         { return createSymbol(sym.RPAREN, ")"); }
    ":="        { return createSymbol(sym.ASS_SYM, ":="); }
    "+"         { return createSymbol(sym.PLUS, "+"); }
    "-"         { return createSymbol(sym.MINUS, "-"); }
    "*"         { return createSymbol(sym.TIMES, "*"); }
    "/"         { return createSymbol(sym.DIV, "/"); }
    "print("    { return createSymbol(sym.PRINT, "print"); }

    {WhiteSpace}    { /* fjfjjfjff */ }
    {Identifier}    { return createSymbol(sym.IDENT, yytext());}
    {Int}           { return createSymbol(sym.INT, new Integer(yytext()));}
}