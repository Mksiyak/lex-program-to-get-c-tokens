%{ 
int count = 0; 
%}

whitespace	[ \n\t\r]
preprocessor    "#include <"{letter}+(\.{letter}*)?>
comment         "//".*
letter		[a-zA-Z_]
digit		[0-9]
stringLiteral {letter}?\"(\\.|[^\\"])*\"
identifier {letter}({letter}|{digit})*
functiuon {identifier}?(.*)
keyword "auto"|"double"|"int"|"struct"|"break"|"else"|"long"|"switch"|"case"|"enum"|"register"|"typedef"|"char"|"extern"|"return"|"union"|"const"|"float"|"short"|"unsigned"|"continue"|"for"|"signed"|"void"|"default"|"goto"|"sizeof"|"volatile"|"do"|"if"|"static"|"while"

%%
{whitespace} {/*skip white space*/}

{comment}       {/*skip comments*/}

functiuon     {printf("function: %s\n",yytext);}

{preprocessor} {printf("\tpreprocessor: %s\n",yytext);}

{stringLiteral} {printf("\t stringLiteral: %s\n",yytext);}

{keyword} {printf("\tkeyword: %s\n",yytext);}

identifier {printf("identifier(variable): %s\n",yytext);}

{digit}*|{digit}*"."{digit}*	{printf("numericle(constant): %s\n",yytext);}

"("					{printf("opening parenthsis\n");}

")"					{printf("closing parenthsis\n");}

("{"|"<%")			{printf("opening flowerbrackets\n");}

("}"|"%>")          {printf("closing flowerbrackets\n");}

("["|"<:")			{printf("opening squrebrackets\n");} 

("]"|":>")			{printf("closing squrebrackets\n");}

","				    {printf("delimeter (,)\n");}

";"                 {printf("semicolon (;)\n");}

"&"				    {printf("betwise operator (&)\n");}

"="					{printf("assign operator\n");}

"<"					{printf("relational operator (<)\n");}

"++"				{printf("unery operator (++)\n");}

"=="				{printf("relational operator (is equal)\n");}

"+"					{printf("operator (+)\n");}

"+="				{printf("shorthand (+=)\n");}

"!="				{printf("relational operator not equal (!=)\n");}

">"					{printf("relational operator (>)\n");}

"*="				{printf("shorthand (*=)\n");}

"--"				{printf("unery decrement operator(--)\n");}

"<="				{printf("relational operator (<=)\n");}

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
printf("\nNumber of Captial letters " 
      "in the given input - %d\n", count); 
  
return 0; 
} 