#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <stringtype.h>

void die(char* who, char* what, int where) {
  fprintf(stderr, "Error: \"%s\" at line %d in file %s\n", what, where, who);
  exit(EXIT_FAILURE);
}

int fpeek(FILE * buffer) {
  char c = fgetc(buffer);
  ungetc(c, buffer);

  return c;
}

unsigned long long copyline(FILE * in, FILE * out) {
  unsigned long long chars_ate = 1;
  char c = fgetc(in);

  if (feof(in)) return 0;

  while (c != '\r' && c != '\n') {
    c = fgetc(in);
    fputc(c, out);
    chars_ate++;
  }

  if (c == '\r' && fpeek(in) == '\n') {
    c = fgetc(in);
    fputc(c, out);
    chars_ate++;
  }

  return chars_ate;
}

unsigned long long skipline(FILE * in) {
  unsigned long long chars_ate = 1;
  char c = fgetc(in);

  if (feof(in)) return 0;

  while (c != '\r' && c != '\n') {
    c = fgetc(in);
    chars_ate++;
  }

  if (c == '\r' && fpeek(in) == '\n') {
    c = fgetc(in);
    chars_ate++;
  }

  return chars_ate;
}

int main(int argc, char** argv) {
  // Some files can be really big.
  unsigned long long fromline = 0;
  unsigned long long toline = 0;
  unsigned long long currentline = 0;
  unsigned long long copiedlines = 0;
  unsigned long long skippedlines = 0;

  // First argument is the program call
  if (argc < 3) {
    die(__FILE__, "Not enough arguments", __LINE__);
  }

  if (strisdigit(argv[1])) {
    sscanf(argv[1], "%llu", &fromline);
  }

  if (strisdigit(argv[2])) {
    sscanf(argv[2], "%llu", &toline);
  }

  if (fromline == 0 && toline == 0) {
    die(__FILE__, "You must provide at least 1 non-zero argument", __LINE__);
  }

  // skip copy skip
  if (fromline != 0) {
    while(currentline < fromline && skipline(stdin) > 0) {
      currentline++;
    }
  }

  skippedlines = currentline;

  if (toline != 0) {
    while (currentline < toline && copyline(stdin, stdout) > 0) {
      currentline++;
    }
  }
  else {
    while (copyline(stdin, stdout) > 0) {
      currentline++;
    }
  }
  copiedlines = currentline;

  fprintf(stderr, "Skipped %llu lines.\n", skippedlines);
  fprintf(stderr, "Copied %llu lines.\n", copiedlines - skippedlines);

  exit(EXIT_SUCCESS);
}