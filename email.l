%{
#include<stdio.h>
#include "y.tab.h"
%}

from		"from"
name		"name"
date		"date"
to		"to"
cc		"cc"
bcc		"bcc"
address		"address"
subject		"subject"
digittwo		[0-9][0-9]
digitfour		[0-9][0-9][0-9][0-9]
email		[a-zA-Z]*"@"[a-z]*".com"	
greetings 	"Dear"|"Respected"
regards		"Sincerely"|"Regards"
ws		" "
text		[a-zA-Z0-9]*
comma		","
colon		":"
slash		"/"

%%

{from}		{printf("from : %s\n",yytext); return FROM;}
{slash}		{printf("Separator : %s\n",yytext); return SLASH;}
{address}	{printf("address : %s\n",yytext); return ADDRESS;}
{date}		{printf("date : %s\n",yytext); return DATE;}
{digittwo}	{printf("date/month : %s\n", yytext);return DIGITTWO;}
{digitfour}	{printf("year : %s\n", yytext);return DIGITFOUR;}
{name}		{printf("name : %s\n",yytext); return NAME;}
{subject}	{printf("subject : %s\n",yytext); return SUBJECT;}
{to}		{printf("to : %s\n",yytext); return TO;}
{cc}		{printf("cc : %s\n",yytext); return CC;}
{bcc}		{printf("bcc : %s\n",yytext); return BCC;}
{comma}		{printf("Separator : %s\n",yytext); return COMMA;}
{colon}		{printf("Separator : %s\n",yytext); return COLON;}
{email}		{printf("email : %s\n",yytext); return EMAIL;}
{greetings}	{printf("greetings : %s\n",yytext); return GREETINGS;}
{regards}	{printf("regards : %s\n",yytext); return REGARDS;}
{text}		{printf("text : %s\n",yytext); return TEXT;}
{ws}		{}

%%

int yywrap()
{
	return 1;
}