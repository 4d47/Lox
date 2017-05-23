
JAVAC = javac -cp java
JAVA = java -cp java
SOURCES = $(wildcard java/*.java)
CLASSES = $(SOURCES:.java=.class)


run: java/Lox.class
	$(JAVA) Lox

java/Lox.class: $(SOURCES) java/Expr.java
	$(JAVAC) java/Lox.java

java/Expr.java: java/GenerateAst.class
	$(JAVA) GenerateAst java

clean:
	rm -f java/*.class java/Expr.java

%.class: %.java
	$(JAVAC) $<

.PHONY: run clean
