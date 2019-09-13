/* first attempt at a scanner - using jflex and its built in GUI */
/* this is RUFF */

import java_cup.runtime.*; 

%%
%class Scanner
%implements sym
%debug
%cup
%unicode



%{
   class Symbol{
       final String TYPE;
       final String VALUE;

    Symbol(String type, String value){
        this.TYPE = type;
        this.VALUE = value;
    }
   }

   private Symbol createSymbol(String type, String value){
       return new Symbol(type, value);
   }
%}

    LineTerminator = \r|\n|\r\n
    InputCharacter = [^\r\n]
    WhiteSpace = {LineTerminator} | [ \t\f]
    Identifier = [:jletter:] [:jletterdigit:]*
    Int = [1-9][0-9]* | 0

%%

<YYINITIAL> {
    //keywords
    "boolean"   { return symbol("BOOLEAN", "boolean"); } 
    "int"       { return createSymbol("INT", "int"); }
    "true"      { return createSymbol("BOOLEAN_LITERAL", "true"); }
    "false"     { return createymbol("BOOLEAN_LITERAL", "false"); }
    "("         { return createSymbol("OP", "(")); }
    ")"         { return createSymbol("OP", ")"); }
    "{"         { return createSymbol("OP", "{"); }
    "}"         { return createSymbol("OP", "}"); }
    ":="        { return createSymbol("EQUAL", ":="); }
    ">"         { return createSymbol("MATH_OP", ">"); }
    "<"         { return createSymbol("MATH_OP", "<"); }
    "!"         { return createSymbol("LOG_OP", "!"); }
    "+"         { return createSymbol("MATH_OP", "+"); }
    "-"         { return createSymbol("MATH_OP", "-"); }
    "*"         { return createSymbol("MATH_OP", "*"); }
    "/"         { return createSymbol("MATH_OP", "/"); }
    "&"         { return createSymbol("LOG_OP", "&"); }
    "|"         { return createSymbol("LOG_OP", "|"); }
    "if"        { return createSymbol("IF", "if"); }
    {WhiteSpace}    {}
    {Identifier}    { return createSymbol("IDENTIFIER", yytext());}
    {Int}           { return createSymbol("INT", yytext());}
}