
export CLASSPATH = src/java
SOURCES = $(wildcard src/java/*.java) src/java/Expr.java
CLASSES = $(SOURCES:.java=.class)


all: lox ast

lox: src/java/Expr.class src/java/Lox.class

ast: src/java/Expr.class src/java/AstPrinter.class 
	java AstPrinter

run: lox
	java Lox

clean:
	rm -f src/java/*.class src/java/Expr.java

tags: $(SOURCES)
	ctags -R .

src/java/Lox.class: $(SOURCES)
	javac src/java/Lox.java

src/java/Expr.java: src/java/GenerateAst.class
	java GenerateAst src/java/

%.class: %.java
	javac $<

.PHONY: all lox ast run clean
