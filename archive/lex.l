%{#include <stdio.h>
%}

%option noyywrap
%option noinput
%option nounput

%%
[a-zA-Z][a-zA-Z0-9]* printf("tID:'%s'\n",yytext);
[0-9]+ printf("tNB: '%s[0x%x]'\n", yytext, atoi(yytext)); 
if printf("tIF\n");
else printf("tELSE\n");
while printf("tWHILE\n");
print printf("tPRINT\n");
return printf("tRETURN\n");
int printf("tINT\n");
void printf("tVOID\n");
"//".*
"/*"([^*]|"*"+[^*/])*"*/" 
\+ printf("tADD\n");
- printf("tSUB\n");
\* printf("tMUL\n");
/ printf("tDIV\n");
< printf("tLT\n");
> printf("tGT\n");
!= printf("tNE\n");
== printf("tEQ\n");
>= printf("tGE\n");
<= printf("tLE\n");
= printf("tAFFECTATION\n");
&& printf("tAND\n");
\|\| printf("tOR\n");
! printf("tNOT\n");
\{ printf("tLBRACE");
\} printf("tRBRACE");
\( printf("tLPAREN");
\) printf("tRPAREN");
; printf("tSEMI");
, printf("tCOMMA");