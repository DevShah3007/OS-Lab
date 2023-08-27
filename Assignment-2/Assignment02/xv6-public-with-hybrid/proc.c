#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "spinlock.h"
#include "processInfo.h"

struct {
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;

static struct proc *initproc;

int quant = 1000;

//implementation of Priority Queue
struct {
	int sze;
	struct spinlock lock;
	struct proc* proc[NPROC+1];
} priorityQ;

struct {
	int sze;
	struct spinlock lock;
	struct proc* proc[NPROC+1];
} priorityQ2;


int isEmpty(){
	acquire(&priorityQ.lock);
	if(priorityQ.sze == 0){
		release(&priorityQ.lock);
		return 1;
	}
	else{
		release(&priorityQ.lock);
		return 0;
	}
}

int isEmpty2(){
	acquire(&priorityQ2.lock);
	if(priorityQ2.sze == 0){
		release(&priorityQ2.lock);
		return 1;
	}
	else{
		release(&priorityQ2.lock);
		return 0;
	}
}

int isFull(){
	acquire(&priorityQ.lock);
	if(priorityQ.sze==NPROC){
		release(&priorityQ.lock);
		return 1;
	}
	else{
		release(&priorityQ.lock);
		return 0;
	}
}

int isFull2(){
	acquire(&priorityQ2.lock);
	if(priorityQ2.sze==NPROC){
		release(&priorityQ2.lock);
		return 1;
	}
	else{
		release(&priorityQ2.lock);
		return 0;
	}
}

void insertIntoPQ(struct proc *p){
	if(isFull())
		return;

	acquire(&priorityQ.lock);
	priorityQ.sze++;
	priorityQ.proc[priorityQ.sze]=p;
	int curr=priorityQ.sze;
	while(!(curr<=1) && ((priorityQ.proc[curr]->burst_time)<(priorityQ.proc[curr/2]->burst_time))){
		struct proc* temp=priorityQ.proc[curr];
		priorityQ.proc[curr]=priorityQ.proc[curr/2];
		priorityQ.proc[curr/2]=temp;
		curr/=2;
	}
	release(&priorityQ.lock);
}

void insertIntoPQ2(struct proc *p){
	if(isFull2())
		return;

	acquire(&priorityQ2.lock);
	priorityQ2.sze++;
	priorityQ2.proc[priorityQ2.sze]=p;
	int curr=priorityQ2.sze;
	while(curr>1 && ((priorityQ2.proc[curr]->burst_time)<(priorityQ2.proc[curr/2]->burst_time))){
		struct proc* temp=priorityQ2.proc[curr];
		priorityQ2.proc[curr]=priorityQ2.proc[curr/2];
		priorityQ2.proc[curr/2]=temp;
		curr/=2;
	}
	release(&priorityQ2.lock);
}


void heapify(int curr){

	acquire(&priorityQ.lock);
	while(curr*2<=priorityQ.sze){
		if(curr*2+1<=priorityQ.sze){
			if((priorityQ.proc[curr]->burst_time)<=(priorityQ.proc[curr*2]->burst_time)&&(priorityQ.proc[curr]->burst_time)<=(priorityQ.proc[curr*2+1]->burst_time))
				break;
			else{
				if((priorityQ.proc[curr*2]->burst_time)<=(priorityQ.proc[curr*2+1]->burst_time)){
					struct proc* temp=priorityQ.proc[curr*2];
					priorityQ.proc[curr*2]=priorityQ.proc[curr];
					priorityQ.proc[curr]=temp;
					curr*=2;
				} else {
					struct proc* temp=priorityQ.proc[curr*2+1];
					priorityQ.proc[curr*2+1]=priorityQ.proc[curr];
					priorityQ.proc[curr]=temp;
					curr*=2;
					curr++;
				}
			}
		} else {
			if((priorityQ.proc[curr]->burst_time)<=(priorityQ.proc[curr*2]->burst_time))
				break;
			else{
				struct proc* temp=priorityQ.proc[curr*2];
				priorityQ.proc[curr*2]=priorityQ.proc[curr];
				priorityQ.proc[curr]=temp;
				curr*=2;
			}
		}
	}
	release(&priorityQ.lock);
}

void heapify2(int curr){

	acquire(&priorityQ2.lock);
	while(curr*2<=priorityQ2.sze){
		if(curr*2+1<=priorityQ2.sze){
			if((priorityQ2.proc[curr]->burst_time)<=(priorityQ2.proc[curr*2]->burst_time)&&(priorityQ2.proc[curr]->burst_time)<=(priorityQ2.proc[curr*2+1]->burst_time))
				break;
			else{
				if((priorityQ2.proc[curr*2]->burst_time)<=(priorityQ2.proc[curr*2+1]->burst_time)){
					struct proc* temp=priorityQ2.proc[curr*2];
					priorityQ2.proc[curr*2]=priorityQ2.proc[curr];
					priorityQ2.proc[curr]=temp;
					curr*=2;
				} else {
					struct proc* temp=priorityQ2.proc[curr*2+1];
					priorityQ2.proc[curr*2+1]=priorityQ2.proc[curr];
					priorityQ2.proc[curr]=temp;
					curr*=2;
					curr++;
				}
			}
		} else {
			if((priorityQ2.proc[curr]->burst_time)<=(priorityQ2.proc[curr*2]->burst_time))
				break;
			else{
				struct proc* temp=priorityQ2.proc[curr*2];
				priorityQ2.proc[curr*2]=priorityQ2.proc[curr];
				priorityQ2.proc[curr]=temp;
				curr*=2;
			}
		}
	}
	release(&priorityQ2.lock);
}

struct proc * extractMin(){

