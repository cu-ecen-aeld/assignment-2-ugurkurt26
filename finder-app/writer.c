#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>
#include <errno.h>

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <file> <string>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *filename = argv[1];
    const char *string = argv[2];

    // Open syslog
    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    // Log the writing action
    syslog(LOG_DEBUG, "Writing '%s' to '%s'", string, filename);

    // Open the file for writing
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error opening file '%s': %s", filename, strerror(errno));
        closelog();
        return EXIT_FAILURE;
    }

    // Write the string to the file
    if (fprintf(file, "%s\n", string) < 0) {
        syslog(LOG_ERR, "Error writing to file '%s': %s", filename, strerror(errno));
        fclose(file);
        closelog();
        return EXIT_FAILURE;
    }

    // Close the file
    if (fclose(file) != 0) {
        syslog(LOG_ERR, "Error closing file '%s': %s", filename, strerror(errno));
        closelog();
        return EXIT_FAILURE;
    }

    // Close syslog
    closelog();
    
    return EXIT_SUCCESS;
}
