%{
char text[800];
%}

YEAR_12 (8[7-9]{1})|(9[0-9]{1})|(0[0-9]{1})|(1[0-2]{1})
YEAR_14 1[4-8][1-2]
YEAR_13 13[1-2]
COUNTY_13 C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|TN|W|WH|WX|WW|TS|WD|LK
COUNTY_14 C|CE|CN|CW|D|DL|G|KE|KK|KY|L|LD|LH|LM|LS|MH|MN|MO|OY|RN|SO|W|WH|WX|WW
SERIAL [0-9]{1,6}

%%
{YEAR_12}{1}\-{COUNTY_13}{1}\-{SERIAL}{1}(" "|\t|\n)+ {char yearArray[] = {' ', ' '};
                                                       strncpy(yearArray, yytext, 2);
                                                       int year = atoi(yearArray);
                                                       int yearSince = (year > 18) ? (100-year+18) : (18-year);
                                                       char* yearSinceArray = (char*) malloc(2);
                                                       sprintf(yearSinceArray, "%d", yearSince); 
                                                       strcat(text, yearSinceArray);
                                                       strcat(text, "\n");
                                                       free(yearSinceArray);
                                                      }
                                                      
{YEAR_13}{1}\-{COUNTY_13}{1}\-{SERIAL}{1}(" "|\t|\n)+ {char yearArray[] = {' ', ' '};                                                     
                                                       strncpy(yearArray, yytext, 2);           
                                                       int year = atoi(yearArray);
                                                       int yearSince = (year > 18) ? (100-year+18) : (18-year);
                                                       char* yearSinceArray = (char*) malloc(2);
                                                       sprintf(yearSinceArray, "%d", yearSince); 
                                                       strcat(text, yearSinceArray);
                                                       strcat(text, "\n");
                                                       free(yearSinceArray);
                                                      }
                                                      
{YEAR_14}{1}\-{COUNTY_14}{1}\-{SERIAL}{1}(" "|\t|\n)+ {char yearArray[] = {' ', ' '};          
                                                       strncpy(yearArray, yytext, 2);                            
                                                       int year = atoi(yearArray);                                              
                                                       int yearSince = (year > 18) ? (100-year+18) : (18-year);               
                                                       char* yearSinceArray = (char*) malloc(2);
                                                       sprintf(yearSinceArray, "%d", yearSince); 
                                                       strcat(text, yearSinceArray);
                                                       strcat(text, "\n");
                                                       free(yearSinceArray);
                                                     }

.*		{strcat(text, "INVALID\n");}              
\n      {}                        
                         

%%

int main()
{
  yylex();
  printf("%s", text);
  return 0;
}
























