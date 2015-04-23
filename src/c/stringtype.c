#include <ctype.h>
#include <string.h>
#include <stdbool.h>

bool strisdigit(char* str) {
  for (int i = 0; i < strlen(str); i++) {
    if (!isdigit(str[i])) return false;
  }

  return true;
}
