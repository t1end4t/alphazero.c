CC = gcc
CFLAGS = -Iinclude -Wall
SRC = src/main.c src/utils.c
BUILD_DIR = build
OBJ = $(SRC:src/%.c=$(BUILD_DIR)/%.o)
TARGET = $(BUILD_DIR)/out

all: $(TARGET)

$(TARGET): $(OBJ)
	@mkdir -p $(dir $@)
	$(CC) -o $@ $^

$(BUILD_DIR)/%.o: src/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

run: $(TARGET)
	./$(TARGET)

clean:
	rm -rf $(BUILD_DIR) $(TARGET)
