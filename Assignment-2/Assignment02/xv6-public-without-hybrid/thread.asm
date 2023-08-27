
_thread:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    printf(1, "Done s:%x\n", b->name);
    thread_exit();

    return;
}
int main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 64             	sub    $0x64,%esp

    //thread_spin_init(&lock);
    thread_mutex_init(&lock);

    struct balance b1 = {"b1", 3200};
  14:	c7 45 a0 62 31 00 00 	movl   $0x3162,-0x60(%ebp)
    struct balance b2 = {"b2", 2800};

    void *s1, *s2;
    int t1, t2, r1, r2;

    s1 = malloc(4096);
  1b:	68 00 10 00 00       	push   $0x1000
    m->lock = 0;
  20:	c7 05 a4 11 00 00 00 	movl   $0x0,0x11a4
  27:	00 00 00 
    m->name = "null";
  2a:	c7 05 a8 11 00 00 7b 	movl   $0xc7b,0x11a8
  31:	0c 00 00 
    struct balance b1 = {"b1", 3200};
  34:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
  3b:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
  42:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%ebp)
  49:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
  50:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
  57:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%ebp)
  5e:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
  65:	c7 45 c0 80 0c 00 00 	movl   $0xc80,-0x40(%ebp)
    struct balance b2 = {"b2", 2800};
  6c:	c7 45 c4 62 32 00 00 	movl   $0x3262,-0x3c(%ebp)
  73:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
  7a:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
  81:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
  88:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  8f:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  96:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  9d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  a4:	c7 45 e4 f0 0a 00 00 	movl   $0xaf0,-0x1c(%ebp)
    s1 = malloc(4096);
  ab:	e8 80 08 00 00       	call   930 <malloc>
    s2 = malloc(4096);
  b0:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    s1 = malloc(4096);
  b7:	89 c3                	mov    %eax,%ebx
    s2 = malloc(4096);
  b9:	e8 72 08 00 00       	call   930 <malloc>

    t1 = thread_create(do_work, (void*)&b1, s1);
  be:	83 c4 0c             	add    $0xc,%esp
    s2 = malloc(4096);
  c1:	89 c6                	mov    %eax,%esi
    t1 = thread_create(do_work, (void*)&b1, s1);
  c3:	8d 45 a0             	lea    -0x60(%ebp),%eax
  c6:	53                   	push   %ebx
  c7:	50                   	push   %eax
  c8:	68 30 01 00 00       	push   $0x130
  cd:	e8 21 05 00 00       	call   5f3 <thread_create>
    t2 = thread_create(do_work, (void*)&b2, s2);
  d2:	83 c4 0c             	add    $0xc,%esp
    t1 = thread_create(do_work, (void*)&b1, s1);
  d5:	89 c3                	mov    %eax,%ebx
    t2 = thread_create(do_work, (void*)&b2, s2);
  d7:	8d 45 c4             	lea    -0x3c(%ebp),%eax
  da:	56                   	push   %esi
  db:	50                   	push   %eax
  dc:	68 30 01 00 00       	push   $0x130
  e1:	e8 0d 05 00 00       	call   5f3 <thread_create>
  e6:	89 c7                	mov    %eax,%edi

    r1 = thread_join();
  e8:	e8 0e 05 00 00       	call   5fb <thread_join>
  ed:	89 c6                	mov    %eax,%esi
    r2 = thread_join();
  ef:	e8 07 05 00 00       	call   5fb <thread_join>

    printf(1, "Threads finished: (%d):%d, (%d):%d, shared balance:%d\n",
  f4:	8b 15 a0 11 00 00    	mov    0x11a0,%edx
  fa:	83 c4 0c             	add    $0xc,%esp
  fd:	52                   	push   %edx
  fe:	50                   	push   %eax
  ff:	57                   	push   %edi
 100:	56                   	push   %esi
 101:	53                   	push   %ebx
 102:	68 80 0c 00 00       	push   $0xc80
 107:	6a 01                	push   $0x1
 109:	e8 f2 05 00 00       	call   700 <printf>
    t1, r1, t2, r2, total_balance);
    int num = getNumProc();
 10e:	83 c4 20             	add    $0x20,%esp
 111:	e8 fd 04 00 00       	call   613 <getNumProc>
    printf(1,"Number of Active Processes = %d\n",num);
 116:	83 ec 04             	sub    $0x4,%esp
 119:	50                   	push   %eax
 11a:	68 b8 0c 00 00       	push   $0xcb8
 11f:	6a 01                	push   $0x1
 121:	e8 da 05 00 00       	call   700 <printf>
    exit();
 126:	e8 28 04 00 00       	call   553 <exit>
 12b:	66 90                	xchg   %ax,%ax
 12d:	66 90                	xchg   %ax,%ax
 12f:	90                   	nop

