#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "processInfo.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

int sys_thread_create(void){
  void (*fcn)(void*);
  void* arg;
  void* stack;
  argptr(0,(void*) &fcn, sizeof(void(*)(void *)));
  argptr(1, (void*) &arg, sizeof(void*));
  argptr(2, (void*) &stack, sizeof(void *));
  return thread_create(fcn,arg,stack);
}

int sys_thread_join(void){
  return thread_join();
}


int sys_thread_exit(void){
  return thread_exit();
}

int sys_getNumProc(void){
  return getNumProc();
}

int sys_getMaxPid(void){
  return getMaxPid();
}
/*
int sys_setBurstTime(void){
  struct proc * p = myproc();
  p->burstTime = 5;
  return 0;
}

int sys_getBurstTime(void){
  struct proc *p = myproc();
  return p->burstTime;
}*/

int sys_set_burst_time(void){
  int burst_time;
  argptr(0,(void *)&burst_time, sizeof(burst_time));

  return set_burst_timeAssist(burst_time);
}

int sys_get_burst_time(void){
  return get_burst_timeAssist();
}


int sys_getProcInfo(void){
  int pid;
  struct processInfo *info;
  argptr(0,(void *) &pid,sizeof(pid));
  argptr(1,(void *) &info,sizeof(info));
  struct processInfo tempInfo = getProcInfoHelp(pid);
  if(tempInfo.ppid==-1)
    return -1;
  info->ppid = tempInfo.ppid;
  info->psize = tempInfo.psize;
  info->numberContextSwitches = tempInfo.numberContextSwitches;
  return 0;  
}

int 
sys_draw(void){
  void* buf;
  uint size;
  argptr(0,(void*)&buf,sizeof(buf));
  argptr(1,(void*)&size,sizeof(size));
  char figure[] = "\nGroup M10\n";
  if(sizeof(figure)>size)return -1;
  strncpy((char *)buf,figure,size);
  return sizeof(figure);                
}

int
sys_getCurrentInfo(void)
{
  struct processInfo *info;
  argptr(0,(void *)&info, sizeof(info));

  struct processInfo temporaryInfo = getCurrentInfoAssist();

  if(temporaryInfo.ppid == -1)return -1;

  info->ppid = temporaryInfo.ppid;
  info->psize = temporaryInfo.psize;
  info->numberContextSwitches = temporaryInfo.numberContextSwitches;
  return 0;
}

int sys_getCurrentPID(void){
  return getCurrentPIDAssist();
}
