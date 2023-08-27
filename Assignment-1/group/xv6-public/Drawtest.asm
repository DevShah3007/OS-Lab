
_Drawtest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
int main(void){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 0c             	sub    $0xc,%esp
    static char buf[5000];
    printf(1,"The system call returns %d\n",draw((void*) buf,5000));
  11:	68 88 13 00 00       	push   $0x1388
  16:	68 80 0a 00 00       	push   $0xa80
  1b:	e8 3b 03 00 00       	call   35b <draw>
  20:	83 c4 0c             	add    $0xc,%esp
  23:	50                   	push   %eax
  24:	68 48 07 00 00       	push   $0x748
  29:	6a 01                	push   $0x1
  2b:	e8 f0 03 00 00       	call   420 <printf>
    printf(1,"%s",buf);
  30:	83 c4 0c             	add    $0xc,%esp
  33:	68 80 0a 00 00       	push   $0xa80
  38:	68 64 07 00 00       	push   $0x764
  3d:	6a 01                	push   $0x1
  3f:	e8 dc 03 00 00       	call   420 <printf>
    exit();
  44:	e8 5a 02 00 00       	call   2a3 <exit>
  49:	66 90                	xchg   %ax,%ax
  4b:	66 90                	xchg   %ax,%ax
  4d:	66 90                	xchg   %ax,%ax
  4f:	90                   	nop

00000050 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  50:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  51:	31 c0                	xor    %eax,%eax
{
  53:	89 e5                	mov    %esp,%ebp
  55:	53                   	push   %ebx
  56:	8b 4d 08             	mov    0x8(%ebp),%ecx
  59:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  60:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  64:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  67:	83 c0 01             	add    $0x1,%eax
  6a:	84 d2                	test   %dl,%dl
  6c:	75 f2                	jne    60 <strcpy+0x10>
    ;
  return os;
}
  6e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  71:	89 c8                	mov    %ecx,%eax
  73:	c9                   	leave  
  74:	c3                   	ret    
  75:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000080 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	53                   	push   %ebx
  84:	8b 55 08             	mov    0x8(%ebp),%edx
  87:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  8a:	0f b6 02             	movzbl (%edx),%eax
  8d:	84 c0                	test   %al,%al
  8f:	75 17                	jne    a8 <strcmp+0x28>
  91:	eb 3a                	jmp    cd <strcmp+0x4d>
  93:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  97:	90                   	nop
  98:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  9c:	83 c2 01             	add    $0x1,%edx
  9f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  a2:	84 c0                	test   %al,%al
  a4:	74 1a                	je     c0 <strcmp+0x40>
    p++, q++;
  a6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  a8:	0f b6 19             	movzbl (%ecx),%ebx
  ab:	38 c3                	cmp    %al,%bl
  ad:	74 e9                	je     98 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  af:	29 d8                	sub    %ebx,%eax
}
  b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b4:	c9                   	leave  
  b5:	c3                   	ret    
  b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  bd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  c4:	31 c0                	xor    %eax,%eax
  c6:	29 d8                	sub    %ebx,%eax
}
  c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  cb:	c9                   	leave  
  cc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  cd:	0f b6 19             	movzbl (%ecx),%ebx
  d0:	31 c0                	xor    %eax,%eax
  d2:	eb db                	jmp    af <strcmp+0x2f>
  d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  df:	90                   	nop

000000e0 <strlen>:

uint
strlen(const char *s)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  e6:	80 3a 00             	cmpb   $0x0,(%edx)
  e9:	74 15                	je     100 <strlen+0x20>
  eb:	31 c0                	xor    %eax,%eax
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	83 c0 01             	add    $0x1,%eax
  f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  f7:	89 c1                	mov    %eax,%ecx
  f9:	75 f5                	jne    f0 <strlen+0x10>
    ;
  return n;
}
  fb:	89 c8                	mov    %ecx,%eax
  fd:	5d                   	pop    %ebp
  fe:	c3                   	ret    
  ff:	90                   	nop
  for(n = 0; s[n]; n++)
 100:	31 c9                	xor    %ecx,%ecx
}
 102:	5d                   	pop    %ebp
 103:	89 c8                	mov    %ecx,%eax
 105:	c3                   	ret    
 106:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10d:	8d 76 00             	lea    0x0(%esi),%esi

