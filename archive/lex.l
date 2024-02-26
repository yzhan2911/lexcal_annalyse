%{
  #include <stdio.h>
  #include <stdlib.h>
%}

%option noyywrap
%option noinput
%option nounput

%%

"if"                    { printf("tIF\n");   }
"else"                  { printf("tELSE\n");  }
"while"                 { printf("tWHILE\n"); }
"print"                 { printf("tPRINT\n"); }
"return"                { printf("tRETURN\n"); }
"int"                   { printf("tINT\n"); }
"void"                  { printf("tVOID\n"); }
[a-zA-Z][a-zA-Z0-9]* {printf("tID:'%s'\n",yytext);}
[0-9]+ {printf("tNB: '%s[0x%x]'\n", yytext, atoi(yytext)); }
"//".*
"/*"([^*]|"*"+[^*/])*"*/" 
"+"   { printf("tADD\n"); }
"-"   { printf("tSUB\n"); }
"*"   { printf("tMUL\n"); }
"/"   { printf("tDIV\n"); }
"<"   { printf("tLT\n"); }
">"   { printf("tGT\n"); }
"!="  { printf("tNE\n"); }
"=="  { printf("tEQ\n"); }
">="  { printf("tGE\n"); }
"<="  { printf("tLE\n");}
"="   { printf("tAFFECTATION\n");}
"&&"  { printf("tAND\n");}
"||"  { printf("tOR\n"); }
"!"   { printf("tNOT\n"); }
"{"   { printf("tLBRACE\n"); }
"}"   { printf("tRBRACE\n"); }
"("   { printf("tLPAREN\n"); }
")"   { printf("tRPAREN\n"); }
";"   { printf("tSEMI\n"); }
","   { printf("tCOMMA\n"); }
.     { printf("Caractère non reconnu: %s\n", yytext); }


%%


int main(int argc, char **argv) {
  if (argc != 2) {
    fprintf(stderr, "usage: %s filename\n", argv[0]);
    exit(1);
  }
  yyin = fopen(argv[1], "r");
  if (!yyin) {
    fprintf(stderr, "invalid filename: %s\n", argv[1]);
    exit(2);
  }
  yylex();
  fclose(yyin);
  return 0;
}