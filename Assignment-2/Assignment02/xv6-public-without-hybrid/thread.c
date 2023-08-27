#include "types.h"
#include "stat.h"
#include "user.h"

// spinlock struct 
struct thread_spinlock{
    volatile uint lock;
    char *name;
};

// mutex struct
struct thread_mutex{
    volatile uint lock;
    char *name;
};

//Atomic instruction to check if the lock is available
static inline uint xchg(volatile uint *addr,uint newval){
    uint result;

    asm volatile("lock; xchgl %0, %1" :
                  "+m" (*addr), "=a" (result) :
                  "1" (newval) :
                  "cc");
    return result;
}

//Initialize the spinlock
void thread_spin_init(struct thread_spinlock *lk){
    lk->lock = 0;
    lk->name = "null";
}

//Continue if lock is available or busy wait
void thread_spin_lock(struct thread_spinlock *lk){
    while(xchg(&lk->lock,1)!=0);
    __sync_synchronize();
}

//Unlock the acquired lock
void thread_spin_unlock(struct thread_spinlock *lk){
    __sync_synchronize();
    asm volatile("movl $0, %0" : "+m" (lk->lock) : );
}

//Initialize the mutex lock
void thread_mutex_init(struct thread_mutex *m){
    m->lock = 0;
    m->name = "null";
}

//Continue if lock is available or sleep
void thread_mutex_lock(struct thread_mutex *m){
    while(xchg(&m->lock,1)!=0){
        sleep(1);
    }

    __sync_synchronize();
}

//Unlock the acquired mutex lock 
void thread_mutex_unlock(struct thread_mutex *m){
    __sync_synchronize();
    asm volatile("movl $0, %0" : "+m" (m->lock) : );
}

//struct thread_spinlock lock;
struct thread_mutex lock;

struct balance{
    char name[32];
    int amount;
};


volatile int total_balance = 0;
volatile unsigned int delay (unsigned int d){
    unsigned int i;
    for (i = 0; i < d; i++)
    {
    __asm volatile( "nop" ::: );
    }
    return i;
}
void do_work(void *arg)
{
    int i;
    int old;
    struct balance *b = (struct balance*) arg;
    printf(1, "Starting do_work: s:%x\n", b->name);
    for (i = 0; i < b->amount; i++){
        //thread_spin_lock(&lock);
        thread_mutex_lock(&lock);
        old = total_balance;
        delay(100000);
        total_balance = old + 1;
        thread_mutex_unlock(&lock);
        //thread_spin_unlock(&lock);
    }

    printf(1, "Done s:%x\n", b->name);
    thread_exit();

    return;
}
int main(int argc, char *argv[]) {

    //thread_spin_init(&lock);
    thread_mutex_init(&lock);

    struct balance b1 = {"b1", 3200};
    struct balance b2 = {"b2", 2800};

    void *s1, *s2;
    int t1, t2, r1, r2;

    s1 = malloc(4096);
    s2 = malloc(4096);

    t1 = thread_create(do_work, (void*)&b1, s1);
    t2 = thread_create(do_work, (void*)&b2, s2);

    r1 = thread_join();
    r2 = thread_join();

    printf(1, "Threads finished: (%d):%d, (%d):%d, shared balance:%d\n",
    t1, r1, t2, r2, total_balance);
    int num = getNumProc();
    printf(1,"Number of Active Processes = %d\n",num);
    exit();
}