00000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 117:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 d7                	mov    %edx,%edi
 11f:	fc                   	cld    
 120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 122:	8b 7d fc             	mov    -0x4(%ebp),%edi
 125:	89 d0                	mov    %edx,%eax
 127:	c9                   	leave  
 128:	c3                   	ret    
 129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 45 08             	mov    0x8(%ebp),%eax
 136:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 13a:	0f b6 10             	movzbl (%eax),%edx
 13d:	84 d2                	test   %dl,%dl
 13f:	75 12                	jne    153 <strchr+0x23>
 141:	eb 1d                	jmp    160 <strchr+0x30>
 143:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 147:	90                   	nop
 148:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 14c:	83 c0 01             	add    $0x1,%eax
 14f:	84 d2                	test   %dl,%dl
 151:	74 0d                	je     160 <strchr+0x30>
    if(*s == c)
 153:	38 d1                	cmp    %dl,%cl
 155:	75 f1                	jne    148 <strchr+0x18>
      return (char*)s;
  return 0;
}
 157:	5d                   	pop    %ebp
 158:	c3                   	ret    
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 160:	31 c0                	xor    %eax,%eax
}
 162:	5d                   	pop    %ebp
 163:	c3                   	ret    
 164:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 16f:	90                   	nop

00000170 <gets>:

char*
gets(char *buf, int max)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 175:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 178:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 179:	31 db                	xor    %ebx,%ebx
{
 17b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 17e:	eb 27                	jmp    1a7 <gets+0x37>
    cc = read(0, &c, 1);
 180:	83 ec 04             	sub    $0x4,%esp
 183:	6a 01                	push   $0x1
 185:	57                   	push   %edi
 186:	6a 00                	push   $0x0
 188:	e8 2e 01 00 00       	call   2bb <read>
    if(cc < 1)
 18d:	83 c4 10             	add    $0x10,%esp
 190:	85 c0                	test   %eax,%eax
 192:	7e 1d                	jle    1b1 <gets+0x41>
      break;
    buf[i++] = c;
 194:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 198:	8b 55 08             	mov    0x8(%ebp),%edx
 19b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 19f:	3c 0a                	cmp    $0xa,%al
 1a1:	74 1d                	je     1c0 <gets+0x50>
 1a3:	3c 0d                	cmp    $0xd,%al
 1a5:	74 19                	je     1c0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1a7:	89 de                	mov    %ebx,%esi
 1a9:	83 c3 01             	add    $0x1,%ebx
 1ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1af:	7c cf                	jl     180 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1b1:	8b 45 08             	mov    0x8(%ebp),%eax
 1b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1bb:	5b                   	pop    %ebx
 1bc:	5e                   	pop    %esi
 1bd:	5f                   	pop    %edi
 1be:	5d                   	pop    %ebp
 1bf:	c3                   	ret    
  buf[i] = '\0';
 1c0:	8b 45 08             	mov    0x8(%ebp),%eax
 1c3:	89 de                	mov    %ebx,%esi
 1c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cc:	5b                   	pop    %ebx
 1cd:	5e                   	pop    %esi
 1ce:	5f                   	pop    %edi
 1cf:	5d                   	pop    %ebp
 1d0:	c3                   	ret    
 1d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1df:	90                   	nop

000001e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e5:	83 ec 08             	sub    $0x8,%esp
 1e8:	6a 00                	push   $0x0
 1ea:	ff 75 08             	push   0x8(%ebp)
 1ed:	e8 f1 00 00 00       	call   2e3 <open>
  if(fd < 0)
 1f2:	83 c4 10             	add    $0x10,%esp
 1f5:	85 c0                	test   %eax,%eax
 1f7:	78 27                	js     220 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1f9:	83 ec 08             	sub    $0x8,%esp
 1fc:	ff 75 0c             	push   0xc(%ebp)
 1ff:	89 c3                	mov    %eax,%ebx
 201:	50                   	push   %eax
 202:	e8 f4 00 00 00       	call   2fb <fstat>
  close(fd);
 207:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 20a:	89 c6                	mov    %eax,%esi
  close(fd);
 20c:	e8 ba 00 00 00       	call   2cb <close>
  return r;
 211:	83 c4 10             	add    $0x10,%esp
}
 214:	8d 65 f8             	lea    -0x8(%ebp),%esp
 217:	89 f0                	mov    %esi,%eax
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
 21d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 220:	be ff ff ff ff       	mov    $0xffffffff,%esi
 225:	eb ed                	jmp    214 <stat+0x34>
 227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22e:	66 90                	xchg   %ax,%ax

