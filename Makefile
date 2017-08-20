
JRE = java
JCC =  javac
JFLAGS = -cp src/java
 
.SUFFIXES: .java .class
.PHONY: all lox ast run clean

all: lox ast

lox: src/java/Expr.class src/java/Lox.class

ast: src/java/Expr.class src/java/AstPrinter.class 
	$(JRE) $(JFLAGS) AstPrinter

run: lox
	$(JRE) $(JFLAGS) Lox

clean:
	rm -f src/java/*.class src/java/Expr.java

src/java/Expr.java: src/java/GenerateAst.class
	$(JRE) $(JFLAGS) GenerateAst src/java

.java.class:
	$(JCC) $(JFLAGS) $<


