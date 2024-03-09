%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex (void);
void yyerror (const char *);
%}
%token tID tNB tIF tELSE tWHILE tPRINT tRETURN tINT tVOID
%token tADD tSUB tMUL tDIV tLT tGT tNE tEQ tGE tLE tASSIGN tAND tOR tNOT tRBRACE tLBRACE tLPAR tRPAR tSEMI tCOMMA tERROR

%start Input
%%

Input : Function*;

Function : 
    tVOID Declaration tLBRACE Contenu tRBRACE 
    |tINT Declaration tLBRACE Contenu Return tSEMI tRBRACE；

Declaration:
    tID tLPAR Arg tRPAR;
Arg:
    tVOID
    |tINT tID 
    |tINT tID tCOMMA Arg;

Contenu:
    %empty
    |Affect tSEMI Contenu // a = b+c ;
    |tINT Ini tSEMI Contenu  // int a , b
    |tIF tLPAR Condition tRPAR tLBRACE Contenu tRBRACE Contenu   // if() then{} 
    |tIF tLPAR Condition tRPAR tLBRACE Contenu tRBRACE tELSE tLBRACE Contenu tRBRACE Contenu//if() then{} else {}
    |tWHILE tLPAR Condition tRPAR tLBRACE Contenu tRBRACE Contenu// while () {}
    |tPRINT tLPAR Vals tRPAR tSEMI Contenu;//print("")
Affect:
    tID tASSIGN Vals
Vals:
    tID
    |tNB
    |Vals tADD Vals
    |Vals tSUB Vals
    |Vals tMUL Vals
    |Vals tDIV Vals 
    |tID tLPAR tRPAR // function void
    |tID tLPAR Parametre tRBRACE ;// function (a+b machin)
Parametre:
    Vals // a
    | Vals tCOMMA Parametre; // (a,b)
Ini  :
    tID
    |tID tASSIGN Vals
    |Ini tCOMMA Ini; // dans le cas de int b, c = a+d*5
Condition :
    Vals
    | Val tCOMP Val                                                                 
    | Vals tCOMP Vals;
    |tNOT Vals
    |Vals tLT Vals
    |Vals tGT Vals
    |Vals tNE Vals
    |Vals tEQ Vals
    |Vals tGE Vals
    |Vals tLE Vals
    |Vals tAND Vals
    |Vals tOR Vals;
Return :
    tRETURN Vals
    |tRETURN tLPAR Vals tLPAR ;
%%
void yyerror(const char *msg) {
  fprintf(stderr, "error: %s\n", msg);
  exit(1);
}

int main(void) {
  yyparse();
}

