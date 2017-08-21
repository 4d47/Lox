
JRE = java
JCC =  javac
SRC = src/java/lox
JFLAGS = -cp src/java
 
.SUFFIXES: .java .class
.PHONY: all lox ast run clean

all: lox ast

lox: $(SRC)/Expr.class $(SRC)/Lox.class

ast: $(SRC)/Expr.class $(SRC)/AstPrinter.class 
	$(JRE) $(JFLAGS) lox.AstPrinter

run: lox
	$(JRE) $(JFLAGS) lox.Lox

clean:
	rm -f $(SRC)/*.class $(SRC)/Expr.java

$(SRC)/Expr.java: $(SRC)/GenerateAst.class
	$(JRE) $(JFLAGS) lox.GenerateAst $(SRC)

.java.class:
	$(JCC) $(JFLAGS) $<

