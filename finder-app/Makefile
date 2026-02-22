CC := $(if $(CROSS_COMPILE),$(CROSS_COMPILE)gcc,gcc)
CFLAGS ?= -Wall -Wextra -Werror

.PHONY: all clean

# Default target builds the writer application
all: writer

writer: writer.o
	$(CC) $(CFLAGS) -o $@ $^

writer.o: writer.c
	$(CC) $(CFLAGS) -c $< -o $@

# Remove the writer binary and all object files
clean:
	rm -f writer *.o
