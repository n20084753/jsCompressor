%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int is_keyword_found = 0;
%}
name [a-zA-Z][a-zA-Z]*
number [0-9]+
fnumber [0-9]+(\.[0-9]+)
%%

break				|
case				|
catch				|
const				|
continue			|
debugger			|
default				|
delete				|
do				|
else				|
finally				|
for				|
function			|
if				|
in				|
instanceof			|
new				|
return				|
switch				|
throw				|
try				|
typeof				|
var				|
void				|
while				|
with				|
abstract			|
boolean				|
byte				|
char				|
class				|
double				|
enum				|
export				|
extends				|
final				|
float				|
goto				|
implements			|
import				|
int				|
interface			|
long				|
native				|
package				|
private				|
protected			|
public				|
short				|
static				|
super				|
synchronized			|
throws				|
transient			|
volatile			{printf("%s",yytext);is_keyword_found = 1;}

(\/\*([^*]|[\r\n]|(\*+([^*\/]|[\r\n])))*\*+\/)|(\/\/.*)	/* ignore Comments */

"(.|[\r\n])*?"|'(.|[\r\n])*?'	{printf("%s",yytext);}

[\t|\n ]+			{
						if(is_keyword_found)
						{
							printf(" ");
							is_keyword_found = 0;
						}						
					}					
. 					{printf("%s",yytext);is_keyword_found = 0;}
%%
int main(){
	yylex();
    return 0;
}
