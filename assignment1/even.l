
%{
int count = 0;
%}

%%

[0-9]+	{if ((atoi(yytext)%2) == 0) {count++;}}
\n		{}
.		{}

%%

int main()
{
  yylex();
  printf("%d\n", count);
  return 0;
}

