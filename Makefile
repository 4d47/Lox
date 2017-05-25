
JAVAC = javac -cp java
JAVA = java -cp java
SOURCES = $(wildcard java/*.java)
CLASSES = $(SOURCES:.java=.class)


all: java/Lox.class java/AstPrinter.class

run: java/Lox.class
	$(JAVA) Lox

ast: java/AstPrinter.class
	$(JAVA) AstPrinter

clean:
	rm -f java/*.class java/Expr.java

java/Lox.class: $(SOURCES) java/Expr.java
	$(JAVAC) java/Lox.java

java/AstPrinter.class: java/Expr.class

java/Expr.java: java/GenerateAst.class
	$(JAVA) GenerateAst java

%.class: %.java
	$(JAVAC) $<

.PHONY: all run ast clean