	if(isEmpty())
		return 0;

	acquire(&priorityQ.lock);
	struct proc* minimum=priorityQ.proc[1];
	if(priorityQ.sze==1)
	{
		priorityQ.sze=0;
		release(&priorityQ.lock);
	}
	else{
		priorityQ.proc[1] = priorityQ.proc[priorityQ.sze];
		priorityQ.sze--;
		release(&priorityQ.lock);

		heapify(1);
	}
	return minimum;
}

struct proc * extractMin2(){

	if(isEmpty2())
		return 0;

	acquire(&priorityQ2.lock);
	struct proc* minimum=priorityQ2.proc[1];
	if(priorityQ2.sze==1)
	{
		priorityQ2.sze=0;
		release(&priorityQ2.lock);
	}
	else{
		priorityQ2.proc[1] = priorityQ2.proc[priorityQ2.sze];
		priorityQ2.sze--;
		release(&priorityQ2.lock);

		heapify2(1);
	}
	return minimum;
}

void changeKey(int pid, int newBT){

	acquire(&priorityQ.lock);

	struct proc* p;
	int curr=-1;
	for(int i=1;i<=priorityQ.sze;i++){
		if(priorityQ.proc[i]->pid == pid){
			p=priorityQ.proc[i];
			curr=i;
			break;
		}
	}

	if(curr==-1){
		release(&priorityQ.lock);
		return;
	}


	if(curr==priorityQ.sze){
		priorityQ.sze--;
		release(&priorityQ.lock);
	}
	else{
		priorityQ.proc[curr]=priorityQ.proc[priorityQ.sze];
		priorityQ.sze--;
		release(&priorityQ.lock);

		heapify(curr);
	}

	p->burst_time=newBT;
	insertIntoPQ(p);

}

void changeKey2(int pid, int newBT){

	acquire(&priorityQ2.lock);

	struct proc* p;
	int curr=-1;
	for(int i=1;i<=priorityQ2.sze;i++){
		if(priorityQ2.proc[i]->pid == pid){
			p=priorityQ2.proc[i];
			curr=i;
			break;
		}
	}

	if(curr==-1){
		release(&priorityQ2.lock);
		return;
	}


	if(curr==priorityQ2.sze){
		priorityQ2.sze--;
		release(&priorityQ2.lock);
	}
	else{
		priorityQ2.proc[curr]=priorityQ2.proc[priorityQ2.sze];
		priorityQ2.sze--;
		release(&priorityQ2.lock);

		heapify2(curr);
	}

	p->burst_time=newBT;
	insertIntoPQ2(p);

}



int nextpid = 1;
extern void forkret(void);
extern void trapret(void);

static void wakeup1(void *chan);

struct proc defaultParent;

void
pinit(void)
{
  initlock(&ptable.lock, "ptable");
  initlock(&priorityQ.lock, "priorityQ");
  initlock(&priorityQ2.lock, "priorityQ2");
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
}

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
  c = mycpu();
  p = c->proc;
  popcli();
  return p;
}

