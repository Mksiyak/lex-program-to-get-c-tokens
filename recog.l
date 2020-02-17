%{ 
int countkeywords = 0; 
int countwhitespaces = 0; 
int countsinglecomments = 0; 
int countmultilinecomments = 0;
int counterrors = 0;
int countpreprocessorscommands = 0;
int countfunctions = 0;
int countstring = 0;
int countidentifier = 0;
int countnumbers = 0;
int countopeningbrackets = 0;
int countclosingbrackets = 0;
int countcomma = 0;
int countsemicolon=0;
int countoperator=0;
int countshorthands = 0;
%}

whitespace	[ \n\t\r]
preprocessor    "#include <"{letter}+(\.{letter}*)?>
comment         "//".*
letter		[a-zA-Z_]
digit		[0-9]
stringLiteral {letter}?\"(\\.|[^\\"])*\"
identifier {letter}({letter}|{digit})*
functiuon {identifier}\(.*\)
keyword "auto"|"double"|"int"|"struct"|"break"|"else"|"long"|"switch"|"case"|"enum"|"register"|"typedef"|"char"|"extern"|"return"|"union"|"const"|"float"|"short"|"unsigned"|"continue"|"for"|"signed"|"void"|"default"|"goto"|"sizeof"|"volatile"|"do"|"if"|"static"|"while"
mlinecomment \/\*.*\*\/
invalid {digit}+{letter}+
%%

{whitespace} {countwhitespaces++;/*skip white space*/}

{comment}       {printf("comment : %s\n",yytext);countsinglecomments++;}

{mlinecomment} {printf("multiline comment : %s\n",yytext);countmultilinecomments++;}

{invalid}   {printf("invalid identifiers : %s\n",yytext);counterrors++;}

{keyword} {printf("\tkeyword: %s\n",yytext);countkeywords++;}

{functiuon}    {printf("function: %s\n",yytext);countfunctions++;}

{preprocessor} {printf("\tpreprocessor: %s\n",yytext);countpreprocessorscommands++;}

{stringLiteral} {printf("\t stringLiteral: %s\n",yytext);countstring++;}

{identifier} {printf("identifier(variable): %s\n",yytext);countidentifier++;}

{digit}*|{digit}*"."{digit}*	{printf("numericle(constant): %s\n",yytext);countnumbers++;}

"("					{printf("opening parenthsis\n");countopeningbrackets++;}

")"					{printf("closing parenthsis\n");countclosingbrackets++;}

"{"		{printf("opening flowerbrackets\n");countopeningbrackets++;}

"}"          {printf("closing flowerbrackets\n");countclosingbrackets++;}

"["			{printf("opening squrebrackets\n");countopeningbrackets++;} 

"]"			{printf("closing squrebrackets\n");countclosingbrackets++;}

","				    {printf("delimeter (,)\n");countcomma++;}

";"                 {printf("semicolon (;)\n");countsemicolon++;}

"&"				    {printf("betwise operator (&)\n");countoperator++;}

"="					{printf("assign operator\n");countoperator++;}

"<"					{printf("relational operator (<)\n");countoperator++;}

"++"				{printf("unery operator (++)\n");countoperator++;}

"=="				{printf("relational operator (is equal)\n");countoperator++;}

"+"					{printf("operator (+)\n");countoperator++;}

("+="|"-="|"*="|"/=")		{printf("shorthand : %s \n",yytext);countshorthands++;}

"!="				{printf("relational operator not equal (!=)\n");countoperator++;}

">"					{printf("relational operator (>)\n");countoperator++;}

"--"				{printf("unery decrement operator(--)\n");countoperator++;}

"<="				{printf("relational operator (<=)\n");countoperator++;}

%% 
  
int yywrap(){} 
int main(){ 
 FILE *fp; 
 char filename[50]; 
 printf("Enter the filename: \n"); 
 scanf("%s",filename); 
 fp = fopen(filename,"r"); 
 yyin = fp; 
yylex();

printf("\n\n\ncounting\n\n\n");
printf("\nkeywords : %d",countkeywords);
printf("\nwhite spaces : %d",countwhitespaces);
printf("\nsingle line comments : %d",countsinglecomments);
printf("\nmulti line comment : %d",countmultilinecomments);
printf("\nerrors : %d",counterrors);
printf("\npreprocessor commands : %d",countpreprocessorscommands);
printf("\nfunctions : %d",countfunctions);
printf("\nstrings : %d",countstring);
printf("\nidentifier : %d",countidentifier);
printf("\nnumbers : %d",countnumbers);
printf("\nopening brackets : %d",countopeningbrackets);
printf("\nclosing brackets : %d",countclosingbrackets);
printf("\ncomma : %d",countcomma);
printf("\nsemicolon : %d",countsemicolon);
printf("\noperator : %d",countoperator);
printf("\nshorthand : %d",countshorthands);
return 0; 
} 