00000230 <atoi>:

int
atoi(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	53                   	push   %ebx
 234:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 237:	0f be 02             	movsbl (%edx),%eax
 23a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 23d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 240:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 245:	77 1e                	ja     265 <atoi+0x35>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 250:	83 c2 01             	add    $0x1,%edx
 253:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 256:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 25a:	0f be 02             	movsbl (%edx),%eax
 25d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 260:	80 fb 09             	cmp    $0x9,%bl
 263:	76 eb                	jbe    250 <atoi+0x20>
  return n;
}
 265:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 268:	89 c8                	mov    %ecx,%eax
 26a:	c9                   	leave  
 26b:	c3                   	ret    
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	8b 45 10             	mov    0x10(%ebp),%eax
 277:	8b 55 08             	mov    0x8(%ebp),%edx
 27a:	56                   	push   %esi
 27b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 27e:	85 c0                	test   %eax,%eax
 280:	7e 13                	jle    295 <memmove+0x25>
 282:	01 d0                	add    %edx,%eax
  dst = vdst;
 284:	89 d7                	mov    %edx,%edi
 286:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 28d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 290:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 291:	39 f8                	cmp    %edi,%eax
 293:	75 fb                	jne    290 <memmove+0x20>
  return vdst;
}
 295:	5e                   	pop    %esi
 296:	89 d0                	mov    %edx,%eax
 298:	5f                   	pop    %edi
 299:	5d                   	pop    %ebp
 29a:	c3                   	ret    

0000029b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29b:	b8 01 00 00 00       	mov    $0x1,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <exit>:
SYSCALL(exit)
 2a3:	b8 02 00 00 00       	mov    $0x2,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <wait>:
SYSCALL(wait)
 2ab:	b8 03 00 00 00       	mov    $0x3,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <pipe>:
SYSCALL(pipe)
 2b3:	b8 04 00 00 00       	mov    $0x4,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <read>:
SYSCALL(read)
 2bb:	b8 05 00 00 00       	mov    $0x5,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <write>:
SYSCALL(write)
 2c3:	b8 10 00 00 00       	mov    $0x10,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <close>:
SYSCALL(close)
 2cb:	b8 15 00 00 00       	mov    $0x15,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <kill>:
SYSCALL(kill)
 2d3:	b8 06 00 00 00       	mov    $0x6,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <exec>:
SYSCALL(exec)
 2db:	b8 07 00 00 00       	mov    $0x7,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <open>:
SYSCALL(open)
 2e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <mknod>:
SYSCALL(mknod)
 2eb:	b8 11 00 00 00       	mov    $0x11,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <unlink>:
SYSCALL(unlink)
 2f3:	b8 12 00 00 00       	mov    $0x12,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <fstat>:
SYSCALL(fstat)
 2fb:	b8 08 00 00 00       	mov    $0x8,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <link>:
SYSCALL(link)
 303:	b8 13 00 00 00       	mov    $0x13,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <mkdir>:
SYSCALL(mkdir)
 30b:	b8 14 00 00 00       	mov    $0x14,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <chdir>:
SYSCALL(chdir)
 313:	b8 09 00 00 00       	mov    $0x9,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <dup>:
SYSCALL(dup)
 31b:	b8 0a 00 00 00       	mov    $0xa,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <getpid>:
SYSCALL(getpid)
 323:	b8 0b 00 00 00       	mov    $0xb,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <sbrk>:
SYSCALL(sbrk)
 32b:	b8 0c 00 00 00       	mov    $0xc,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <sleep>:
SYSCALL(sleep)
 333:	b8 0d 00 00 00       	mov    $0xd,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <uptime>:
SYSCALL(uptime)
 33b:	b8 0e 00 00 00       	mov    $0xe,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <thread_create>:
SYSCALL(thread_create)
 343:	b8 16 00 00 00       	mov    $0x16,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <thread_join>:
SYSCALL(thread_join)
 34b:	b8 18 00 00 00       	mov    $0x18,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <thread_exit>:
SYSCALL(thread_exit)
 353:	b8 17 00 00 00       	mov    $0x17,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <draw>:
 35b:	b8 19 00 00 00       	mov    $0x19,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    
 363:	66 90                	xchg   %ax,%ax
 365:	66 90                	xchg   %ax,%ax
 367:	66 90                	xchg   %ax,%ax
 369:	66 90                	xchg   %ax,%ax
 36b:	66 90                	xchg   %ax,%ax
 36d:	66 90                	xchg   %ax,%ax
 36f:	90                   	nop

00000370 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	53                   	push   %ebx
 376:	83 ec 3c             	sub    $0x3c,%esp
 379:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 37c:	89 d1                	mov    %edx,%ecx
{
 37e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 381:	85 d2                	test   %edx,%edx
 383:	0f 89 7f 00 00 00    	jns    408 <printint+0x98>
 389:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 38d:	74 79                	je     408 <printint+0x98>
    neg = 1;
 38f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 396:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 398:	31 db                	xor    %ebx,%ebx
 39a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 39d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3a0:	89 c8                	mov    %ecx,%eax
 3a2:	31 d2                	xor    %edx,%edx
 3a4:	89 cf                	mov    %ecx,%edi
 3a6:	f7 75 c4             	divl   -0x3c(%ebp)
 3a9:	0f b6 92 c8 07 00 00 	movzbl 0x7c8(%edx),%edx
 3b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3b3:	89 d8                	mov    %ebx,%eax
 3b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 3b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 3bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 3be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 3c1:	76 dd                	jbe    3a0 <printint+0x30>
  if(neg)
 3c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 3c6:	85 c9                	test   %ecx,%ecx
 3c8:	74 0c                	je     3d6 <printint+0x66>
    buf[i++] = '-';
 3ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 3cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 3d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 3d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 3d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3dd:	eb 07                	jmp    3e6 <printint+0x76>
 3df:	90                   	nop
    putc(fd, buf[i]);
 3e0:	0f b6 13             	movzbl (%ebx),%edx
 3e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3e6:	83 ec 04             	sub    $0x4,%esp
 3e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3ec:	6a 01                	push   $0x1
 3ee:	56                   	push   %esi
 3ef:	57                   	push   %edi
 3f0:	e8 ce fe ff ff       	call   2c3 <write>
  while(--i >= 0)
 3f5:	83 c4 10             	add    $0x10,%esp
 3f8:	39 de                	cmp    %ebx,%esi
 3fa:	75 e4                	jne    3e0 <printint+0x70>
}
 3fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ff:	5b                   	pop    %ebx
 400:	5e                   	pop    %esi
 401:	5f                   	pop    %edi
 402:	5d                   	pop    %ebp
 403:	c3                   	ret    
 404:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 408:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 40f:	eb 87                	jmp    398 <printint+0x28>
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 418:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 41f:	90                   	nop