//PAGEBREAK: 32
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
  p->numSwitches = 0;
  p->parent = &defaultParent;
  p->burst_time = 0;
  p->run_time = 0;
  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
  acquire(&priorityQ.lock);
  priorityQ2.sze = 0;
  release(&priorityQ.lock);

  acquire(&priorityQ2.lock);
  priorityQ2.sze = 0;
  release(&priorityQ2.lock);

  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
  p->tf->es = p->tf->ds;
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
  p->cwd = namei("/");

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
  
  short check = (p->state!=RUNNABLE);
  p->state = RUNNABLE;

  //Insert Process Into Queue
  if(check)
  	insertIntoPQ(p);

  release(&ptable.lock);
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
  return 0;
}

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));

  pid = np->pid;

  acquire(&ptable.lock);

  short check = (np->state!=RUNNABLE);
  np->state = RUNNABLE;

  //Insert Process Into Queue
  if(check)
  	insertIntoPQ(np);

  release(&ptable.lock);

  return pid;
}

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
  iput(curproc->cwd);
  end_op();
  curproc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
      if(p->state == ZOMBIE)
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
  sched();
  panic("zombie exit");
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}

//PAGEBREAK: 42
// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void scheduler(void){
  defaultParent.pid = -2;
  struct proc *p;
  struct cpu *c = mycpu();
  c->proc = 0;
  for(;;){
    // Enable interrupts on this processor.
    sti();
    /*
    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->state != RUNNABLE) continue;
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;
      (p->numSwitches)++;
      swtch(&(c->scheduler), p->context);
      switchkvm();
      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
    }
    release(&ptable.lock);*/
    /*
    // NEW Shortest Job Scheduler
    acquire(&ptable.lock);
  	if((p = extractMin()) == 0){release(&ptable.lock);continue;}
  	if(p->state!=RUNNABLE){release(&ptable.lock);continue;}
  	c->proc = p;
  	switchuvm(p);
  	p->state = RUNNING;
  	(p->numSwitches)++;
  	swtch(&(c->scheduler), p->context);
  	switchkvm();
  	c->proc = 0;
    release(&ptable.lock);*/
    // New Hybrid Scheduler
    acquire(&ptable.lock);
    if(isEmpty()){
      if(isEmpty2()){ 
      	goto label;
      }
      while(!isEmpty2()){
        if((p = extractMin2()) == 0){release(&ptable.lock);break;}
        insertIntoPQ(p);
      }
    }
    label:
  	if((p = extractMin()) == 0){release(&ptable.lock);continue;}
  	if(p->state!=RUNNABLE) 
  		{release(&ptable.lock);continue;}
  	c->proc = p;
  	switchuvm(p);
  	p->state = RUNNING;
  	(p->numSwitches)++;
  	swtch(&(c->scheduler), p->context);
  	switchkvm();
  	c->proc = 0;
  	
    release(&ptable.lock);
  }
}

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
}

