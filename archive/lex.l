%{#include <stdio.h>
%}

%option noyywrap
%option noinput
%option nounput

%%
[a-zA-Z][a-zA-Z0-9]* printf("tID:'%s'",yytext);
[0-9]+ printf("tNB: '%s[0x%x]'\n", yytext, atoi(yytext)); 
if printf("tIF");
else printf("tELSE");
while printf("tWHILE");
print printf("tPRINT");
return printf("tRETURN");
int printf("tINT");
void printf("tVOID");
"//".*
"/*"([^*]|"*"+[^*/])*"*/" 
+ printf("tADD");
- printf("tSUB");
* printf("tMUL");
/ printf("tDIV");
< printf("tLT");
> printf("tGT");
!= printf("tNE");
== printf("tEQ");
>= printf("tGE");
<= printf("tLE");
= printf("tAFFECTATION");
&& printf("tAND");
|| printf("tOR");
! printf("tNOT");
{ printf("tLBRACE");
} printf("tRBRACE");
( printf("tLPAREN");
) printf("tRPAREN");
; printf("tSEMI");
, printf("tCOMMA");