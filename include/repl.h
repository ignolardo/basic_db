#ifndef INPUT_BUFFER_H
#define INPUT_BUFFER_H

#include <stdlib.h>
#include <stdint.h>
#include <row.h>

#define print_prompt() printf("db> ");

// INPUT BUFFER
typedef struct {
    char *buffer;
    size_t buffer_length;
    size_t input_length;
} InputBuffer;

InputBuffer* new_input_buffer();
void close_input_buffer(InputBuffer *input_buffer);
void read_input(InputBuffer *input_buffer);

// REPL INITIALIZATION
void init_repl();


// COMMAND
typedef enum {
    META_COMMAND_SUCCESS,
    META_COMMAND_UNRECOGNIZED_COMMAND,
} MetaCommandResult;

typedef enum {
    PREPARE_SUCCESS,
    PREPARE_UNRECOGNIZED_STATEMENT,
    PREPARE_SYNTAX_ERROR,
} PrepareResult;

typedef enum {
    STATEMENT_INSERT,
    STATEMENT_SELECT,
} StatementType;

typedef struct {
    StatementType type;
    Row row_to_insert;
} Statement;

typedef enum {
    EXECUTE_SUCCESS,
    EXECUTE_TABLE_FULL,
} ExecutionResult;

MetaCommandResult do_meta_command(InputBuffer *input_buffer, Table *table);
PrepareResult prepare_statement(InputBuffer *input_buffer, Statement *statement);
ExecutionResult execute_statement(Statement *statement, Table *table);
ExecutionResult execute_insert(Statement *statement, Table *table);
ExecutionResult execute_select(Statement *statement, Table *table);


#endif