// Give up the CPU for one scheduling round.
void yield(void){
  acquire(&ptable.lock);  //DOC: yieldlock
  short check = (myproc()->state != RUNNABLE);
  myproc()->state = RUNNABLE;

  //Insert Process Into Queue
  if(check)
  insertIntoPQ(myproc());
  
  sched();
  release(&ptable.lock);
}

void new_yield(void){
  acquire(&ptable.lock);

  myproc()->state = RUNNABLE;

  insertIntoPQ2(myproc());

  sched();
  release(&ptable.lock);

}


// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");

  // Must acquire ptable.lock in order to
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
  p->state = SLEEPING;

  sched();

  // Tidy up.
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}

//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == SLEEPING && p->chan == chan){
    	short check = (p->state !=RUNNABLE);

      p->state = RUNNABLE;
      if(check)
      	insertIntoPQ(p);
    }
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
}

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING){
        short check = (p->state != RUNNABLE);

        p->state = RUNNABLE;

        if(check)
    	insertIntoPQ(p);
    }
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}

//PAGEBREAK: 36
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
  static char *states[] = {
  [UNUSED]    "unused",
  [EMBRYO]    "embryo",
  [SLEEPING]  "sleep ",
  [RUNNABLE]  "runble",
  [RUNNING]   "run   ",
  [ZOMBIE]    "zombie"
  };
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}

int thread_create(void (*fcn)(void *),void *arg,void* stack){
  if((uint)stack==0)
  {
    return -1;
  }
  int i,pid; 
  struct proc *np;  //Create this pointer to alloacate to the new process created by the thread_create() system call
  struct proc *curproc = myproc();  //Gets referemce to the Current process in which thread is being created

  if((np=allocproc())==0)return -1; //If the process could not be created return -1  


  //The page directory,size,parent process and memory allocated to this process is same as the current process
  np->pgdir = curproc->pgdir;
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;   //Equates all variables in the current processs to the new thread...basically this will be the set of all shared variables

  np->isThread = 1;   //Is this process a thread?...Used in thread join later

  np->tf->eax = 0;

  np->tf->eip = (int)fcn;   //Sets the instruction pointer to the beginning of the reference to the function call reference (fcn)

  np->tf->esp = (int) stack + 4096;   //Allocates 4096 bytes of stack memory to the thread
  np->tf->esp -= 4;  //Decrement stack pointer to store the local variable arg
  *((int*)(np->tf->esp)) = (int) arg;  //Store the local variable arg
  np->tf->esp-=4;  //Decrement the stack pointer to store the initial Program Counter value
  *((int*)(np->tf->esp)) = 0xffffffff;  //Store the initial program counter value


  /*Since the files of a process and its threaded process is same..so we check all files to see if it is opened in the parent process
  If yes then we also open them in the threaded process. This is done using the below for loop*/

  for(i=0;i<NOFILE;++i)   //NOFILE denotes the total number of files opened in the kernel
  {
  	if(curproc->ofile[i])   //If the file is opened in the parent process
	{
		np->ofile[i] = filedup(curproc->ofile[i]);   //open it in the newly created threaded process
	}	
  }	
	np->cwd = idup(curproc->cwd);  //Equates directory of parent and threaded process as they are same
	safestrcpy(np->name,curproc->name,sizeof(curproc->name));
	pid = np->pid;  //We will return the value in the end...basically it is the id os the newly created thread
	acquire(&ptable.lock);
	np->state = RUNNABLE;
	release(&ptable.lock);
	return pid;	
}

