#include "types.h"
#include "user.h"
#include "stat.h"

int main(void){
    printf(1,"Maximum pid of processes running in the system = %d\n",getMaxPid());
    exit();
}