00000130 <do_work>:
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	56                   	push   %esi
 135:	31 f6                	xor    %esi,%esi
 137:	53                   	push   %ebx
 138:	bb 01 00 00 00       	mov    $0x1,%ebx
 13d:	83 ec 10             	sub    $0x10,%esp
 140:	8b 7d 08             	mov    0x8(%ebp),%edi
    printf(1, "Starting do_work: s:%x\n", b->name);
 143:	57                   	push   %edi
 144:	68 58 0c 00 00       	push   $0xc58
 149:	6a 01                	push   $0x1
 14b:	e8 b0 05 00 00       	call   700 <printf>
    for (i = 0; i < b->amount; i++){
 150:	8b 47 20             	mov    0x20(%edi),%eax
 153:	83 c4 10             	add    $0x10,%esp
 156:	85 c0                	test   %eax,%eax
 158:	7e 6b                	jle    1c5 <do_work+0x95>
 15a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    asm volatile("lock; xchgl %0, %1" :
 160:	89 d8                	mov    %ebx,%eax
 162:	f0 87 05 a4 11 00 00 	lock xchg %eax,0x11a4
    while(xchg(&m->lock,1)!=0){
 169:	85 c0                	test   %eax,%eax
 16b:	74 1d                	je     18a <do_work+0x5a>
 16d:	8d 76 00             	lea    0x0(%esi),%esi
        sleep(1);
 170:	83 ec 0c             	sub    $0xc,%esp
 173:	6a 01                	push   $0x1
 175:	e8 69 04 00 00       	call   5e3 <sleep>
    asm volatile("lock; xchgl %0, %1" :
 17a:	89 d8                	mov    %ebx,%eax
 17c:	f0 87 05 a4 11 00 00 	lock xchg %eax,0x11a4
    while(xchg(&m->lock,1)!=0){
 183:	83 c4 10             	add    $0x10,%esp
 186:	85 c0                	test   %eax,%eax
 188:	75 e6                	jne    170 <do_work+0x40>
    __sync_synchronize();
 18a:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
        old = total_balance;
 18f:	b8 a0 86 01 00       	mov    $0x186a0,%eax
 194:	8b 15 a0 11 00 00    	mov    0x11a0,%edx
    for (i = 0; i < d; i++)
 19a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    __asm volatile( "nop" ::: );
 1a0:	90                   	nop
    for (i = 0; i < d; i++)
 1a1:	83 e8 01             	sub    $0x1,%eax
 1a4:	75 fa                	jne    1a0 <do_work+0x70>
        total_balance = old + 1;
 1a6:	8d 42 01             	lea    0x1(%edx),%eax
 1a9:	a3 a0 11 00 00       	mov    %eax,0x11a0
    __sync_synchronize();
 1ae:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
    asm volatile("movl $0, %0" : "+m" (m->lock) : );
 1b3:	c7 05 a4 11 00 00 00 	movl   $0x0,0x11a4
 1ba:	00 00 00 
    for (i = 0; i < b->amount; i++){
 1bd:	83 c6 01             	add    $0x1,%esi
 1c0:	39 77 20             	cmp    %esi,0x20(%edi)
 1c3:	7f 9b                	jg     160 <do_work+0x30>
    printf(1, "Done s:%x\n", b->name);
 1c5:	83 ec 04             	sub    $0x4,%esp
 1c8:	57                   	push   %edi
 1c9:	68 70 0c 00 00       	push   $0xc70
 1ce:	6a 01                	push   $0x1
 1d0:	e8 2b 05 00 00       	call   700 <printf>
    thread_exit();
 1d5:	83 c4 10             	add    $0x10,%esp
}
 1d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1db:	5b                   	pop    %ebx
 1dc:	5e                   	pop    %esi
 1dd:	5f                   	pop    %edi
 1de:	5d                   	pop    %ebp
    thread_exit();
 1df:	e9 1f 04 00 00       	jmp    603 <thread_exit>
 1e4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1ef:	90                   	nop

000001f0 <thread_spin_init>:
void thread_spin_init(struct thread_spinlock *lk){
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
    lk->lock = 0;
 1f6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    lk->name = "null";
 1fc:	c7 40 04 7b 0c 00 00 	movl   $0xc7b,0x4(%eax)
}
 203:	5d                   	pop    %ebp
 204:	c3                   	ret    
 205:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000210 <thread_spin_lock>:
void thread_spin_lock(struct thread_spinlock *lk){
 210:	55                   	push   %ebp
    asm volatile("lock; xchgl %0, %1" :
 211:	b9 01 00 00 00       	mov    $0x1,%ecx
void thread_spin_lock(struct thread_spinlock *lk){
 216:	89 e5                	mov    %esp,%ebp
 218:	8b 55 08             	mov    0x8(%ebp),%edx
 21b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 21f:	90                   	nop
    asm volatile("lock; xchgl %0, %1" :
 220:	89 c8                	mov    %ecx,%eax
 222:	f0 87 02             	lock xchg %eax,(%edx)
    while(xchg(&lk->lock,1)!=0);
 225:	85 c0                	test   %eax,%eax
 227:	75 f7                	jne    220 <thread_spin_lock+0x10>
    __sync_synchronize();
 229:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 22e:	5d                   	pop    %ebp
 22f:	c3                   	ret    

00000230 <thread_spin_unlock>:
void thread_spin_unlock(struct thread_spinlock *lk){
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 45 08             	mov    0x8(%ebp),%eax
    __sync_synchronize();
 236:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
    asm volatile("movl $0, %0" : "+m" (lk->lock) : );
 23b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 241:	5d                   	pop    %ebp
 242:	c3                   	ret    
 243:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000250 <thread_mutex_init>:
void thread_mutex_init(struct thread_mutex *m){
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 45 08             	mov    0x8(%ebp),%eax
    m->lock = 0;
 256:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    m->name = "null";
 25c:	c7 40 04 7b 0c 00 00 	movl   $0xc7b,0x4(%eax)
}
 263:	5d                   	pop    %ebp
 264:	c3                   	ret    
 265:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <thread_mutex_lock>:
void thread_mutex_lock(struct thread_mutex *m){
 270:	55                   	push   %ebp
    asm volatile("lock; xchgl %0, %1" :
 271:	b8 01 00 00 00       	mov    $0x1,%eax
void thread_mutex_lock(struct thread_mutex *m){
 276:	89 e5                	mov    %esp,%ebp
 278:	56                   	push   %esi
 279:	53                   	push   %ebx
 27a:	8b 5d 08             	mov    0x8(%ebp),%ebx
    asm volatile("lock; xchgl %0, %1" :
 27d:	f0 87 03             	lock xchg %eax,(%ebx)
    return result;
 280:	be 01 00 00 00       	mov    $0x1,%esi
    while(xchg(&m->lock,1)!=0){
 285:	85 c0                	test   %eax,%eax
 287:	74 1d                	je     2a6 <thread_mutex_lock+0x36>
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        sleep(1);
 290:	83 ec 0c             	sub    $0xc,%esp
 293:	6a 01                	push   $0x1
 295:	e8 49 03 00 00       	call   5e3 <sleep>
    asm volatile("lock; xchgl %0, %1" :
 29a:	89 f0                	mov    %esi,%eax
 29c:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&m->lock,1)!=0){
 29f:	83 c4 10             	add    $0x10,%esp
 2a2:	85 c0                	test   %eax,%eax
 2a4:	75 ea                	jne    290 <thread_mutex_lock+0x20>
    __sync_synchronize();
 2a6:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 2ab:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2ae:	5b                   	pop    %ebx
 2af:	5e                   	pop    %esi
 2b0:	5d                   	pop    %ebp
 2b1:	c3                   	ret    
 2b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002c0 <thread_mutex_unlock>:
void thread_mutex_unlock(struct thread_mutex *m){
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 45 08             	mov    0x8(%ebp),%eax
    __sync_synchronize();
 2c6:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
    asm volatile("movl $0, %0" : "+m" (m->lock) : );
 2cb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2d1:	5d                   	pop    %ebp
 2d2:	c3                   	ret    
 2d3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002e0 <delay>:
volatile unsigned int delay (unsigned int d){
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	8b 55 08             	mov    0x8(%ebp),%edx
    for (i = 0; i < d; i++)
 2e6:	85 d2                	test   %edx,%edx
 2e8:	74 0e                	je     2f8 <delay+0x18>
 2ea:	31 c0                	xor    %eax,%eax
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    __asm volatile( "nop" ::: );
 2f0:	90                   	nop
    for (i = 0; i < d; i++)
 2f1:	83 c0 01             	add    $0x1,%eax
 2f4:	39 c2                	cmp    %eax,%edx
 2f6:	75 f8                	jne    2f0 <delay+0x10>
}
 2f8:	89 d0                	mov    %edx,%eax
 2fa:	5d                   	pop    %ebp
 2fb:	c3                   	ret    
 2fc:	66 90                	xchg   %ax,%ax
 2fe:	66 90                	xchg   %ax,%ax

00000300 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 300:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 301:	31 c0                	xor    %eax,%eax
{
 303:	89 e5                	mov    %esp,%ebp
 305:	53                   	push   %ebx
 306:	8b 4d 08             	mov    0x8(%ebp),%ecx
 309:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 310:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 314:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 317:	83 c0 01             	add    $0x1,%eax
 31a:	84 d2                	test   %dl,%dl
 31c:	75 f2                	jne    310 <strcpy+0x10>
    ;
  return os;
}
 31e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 321:	89 c8                	mov    %ecx,%eax
 323:	c9                   	leave  
 324:	c3                   	ret    
 325:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000330 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	8b 55 08             	mov    0x8(%ebp),%edx
 337:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 33a:	0f b6 02             	movzbl (%edx),%eax
 33d:	84 c0                	test   %al,%al
 33f:	75 17                	jne    358 <strcmp+0x28>
 341:	eb 3a                	jmp    37d <strcmp+0x4d>
 343:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 347:	90                   	nop
 348:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 34c:	83 c2 01             	add    $0x1,%edx
 34f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 352:	84 c0                	test   %al,%al
 354:	74 1a                	je     370 <strcmp+0x40>
    p++, q++;
 356:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 358:	0f b6 19             	movzbl (%ecx),%ebx
 35b:	38 c3                	cmp    %al,%bl
 35d:	74 e9                	je     348 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 35f:	29 d8                	sub    %ebx,%eax
}
 361:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 364:	c9                   	leave  
 365:	c3                   	ret    
 366:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 370:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 374:	31 c0                	xor    %eax,%eax
 376:	29 d8                	sub    %ebx,%eax
}
 378:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 37b:	c9                   	leave  
 37c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 37d:	0f b6 19             	movzbl (%ecx),%ebx
 380:	31 c0                	xor    %eax,%eax
 382:	eb db                	jmp    35f <strcmp+0x2f>
 384:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 38f:	90                   	nop

00000390 <strlen>:

uint
strlen(const char *s)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 396:	80 3a 00             	cmpb   $0x0,(%edx)
 399:	74 15                	je     3b0 <strlen+0x20>
 39b:	31 c0                	xor    %eax,%eax
 39d:	8d 76 00             	lea    0x0(%esi),%esi
 3a0:	83 c0 01             	add    $0x1,%eax
 3a3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3a7:	89 c1                	mov    %eax,%ecx
 3a9:	75 f5                	jne    3a0 <strlen+0x10>
    ;
  return n;
}
 3ab:	89 c8                	mov    %ecx,%eax
 3ad:	5d                   	pop    %ebp
 3ae:	c3                   	ret    
 3af:	90                   	nop
  for(n = 0; s[n]; n++)
 3b0:	31 c9                	xor    %ecx,%ecx
}
 3b2:	5d                   	pop    %ebp
 3b3:	89 c8                	mov    %ecx,%eax
 3b5:	c3                   	ret    
 3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bd:	8d 76 00             	lea    0x0(%esi),%esi

000003c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cd:	89 d7                	mov    %edx,%edi
 3cf:	fc                   	cld    
 3d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3d2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3d5:	89 d0                	mov    %edx,%eax
 3d7:	c9                   	leave  
 3d8:	c3                   	ret    
 3d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003e0 <strchr>:

char*
strchr(const char *s, char c)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3ea:	0f b6 10             	movzbl (%eax),%edx
 3ed:	84 d2                	test   %dl,%dl
 3ef:	75 12                	jne    403 <strchr+0x23>
 3f1:	eb 1d                	jmp    410 <strchr+0x30>
 3f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3f7:	90                   	nop
 3f8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 3fc:	83 c0 01             	add    $0x1,%eax
 3ff:	84 d2                	test   %dl,%dl
 401:	74 0d                	je     410 <strchr+0x30>
    if(*s == c)
 403:	38 d1                	cmp    %dl,%cl
 405:	75 f1                	jne    3f8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 407:	5d                   	pop    %ebp
 408:	c3                   	ret    
 409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 410:	31 c0                	xor    %eax,%eax
}
 412:	5d                   	pop    %ebp
 413:	c3                   	ret    
 414:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <gets>:

char*
gets(char *buf, int max)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 425:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 428:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 429:	31 db                	xor    %ebx,%ebx
{
 42b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 42e:	eb 27                	jmp    457 <gets+0x37>
    cc = read(0, &c, 1);
 430:	83 ec 04             	sub    $0x4,%esp
 433:	6a 01                	push   $0x1
 435:	57                   	push   %edi
 436:	6a 00                	push   $0x0
 438:	e8 2e 01 00 00       	call   56b <read>
    if(cc < 1)
 43d:	83 c4 10             	add    $0x10,%esp
 440:	85 c0                	test   %eax,%eax
 442:	7e 1d                	jle    461 <gets+0x41>
      break;
    buf[i++] = c;
 444:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 448:	8b 55 08             	mov    0x8(%ebp),%edx
 44b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 44f:	3c 0a                	cmp    $0xa,%al
 451:	74 1d                	je     470 <gets+0x50>
 453:	3c 0d                	cmp    $0xd,%al
 455:	74 19                	je     470 <gets+0x50>
  for(i=0; i+1 < max; ){
 457:	89 de                	mov    %ebx,%esi
 459:	83 c3 01             	add    $0x1,%ebx
 45c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 45f:	7c cf                	jl     430 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 461:	8b 45 08             	mov    0x8(%ebp),%eax
 464:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 468:	8d 65 f4             	lea    -0xc(%ebp),%esp
 46b:	5b                   	pop    %ebx
 46c:	5e                   	pop    %esi
 46d:	5f                   	pop    %edi
 46e:	5d                   	pop    %ebp
 46f:	c3                   	ret    
  buf[i] = '\0';
 470:	8b 45 08             	mov    0x8(%ebp),%eax
 473:	89 de                	mov    %ebx,%esi
 475:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 479:	8d 65 f4             	lea    -0xc(%ebp),%esp
 47c:	5b                   	pop    %ebx
 47d:	5e                   	pop    %esi
 47e:	5f                   	pop    %edi
 47f:	5d                   	pop    %ebp
 480:	c3                   	ret    
 481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 488:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop

00000490 <stat>:

int
stat(const char *n, struct stat *st)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	56                   	push   %esi
 494:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 495:	83 ec 08             	sub    $0x8,%esp
 498:	6a 00                	push   $0x0
 49a:	ff 75 08             	push   0x8(%ebp)
 49d:	e8 f1 00 00 00       	call   593 <open>
  if(fd < 0)
 4a2:	83 c4 10             	add    $0x10,%esp
 4a5:	85 c0                	test   %eax,%eax
 4a7:	78 27                	js     4d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4a9:	83 ec 08             	sub    $0x8,%esp
 4ac:	ff 75 0c             	push   0xc(%ebp)
 4af:	89 c3                	mov    %eax,%ebx
 4b1:	50                   	push   %eax
 4b2:	e8 f4 00 00 00       	call   5ab <fstat>
  close(fd);
 4b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4ba:	89 c6                	mov    %eax,%esi
  close(fd);
 4bc:	e8 ba 00 00 00       	call   57b <close>
  return r;
 4c1:	83 c4 10             	add    $0x10,%esp
}
 4c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4c7:	89 f0                	mov    %esi,%eax
 4c9:	5b                   	pop    %ebx
 4ca:	5e                   	pop    %esi
 4cb:	5d                   	pop    %ebp
 4cc:	c3                   	ret    
 4cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 4d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4d5:	eb ed                	jmp    4c4 <stat+0x34>
 4d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4de:	66 90                	xchg   %ax,%ax

000004e0 <atoi>:

int
atoi(const char *s)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	53                   	push   %ebx
 4e4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4e7:	0f be 02             	movsbl (%edx),%eax
 4ea:	8d 48 d0             	lea    -0x30(%eax),%ecx
 4ed:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 4f0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 4f5:	77 1e                	ja     515 <atoi+0x35>
 4f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4fe:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 500:	83 c2 01             	add    $0x1,%edx
 503:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 506:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 50a:	0f be 02             	movsbl (%edx),%eax
 50d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 510:	80 fb 09             	cmp    $0x9,%bl
 513:	76 eb                	jbe    500 <atoi+0x20>
  return n;
}
 515:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 518:	89 c8                	mov    %ecx,%eax
 51a:	c9                   	leave  
 51b:	c3                   	ret    
 51c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000520 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	8b 45 10             	mov    0x10(%ebp),%eax
 527:	8b 55 08             	mov    0x8(%ebp),%edx
 52a:	56                   	push   %esi
 52b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 52e:	85 c0                	test   %eax,%eax
 530:	7e 13                	jle    545 <memmove+0x25>
 532:	01 d0                	add    %edx,%eax
  dst = vdst;
 534:	89 d7                	mov    %edx,%edi
 536:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 540:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 541:	39 f8                	cmp    %edi,%eax
 543:	75 fb                	jne    540 <memmove+0x20>
  return vdst;
}
 545:	5e                   	pop    %esi
 546:	89 d0                	mov    %edx,%eax
 548:	5f                   	pop    %edi
 549:	5d                   	pop    %ebp
 54a:	c3                   	ret    

0000054b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 54b:	b8 01 00 00 00       	mov    $0x1,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <exit>:
SYSCALL(exit)
 553:	b8 02 00 00 00       	mov    $0x2,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <wait>:
SYSCALL(wait)
 55b:	b8 03 00 00 00       	mov    $0x3,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <pipe>:
SYSCALL(pipe)
 563:	b8 04 00 00 00       	mov    $0x4,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <read>:
SYSCALL(read)
 56b:	b8 05 00 00 00       	mov    $0x5,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <write>:
SYSCALL(write)
 573:	b8 10 00 00 00       	mov    $0x10,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <close>:
SYSCALL(close)
 57b:	b8 15 00 00 00       	mov    $0x15,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <kill>:
SYSCALL(kill)
 583:	b8 06 00 00 00       	mov    $0x6,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <exec>:
SYSCALL(exec)
 58b:	b8 07 00 00 00       	mov    $0x7,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <open>:
SYSCALL(open)
 593:	b8 0f 00 00 00       	mov    $0xf,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <mknod>:
SYSCALL(mknod)
 59b:	b8 11 00 00 00       	mov    $0x11,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <unlink>:
SYSCALL(unlink)
 5a3:	b8 12 00 00 00       	mov    $0x12,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <fstat>:
SYSCALL(fstat)
 5ab:	b8 08 00 00 00       	mov    $0x8,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <link>:
SYSCALL(link)
 5b3:	b8 13 00 00 00       	mov    $0x13,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <mkdir>:
SYSCALL(mkdir)
 5bb:	b8 14 00 00 00       	mov    $0x14,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <chdir>:
SYSCALL(chdir)
 5c3:	b8 09 00 00 00       	mov    $0x9,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <dup>:
SYSCALL(dup)
 5cb:	b8 0a 00 00 00       	mov    $0xa,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <getpid>:
SYSCALL(getpid)
 5d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <sbrk>:
SYSCALL(sbrk)
 5db:	b8 0c 00 00 00       	mov    $0xc,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <sleep>:
SYSCALL(sleep)
 5e3:	b8 0d 00 00 00       	mov    $0xd,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <uptime>:
SYSCALL(uptime)
 5eb:	b8 0e 00 00 00       	mov    $0xe,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <thread_create>:
SYSCALL(thread_create)
 5f3:	b8 16 00 00 00       	mov    $0x16,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <thread_join>:
SYSCALL(thread_join)
 5fb:	b8 18 00 00 00       	mov    $0x18,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <thread_exit>:
SYSCALL(thread_exit)
 603:	b8 17 00 00 00       	mov    $0x17,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <draw>:
SYSCALL(draw)
 60b:	b8 19 00 00 00       	mov    $0x19,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <getNumProc>:
SYSCALL(getNumProc)
 613:	b8 1a 00 00 00       	mov    $0x1a,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <getMaxPid>:
SYSCALL(getMaxPid)
 61b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <getProcInfo>:
SYSCALL(getProcInfo)
 623:	b8 1c 00 00 00       	mov    $0x1c,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <set_burst_time>:
SYSCALL(set_burst_time)
 62b:	b8 1d 00 00 00       	mov    $0x1d,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <get_burst_time>:
SYSCALL(get_burst_time)
 633:	b8 1e 00 00 00       	mov    $0x1e,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <getCurrentInfo>:
SYSCALL(getCurrentInfo)
 63b:	b8 1f 00 00 00       	mov    $0x1f,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <getCurrentPID>:
SYSCALL(getCurrentPID)
 643:	b8 20 00 00 00       	mov    $0x20,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    
 64b:	66 90                	xchg   %ax,%ax
 64d:	66 90                	xchg   %ax,%ax
 64f:	90                   	nop

00000650 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 3c             	sub    $0x3c,%esp
 659:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 65c:	89 d1                	mov    %edx,%ecx
{
 65e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 661:	85 d2                	test   %edx,%edx
 663:	0f 89 7f 00 00 00    	jns    6e8 <printint+0x98>
 669:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 66d:	74 79                	je     6e8 <printint+0x98>
    neg = 1;
 66f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 676:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 678:	31 db                	xor    %ebx,%ebx
 67a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 67d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 680:	89 c8                	mov    %ecx,%eax
 682:	31 d2                	xor    %edx,%edx
 684:	89 cf                	mov    %ecx,%edi
 686:	f7 75 c4             	divl   -0x3c(%ebp)
 689:	0f b6 92 38 0d 00 00 	movzbl 0xd38(%edx),%edx
 690:	89 45 c0             	mov    %eax,-0x40(%ebp)
 693:	89 d8                	mov    %ebx,%eax
 695:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 698:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 69b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 69e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 6a1:	76 dd                	jbe    680 <printint+0x30>
  if(neg)
 6a3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 6a6:	85 c9                	test   %ecx,%ecx
 6a8:	74 0c                	je     6b6 <printint+0x66>
    buf[i++] = '-';
 6aa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 6af:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 6b1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 6b6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 6b9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 6bd:	eb 07                	jmp    6c6 <printint+0x76>
 6bf:	90                   	nop
    putc(fd, buf[i]);
 6c0:	0f b6 13             	movzbl (%ebx),%edx
 6c3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 6c6:	83 ec 04             	sub    $0x4,%esp
 6c9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 6cc:	6a 01                	push   $0x1
 6ce:	56                   	push   %esi
 6cf:	57                   	push   %edi
 6d0:	e8 9e fe ff ff       	call   573 <write>
  while(--i >= 0)
 6d5:	83 c4 10             	add    $0x10,%esp
 6d8:	39 de                	cmp    %ebx,%esi
 6da:	75 e4                	jne    6c0 <printint+0x70>
}
 6dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6df:	5b                   	pop    %ebx
 6e0:	5e                   	pop    %esi
 6e1:	5f                   	pop    %edi
 6e2:	5d                   	pop    %ebp
 6e3:	c3                   	ret    
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6e8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 6ef:	eb 87                	jmp    678 <printint+0x28>
 6f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ff:	90                   	nop

00000700 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 709:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 70c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 70f:	0f b6 13             	movzbl (%ebx),%edx
 712:	84 d2                	test   %dl,%dl
 714:	74 6a                	je     780 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 716:	8d 45 10             	lea    0x10(%ebp),%eax
 719:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 71c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 71f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 721:	89 45 d0             	mov    %eax,-0x30(%ebp)
 724:	eb 36                	jmp    75c <printf+0x5c>
 726:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 72d:	8d 76 00             	lea    0x0(%esi),%esi
 730:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 733:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 738:	83 f8 25             	cmp    $0x25,%eax
 73b:	74 15                	je     752 <printf+0x52>
  write(fd, &c, 1);
 73d:	83 ec 04             	sub    $0x4,%esp
 740:	88 55 e7             	mov    %dl,-0x19(%ebp)
 743:	6a 01                	push   $0x1
 745:	57                   	push   %edi
 746:	56                   	push   %esi
 747:	e8 27 fe ff ff       	call   573 <write>
 74c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 74f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 752:	0f b6 13             	movzbl (%ebx),%edx
 755:	83 c3 01             	add    $0x1,%ebx
 758:	84 d2                	test   %dl,%dl
 75a:	74 24                	je     780 <printf+0x80>
    c = fmt[i] & 0xff;
 75c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 75f:	85 c9                	test   %ecx,%ecx
 761:	74 cd                	je     730 <printf+0x30>
      }
    } else if(state == '%'){
 763:	83 f9 25             	cmp    $0x25,%ecx
 766:	75 ea                	jne    752 <printf+0x52>
      if(c == 'd'){
 768:	83 f8 25             	cmp    $0x25,%eax
 76b:	0f 84 07 01 00 00    	je     878 <printf+0x178>
 771:	83 e8 63             	sub    $0x63,%eax
 774:	83 f8 15             	cmp    $0x15,%eax
 777:	77 17                	ja     790 <printf+0x90>
 779:	ff 24 85 e0 0c 00 00 	jmp    *0xce0(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 780:	8d 65 f4             	lea    -0xc(%ebp),%esp
 783:	5b                   	pop    %ebx
 784:	5e                   	pop    %esi
 785:	5f                   	pop    %edi
 786:	5d                   	pop    %ebp
 787:	c3                   	ret    
 788:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78f:	90                   	nop
  write(fd, &c, 1);
 790:	83 ec 04             	sub    $0x4,%esp
 793:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 796:	6a 01                	push   $0x1
 798:	57                   	push   %edi
 799:	56                   	push   %esi
 79a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 79e:	e8 d0 fd ff ff       	call   573 <write>
        putc(fd, c);
 7a3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 7a7:	83 c4 0c             	add    $0xc,%esp
 7aa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 7ad:	6a 01                	push   $0x1
 7af:	57                   	push   %edi
 7b0:	56                   	push   %esi
 7b1:	e8 bd fd ff ff       	call   573 <write>
        putc(fd, c);
 7b6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7b9:	31 c9                	xor    %ecx,%ecx
 7bb:	eb 95                	jmp    752 <printf+0x52>
 7bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 7c0:	83 ec 0c             	sub    $0xc,%esp
 7c3:	b9 10 00 00 00       	mov    $0x10,%ecx
 7c8:	6a 00                	push   $0x0
 7ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7cd:	8b 10                	mov    (%eax),%edx
 7cf:	89 f0                	mov    %esi,%eax
 7d1:	e8 7a fe ff ff       	call   650 <printint>
        ap++;
 7d6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 7da:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7dd:	31 c9                	xor    %ecx,%ecx
 7df:	e9 6e ff ff ff       	jmp    752 <printf+0x52>
 7e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 7e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7eb:	8b 10                	mov    (%eax),%edx
        ap++;
 7ed:	83 c0 04             	add    $0x4,%eax
 7f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7f3:	85 d2                	test   %edx,%edx
 7f5:	0f 84 8d 00 00 00    	je     888 <printf+0x188>
        while(*s != 0){
 7fb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 7fe:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 800:	84 c0                	test   %al,%al
 802:	0f 84 4a ff ff ff    	je     752 <printf+0x52>
 808:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 80b:	89 d3                	mov    %edx,%ebx
 80d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 810:	83 ec 04             	sub    $0x4,%esp
          s++;
 813:	83 c3 01             	add    $0x1,%ebx
 816:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 819:	6a 01                	push   $0x1
 81b:	57                   	push   %edi
 81c:	56                   	push   %esi
 81d:	e8 51 fd ff ff       	call   573 <write>
        while(*s != 0){
 822:	0f b6 03             	movzbl (%ebx),%eax
 825:	83 c4 10             	add    $0x10,%esp
 828:	84 c0                	test   %al,%al
 82a:	75 e4                	jne    810 <printf+0x110>
      state = 0;
 82c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 82f:	31 c9                	xor    %ecx,%ecx
 831:	e9 1c ff ff ff       	jmp    752 <printf+0x52>
 836:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 840:	83 ec 0c             	sub    $0xc,%esp
 843:	b9 0a 00 00 00       	mov    $0xa,%ecx
 848:	6a 01                	push   $0x1
 84a:	e9 7b ff ff ff       	jmp    7ca <printf+0xca>
 84f:	90                   	nop
        putc(fd, *ap);
 850:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 853:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 856:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 858:	6a 01                	push   $0x1
 85a:	57                   	push   %edi
 85b:	56                   	push   %esi
        putc(fd, *ap);
 85c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 85f:	e8 0f fd ff ff       	call   573 <write>
        ap++;
 864:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 868:	83 c4 10             	add    $0x10,%esp
      state = 0;
 86b:	31 c9                	xor    %ecx,%ecx
 86d:	e9 e0 fe ff ff       	jmp    752 <printf+0x52>
 872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 878:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 87b:	83 ec 04             	sub    $0x4,%esp
 87e:	e9 2a ff ff ff       	jmp    7ad <printf+0xad>
 883:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 887:	90                   	nop
          s = "(null)";
 888:	ba d9 0c 00 00       	mov    $0xcd9,%edx
        while(*s != 0){
 88d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 890:	b8 28 00 00 00       	mov    $0x28,%eax
 895:	89 d3                	mov    %edx,%ebx
 897:	e9 74 ff ff ff       	jmp    810 <printf+0x110>
 89c:	66 90                	xchg   %ax,%ax
 89e:	66 90                	xchg   %ax,%ax

000008a0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a1:	a1 ac 11 00 00       	mov    0x11ac,%eax
{
 8a6:	89 e5                	mov    %esp,%ebp
 8a8:	57                   	push   %edi
 8a9:	56                   	push   %esi
 8aa:	53                   	push   %ebx
 8ab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 8ae:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8b8:	89 c2                	mov    %eax,%edx
 8ba:	8b 00                	mov    (%eax),%eax
 8bc:	39 ca                	cmp    %ecx,%edx
 8be:	73 30                	jae    8f0 <free+0x50>
 8c0:	39 c1                	cmp    %eax,%ecx
 8c2:	72 04                	jb     8c8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c4:	39 c2                	cmp    %eax,%edx
 8c6:	72 f0                	jb     8b8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8c8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8cb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8ce:	39 f8                	cmp    %edi,%eax
 8d0:	74 30                	je     902 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 8d2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 8d5:	8b 42 04             	mov    0x4(%edx),%eax
 8d8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 8db:	39 f1                	cmp    %esi,%ecx
 8dd:	74 3a                	je     919 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 8df:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 8e1:	5b                   	pop    %ebx
  freep = p;
 8e2:	89 15 ac 11 00 00    	mov    %edx,0x11ac
}
 8e8:	5e                   	pop    %esi
 8e9:	5f                   	pop    %edi
 8ea:	5d                   	pop    %ebp
 8eb:	c3                   	ret    
 8ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8f0:	39 c2                	cmp    %eax,%edx
 8f2:	72 c4                	jb     8b8 <free+0x18>
 8f4:	39 c1                	cmp    %eax,%ecx
 8f6:	73 c0                	jae    8b8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 8f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8fe:	39 f8                	cmp    %edi,%eax
 900:	75 d0                	jne    8d2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 902:	03 70 04             	add    0x4(%eax),%esi
 905:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 908:	8b 02                	mov    (%edx),%eax
 90a:	8b 00                	mov    (%eax),%eax
 90c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 90f:	8b 42 04             	mov    0x4(%edx),%eax
 912:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 915:	39 f1                	cmp    %esi,%ecx
 917:	75 c6                	jne    8df <free+0x3f>
    p->s.size += bp->s.size;
 919:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 91c:	89 15 ac 11 00 00    	mov    %edx,0x11ac
    p->s.size += bp->s.size;
 922:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 925:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 928:	89 0a                	mov    %ecx,(%edx)
}
 92a:	5b                   	pop    %ebx
 92b:	5e                   	pop    %esi
 92c:	5f                   	pop    %edi
 92d:	5d                   	pop    %ebp
 92e:	c3                   	ret    
 92f:	90                   	nop

00000930 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
 933:	57                   	push   %edi
 934:	56                   	push   %esi
 935:	53                   	push   %ebx
 936:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 939:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 93c:	8b 3d ac 11 00 00    	mov    0x11ac,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 942:	8d 70 07             	lea    0x7(%eax),%esi
 945:	c1 ee 03             	shr    $0x3,%esi
 948:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 94b:	85 ff                	test   %edi,%edi
 94d:	0f 84 9d 00 00 00    	je     9f0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 953:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 955:	8b 4a 04             	mov    0x4(%edx),%ecx
 958:	39 f1                	cmp    %esi,%ecx
 95a:	73 6a                	jae    9c6 <malloc+0x96>
 95c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 961:	39 de                	cmp    %ebx,%esi
 963:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 966:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 96d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 970:	eb 17                	jmp    989 <malloc+0x59>
 972:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 978:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 97a:	8b 48 04             	mov    0x4(%eax),%ecx
 97d:	39 f1                	cmp    %esi,%ecx
 97f:	73 4f                	jae    9d0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 981:	8b 3d ac 11 00 00    	mov    0x11ac,%edi
 987:	89 c2                	mov    %eax,%edx
 989:	39 d7                	cmp    %edx,%edi
 98b:	75 eb                	jne    978 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 98d:	83 ec 0c             	sub    $0xc,%esp
 990:	ff 75 e4             	push   -0x1c(%ebp)
 993:	e8 43 fc ff ff       	call   5db <sbrk>
  if(p == (char*)-1)
 998:	83 c4 10             	add    $0x10,%esp
 99b:	83 f8 ff             	cmp    $0xffffffff,%eax
 99e:	74 1c                	je     9bc <malloc+0x8c>
  hp->s.size = nu;
 9a0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9a3:	83 ec 0c             	sub    $0xc,%esp
 9a6:	83 c0 08             	add    $0x8,%eax
 9a9:	50                   	push   %eax
 9aa:	e8 f1 fe ff ff       	call   8a0 <free>
  return freep;
 9af:	8b 15 ac 11 00 00    	mov    0x11ac,%edx
      if((p = morecore(nunits)) == 0)
 9b5:	83 c4 10             	add    $0x10,%esp
 9b8:	85 d2                	test   %edx,%edx
 9ba:	75 bc                	jne    978 <malloc+0x48>
        return 0;
  }
}
 9bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9bf:	31 c0                	xor    %eax,%eax
}
 9c1:	5b                   	pop    %ebx
 9c2:	5e                   	pop    %esi
 9c3:	5f                   	pop    %edi
 9c4:	5d                   	pop    %ebp
 9c5:	c3                   	ret    
    if(p->s.size >= nunits){
 9c6:	89 d0                	mov    %edx,%eax
 9c8:	89 fa                	mov    %edi,%edx
 9ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 9d0:	39 ce                	cmp    %ecx,%esi
 9d2:	74 4c                	je     a20 <malloc+0xf0>
        p->s.size -= nunits;
 9d4:	29 f1                	sub    %esi,%ecx
 9d6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9dc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 9df:	89 15 ac 11 00 00    	mov    %edx,0x11ac
}
 9e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 9e8:	83 c0 08             	add    $0x8,%eax
}
 9eb:	5b                   	pop    %ebx
 9ec:	5e                   	pop    %esi
 9ed:	5f                   	pop    %edi
 9ee:	5d                   	pop    %ebp
 9ef:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 9f0:	c7 05 ac 11 00 00 b0 	movl   $0x11b0,0x11ac
 9f7:	11 00 00 
    base.s.size = 0;
 9fa:	bf b0 11 00 00       	mov    $0x11b0,%edi
    base.s.ptr = freep = prevp = &base;
 9ff:	c7 05 b0 11 00 00 b0 	movl   $0x11b0,0x11b0
 a06:	11 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a09:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 a0b:	c7 05 b4 11 00 00 00 	movl   $0x0,0x11b4
 a12:	00 00 00 
    if(p->s.size >= nunits){
 a15:	e9 42 ff ff ff       	jmp    95c <malloc+0x2c>
 a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 a20:	8b 08                	mov    (%eax),%ecx
 a22:	89 0a                	mov    %ecx,(%edx)
 a24:	eb b9                	jmp    9df <malloc+0xaf>
 a26:	66 90                	xchg   %ax,%ax
 a28:	66 90                	xchg   %ax,%ax
 a2a:	66 90                	xchg   %ax,%ax
 a2c:	66 90                	xchg   %ax,%ax
 a2e:	66 90                	xchg   %ax,%ax

00000a30 <sgenrand>:
static int mti=N+1; /* mti==N+1 means mt[N] is not initialized */

/* initializing the array with a NONZERO seed */
void
sgenrand(unsigned long seed)
{
 a30:	55                   	push   %ebp
 a31:	b8 c4 11 00 00       	mov    $0x11c4,%eax
 a36:	89 e5                	mov    %esp,%ebp
 a38:	8b 55 08             	mov    0x8(%ebp),%edx
    /* setting initial seeds to mt[N] using         */
    /* the generator Line 25 of Table 1 in          */
    /* [KNUTH 1981, The Art of Computer Programming */
    /*    Vol. 2 (2nd Ed.), pp102]                  */
    mt[0]= seed & 0xffffffff;
 a3b:	89 15 c0 11 00 00    	mov    %edx,0x11c0
    for (mti=1; mti<N; mti++)
 a41:	eb 08                	jmp    a4b <sgenrand+0x1b>
 a43:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a47:	90                   	nop
 a48:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 a4b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 a51:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 a53:	3d 7c 1b 00 00       	cmp    $0x1b7c,%eax
 a58:	75 ee                	jne    a48 <sgenrand+0x18>
 a5a:	c7 05 94 11 00 00 70 	movl   $0x270,0x1194
 a61:	02 00 00 
}
 a64:	5d                   	pop    %ebp
 a65:	c3                   	ret    
 a66:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a6d:	8d 76 00             	lea    0x0(%esi),%esi

00000a70 <genrand>:
{
    unsigned long y;
    static unsigned long mag01[2]={0x0, MATRIX_A};
    /* mag01[x] = x * MATRIX_A  for x=0,1 */

    if (mti >= N) { /* generate N words at one time */
 a70:	a1 94 11 00 00       	mov    0x1194,%eax
 a75:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 a7a:	7f 3d                	jg     ab9 <genrand+0x49>
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];

        mti = 0;
    }
  
    y = mt[mti++];
 a7c:	8b 0c 85 c0 11 00 00 	mov    0x11c0(,%eax,4),%ecx
 a83:	8d 50 01             	lea    0x1(%eax),%edx
 a86:	89 15 94 11 00 00    	mov    %edx,0x1194
    y ^= TEMPERING_SHIFT_U(y);
 a8c:	89 ca                	mov    %ecx,%edx
 a8e:	c1 ea 0b             	shr    $0xb,%edx
 a91:	31 ca                	xor    %ecx,%edx
    y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
 a93:	89 d0                	mov    %edx,%eax
 a95:	c1 e0 07             	shl    $0x7,%eax
 a98:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
 a9d:	31 d0                	xor    %edx,%eax
    y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
 a9f:	89 c2                	mov    %eax,%edx
 aa1:	c1 e2 0f             	shl    $0xf,%edx
 aa4:	81 e2 00 00 c6 ef    	and    $0xefc60000,%edx
 aaa:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_L(y);
 aac:	89 d0                	mov    %edx,%eax
 aae:	c1 e8 12             	shr    $0x12,%eax
 ab1:	31 d0                	xor    %edx,%eax

    // Strip off uppermost bit because we want a long,
    // not an unsigned long
    return y & RAND_MAX;
 ab3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
 ab8:	c3                   	ret    
        if (mti == N+1)   /* if sgenrand() has not been called, */
 ab9:	3d 71 02 00 00       	cmp    $0x271,%eax
 abe:	0f 84 d4 00 00 00    	je     b98 <genrand+0x128>
    mt[0]= seed & 0xffffffff;
 ac4:	31 c0                	xor    %eax,%eax
 ac6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 acd:	8d 76 00             	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 ad0:	8b 0c 85 c0 11 00 00 	mov    0x11c0(,%eax,4),%ecx
 ad7:	83 c0 01             	add    $0x1,%eax
 ada:	8b 14 85 c0 11 00 00 	mov    0x11c0(,%eax,4),%edx
 ae1:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 ae7:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 aed:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1];
 aef:	89 d1                	mov    %edx,%ecx
 af1:	83 e2 01             	and    $0x1,%edx
 af4:	d1 e9                	shr    %ecx
 af6:	33 0c 85 f0 17 00 00 	xor    0x17f0(,%eax,4),%ecx
 afd:	33 0c 95 4c 0d 00 00 	xor    0xd4c(,%edx,4),%ecx
 b04:	89 0c 85 bc 11 00 00 	mov    %ecx,0x11bc(,%eax,4)
        for (kk=0;kk<N-M;kk++) {
 b0b:	3d e3 00 00 00       	cmp    $0xe3,%eax
 b10:	75 be                	jne    ad0 <genrand+0x60>
 b12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 b18:	8b 0c 85 c0 11 00 00 	mov    0x11c0(,%eax,4),%ecx
 b1f:	83 c0 01             	add    $0x1,%eax
 b22:	8b 14 85 c0 11 00 00 	mov    0x11c0(,%eax,4),%edx
 b29:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 b2f:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 b35:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1];
 b37:	89 d1                	mov    %edx,%ecx
 b39:	83 e2 01             	and    $0x1,%edx
 b3c:	d1 e9                	shr    %ecx
 b3e:	33 0c 85 30 0e 00 00 	xor    0xe30(,%eax,4),%ecx
 b45:	33 0c 95 4c 0d 00 00 	xor    0xd4c(,%edx,4),%ecx
 b4c:	89 0c 85 bc 11 00 00 	mov    %ecx,0x11bc(,%eax,4)
        for (;kk<N-1;kk++) {
 b53:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 b58:	75 be                	jne    b18 <genrand+0xa8>
        y = (mt[N-1]&UPPER_MASK)|(mt[0]&LOWER_MASK);
 b5a:	8b 0d c0 11 00 00    	mov    0x11c0,%ecx
 b60:	a1 7c 1b 00 00       	mov    0x1b7c,%eax
 b65:	89 ca                	mov    %ecx,%edx
 b67:	25 00 00 00 80       	and    $0x80000000,%eax
 b6c:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 b72:	09 d0                	or     %edx,%eax
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];
 b74:	89 c2                	mov    %eax,%edx
 b76:	83 e0 01             	and    $0x1,%eax
 b79:	d1 ea                	shr    %edx
 b7b:	33 15 f0 17 00 00    	xor    0x17f0,%edx
 b81:	33 14 85 4c 0d 00 00 	xor    0xd4c(,%eax,4),%edx
 b88:	89 15 7c 1b 00 00    	mov    %edx,0x1b7c
 b8e:	ba 01 00 00 00       	mov    $0x1,%edx
 b93:	e9 ee fe ff ff       	jmp    a86 <genrand+0x16>
    mt[0]= seed & 0xffffffff;
 b98:	b8 c4 11 00 00       	mov    $0x11c4,%eax
 b9d:	b9 7c 1b 00 00       	mov    $0x1b7c,%ecx
 ba2:	ba 05 11 00 00       	mov    $0x1105,%edx
 ba7:	c7 05 c0 11 00 00 05 	movl   $0x1105,0x11c0
 bae:	11 00 00 
    for (mti=1; mti<N; mti++)
 bb1:	eb 08                	jmp    bbb <genrand+0x14b>
 bb3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 bb7:	90                   	nop
 bb8:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 bbb:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 bc1:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 bc3:	39 c1                	cmp    %eax,%ecx
 bc5:	75 f1                	jne    bb8 <genrand+0x148>
 bc7:	e9 f8 fe ff ff       	jmp    ac4 <genrand+0x54>
 bcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000bd0 <random_at_most>:

// Assumes 0 <= max <= RAND_MAX
// Returns in the half-open interval [0, max]
long random_at_most(long max) {
 bd0:	55                   	push   %ebp
  unsigned long
    // max <= RAND_MAX < ULONG_MAX, so this is okay.
    num_bins = (unsigned long) max + 1,
    num_rand = (unsigned long) RAND_MAX + 1,
    bin_size = num_rand / num_bins,
 bd1:	31 d2                	xor    %edx,%edx
long random_at_most(long max) {
 bd3:	89 e5                	mov    %esp,%ebp
 bd5:	56                   	push   %esi
    num_bins = (unsigned long) max + 1,
 bd6:	8b 45 08             	mov    0x8(%ebp),%eax
long random_at_most(long max) {
 bd9:	53                   	push   %ebx
    bin_size = num_rand / num_bins,
 bda:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    num_bins = (unsigned long) max + 1,
 bdf:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 be2:	89 d8                	mov    %ebx,%eax
 be4:	f7 f1                	div    %ecx
 be6:	89 c6                	mov    %eax,%esi
  long x;
  do {
   x = genrand();
  }
  // This is carefully written not to overflow
  while (num_rand - defect <= (unsigned long)x);
 be8:	29 d3                	sub    %edx,%ebx
 bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   x = genrand();
 bf0:	e8 7b fe ff ff       	call   a70 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 bf5:	39 d8                	cmp    %ebx,%eax
 bf7:	73 f7                	jae    bf0 <random_at_most+0x20>

  // Truncated division is intentional
  return x/bin_size;
 bf9:	31 d2                	xor    %edx,%edx
}
 bfb:	5b                   	pop    %ebx
  return x/bin_size;
 bfc:	f7 f6                	div    %esi
}
 bfe:	5e                   	pop    %esi
 bff:	5d                   	pop    %ebp
 c00:	c3                   	ret    
 c01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c08:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 c0f:	90                   	nop

00000c10 <randomrange>:

int randomrange(int low, int high){
 c10:	55                   	push   %ebp
 c11:	89 e5                	mov    %esp,%ebp
 c13:	57                   	push   %edi
 c14:	56                   	push   %esi
 c15:	53                   	push   %ebx
 c16:	83 ec 0c             	sub    $0xc,%esp
 c19:	8b 75 08             	mov    0x8(%ebp),%esi
 c1c:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(high<low){
 c1f:	39 f0                	cmp    %esi,%eax
 c21:	7d 06                	jge    c29 <randomrange+0x19>
 c23:	89 f2                	mov    %esi,%edx
 c25:	89 c6                	mov    %eax,%esi
 c27:	89 d0                	mov    %edx,%eax
    int temp=high;
    high=low;
    low=temp;
  }
  int val = random_at_most(high-low) + low;
 c29:	29 f0                	sub    %esi,%eax
    bin_size = num_rand / num_bins,
 c2b:	bb 00 00 00 80       	mov    $0x80000000,%ebx
 c30:	31 d2                	xor    %edx,%edx
    num_bins = (unsigned long) max + 1,
 c32:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 c35:	89 d8                	mov    %ebx,%eax
 c37:	f7 f1                	div    %ecx
 c39:	89 c7                	mov    %eax,%edi
  while (num_rand - defect <= (unsigned long)x);
 c3b:	29 d3                	sub    %edx,%ebx
 c3d:	8d 76 00             	lea    0x0(%esi),%esi
   x = genrand();
 c40:	e8 2b fe ff ff       	call   a70 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 c45:	39 d8                	cmp    %ebx,%eax
 c47:	73 f7                	jae    c40 <randomrange+0x30>
  return x/bin_size;
 c49:	31 d2                	xor    %edx,%edx
  return val;
}
 c4b:	83 c4 0c             	add    $0xc,%esp
  return x/bin_size;
 c4e:	f7 f7                	div    %edi
}
 c50:	5b                   	pop    %ebx
  int val = random_at_most(high-low) + low;
 c51:	01 f0                	add    %esi,%eax
}
 c53:	5e                   	pop    %esi
 c54:	5f                   	pop    %edi
 c55:	5d                   	pop    %ebp
 c56:	c3                   	ret    