int thread_join(void){
	struct proc *p; //Process pointer for looping over all the proccesses
	int havekids, pid;  //havekids denotes whether there are any child processes for the current process
	struct proc *curproc = myproc();  //Pointer to the current process

	acquire(&ptable.lock);  //Acquire a lock and choose a process to kill in the below while loops
	while(1){
		havekids = 0;
    //Continue looping through all process until you find a process which is a child of the current process and a thread we created
		for(p = ptable.proc;p< &ptable.proc[NPROC];++p){
			if(p->isThread==0||p->parent!=curproc)
			{
				continue;
			}	
			havekids = 1; /*We found a thread to kill now we execute that by setting the state to zombie and then set
      other attributes to NULL/0  */
			if(p->state==ZOMBIE){
				pid = p->pid;
				p->kstack = 0;
				p->pid = 0;
				p->parent = 0;
				p->name[0] = 0;
				p->killed = 0;
				p->state = UNUSED;
				release(&ptable.lock);
				return pid; //We return the process id of the terminated thread
			}
		}
    //If the current process terminates or the process does not have any kids we return -1 and release the aquired lock
		if(!havekids||curproc->killed){
			release(&ptable.lock);
			return -1;
		}
		sleep(curproc,&ptable.lock);
	}

}


int thread_exit(){
	struct proc *curproc = myproc();  //reference to the process which we have to kill
	struct proc *p;     //Used in looping through the processes 
	int fd; 

	if(curproc==initproc)
	{
		panic("init exiting");  
	}

  //Check all the files opened by the current process and close them one by one by setting the reference to NULL
	for(fd = 0;fd<NOFILE;fd++){
		if(curproc->ofile[fd]){
			fileclose(curproc->ofile[fd]);
			curproc->ofile[fd] = 0;
		}
	}
	begin_op();
	iput(curproc->cwd);
	end_op();
	curproc->cwd = 0;
	acquire(&ptable.lock);

	wakeup1(curproc->parent);
	
	for(p=ptable.proc;p<&ptable.proc[NPROC];++p){
		if(p->parent==curproc){
			p->parent = initproc;
			if(p->state==ZOMBIE){
				wakeup1(initproc);
			}
		}
	}
	curproc->state = ZOMBIE;
	sched();
	panic("zombie exit");
}

int getNumProc(void){
  int ans = 0;
  struct proc *p;
  acquire(&ptable.lock);
  for(p=ptable.proc;p<&ptable.proc[NPROC];++p){
    if(p->state!=UNUSED)
      ++ans;
  }
  release(&ptable.lock);
  return ans;
}

int getMaxPid(void){
  int ans = -1;
  struct proc *p;
  acquire(&ptable.lock);
  for(p = ptable.proc;p<&ptable.proc[NPROC];++p)
    if(p->pid>ans)
      ans = p->pid;
  release(&ptable.lock);
  return ans;  
}

int set_burst_timeAssist(int burst_time){
	struct proc *p = myproc();
	p->burst_time = burst_time;
	if(burst_time < quant){
		quant = burst_time;
	}
        yield();

	return 0;
}

int get_burst_timeAssist(){
	struct proc *p = myproc();

	return p->burst_time;

}

struct processInfo getProcInfoHelp(int pid){
  struct proc *p;
  struct processInfo temp = {-1,0,0};
  acquire(&ptable.lock);
  for(p = ptable.proc;p<&ptable.proc[NPROC];++p)
  {
    if(p->state!=UNUSED)
    {
      if(p->pid==pid){
        temp.ppid = p->parent->pid;
        temp.psize = p->sz;
        temp.numberContextSwitches = p->numSwitches;
        release(&ptable.lock);
        return temp;
      }
    } 
  }    
      release(&ptable.lock);
      return temp;
}

struct processInfo getCurrentInfoAssist(){

  struct proc *p;
  struct processInfo temp = {-1,0,0};

  acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->state != UNUSED){
        // printf(1, "%d\n", p->pid);
        if(p == myproc()) {
          temp.ppid = p->parent->pid;
          temp.psize = p->sz;
          temp.numberContextSwitches = p->numSwitches;
          release(&ptable.lock);
          return temp;
        }
      }
    }
    release(&ptable.lock);

    return temp;

}

int getCurrentPIDAssist(void){
  if(!myproc())return -1;
  return myproc()->pid;
}





