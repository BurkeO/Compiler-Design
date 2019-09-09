
%{
int count = 0;
int multi = 0;
char code[800];
%}

%%

\"[^\"]*\" {strcat(code, yytext);}                      //leave strings in (anything starting with " and ending with ")
\*\*.*	{}                                              //Do nothing for ** (single line comments) i.e. don't add to char array
\{[^\}]*\} {}                                           //Do nothing for { followed by anything but closing }, then a closing } (multi line comment)
\{[^\}]*  {strcat(code, "syntax error\n"); return 0;}   //Add "syntax error" for open { never followed by closing }
\}      {strcat(code, "syntax error\n"); return 0;}     //Add "syntax error" for closing } (all other rules met, then is the only one left)
\n      {strcat(code, yytext);}                         //Anything else is valid code (non-comment) so add to array
.		{strcat(code, yytext);}                         //Anything else is valid code (non-comment) so add to array

%%

int main()
{
  yylex();
  printf ("%s", code);
  return 0;
}
























