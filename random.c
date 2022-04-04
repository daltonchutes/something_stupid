#include <rand.h>
#include <stdbool.h>
#include <stdint.h>

uint8_t r;

bool randomXD()
{
    return rand() > 127;
}

int8_t randomDir()
{
    r = rand();
    if(r > 127){
        return 1;
    }else{
        return -1;
    }
}

int8_t randomPickup()
{
    r = rand() % 80;
    r = r + 40;
    return r;
}

