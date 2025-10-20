CC = gcc
CFLAGS = -Iinclude
DEPS = include/utils.h include/repl.h include/row.h include/table.h
OBJ = src/main.o src/utils/getline.o src/repl/input_buffer.o src/repl/repl.o src/repl/command.o src/row.o src/table.o
TARGET = bin/my_db.exe

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) -o $@ $^

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm -f src/*.o $(TARGET)

