
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
    lk->lock = 0;
  20:	c7 05 78 0e 00 00 00 	movl   $0x0,0xe78
  27:	00 00 00 
    lk->name = "null";
  2a:	c7 05 7c 0e 00 00 0b 	movl   $0xa0b,0xe7c
  31:	0a 00 00 
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
  ab:	e8 40 08 00 00       	call   8f0 <malloc>
    s2 = malloc(4096);
  b0:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    s1 = malloc(4096);
  b7:	89 c3                	mov    %eax,%ebx
    s2 = malloc(4096);
  b9:	e8 32 08 00 00       	call   8f0 <malloc>

    t1 = thread_create(do_work, (void*)&b1, s1);
  be:	83 c4 0c             	add    $0xc,%esp
    s2 = malloc(4096);
  c1:	89 c6                	mov    %eax,%esi
    t1 = thread_create(do_work, (void*)&b1, s1);
  c3:	8d 45 a0             	lea    -0x60(%ebp),%eax
  c6:	53                   	push   %ebx
  c7:	50                   	push   %eax
  c8:	68 20 01 00 00       	push   $0x120
  cd:	e8 11 05 00 00       	call   5e3 <thread_create>
    t2 = thread_create(do_work, (void*)&b2, s2);
  d2:	83 c4 0c             	add    $0xc,%esp
    t1 = thread_create(do_work, (void*)&b1, s1);
  d5:	89 c3                	mov    %eax,%ebx
    t2 = thread_create(do_work, (void*)&b2, s2);
  d7:	8d 45 c4             	lea    -0x3c(%ebp),%eax
  da:	56                   	push   %esi
  db:	50                   	push   %eax
  dc:	68 20 01 00 00       	push   $0x120
  e1:	e8 fd 04 00 00       	call   5e3 <thread_create>
  e6:	89 c7                	mov    %eax,%edi

    r1 = thread_join();
  e8:	e8 fe 04 00 00       	call   5eb <thread_join>
  ed:	89 c6                	mov    %eax,%esi
    r2 = thread_join();
  ef:	e8 f7 04 00 00       	call   5eb <thread_join>

    printf(1, "Threads finished: (%d):%d, (%d):%d, shared balance:%d\n",
  f4:	8b 15 74 0e 00 00    	mov    0xe74,%edx
  fa:	83 c4 0c             	add    $0xc,%esp
  fd:	52                   	push   %edx
  fe:	50                   	push   %eax
  ff:	57                   	push   %edi
 100:	56                   	push   %esi
 101:	53                   	push   %ebx
 102:	68 10 0a 00 00       	push   $0xa10
 107:	6a 01                	push   $0x1
 109:	e8 b2 05 00 00       	call   6c0 <printf>
    t1, r1, t2, r2, total_balance);
    exit();
 10e:	83 c4 20             	add    $0x20,%esp
 111:	e8 2d 04 00 00       	call   543 <exit>
 116:	66 90                	xchg   %ax,%ax
 118:	66 90                	xchg   %ax,%ax
 11a:	66 90                	xchg   %ax,%ax
 11c:	66 90                	xchg   %ax,%ax
 11e:	66 90                	xchg   %ax,%ax

