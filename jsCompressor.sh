flex lib/tokenize.l
gcc lex.yy.c -ll
./a.out < $1 > $2
echo "................................. FINISHED COMPRESSION ...................................";
