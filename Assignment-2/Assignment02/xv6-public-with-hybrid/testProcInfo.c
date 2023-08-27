#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc,char *argv[]){
    if(argc<2){
        printf(1,"Incorrect Format\n");
        exit();
    }
    struct processInfo info;
    if(getProcInfo(atoi(argv[1]),&info)==-1){
        printf(1,"No process has this PID.\n");
        exit();
    }
    if(info.ppid != -2){
         printf(1,"PPID:  %d\nSize: %d\nNumber of Context Switches: %d\n",info.ppid,info.psize,info.numberContextSwitches);
     }else{
         printf(1,"PPID: No parent Process\nSize: %d\nNumber of Context Switches: %d\n",info.psize,info.numberContextSwitches);
     }
}