00000120 <do_work>:
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	56                   	push   %esi
 125:	31 f6                	xor    %esi,%esi
 127:	53                   	push   %ebx
 128:	bb 01 00 00 00       	mov    $0x1,%ebx
 12d:	83 ec 10             	sub    $0x10,%esp
 130:	8b 7d 08             	mov    0x8(%ebp),%edi
    printf(1, "Starting do_work: s:%s\n", b->name);
 133:	57                   	push   %edi
 134:	68 e8 09 00 00       	push   $0x9e8
 139:	6a 01                	push   $0x1
 13b:	e8 80 05 00 00       	call   6c0 <printf>
    for (i = 0; i < b->amount; i++){
 140:	8b 47 20             	mov    0x20(%edi),%eax
 143:	83 c4 10             	add    $0x10,%esp
 146:	85 c0                	test   %eax,%eax
 148:	7e 6b                	jle    1b5 <do_work+0x95>
 14a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    asm volatile("lock; xchgl %0, %1" :
 150:	89 d8                	mov    %ebx,%eax
 152:	f0 87 05 78 0e 00 00 	lock xchg %eax,0xe78
    while(xchg(&lk->lock,1)!=0){
 159:	85 c0                	test   %eax,%eax
 15b:	74 1d                	je     17a <do_work+0x5a>
 15d:	8d 76 00             	lea    0x0(%esi),%esi
        sleep(1);
 160:	83 ec 0c             	sub    $0xc,%esp
 163:	6a 01                	push   $0x1
 165:	e8 69 04 00 00       	call   5d3 <sleep>
    asm volatile("lock; xchgl %0, %1" :
 16a:	89 d8                	mov    %ebx,%eax
 16c:	f0 87 05 78 0e 00 00 	lock xchg %eax,0xe78
    while(xchg(&lk->lock,1)!=0){
 173:	83 c4 10             	add    $0x10,%esp
 176:	85 c0                	test   %eax,%eax
 178:	75 e6                	jne    160 <do_work+0x40>
    __sync_synchronize();
 17a:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
        old = total_balance;
 17f:	b8 a0 86 01 00       	mov    $0x186a0,%eax
 184:	8b 15 74 0e 00 00    	mov    0xe74,%edx
    for (i = 0; i < d; i++)
 18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    __asm volatile( "nop" ::: );
 190:	90                   	nop
    for (i = 0; i < d; i++)
 191:	83 e8 01             	sub    $0x1,%eax
 194:	75 fa                	jne    190 <do_work+0x70>
        total_balance = old + 1;
 196:	8d 42 01             	lea    0x1(%edx),%eax
 199:	a3 74 0e 00 00       	mov    %eax,0xe74
    __sync_synchronize();
 19e:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
    asm volatile("movl $0, %0" : "+m" (lk->lock) : );
 1a3:	c7 05 78 0e 00 00 00 	movl   $0x0,0xe78
 1aa:	00 00 00 
    for (i = 0; i < b->amount; i++){
 1ad:	83 c6 01             	add    $0x1,%esi
 1b0:	39 77 20             	cmp    %esi,0x20(%edi)
 1b3:	7f 9b                	jg     150 <do_work+0x30>
    printf(1, "Done s:%x\n", b->name);
 1b5:	83 ec 04             	sub    $0x4,%esp
 1b8:	57                   	push   %edi
 1b9:	68 00 0a 00 00       	push   $0xa00
 1be:	6a 01                	push   $0x1
 1c0:	e8 fb 04 00 00       	call   6c0 <printf>
    thread_exit();
 1c5:	83 c4 10             	add    $0x10,%esp
}
 1c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cb:	5b                   	pop    %ebx
 1cc:	5e                   	pop    %esi
 1cd:	5f                   	pop    %edi
 1ce:	5d                   	pop    %ebp
    thread_exit();
 1cf:	e9 1f 04 00 00       	jmp    5f3 <thread_exit>
 1d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1df:	90                   	nop

000001e0 <thread_spin_init>:
void thread_spin_init(struct thread_spinlock *lk){
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
    lk->lock = 0;
 1e6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    lk->name = "null";
 1ec:	c7 40 04 0b 0a 00 00 	movl   $0xa0b,0x4(%eax)
}
 1f3:	5d                   	pop    %ebp
 1f4:	c3                   	ret    
 1f5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000200 <thread_spin_lock>:
void thread_spin_lock(struct thread_spinlock *lk){
 200:	55                   	push   %ebp
    asm volatile("lock; xchgl %0, %1" :
 201:	b9 01 00 00 00       	mov    $0x1,%ecx
void thread_spin_lock(struct thread_spinlock *lk){
 206:	89 e5                	mov    %esp,%ebp
 208:	8b 55 08             	mov    0x8(%ebp),%edx
 20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop
    asm volatile("lock; xchgl %0, %1" :
 210:	89 c8                	mov    %ecx,%eax
 212:	f0 87 02             	lock xchg %eax,(%edx)
    while(xchg(&lk->lock,1)!=0);
 215:	85 c0                	test   %eax,%eax
 217:	75 f7                	jne    210 <thread_spin_lock+0x10>
    __sync_synchronize();
 219:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 21e:	5d                   	pop    %ebp
 21f:	c3                   	ret    

00000220 <thread_spin_unlock>:
void thread_spin_unlock(struct thread_spinlock *lk){
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 45 08             	mov    0x8(%ebp),%eax
    __sync_synchronize();
 226:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
    asm volatile("movl $0, %0" : "+m" (lk->lock) : );
 22b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 231:	5d                   	pop    %ebp
 232:	c3                   	ret    
 233:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000240 <thread_mutex_init>:
void thread_mutex_init(struct thread_mutex *lk){
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 45 08             	mov    0x8(%ebp),%eax
    lk->lock = 0;
 246:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    lk->name = "null";
 24c:	c7 40 04 0b 0a 00 00 	movl   $0xa0b,0x4(%eax)
}
 253:	5d                   	pop    %ebp
 254:	c3                   	ret    
 255:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000260 <thread_mutex_lock>:
void thread_mutex_lock(struct thread_mutex *lk){
 260:	55                   	push   %ebp
    asm volatile("lock; xchgl %0, %1" :
 261:	b8 01 00 00 00       	mov    $0x1,%eax
void thread_mutex_lock(struct thread_mutex *lk){
 266:	89 e5                	mov    %esp,%ebp
 268:	56                   	push   %esi
 269:	53                   	push   %ebx
 26a:	8b 5d 08             	mov    0x8(%ebp),%ebx
    asm volatile("lock; xchgl %0, %1" :
 26d:	f0 87 03             	lock xchg %eax,(%ebx)
    return result;
 270:	be 01 00 00 00       	mov    $0x1,%esi
    while(xchg(&lk->lock,1)!=0){
 275:	85 c0                	test   %eax,%eax
 277:	74 1d                	je     296 <thread_mutex_lock+0x36>
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        sleep(1);
 280:	83 ec 0c             	sub    $0xc,%esp
 283:	6a 01                	push   $0x1
 285:	e8 49 03 00 00       	call   5d3 <sleep>
    asm volatile("lock; xchgl %0, %1" :
 28a:	89 f0                	mov    %esi,%eax
 28c:	f0 87 03             	lock xchg %eax,(%ebx)
    while(xchg(&lk->lock,1)!=0){
 28f:	83 c4 10             	add    $0x10,%esp
 292:	85 c0                	test   %eax,%eax
 294:	75 ea                	jne    280 <thread_mutex_lock+0x20>
    __sync_synchronize();
 296:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
}
 29b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 29e:	5b                   	pop    %ebx
 29f:	5e                   	pop    %esi
 2a0:	5d                   	pop    %ebp
 2a1:	c3                   	ret    
 2a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002b0 <thread_mutex_unlock>:
void thread_mutex_unlock(struct thread_mutex *lk){
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
    __sync_synchronize();
 2b6:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
    asm volatile("movl $0, %0" : "+m" (lk->lock) : );
 2bb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 2c1:	5d                   	pop    %ebp
 2c2:	c3                   	ret    
 2c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002d0 <delay>:
volatile unsigned int delay (unsigned int d){
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	8b 55 08             	mov    0x8(%ebp),%edx
    for (i = 0; i < d; i++)
 2d6:	85 d2                	test   %edx,%edx
 2d8:	74 0e                	je     2e8 <delay+0x18>
 2da:	31 c0                	xor    %eax,%eax
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    __asm volatile( "nop" ::: );
 2e0:	90                   	nop
    for (i = 0; i < d; i++)
 2e1:	83 c0 01             	add    $0x1,%eax
 2e4:	39 c2                	cmp    %eax,%edx
 2e6:	75 f8                	jne    2e0 <delay+0x10>
}
 2e8:	89 d0                	mov    %edx,%eax
 2ea:	5d                   	pop    %ebp
 2eb:	c3                   	ret    
 2ec:	66 90                	xchg   %ax,%ax
 2ee:	66 90                	xchg   %ax,%ax

000002f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 2f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2f1:	31 c0                	xor    %eax,%eax
{
 2f3:	89 e5                	mov    %esp,%ebp
 2f5:	53                   	push   %ebx
 2f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 300:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 304:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 307:	83 c0 01             	add    $0x1,%eax
 30a:	84 d2                	test   %dl,%dl
 30c:	75 f2                	jne    300 <strcpy+0x10>
    ;
  return os;
}
 30e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 311:	89 c8                	mov    %ecx,%eax
 313:	c9                   	leave  
 314:	c3                   	ret    
 315:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000320 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 55 08             	mov    0x8(%ebp),%edx
 327:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 32a:	0f b6 02             	movzbl (%edx),%eax
 32d:	84 c0                	test   %al,%al
 32f:	75 17                	jne    348 <strcmp+0x28>
 331:	eb 3a                	jmp    36d <strcmp+0x4d>
 333:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 337:	90                   	nop
 338:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 33c:	83 c2 01             	add    $0x1,%edx
 33f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 342:	84 c0                	test   %al,%al
 344:	74 1a                	je     360 <strcmp+0x40>
    p++, q++;
 346:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 348:	0f b6 19             	movzbl (%ecx),%ebx
 34b:	38 c3                	cmp    %al,%bl
 34d:	74 e9                	je     338 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 34f:	29 d8                	sub    %ebx,%eax
}
 351:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 354:	c9                   	leave  
 355:	c3                   	ret    
 356:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 360:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 364:	31 c0                	xor    %eax,%eax
 366:	29 d8                	sub    %ebx,%eax
}
 368:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 36b:	c9                   	leave  
 36c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 36d:	0f b6 19             	movzbl (%ecx),%ebx
 370:	31 c0                	xor    %eax,%eax
 372:	eb db                	jmp    34f <strcmp+0x2f>
 374:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 37f:	90                   	nop

00000380 <strlen>:

uint
strlen(const char *s)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 386:	80 3a 00             	cmpb   $0x0,(%edx)
 389:	74 15                	je     3a0 <strlen+0x20>
 38b:	31 c0                	xor    %eax,%eax
 38d:	8d 76 00             	lea    0x0(%esi),%esi
 390:	83 c0 01             	add    $0x1,%eax
 393:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 397:	89 c1                	mov    %eax,%ecx
 399:	75 f5                	jne    390 <strlen+0x10>
    ;
  return n;
}
 39b:	89 c8                	mov    %ecx,%eax
 39d:	5d                   	pop    %ebp
 39e:	c3                   	ret    
 39f:	90                   	nop
  for(n = 0; s[n]; n++)
 3a0:	31 c9                	xor    %ecx,%ecx
}
 3a2:	5d                   	pop    %ebp
 3a3:	89 c8                	mov    %ecx,%eax
 3a5:	c3                   	ret    
 3a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ad:	8d 76 00             	lea    0x0(%esi),%esi

000003b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bd:	89 d7                	mov    %edx,%edi
 3bf:	fc                   	cld    
 3c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3c5:	89 d0                	mov    %edx,%eax
 3c7:	c9                   	leave  
 3c8:	c3                   	ret    
 3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003d0 <strchr>:

char*
strchr(const char *s, char c)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
 3d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3da:	0f b6 10             	movzbl (%eax),%edx
 3dd:	84 d2                	test   %dl,%dl
 3df:	75 12                	jne    3f3 <strchr+0x23>
 3e1:	eb 1d                	jmp    400 <strchr+0x30>
 3e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3e7:	90                   	nop
 3e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 3ec:	83 c0 01             	add    $0x1,%eax
 3ef:	84 d2                	test   %dl,%dl
 3f1:	74 0d                	je     400 <strchr+0x30>
    if(*s == c)
 3f3:	38 d1                	cmp    %dl,%cl
 3f5:	75 f1                	jne    3e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 3f7:	5d                   	pop    %ebp
 3f8:	c3                   	ret    
 3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 400:	31 c0                	xor    %eax,%eax
}
 402:	5d                   	pop    %ebp
 403:	c3                   	ret    
 404:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 40f:	90                   	nop

00000410 <gets>:

char*
gets(char *buf, int max)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 415:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 418:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 419:	31 db                	xor    %ebx,%ebx
{
 41b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 41e:	eb 27                	jmp    447 <gets+0x37>
    cc = read(0, &c, 1);
 420:	83 ec 04             	sub    $0x4,%esp
 423:	6a 01                	push   $0x1
 425:	57                   	push   %edi
 426:	6a 00                	push   $0x0
 428:	e8 2e 01 00 00       	call   55b <read>
    if(cc < 1)
 42d:	83 c4 10             	add    $0x10,%esp
 430:	85 c0                	test   %eax,%eax
 432:	7e 1d                	jle    451 <gets+0x41>
      break;
    buf[i++] = c;
 434:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 438:	8b 55 08             	mov    0x8(%ebp),%edx
 43b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 43f:	3c 0a                	cmp    $0xa,%al
 441:	74 1d                	je     460 <gets+0x50>
 443:	3c 0d                	cmp    $0xd,%al
 445:	74 19                	je     460 <gets+0x50>
  for(i=0; i+1 < max; ){
 447:	89 de                	mov    %ebx,%esi
 449:	83 c3 01             	add    $0x1,%ebx
 44c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 44f:	7c cf                	jl     420 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 451:	8b 45 08             	mov    0x8(%ebp),%eax
 454:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 458:	8d 65 f4             	lea    -0xc(%ebp),%esp
 45b:	5b                   	pop    %ebx
 45c:	5e                   	pop    %esi
 45d:	5f                   	pop    %edi
 45e:	5d                   	pop    %ebp
 45f:	c3                   	ret    
  buf[i] = '\0';
 460:	8b 45 08             	mov    0x8(%ebp),%eax
 463:	89 de                	mov    %ebx,%esi
 465:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 469:	8d 65 f4             	lea    -0xc(%ebp),%esp
 46c:	5b                   	pop    %ebx
 46d:	5e                   	pop    %esi
 46e:	5f                   	pop    %edi
 46f:	5d                   	pop    %ebp
 470:	c3                   	ret    
 471:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 478:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 47f:	90                   	nop

00000480 <stat>:

int
stat(const char *n, struct stat *st)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	56                   	push   %esi
 484:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 485:	83 ec 08             	sub    $0x8,%esp
 488:	6a 00                	push   $0x0
 48a:	ff 75 08             	push   0x8(%ebp)
 48d:	e8 f1 00 00 00       	call   583 <open>
  if(fd < 0)
 492:	83 c4 10             	add    $0x10,%esp
 495:	85 c0                	test   %eax,%eax
 497:	78 27                	js     4c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 499:	83 ec 08             	sub    $0x8,%esp
 49c:	ff 75 0c             	push   0xc(%ebp)
 49f:	89 c3                	mov    %eax,%ebx
 4a1:	50                   	push   %eax
 4a2:	e8 f4 00 00 00       	call   59b <fstat>
  close(fd);
 4a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4aa:	89 c6                	mov    %eax,%esi
  close(fd);
 4ac:	e8 ba 00 00 00       	call   56b <close>
  return r;
 4b1:	83 c4 10             	add    $0x10,%esp
}
 4b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4b7:	89 f0                	mov    %esi,%eax
 4b9:	5b                   	pop    %ebx
 4ba:	5e                   	pop    %esi
 4bb:	5d                   	pop    %ebp
 4bc:	c3                   	ret    
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 4c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4c5:	eb ed                	jmp    4b4 <stat+0x34>
 4c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ce:	66 90                	xchg   %ax,%ax

000004d0 <atoi>:

int
atoi(const char *s)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	53                   	push   %ebx
 4d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4d7:	0f be 02             	movsbl (%edx),%eax
 4da:	8d 48 d0             	lea    -0x30(%eax),%ecx
 4dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 4e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 4e5:	77 1e                	ja     505 <atoi+0x35>
 4e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ee:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 4f0:	83 c2 01             	add    $0x1,%edx
 4f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 4f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 4fa:	0f be 02             	movsbl (%edx),%eax
 4fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 500:	80 fb 09             	cmp    $0x9,%bl
 503:	76 eb                	jbe    4f0 <atoi+0x20>
  return n;
}
 505:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 508:	89 c8                	mov    %ecx,%eax
 50a:	c9                   	leave  
 50b:	c3                   	ret    
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000510 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	8b 45 10             	mov    0x10(%ebp),%eax
 517:	8b 55 08             	mov    0x8(%ebp),%edx
 51a:	56                   	push   %esi
 51b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 51e:	85 c0                	test   %eax,%eax
 520:	7e 13                	jle    535 <memmove+0x25>
 522:	01 d0                	add    %edx,%eax
  dst = vdst;
 524:	89 d7                	mov    %edx,%edi
 526:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 530:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 531:	39 f8                	cmp    %edi,%eax
 533:	75 fb                	jne    530 <memmove+0x20>
  return vdst;
}
 535:	5e                   	pop    %esi
 536:	89 d0                	mov    %edx,%eax
 538:	5f                   	pop    %edi
 539:	5d                   	pop    %ebp
 53a:	c3                   	ret    

0000053b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 53b:	b8 01 00 00 00       	mov    $0x1,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <exit>:
SYSCALL(exit)
 543:	b8 02 00 00 00       	mov    $0x2,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <wait>:
SYSCALL(wait)
 54b:	b8 03 00 00 00       	mov    $0x3,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <pipe>:
SYSCALL(pipe)
 553:	b8 04 00 00 00       	mov    $0x4,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <read>:
SYSCALL(read)
 55b:	b8 05 00 00 00       	mov    $0x5,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <write>:
SYSCALL(write)
 563:	b8 10 00 00 00       	mov    $0x10,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <close>:
SYSCALL(close)
 56b:	b8 15 00 00 00       	mov    $0x15,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <kill>:
SYSCALL(kill)
 573:	b8 06 00 00 00       	mov    $0x6,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <exec>:
SYSCALL(exec)
 57b:	b8 07 00 00 00       	mov    $0x7,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <open>:
SYSCALL(open)
 583:	b8 0f 00 00 00       	mov    $0xf,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <mknod>:
SYSCALL(mknod)
 58b:	b8 11 00 00 00       	mov    $0x11,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <unlink>:
SYSCALL(unlink)
 593:	b8 12 00 00 00       	mov    $0x12,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <fstat>:
SYSCALL(fstat)
 59b:	b8 08 00 00 00       	mov    $0x8,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <link>:
SYSCALL(link)
 5a3:	b8 13 00 00 00       	mov    $0x13,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <mkdir>:
SYSCALL(mkdir)
 5ab:	b8 14 00 00 00       	mov    $0x14,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <chdir>:
SYSCALL(chdir)
 5b3:	b8 09 00 00 00       	mov    $0x9,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <dup>:
SYSCALL(dup)
 5bb:	b8 0a 00 00 00       	mov    $0xa,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <getpid>:
SYSCALL(getpid)
 5c3:	b8 0b 00 00 00       	mov    $0xb,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <sbrk>:
SYSCALL(sbrk)
 5cb:	b8 0c 00 00 00       	mov    $0xc,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <sleep>:
SYSCALL(sleep)
 5d3:	b8 0d 00 00 00       	mov    $0xd,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <uptime>:
SYSCALL(uptime)
 5db:	b8 0e 00 00 00       	mov    $0xe,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <thread_create>:
SYSCALL(thread_create)
 5e3:	b8 16 00 00 00       	mov    $0x16,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <thread_join>:
SYSCALL(thread_join)
 5eb:	b8 18 00 00 00       	mov    $0x18,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <thread_exit>:
SYSCALL(thread_exit)
 5f3:	b8 17 00 00 00       	mov    $0x17,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <draw>:
 5fb:	b8 19 00 00 00       	mov    $0x19,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    
 603:	66 90                	xchg   %ax,%ax
 605:	66 90                	xchg   %ax,%ax
 607:	66 90                	xchg   %ax,%ax
 609:	66 90                	xchg   %ax,%ax
 60b:	66 90                	xchg   %ax,%ax
 60d:	66 90                	xchg   %ax,%ax
 60f:	90                   	nop

00000610 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	56                   	push   %esi
 615:	53                   	push   %ebx
 616:	83 ec 3c             	sub    $0x3c,%esp
 619:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 61c:	89 d1                	mov    %edx,%ecx
{
 61e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 621:	85 d2                	test   %edx,%edx
 623:	0f 89 7f 00 00 00    	jns    6a8 <printint+0x98>
 629:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 62d:	74 79                	je     6a8 <printint+0x98>
    neg = 1;
 62f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 636:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 638:	31 db                	xor    %ebx,%ebx
 63a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 63d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 640:	89 c8                	mov    %ecx,%eax
 642:	31 d2                	xor    %edx,%edx
 644:	89 cf                	mov    %ecx,%edi
 646:	f7 75 c4             	divl   -0x3c(%ebp)
 649:	0f b6 92 a8 0a 00 00 	movzbl 0xaa8(%edx),%edx
 650:	89 45 c0             	mov    %eax,-0x40(%ebp)
 653:	89 d8                	mov    %ebx,%eax
 655:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 658:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 65b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 65e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 661:	76 dd                	jbe    640 <printint+0x30>
  if(neg)
 663:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 666:	85 c9                	test   %ecx,%ecx
 668:	74 0c                	je     676 <printint+0x66>
    buf[i++] = '-';
 66a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 66f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 671:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 676:	8b 7d b8             	mov    -0x48(%ebp),%edi
 679:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 67d:	eb 07                	jmp    686 <printint+0x76>
 67f:	90                   	nop
    putc(fd, buf[i]);
 680:	0f b6 13             	movzbl (%ebx),%edx
 683:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 686:	83 ec 04             	sub    $0x4,%esp
 689:	88 55 d7             	mov    %dl,-0x29(%ebp)
 68c:	6a 01                	push   $0x1
 68e:	56                   	push   %esi
 68f:	57                   	push   %edi
 690:	e8 ce fe ff ff       	call   563 <write>
  while(--i >= 0)
 695:	83 c4 10             	add    $0x10,%esp
 698:	39 de                	cmp    %ebx,%esi
 69a:	75 e4                	jne    680 <printint+0x70>
}
 69c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 69f:	5b                   	pop    %ebx
 6a0:	5e                   	pop    %esi
 6a1:	5f                   	pop    %edi
 6a2:	5d                   	pop    %ebp
 6a3:	c3                   	ret    
 6a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6a8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 6af:	eb 87                	jmp    638 <printint+0x28>
 6b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6bf:	90                   	nop

000006c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 6cc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 6cf:	0f b6 13             	movzbl (%ebx),%edx
 6d2:	84 d2                	test   %dl,%dl
 6d4:	74 6a                	je     740 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 6d6:	8d 45 10             	lea    0x10(%ebp),%eax
 6d9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 6dc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 6df:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 6e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6e4:	eb 36                	jmp    71c <printf+0x5c>
 6e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
 6f0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 6f3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 6f8:	83 f8 25             	cmp    $0x25,%eax
 6fb:	74 15                	je     712 <printf+0x52>
  write(fd, &c, 1);
 6fd:	83 ec 04             	sub    $0x4,%esp
 700:	88 55 e7             	mov    %dl,-0x19(%ebp)
 703:	6a 01                	push   $0x1
 705:	57                   	push   %edi
 706:	56                   	push   %esi
 707:	e8 57 fe ff ff       	call   563 <write>
 70c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 70f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 712:	0f b6 13             	movzbl (%ebx),%edx
 715:	83 c3 01             	add    $0x1,%ebx
 718:	84 d2                	test   %dl,%dl
 71a:	74 24                	je     740 <printf+0x80>
    c = fmt[i] & 0xff;
 71c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 71f:	85 c9                	test   %ecx,%ecx
 721:	74 cd                	je     6f0 <printf+0x30>
      }
    } else if(state == '%'){
 723:	83 f9 25             	cmp    $0x25,%ecx
 726:	75 ea                	jne    712 <printf+0x52>
      if(c == 'd'){
 728:	83 f8 25             	cmp    $0x25,%eax
 72b:	0f 84 07 01 00 00    	je     838 <printf+0x178>
 731:	83 e8 63             	sub    $0x63,%eax
 734:	83 f8 15             	cmp    $0x15,%eax
 737:	77 17                	ja     750 <printf+0x90>
 739:	ff 24 85 50 0a 00 00 	jmp    *0xa50(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 740:	8d 65 f4             	lea    -0xc(%ebp),%esp
 743:	5b                   	pop    %ebx
 744:	5e                   	pop    %esi
 745:	5f                   	pop    %edi
 746:	5d                   	pop    %ebp
 747:	c3                   	ret    
 748:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74f:	90                   	nop
  write(fd, &c, 1);
 750:	83 ec 04             	sub    $0x4,%esp
 753:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 756:	6a 01                	push   $0x1
 758:	57                   	push   %edi
 759:	56                   	push   %esi
 75a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 75e:	e8 00 fe ff ff       	call   563 <write>
        putc(fd, c);
 763:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 767:	83 c4 0c             	add    $0xc,%esp
 76a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 76d:	6a 01                	push   $0x1
 76f:	57                   	push   %edi
 770:	56                   	push   %esi
 771:	e8 ed fd ff ff       	call   563 <write>
        putc(fd, c);
 776:	83 c4 10             	add    $0x10,%esp
      state = 0;
 779:	31 c9                	xor    %ecx,%ecx
 77b:	eb 95                	jmp    712 <printf+0x52>
 77d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 780:	83 ec 0c             	sub    $0xc,%esp
 783:	b9 10 00 00 00       	mov    $0x10,%ecx
 788:	6a 00                	push   $0x0
 78a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 78d:	8b 10                	mov    (%eax),%edx
 78f:	89 f0                	mov    %esi,%eax
 791:	e8 7a fe ff ff       	call   610 <printint>
        ap++;
 796:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 79a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 79d:	31 c9                	xor    %ecx,%ecx
 79f:	e9 6e ff ff ff       	jmp    712 <printf+0x52>
 7a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 7a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7ab:	8b 10                	mov    (%eax),%edx
        ap++;
 7ad:	83 c0 04             	add    $0x4,%eax
 7b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7b3:	85 d2                	test   %edx,%edx
 7b5:	0f 84 8d 00 00 00    	je     848 <printf+0x188>
        while(*s != 0){
 7bb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 7be:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 7c0:	84 c0                	test   %al,%al
 7c2:	0f 84 4a ff ff ff    	je     712 <printf+0x52>
 7c8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 7cb:	89 d3                	mov    %edx,%ebx
 7cd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 7d0:	83 ec 04             	sub    $0x4,%esp
          s++;
 7d3:	83 c3 01             	add    $0x1,%ebx
 7d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7d9:	6a 01                	push   $0x1
 7db:	57                   	push   %edi
 7dc:	56                   	push   %esi
 7dd:	e8 81 fd ff ff       	call   563 <write>
        while(*s != 0){
 7e2:	0f b6 03             	movzbl (%ebx),%eax
 7e5:	83 c4 10             	add    $0x10,%esp
 7e8:	84 c0                	test   %al,%al
 7ea:	75 e4                	jne    7d0 <printf+0x110>
      state = 0;
 7ec:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 7ef:	31 c9                	xor    %ecx,%ecx
 7f1:	e9 1c ff ff ff       	jmp    712 <printf+0x52>
 7f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 800:	83 ec 0c             	sub    $0xc,%esp
 803:	b9 0a 00 00 00       	mov    $0xa,%ecx
 808:	6a 01                	push   $0x1
 80a:	e9 7b ff ff ff       	jmp    78a <printf+0xca>
 80f:	90                   	nop
        putc(fd, *ap);
 810:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 813:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 816:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 818:	6a 01                	push   $0x1
 81a:	57                   	push   %edi
 81b:	56                   	push   %esi
        putc(fd, *ap);
 81c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 81f:	e8 3f fd ff ff       	call   563 <write>
        ap++;
 824:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 828:	83 c4 10             	add    $0x10,%esp
      state = 0;
 82b:	31 c9                	xor    %ecx,%ecx
 82d:	e9 e0 fe ff ff       	jmp    712 <printf+0x52>
 832:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 838:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 83b:	83 ec 04             	sub    $0x4,%esp
 83e:	e9 2a ff ff ff       	jmp    76d <printf+0xad>
 843:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 847:	90                   	nop
          s = "(null)";
 848:	ba 47 0a 00 00       	mov    $0xa47,%edx
        while(*s != 0){
 84d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 850:	b8 28 00 00 00       	mov    $0x28,%eax
 855:	89 d3                	mov    %edx,%ebx
 857:	e9 74 ff ff ff       	jmp    7d0 <printf+0x110>
 85c:	66 90                	xchg   %ax,%ax
 85e:	66 90                	xchg   %ax,%ax

00000860 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 860:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 861:	a1 80 0e 00 00       	mov    0xe80,%eax
{
 866:	89 e5                	mov    %esp,%ebp
 868:	57                   	push   %edi
 869:	56                   	push   %esi
 86a:	53                   	push   %ebx
 86b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 86e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 871:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 878:	89 c2                	mov    %eax,%edx
 87a:	8b 00                	mov    (%eax),%eax
 87c:	39 ca                	cmp    %ecx,%edx
 87e:	73 30                	jae    8b0 <free+0x50>
 880:	39 c1                	cmp    %eax,%ecx
 882:	72 04                	jb     888 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 884:	39 c2                	cmp    %eax,%edx
 886:	72 f0                	jb     878 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 888:	8b 73 fc             	mov    -0x4(%ebx),%esi
 88b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 88e:	39 f8                	cmp    %edi,%eax
 890:	74 30                	je     8c2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 892:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 895:	8b 42 04             	mov    0x4(%edx),%eax
 898:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 89b:	39 f1                	cmp    %esi,%ecx
 89d:	74 3a                	je     8d9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 89f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 8a1:	5b                   	pop    %ebx
  freep = p;
 8a2:	89 15 80 0e 00 00    	mov    %edx,0xe80
}
 8a8:	5e                   	pop    %esi
 8a9:	5f                   	pop    %edi
 8aa:	5d                   	pop    %ebp
 8ab:	c3                   	ret    
 8ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b0:	39 c2                	cmp    %eax,%edx
 8b2:	72 c4                	jb     878 <free+0x18>
 8b4:	39 c1                	cmp    %eax,%ecx
 8b6:	73 c0                	jae    878 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 8b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8be:	39 f8                	cmp    %edi,%eax
 8c0:	75 d0                	jne    892 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 8c2:	03 70 04             	add    0x4(%eax),%esi
 8c5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8c8:	8b 02                	mov    (%edx),%eax
 8ca:	8b 00                	mov    (%eax),%eax
 8cc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 8cf:	8b 42 04             	mov    0x4(%edx),%eax
 8d2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 8d5:	39 f1                	cmp    %esi,%ecx
 8d7:	75 c6                	jne    89f <free+0x3f>
    p->s.size += bp->s.size;
 8d9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 8dc:	89 15 80 0e 00 00    	mov    %edx,0xe80
    p->s.size += bp->s.size;
 8e2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 8e5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 8e8:	89 0a                	mov    %ecx,(%edx)
}
 8ea:	5b                   	pop    %ebx
 8eb:	5e                   	pop    %esi
 8ec:	5f                   	pop    %edi
 8ed:	5d                   	pop    %ebp
 8ee:	c3                   	ret    
 8ef:	90                   	nop

000008f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8f0:	55                   	push   %ebp
 8f1:	89 e5                	mov    %esp,%ebp
 8f3:	57                   	push   %edi
 8f4:	56                   	push   %esi
 8f5:	53                   	push   %ebx
 8f6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 8fc:	8b 3d 80 0e 00 00    	mov    0xe80,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 902:	8d 70 07             	lea    0x7(%eax),%esi
 905:	c1 ee 03             	shr    $0x3,%esi
 908:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 90b:	85 ff                	test   %edi,%edi
 90d:	0f 84 9d 00 00 00    	je     9b0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 913:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 915:	8b 4a 04             	mov    0x4(%edx),%ecx
 918:	39 f1                	cmp    %esi,%ecx
 91a:	73 6a                	jae    986 <malloc+0x96>
 91c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 921:	39 de                	cmp    %ebx,%esi
 923:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 926:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 92d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 930:	eb 17                	jmp    949 <malloc+0x59>
 932:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 938:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 93a:	8b 48 04             	mov    0x4(%eax),%ecx
 93d:	39 f1                	cmp    %esi,%ecx
 93f:	73 4f                	jae    990 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 941:	8b 3d 80 0e 00 00    	mov    0xe80,%edi
 947:	89 c2                	mov    %eax,%edx
 949:	39 d7                	cmp    %edx,%edi
 94b:	75 eb                	jne    938 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 94d:	83 ec 0c             	sub    $0xc,%esp
 950:	ff 75 e4             	push   -0x1c(%ebp)
 953:	e8 73 fc ff ff       	call   5cb <sbrk>
  if(p == (char*)-1)
 958:	83 c4 10             	add    $0x10,%esp
 95b:	83 f8 ff             	cmp    $0xffffffff,%eax
 95e:	74 1c                	je     97c <malloc+0x8c>
  hp->s.size = nu;
 960:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 963:	83 ec 0c             	sub    $0xc,%esp
 966:	83 c0 08             	add    $0x8,%eax
 969:	50                   	push   %eax
 96a:	e8 f1 fe ff ff       	call   860 <free>
  return freep;
 96f:	8b 15 80 0e 00 00    	mov    0xe80,%edx
      if((p = morecore(nunits)) == 0)
 975:	83 c4 10             	add    $0x10,%esp
 978:	85 d2                	test   %edx,%edx
 97a:	75 bc                	jne    938 <malloc+0x48>
        return 0;
  }
}
 97c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 97f:	31 c0                	xor    %eax,%eax
}
 981:	5b                   	pop    %ebx
 982:	5e                   	pop    %esi
 983:	5f                   	pop    %edi
 984:	5d                   	pop    %ebp
 985:	c3                   	ret    
    if(p->s.size >= nunits){
 986:	89 d0                	mov    %edx,%eax
 988:	89 fa                	mov    %edi,%edx
 98a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 990:	39 ce                	cmp    %ecx,%esi
 992:	74 4c                	je     9e0 <malloc+0xf0>
        p->s.size -= nunits;
 994:	29 f1                	sub    %esi,%ecx
 996:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 999:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 99c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 99f:	89 15 80 0e 00 00    	mov    %edx,0xe80
}
 9a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 9a8:	83 c0 08             	add    $0x8,%eax
}
 9ab:	5b                   	pop    %ebx
 9ac:	5e                   	pop    %esi
 9ad:	5f                   	pop    %edi
 9ae:	5d                   	pop    %ebp
 9af:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 9b0:	c7 05 80 0e 00 00 84 	movl   $0xe84,0xe80
 9b7:	0e 00 00 
    base.s.size = 0;
 9ba:	bf 84 0e 00 00       	mov    $0xe84,%edi
    base.s.ptr = freep = prevp = &base;
 9bf:	c7 05 84 0e 00 00 84 	movl   $0xe84,0xe84
 9c6:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 9cb:	c7 05 88 0e 00 00 00 	movl   $0x0,0xe88
 9d2:	00 00 00 
    if(p->s.size >= nunits){
 9d5:	e9 42 ff ff ff       	jmp    91c <malloc+0x2c>
 9da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 9e0:	8b 08                	mov    (%eax),%ecx
 9e2:	89 0a                	mov    %ecx,(%edx)
 9e4:	eb b9                	jmp    99f <malloc+0xaf>
