
SOURCES = $(wildcard java/*.java)

run: java/Lox.class
	java -cp java Lox

java/Lox.class: $(SOURCES)
	javac -cp java java/Lox.java

.PHONY: run