00000420 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
 426:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 429:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 42c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 42f:	0f b6 13             	movzbl (%ebx),%edx
 432:	84 d2                	test   %dl,%dl
 434:	74 6a                	je     4a0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 436:	8d 45 10             	lea    0x10(%ebp),%eax
 439:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 43c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 43f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 441:	89 45 d0             	mov    %eax,-0x30(%ebp)
 444:	eb 36                	jmp    47c <printf+0x5c>
 446:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44d:	8d 76 00             	lea    0x0(%esi),%esi
 450:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 453:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 458:	83 f8 25             	cmp    $0x25,%eax
 45b:	74 15                	je     472 <printf+0x52>
  write(fd, &c, 1);
 45d:	83 ec 04             	sub    $0x4,%esp
 460:	88 55 e7             	mov    %dl,-0x19(%ebp)
 463:	6a 01                	push   $0x1
 465:	57                   	push   %edi
 466:	56                   	push   %esi
 467:	e8 57 fe ff ff       	call   2c3 <write>
 46c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 46f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 472:	0f b6 13             	movzbl (%ebx),%edx
 475:	83 c3 01             	add    $0x1,%ebx
 478:	84 d2                	test   %dl,%dl
 47a:	74 24                	je     4a0 <printf+0x80>
    c = fmt[i] & 0xff;
 47c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 47f:	85 c9                	test   %ecx,%ecx
 481:	74 cd                	je     450 <printf+0x30>
      }
    } else if(state == '%'){
 483:	83 f9 25             	cmp    $0x25,%ecx
 486:	75 ea                	jne    472 <printf+0x52>
      if(c == 'd'){
 488:	83 f8 25             	cmp    $0x25,%eax
 48b:	0f 84 07 01 00 00    	je     598 <printf+0x178>
 491:	83 e8 63             	sub    $0x63,%eax
 494:	83 f8 15             	cmp    $0x15,%eax
 497:	77 17                	ja     4b0 <printf+0x90>
 499:	ff 24 85 70 07 00 00 	jmp    *0x770(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a3:	5b                   	pop    %ebx
 4a4:	5e                   	pop    %esi
 4a5:	5f                   	pop    %edi
 4a6:	5d                   	pop    %ebp
 4a7:	c3                   	ret    
 4a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop
  write(fd, &c, 1);
 4b0:	83 ec 04             	sub    $0x4,%esp
 4b3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 4b6:	6a 01                	push   $0x1
 4b8:	57                   	push   %edi
 4b9:	56                   	push   %esi
 4ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4be:	e8 00 fe ff ff       	call   2c3 <write>
        putc(fd, c);
 4c3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 4c7:	83 c4 0c             	add    $0xc,%esp
 4ca:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4cd:	6a 01                	push   $0x1
 4cf:	57                   	push   %edi
 4d0:	56                   	push   %esi
 4d1:	e8 ed fd ff ff       	call   2c3 <write>
        putc(fd, c);
 4d6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4d9:	31 c9                	xor    %ecx,%ecx
 4db:	eb 95                	jmp    472 <printf+0x52>
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4e0:	83 ec 0c             	sub    $0xc,%esp
 4e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4e8:	6a 00                	push   $0x0
 4ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4ed:	8b 10                	mov    (%eax),%edx
 4ef:	89 f0                	mov    %esi,%eax
 4f1:	e8 7a fe ff ff       	call   370 <printint>
        ap++;
 4f6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 4fa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4fd:	31 c9                	xor    %ecx,%ecx
 4ff:	e9 6e ff ff ff       	jmp    472 <printf+0x52>
 504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 508:	8b 45 d0             	mov    -0x30(%ebp),%eax
 50b:	8b 10                	mov    (%eax),%edx
        ap++;
 50d:	83 c0 04             	add    $0x4,%eax
 510:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 513:	85 d2                	test   %edx,%edx
 515:	0f 84 8d 00 00 00    	je     5a8 <printf+0x188>
        while(*s != 0){
 51b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 51e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 520:	84 c0                	test   %al,%al
 522:	0f 84 4a ff ff ff    	je     472 <printf+0x52>
 528:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 52b:	89 d3                	mov    %edx,%ebx
 52d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 530:	83 ec 04             	sub    $0x4,%esp
          s++;
 533:	83 c3 01             	add    $0x1,%ebx
 536:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 539:	6a 01                	push   $0x1
 53b:	57                   	push   %edi
 53c:	56                   	push   %esi
 53d:	e8 81 fd ff ff       	call   2c3 <write>
        while(*s != 0){
 542:	0f b6 03             	movzbl (%ebx),%eax
 545:	83 c4 10             	add    $0x10,%esp
 548:	84 c0                	test   %al,%al
 54a:	75 e4                	jne    530 <printf+0x110>
      state = 0;
 54c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 54f:	31 c9                	xor    %ecx,%ecx
 551:	e9 1c ff ff ff       	jmp    472 <printf+0x52>
 556:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 560:	83 ec 0c             	sub    $0xc,%esp
 563:	b9 0a 00 00 00       	mov    $0xa,%ecx
 568:	6a 01                	push   $0x1
 56a:	e9 7b ff ff ff       	jmp    4ea <printf+0xca>
 56f:	90                   	nop
        putc(fd, *ap);
 570:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 573:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 576:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 578:	6a 01                	push   $0x1
 57a:	57                   	push   %edi
 57b:	56                   	push   %esi
        putc(fd, *ap);
 57c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 57f:	e8 3f fd ff ff       	call   2c3 <write>
        ap++;
 584:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 588:	83 c4 10             	add    $0x10,%esp
      state = 0;
 58b:	31 c9                	xor    %ecx,%ecx
 58d:	e9 e0 fe ff ff       	jmp    472 <printf+0x52>
 592:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 598:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 59b:	83 ec 04             	sub    $0x4,%esp
 59e:	e9 2a ff ff ff       	jmp    4cd <printf+0xad>
 5a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5a7:	90                   	nop
          s = "(null)";
 5a8:	ba 67 07 00 00       	mov    $0x767,%edx
        while(*s != 0){
 5ad:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5b0:	b8 28 00 00 00       	mov    $0x28,%eax
 5b5:	89 d3                	mov    %edx,%ebx
 5b7:	e9 74 ff ff ff       	jmp    530 <printf+0x110>
 5bc:	66 90                	xchg   %ax,%ax
 5be:	66 90                	xchg   %ax,%ax

000005c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c1:	a1 08 1e 00 00       	mov    0x1e08,%eax
{
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	57                   	push   %edi
 5c9:	56                   	push   %esi
 5ca:	53                   	push   %ebx
 5cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5d8:	89 c2                	mov    %eax,%edx
 5da:	8b 00                	mov    (%eax),%eax
 5dc:	39 ca                	cmp    %ecx,%edx
 5de:	73 30                	jae    610 <free+0x50>
 5e0:	39 c1                	cmp    %eax,%ecx
 5e2:	72 04                	jb     5e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e4:	39 c2                	cmp    %eax,%edx
 5e6:	72 f0                	jb     5d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ee:	39 f8                	cmp    %edi,%eax
 5f0:	74 30                	je     622 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5f5:	8b 42 04             	mov    0x4(%edx),%eax
 5f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5fb:	39 f1                	cmp    %esi,%ecx
 5fd:	74 3a                	je     639 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 5ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 601:	5b                   	pop    %ebx
  freep = p;
 602:	89 15 08 1e 00 00    	mov    %edx,0x1e08
}
 608:	5e                   	pop    %esi
 609:	5f                   	pop    %edi
 60a:	5d                   	pop    %ebp
 60b:	c3                   	ret    
 60c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 610:	39 c2                	cmp    %eax,%edx
 612:	72 c4                	jb     5d8 <free+0x18>
 614:	39 c1                	cmp    %eax,%ecx
 616:	73 c0                	jae    5d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 618:	8b 73 fc             	mov    -0x4(%ebx),%esi
 61b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 61e:	39 f8                	cmp    %edi,%eax
 620:	75 d0                	jne    5f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 622:	03 70 04             	add    0x4(%eax),%esi
 625:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 628:	8b 02                	mov    (%edx),%eax
 62a:	8b 00                	mov    (%eax),%eax
 62c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 62f:	8b 42 04             	mov    0x4(%edx),%eax
 632:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 635:	39 f1                	cmp    %esi,%ecx
 637:	75 c6                	jne    5ff <free+0x3f>
    p->s.size += bp->s.size;
 639:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 63c:	89 15 08 1e 00 00    	mov    %edx,0x1e08
    p->s.size += bp->s.size;
 642:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 645:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 648:	89 0a                	mov    %ecx,(%edx)
}
 64a:	5b                   	pop    %ebx
 64b:	5e                   	pop    %esi
 64c:	5f                   	pop    %edi
 64d:	5d                   	pop    %ebp
 64e:	c3                   	ret    
 64f:	90                   	nop

00000650 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 659:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 65c:	8b 3d 08 1e 00 00    	mov    0x1e08,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 662:	8d 70 07             	lea    0x7(%eax),%esi
 665:	c1 ee 03             	shr    $0x3,%esi
 668:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 66b:	85 ff                	test   %edi,%edi
 66d:	0f 84 9d 00 00 00    	je     710 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 673:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 675:	8b 4a 04             	mov    0x4(%edx),%ecx
 678:	39 f1                	cmp    %esi,%ecx
 67a:	73 6a                	jae    6e6 <malloc+0x96>
 67c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 681:	39 de                	cmp    %ebx,%esi
 683:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 686:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 68d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 690:	eb 17                	jmp    6a9 <malloc+0x59>
 692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 698:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 69a:	8b 48 04             	mov    0x4(%eax),%ecx
 69d:	39 f1                	cmp    %esi,%ecx
 69f:	73 4f                	jae    6f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6a1:	8b 3d 08 1e 00 00    	mov    0x1e08,%edi
 6a7:	89 c2                	mov    %eax,%edx
 6a9:	39 d7                	cmp    %edx,%edi
 6ab:	75 eb                	jne    698 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 6ad:	83 ec 0c             	sub    $0xc,%esp
 6b0:	ff 75 e4             	push   -0x1c(%ebp)
 6b3:	e8 73 fc ff ff       	call   32b <sbrk>
  if(p == (char*)-1)
 6b8:	83 c4 10             	add    $0x10,%esp
 6bb:	83 f8 ff             	cmp    $0xffffffff,%eax
 6be:	74 1c                	je     6dc <malloc+0x8c>
  hp->s.size = nu;
 6c0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6c3:	83 ec 0c             	sub    $0xc,%esp
 6c6:	83 c0 08             	add    $0x8,%eax
 6c9:	50                   	push   %eax
 6ca:	e8 f1 fe ff ff       	call   5c0 <free>
  return freep;
 6cf:	8b 15 08 1e 00 00    	mov    0x1e08,%edx
      if((p = morecore(nunits)) == 0)
 6d5:	83 c4 10             	add    $0x10,%esp
 6d8:	85 d2                	test   %edx,%edx
 6da:	75 bc                	jne    698 <malloc+0x48>
        return 0;
  }
}
 6dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6df:	31 c0                	xor    %eax,%eax
}
 6e1:	5b                   	pop    %ebx
 6e2:	5e                   	pop    %esi
 6e3:	5f                   	pop    %edi
 6e4:	5d                   	pop    %ebp
 6e5:	c3                   	ret    
    if(p->s.size >= nunits){
 6e6:	89 d0                	mov    %edx,%eax
 6e8:	89 fa                	mov    %edi,%edx
 6ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6f0:	39 ce                	cmp    %ecx,%esi
 6f2:	74 4c                	je     740 <malloc+0xf0>
        p->s.size -= nunits;
 6f4:	29 f1                	sub    %esi,%ecx
 6f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6fc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 6ff:	89 15 08 1e 00 00    	mov    %edx,0x1e08
}
 705:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 708:	83 c0 08             	add    $0x8,%eax
}
 70b:	5b                   	pop    %ebx
 70c:	5e                   	pop    %esi
 70d:	5f                   	pop    %edi
 70e:	5d                   	pop    %ebp
 70f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 710:	c7 05 08 1e 00 00 0c 	movl   $0x1e0c,0x1e08
 717:	1e 00 00 
    base.s.size = 0;
 71a:	bf 0c 1e 00 00       	mov    $0x1e0c,%edi
    base.s.ptr = freep = prevp = &base;
 71f:	c7 05 0c 1e 00 00 0c 	movl   $0x1e0c,0x1e0c
 726:	1e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 729:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 72b:	c7 05 10 1e 00 00 00 	movl   $0x0,0x1e10
 732:	00 00 00 
    if(p->s.size >= nunits){
 735:	e9 42 ff ff ff       	jmp    67c <malloc+0x2c>
 73a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 740:	8b 08                	mov    (%eax),%ecx
 742:	89 0a                	mov    %ecx,(%edx)
 744:	eb b9                	jmp    6ff <malloc+0xaf>
