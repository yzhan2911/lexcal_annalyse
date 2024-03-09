
%option noyywrap
%option noinput
%option nounput

 
   
COMMENT "//"(.)*\n|"/*"([^*]|[\n]|(\*+([^*/]|[\n])))*\*+"/"

%%

"if" { return tIF;   }
"else" { return tELSE;  }
"while" { return tWHILE; }
"print" { return tPRINT; }
"return" { return tRETURN; }
"int" { return tINT; }
"void" { return tVOID; }

[a-zA-Z][a-zA-Z0-9]*  {yylval.s = strdup(yytext); return tID;}
[0-9]+|0[xX][0-9a-fA-F]+ {yylval.s = strdup(yytext); return tNB;}


"+"   { return tADD; }
"-"   { return tSUB; }
"*"   { return tMUL; }
"/"   { return tDIV; }
"<"   { return tLT; }
">"   { return tGT; }
"!="  { return tNE; }
"=="  { return tEQ; }
">="  { return tGE; }
"<="  { return tLE; }
"="   { return tASSIGN; }
"&&"  { return tAND; }
"||"  { return tOR; }
"!"   { return tNOT; }
"{"   { return tLBRACE; }
"}"   { return tRBRACE }
"("   { return tLPAR; }
")"   { return tRPAR; }
";"   { return tSEMI; }
","   { return tCOMMA; }
".|_"     { return tERROR; }
%%

