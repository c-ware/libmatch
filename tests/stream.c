#include "../src/libmatch.h"

int main(void) {
    char *buffer = NULL;
    struct LibmatchCursor new_cursor = libmatch_cursor_from_stream(stdin);

    buffer = libmatch_read_alloc_until(&new_cursor, "{");

    printf("%s\n", buffer);
    libmatch_cursor_free(&new_cursor);

    return 0;
}
