
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 48 0a 00 00       	push   $0xa48
  19:	e8 65 03 00 00       	call   383 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 88 03 00 00       	call   3bb <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 7c 03 00 00       	call   3bb <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 50 0a 00 00       	push   $0xa50
  50:	6a 01                	push   $0x1
  52:	e8 99 04 00 00       	call   4f0 <printf>
    pid = fork();
  57:	e8 df 02 00 00       	call   33b <fork>
    if(pid < 0){
  5c:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  5f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  61:	85 c0                	test   %eax,%eax
  63:	78 2c                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  65:	74 3d                	je     a4 <main+0xa4>
  67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6e:	66 90                	xchg   %ax,%ax
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 d6 02 00 00       	call   34b <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 cf                	js     48 <main+0x48>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 cb                	je     48 <main+0x48>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 8f 0a 00 00       	push   $0xa8f
  85:	6a 01                	push   $0x1
  87:	e8 64 04 00 00       	call   4f0 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 63 0a 00 00       	push   $0xa63
  98:	6a 01                	push   $0x1
  9a:	e8 51 04 00 00       	call   4f0 <printf>
      exit();
  9f:	e8 9f 02 00 00       	call   343 <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 34 0e 00 00       	push   $0xe34
  ab:	68 76 0a 00 00       	push   $0xa76
  b0:	e8 c6 02 00 00       	call   37b <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 79 0a 00 00       	push   $0xa79
  bc:	6a 01                	push   $0x1
  be:	e8 2d 04 00 00       	call   4f0 <printf>
      exit();
  c3:	e8 7b 02 00 00       	call   343 <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 48 0a 00 00       	push   $0xa48
  d2:	e8 b4 02 00 00       	call   38b <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 48 0a 00 00       	push   $0xa48
  e0:	e8 9e 02 00 00       	call   383 <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f1:	31 c0                	xor    %eax,%eax
{
  f3:	89 e5                	mov    %esp,%ebp
  f5:	53                   	push   %ebx
  f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 111:	89 c8                	mov    %ecx,%eax
 113:	c9                   	leave  
 114:	c3                   	ret    
 115:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 55 08             	mov    0x8(%ebp),%edx
 127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 12a:	0f b6 02             	movzbl (%edx),%eax
 12d:	84 c0                	test   %al,%al
 12f:	75 17                	jne    148 <strcmp+0x28>
 131:	eb 3a                	jmp    16d <strcmp+0x4d>
 133:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 137:	90                   	nop
 138:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 13c:	83 c2 01             	add    $0x1,%edx
 13f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 142:	84 c0                	test   %al,%al
 144:	74 1a                	je     160 <strcmp+0x40>
    p++, q++;
 146:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 148:	0f b6 19             	movzbl (%ecx),%ebx
 14b:	38 c3                	cmp    %al,%bl
 14d:	74 e9                	je     138 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 14f:	29 d8                	sub    %ebx,%eax
}
 151:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 154:	c9                   	leave  
 155:	c3                   	ret    
 156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 160:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 164:	31 c0                	xor    %eax,%eax
 166:	29 d8                	sub    %ebx,%eax
}
 168:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 16b:	c9                   	leave  
 16c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 16d:	0f b6 19             	movzbl (%ecx),%ebx
 170:	31 c0                	xor    %eax,%eax
 172:	eb db                	jmp    14f <strcmp+0x2f>
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <strlen>:

uint
strlen(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 3a 00             	cmpb   $0x0,(%edx)
 189:	74 15                	je     1a0 <strlen+0x20>
 18b:	31 c0                	xor    %eax,%eax
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c0 01             	add    $0x1,%eax
 193:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 197:	89 c1                	mov    %eax,%ecx
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	89 c8                	mov    %ecx,%eax
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret    
 19f:	90                   	nop
  for(n = 0; s[n]; n++)
 1a0:	31 c9                	xor    %ecx,%ecx
}
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld    
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1c5:	89 d0                	mov    %edx,%eax
 1c7:	c9                   	leave  
 1c8:	c3                   	ret    
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	75 12                	jne    1f3 <strchr+0x23>
 1e1:	eb 1d                	jmp    200 <strchr+0x30>
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1ec:	83 c0 01             	add    $0x1,%eax
 1ef:	84 d2                	test   %dl,%dl
 1f1:	74 0d                	je     200 <strchr+0x30>
    if(*s == c)
 1f3:	38 d1                	cmp    %dl,%cl
 1f5:	75 f1                	jne    1e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret    
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 200:	31 c0                	xor    %eax,%eax
}
 202:	5d                   	pop    %ebp
 203:	c3                   	ret    
 204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 215:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 218:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 219:	31 db                	xor    %ebx,%ebx
{
 21b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 21e:	eb 27                	jmp    247 <gets+0x37>
    cc = read(0, &c, 1);
 220:	83 ec 04             	sub    $0x4,%esp
 223:	6a 01                	push   $0x1
 225:	57                   	push   %edi
 226:	6a 00                	push   $0x0
 228:	e8 2e 01 00 00       	call   35b <read>
    if(cc < 1)
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 1d                	jle    251 <gets+0x41>
      break;
    buf[i++] = c;
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	8b 55 08             	mov    0x8(%ebp),%edx
 23b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 23f:	3c 0a                	cmp    $0xa,%al
 241:	74 1d                	je     260 <gets+0x50>
 243:	3c 0d                	cmp    $0xd,%al
 245:	74 19                	je     260 <gets+0x50>
  for(i=0; i+1 < max; ){
 247:	89 de                	mov    %ebx,%esi
 249:	83 c3 01             	add    $0x1,%ebx
 24c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 24f:	7c cf                	jl     220 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 251:	8b 45 08             	mov    0x8(%ebp),%eax
 254:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 258:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25b:	5b                   	pop    %ebx
 25c:	5e                   	pop    %esi
 25d:	5f                   	pop    %edi
 25e:	5d                   	pop    %ebp
 25f:	c3                   	ret    
  buf[i] = '\0';
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	89 de                	mov    %ebx,%esi
 265:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 269:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26c:	5b                   	pop    %ebx
 26d:	5e                   	pop    %esi
 26e:	5f                   	pop    %edi
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    
 271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 278:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <stat>:

int
stat(const char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 285:	83 ec 08             	sub    $0x8,%esp
 288:	6a 00                	push   $0x0
 28a:	ff 75 08             	push   0x8(%ebp)
 28d:	e8 f1 00 00 00       	call   383 <open>
  if(fd < 0)
 292:	83 c4 10             	add    $0x10,%esp
 295:	85 c0                	test   %eax,%eax
 297:	78 27                	js     2c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	ff 75 0c             	push   0xc(%ebp)
 29f:	89 c3                	mov    %eax,%ebx
 2a1:	50                   	push   %eax
 2a2:	e8 f4 00 00 00       	call   39b <fstat>
  close(fd);
 2a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2aa:	89 c6                	mov    %eax,%esi
  close(fd);
 2ac:	e8 ba 00 00 00       	call   36b <close>
  return r;
 2b1:	83 c4 10             	add    $0x10,%esp
}
 2b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2b7:	89 f0                	mov    %esi,%eax
 2b9:	5b                   	pop    %ebx
 2ba:	5e                   	pop    %esi
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2c5:	eb ed                	jmp    2b4 <stat+0x34>
 2c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ce:	66 90                	xchg   %ax,%ax

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d7:	0f be 02             	movsbl (%edx),%eax
 2da:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2e5:	77 1e                	ja     305 <atoi+0x35>
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2f0:	83 c2 01             	add    $0x1,%edx
 2f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2fa:	0f be 02             	movsbl (%edx),%eax
 2fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 300:	80 fb 09             	cmp    $0x9,%bl
 303:	76 eb                	jbe    2f0 <atoi+0x20>
  return n;
}
 305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 308:	89 c8                	mov    %ecx,%eax
 30a:	c9                   	leave  
 30b:	c3                   	ret    
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	8b 45 10             	mov    0x10(%ebp),%eax
 317:	8b 55 08             	mov    0x8(%ebp),%edx
 31a:	56                   	push   %esi
 31b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 31e:	85 c0                	test   %eax,%eax
 320:	7e 13                	jle    335 <memmove+0x25>
 322:	01 d0                	add    %edx,%eax
  dst = vdst;
 324:	89 d7                	mov    %edx,%edi
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 331:	39 f8                	cmp    %edi,%eax
 333:	75 fb                	jne    330 <memmove+0x20>
  return vdst;
}
 335:	5e                   	pop    %esi
 336:	89 d0                	mov    %edx,%eax
 338:	5f                   	pop    %edi
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    

0000033b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33b:	b8 01 00 00 00       	mov    $0x1,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <exit>:
SYSCALL(exit)
 343:	b8 02 00 00 00       	mov    $0x2,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <wait>:
SYSCALL(wait)
 34b:	b8 03 00 00 00       	mov    $0x3,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <pipe>:
SYSCALL(pipe)
 353:	b8 04 00 00 00       	mov    $0x4,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <read>:
SYSCALL(read)
 35b:	b8 05 00 00 00       	mov    $0x5,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <write>:
SYSCALL(write)
 363:	b8 10 00 00 00       	mov    $0x10,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <close>:
SYSCALL(close)
 36b:	b8 15 00 00 00       	mov    $0x15,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <kill>:
SYSCALL(kill)
 373:	b8 06 00 00 00       	mov    $0x6,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <exec>:
SYSCALL(exec)
 37b:	b8 07 00 00 00       	mov    $0x7,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <open>:
SYSCALL(open)
 383:	b8 0f 00 00 00       	mov    $0xf,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <mknod>:
SYSCALL(mknod)
 38b:	b8 11 00 00 00       	mov    $0x11,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <unlink>:
SYSCALL(unlink)
 393:	b8 12 00 00 00       	mov    $0x12,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <fstat>:
SYSCALL(fstat)
 39b:	b8 08 00 00 00       	mov    $0x8,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <link>:
SYSCALL(link)
 3a3:	b8 13 00 00 00       	mov    $0x13,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <mkdir>:
SYSCALL(mkdir)
 3ab:	b8 14 00 00 00       	mov    $0x14,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <chdir>:
SYSCALL(chdir)
 3b3:	b8 09 00 00 00       	mov    $0x9,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <dup>:
SYSCALL(dup)
 3bb:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <getpid>:
SYSCALL(getpid)
 3c3:	b8 0b 00 00 00       	mov    $0xb,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <sbrk>:
SYSCALL(sbrk)
 3cb:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <sleep>:
SYSCALL(sleep)
 3d3:	b8 0d 00 00 00       	mov    $0xd,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <uptime>:
SYSCALL(uptime)
 3db:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <thread_create>:
SYSCALL(thread_create)
 3e3:	b8 16 00 00 00       	mov    $0x16,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <thread_join>:
SYSCALL(thread_join)
 3eb:	b8 18 00 00 00       	mov    $0x18,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <thread_exit>:
SYSCALL(thread_exit)
 3f3:	b8 17 00 00 00       	mov    $0x17,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <draw>:
SYSCALL(draw)
 3fb:	b8 19 00 00 00       	mov    $0x19,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <getNumProc>:
SYSCALL(getNumProc)
 403:	b8 1a 00 00 00       	mov    $0x1a,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <getMaxPid>:
SYSCALL(getMaxPid)
 40b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <getProcInfo>:
SYSCALL(getProcInfo)
 413:	b8 1c 00 00 00       	mov    $0x1c,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <set_burst_time>:
SYSCALL(set_burst_time)
 41b:	b8 1d 00 00 00       	mov    $0x1d,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <get_burst_time>:
SYSCALL(get_burst_time)
 423:	b8 1e 00 00 00       	mov    $0x1e,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <getCurrentInfo>:
SYSCALL(getCurrentInfo)
 42b:	b8 1f 00 00 00       	mov    $0x1f,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <getCurrentPID>:
SYSCALL(getCurrentPID)
 433:	b8 20 00 00 00       	mov    $0x20,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    
 43b:	66 90                	xchg   %ax,%ax
 43d:	66 90                	xchg   %ax,%ax
 43f:	90                   	nop

00000440 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	83 ec 3c             	sub    $0x3c,%esp
 449:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 44c:	89 d1                	mov    %edx,%ecx
{
 44e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 451:	85 d2                	test   %edx,%edx
 453:	0f 89 7f 00 00 00    	jns    4d8 <printint+0x98>
 459:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 45d:	74 79                	je     4d8 <printint+0x98>
    neg = 1;
 45f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 466:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 468:	31 db                	xor    %ebx,%ebx
 46a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 46d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 470:	89 c8                	mov    %ecx,%eax
 472:	31 d2                	xor    %edx,%edx
 474:	89 cf                	mov    %ecx,%edi
 476:	f7 75 c4             	divl   -0x3c(%ebp)
 479:	0f b6 92 f8 0a 00 00 	movzbl 0xaf8(%edx),%edx
 480:	89 45 c0             	mov    %eax,-0x40(%ebp)
 483:	89 d8                	mov    %ebx,%eax
 485:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 488:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 48b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 48e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 491:	76 dd                	jbe    470 <printint+0x30>
  if(neg)
 493:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 496:	85 c9                	test   %ecx,%ecx
 498:	74 0c                	je     4a6 <printint+0x66>
    buf[i++] = '-';
 49a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 49f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4a1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4a6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4a9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4ad:	eb 07                	jmp    4b6 <printint+0x76>
 4af:	90                   	nop
    putc(fd, buf[i]);
 4b0:	0f b6 13             	movzbl (%ebx),%edx
 4b3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4b6:	83 ec 04             	sub    $0x4,%esp
 4b9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4bc:	6a 01                	push   $0x1
 4be:	56                   	push   %esi
 4bf:	57                   	push   %edi
 4c0:	e8 9e fe ff ff       	call   363 <write>
  while(--i >= 0)
 4c5:	83 c4 10             	add    $0x10,%esp
 4c8:	39 de                	cmp    %ebx,%esi
 4ca:	75 e4                	jne    4b0 <printint+0x70>
}
 4cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4cf:	5b                   	pop    %ebx
 4d0:	5e                   	pop    %esi
 4d1:	5f                   	pop    %edi
 4d2:	5d                   	pop    %ebp
 4d3:	c3                   	ret    
 4d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4d8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4df:	eb 87                	jmp    468 <printint+0x28>
 4e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ef:	90                   	nop

000004f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 4fc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 4ff:	0f b6 13             	movzbl (%ebx),%edx
 502:	84 d2                	test   %dl,%dl
 504:	74 6a                	je     570 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 506:	8d 45 10             	lea    0x10(%ebp),%eax
 509:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 50c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 50f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 511:	89 45 d0             	mov    %eax,-0x30(%ebp)
 514:	eb 36                	jmp    54c <printf+0x5c>
 516:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51d:	8d 76 00             	lea    0x0(%esi),%esi
 520:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 523:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 528:	83 f8 25             	cmp    $0x25,%eax
 52b:	74 15                	je     542 <printf+0x52>
  write(fd, &c, 1);
 52d:	83 ec 04             	sub    $0x4,%esp
 530:	88 55 e7             	mov    %dl,-0x19(%ebp)
 533:	6a 01                	push   $0x1
 535:	57                   	push   %edi
 536:	56                   	push   %esi
 537:	e8 27 fe ff ff       	call   363 <write>
 53c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 53f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 542:	0f b6 13             	movzbl (%ebx),%edx
 545:	83 c3 01             	add    $0x1,%ebx
 548:	84 d2                	test   %dl,%dl
 54a:	74 24                	je     570 <printf+0x80>
    c = fmt[i] & 0xff;
 54c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 54f:	85 c9                	test   %ecx,%ecx
 551:	74 cd                	je     520 <printf+0x30>
      }
    } else if(state == '%'){
 553:	83 f9 25             	cmp    $0x25,%ecx
 556:	75 ea                	jne    542 <printf+0x52>
      if(c == 'd'){
 558:	83 f8 25             	cmp    $0x25,%eax
 55b:	0f 84 07 01 00 00    	je     668 <printf+0x178>
 561:	83 e8 63             	sub    $0x63,%eax
 564:	83 f8 15             	cmp    $0x15,%eax
 567:	77 17                	ja     580 <printf+0x90>
 569:	ff 24 85 a0 0a 00 00 	jmp    *0xaa0(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 570:	8d 65 f4             	lea    -0xc(%ebp),%esp
 573:	5b                   	pop    %ebx
 574:	5e                   	pop    %esi
 575:	5f                   	pop    %edi
 576:	5d                   	pop    %ebp
 577:	c3                   	ret    
 578:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57f:	90                   	nop
  write(fd, &c, 1);
 580:	83 ec 04             	sub    $0x4,%esp
 583:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 586:	6a 01                	push   $0x1
 588:	57                   	push   %edi
 589:	56                   	push   %esi
 58a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 58e:	e8 d0 fd ff ff       	call   363 <write>
        putc(fd, c);
 593:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 597:	83 c4 0c             	add    $0xc,%esp
 59a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 59d:	6a 01                	push   $0x1
 59f:	57                   	push   %edi
 5a0:	56                   	push   %esi
 5a1:	e8 bd fd ff ff       	call   363 <write>
        putc(fd, c);
 5a6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5a9:	31 c9                	xor    %ecx,%ecx
 5ab:	eb 95                	jmp    542 <printf+0x52>
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5b0:	83 ec 0c             	sub    $0xc,%esp
 5b3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5b8:	6a 00                	push   $0x0
 5ba:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5bd:	8b 10                	mov    (%eax),%edx
 5bf:	89 f0                	mov    %esi,%eax
 5c1:	e8 7a fe ff ff       	call   440 <printint>
        ap++;
 5c6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5ca:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5cd:	31 c9                	xor    %ecx,%ecx
 5cf:	e9 6e ff ff ff       	jmp    542 <printf+0x52>
 5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5d8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5db:	8b 10                	mov    (%eax),%edx
        ap++;
 5dd:	83 c0 04             	add    $0x4,%eax
 5e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5e3:	85 d2                	test   %edx,%edx
 5e5:	0f 84 8d 00 00 00    	je     678 <printf+0x188>
        while(*s != 0){
 5eb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 5ee:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 5f0:	84 c0                	test   %al,%al
 5f2:	0f 84 4a ff ff ff    	je     542 <printf+0x52>
 5f8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5fb:	89 d3                	mov    %edx,%ebx
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 600:	83 ec 04             	sub    $0x4,%esp
          s++;
 603:	83 c3 01             	add    $0x1,%ebx
 606:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 609:	6a 01                	push   $0x1
 60b:	57                   	push   %edi
 60c:	56                   	push   %esi
 60d:	e8 51 fd ff ff       	call   363 <write>
        while(*s != 0){
 612:	0f b6 03             	movzbl (%ebx),%eax
 615:	83 c4 10             	add    $0x10,%esp
 618:	84 c0                	test   %al,%al
 61a:	75 e4                	jne    600 <printf+0x110>
      state = 0;
 61c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 61f:	31 c9                	xor    %ecx,%ecx
 621:	e9 1c ff ff ff       	jmp    542 <printf+0x52>
 626:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 630:	83 ec 0c             	sub    $0xc,%esp
 633:	b9 0a 00 00 00       	mov    $0xa,%ecx
 638:	6a 01                	push   $0x1
 63a:	e9 7b ff ff ff       	jmp    5ba <printf+0xca>
 63f:	90                   	nop
        putc(fd, *ap);
 640:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 643:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 646:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 648:	6a 01                	push   $0x1
 64a:	57                   	push   %edi
 64b:	56                   	push   %esi
        putc(fd, *ap);
 64c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 64f:	e8 0f fd ff ff       	call   363 <write>
        ap++;
 654:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 658:	83 c4 10             	add    $0x10,%esp
      state = 0;
 65b:	31 c9                	xor    %ecx,%ecx
 65d:	e9 e0 fe ff ff       	jmp    542 <printf+0x52>
 662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 668:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 66b:	83 ec 04             	sub    $0x4,%esp
 66e:	e9 2a ff ff ff       	jmp    59d <printf+0xad>
 673:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 677:	90                   	nop
          s = "(null)";
 678:	ba 98 0a 00 00       	mov    $0xa98,%edx
        while(*s != 0){
 67d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 680:	b8 28 00 00 00       	mov    $0x28,%eax
 685:	89 d3                	mov    %edx,%ebx
 687:	e9 74 ff ff ff       	jmp    600 <printf+0x110>
 68c:	66 90                	xchg   %ax,%ax
 68e:	66 90                	xchg   %ax,%ax

00000690 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 690:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 691:	a1 40 0e 00 00       	mov    0xe40,%eax
{
 696:	89 e5                	mov    %esp,%ebp
 698:	57                   	push   %edi
 699:	56                   	push   %esi
 69a:	53                   	push   %ebx
 69b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 69e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6a8:	89 c2                	mov    %eax,%edx
 6aa:	8b 00                	mov    (%eax),%eax
 6ac:	39 ca                	cmp    %ecx,%edx
 6ae:	73 30                	jae    6e0 <free+0x50>
 6b0:	39 c1                	cmp    %eax,%ecx
 6b2:	72 04                	jb     6b8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b4:	39 c2                	cmp    %eax,%edx
 6b6:	72 f0                	jb     6a8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6be:	39 f8                	cmp    %edi,%eax
 6c0:	74 30                	je     6f2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6c2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6c5:	8b 42 04             	mov    0x4(%edx),%eax
 6c8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6cb:	39 f1                	cmp    %esi,%ecx
 6cd:	74 3a                	je     709 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6cf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6d1:	5b                   	pop    %ebx
  freep = p;
 6d2:	89 15 40 0e 00 00    	mov    %edx,0xe40
}
 6d8:	5e                   	pop    %esi
 6d9:	5f                   	pop    %edi
 6da:	5d                   	pop    %ebp
 6db:	c3                   	ret    
 6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e0:	39 c2                	cmp    %eax,%edx
 6e2:	72 c4                	jb     6a8 <free+0x18>
 6e4:	39 c1                	cmp    %eax,%ecx
 6e6:	73 c0                	jae    6a8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 6e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ee:	39 f8                	cmp    %edi,%eax
 6f0:	75 d0                	jne    6c2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 6f2:	03 70 04             	add    0x4(%eax),%esi
 6f5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6f8:	8b 02                	mov    (%edx),%eax
 6fa:	8b 00                	mov    (%eax),%eax
 6fc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 6ff:	8b 42 04             	mov    0x4(%edx),%eax
 702:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 705:	39 f1                	cmp    %esi,%ecx
 707:	75 c6                	jne    6cf <free+0x3f>
    p->s.size += bp->s.size;
 709:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 70c:	89 15 40 0e 00 00    	mov    %edx,0xe40
    p->s.size += bp->s.size;
 712:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 715:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 718:	89 0a                	mov    %ecx,(%edx)
}
 71a:	5b                   	pop    %ebx
 71b:	5e                   	pop    %esi
 71c:	5f                   	pop    %edi
 71d:	5d                   	pop    %ebp
 71e:	c3                   	ret    
 71f:	90                   	nop

00000720 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	57                   	push   %edi
 724:	56                   	push   %esi
 725:	53                   	push   %ebx
 726:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 729:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 72c:	8b 3d 40 0e 00 00    	mov    0xe40,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 732:	8d 70 07             	lea    0x7(%eax),%esi
 735:	c1 ee 03             	shr    $0x3,%esi
 738:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 73b:	85 ff                	test   %edi,%edi
 73d:	0f 84 9d 00 00 00    	je     7e0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 743:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 745:	8b 4a 04             	mov    0x4(%edx),%ecx
 748:	39 f1                	cmp    %esi,%ecx
 74a:	73 6a                	jae    7b6 <malloc+0x96>
 74c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 751:	39 de                	cmp    %ebx,%esi
 753:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 756:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 75d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 760:	eb 17                	jmp    779 <malloc+0x59>
 762:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 768:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 76a:	8b 48 04             	mov    0x4(%eax),%ecx
 76d:	39 f1                	cmp    %esi,%ecx
 76f:	73 4f                	jae    7c0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 771:	8b 3d 40 0e 00 00    	mov    0xe40,%edi
 777:	89 c2                	mov    %eax,%edx
 779:	39 d7                	cmp    %edx,%edi
 77b:	75 eb                	jne    768 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 77d:	83 ec 0c             	sub    $0xc,%esp
 780:	ff 75 e4             	push   -0x1c(%ebp)
 783:	e8 43 fc ff ff       	call   3cb <sbrk>
  if(p == (char*)-1)
 788:	83 c4 10             	add    $0x10,%esp
 78b:	83 f8 ff             	cmp    $0xffffffff,%eax
 78e:	74 1c                	je     7ac <malloc+0x8c>
  hp->s.size = nu;
 790:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 793:	83 ec 0c             	sub    $0xc,%esp
 796:	83 c0 08             	add    $0x8,%eax
 799:	50                   	push   %eax
 79a:	e8 f1 fe ff ff       	call   690 <free>
  return freep;
 79f:	8b 15 40 0e 00 00    	mov    0xe40,%edx
      if((p = morecore(nunits)) == 0)
 7a5:	83 c4 10             	add    $0x10,%esp
 7a8:	85 d2                	test   %edx,%edx
 7aa:	75 bc                	jne    768 <malloc+0x48>
        return 0;
  }
}
 7ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7af:	31 c0                	xor    %eax,%eax
}
 7b1:	5b                   	pop    %ebx
 7b2:	5e                   	pop    %esi
 7b3:	5f                   	pop    %edi
 7b4:	5d                   	pop    %ebp
 7b5:	c3                   	ret    
    if(p->s.size >= nunits){
 7b6:	89 d0                	mov    %edx,%eax
 7b8:	89 fa                	mov    %edi,%edx
 7ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7c0:	39 ce                	cmp    %ecx,%esi
 7c2:	74 4c                	je     810 <malloc+0xf0>
        p->s.size -= nunits;
 7c4:	29 f1                	sub    %esi,%ecx
 7c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7cc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 7cf:	89 15 40 0e 00 00    	mov    %edx,0xe40
}
 7d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7d8:	83 c0 08             	add    $0x8,%eax
}
 7db:	5b                   	pop    %ebx
 7dc:	5e                   	pop    %esi
 7dd:	5f                   	pop    %edi
 7de:	5d                   	pop    %ebp
 7df:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 7e0:	c7 05 40 0e 00 00 44 	movl   $0xe44,0xe40
 7e7:	0e 00 00 
    base.s.size = 0;
 7ea:	bf 44 0e 00 00       	mov    $0xe44,%edi
    base.s.ptr = freep = prevp = &base;
 7ef:	c7 05 44 0e 00 00 44 	movl   $0xe44,0xe44
 7f6:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 7fb:	c7 05 48 0e 00 00 00 	movl   $0x0,0xe48
 802:	00 00 00 
    if(p->s.size >= nunits){
 805:	e9 42 ff ff ff       	jmp    74c <malloc+0x2c>
 80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 810:	8b 08                	mov    (%eax),%ecx
 812:	89 0a                	mov    %ecx,(%edx)
 814:	eb b9                	jmp    7cf <malloc+0xaf>
 816:	66 90                	xchg   %ax,%ax
 818:	66 90                	xchg   %ax,%ax
 81a:	66 90                	xchg   %ax,%ax
 81c:	66 90                	xchg   %ax,%ax
 81e:	66 90                	xchg   %ax,%ax

00000820 <sgenrand>:
static int mti=N+1; /* mti==N+1 means mt[N] is not initialized */

/* initializing the array with a NONZERO seed */
void
sgenrand(unsigned long seed)
{
 820:	55                   	push   %ebp
 821:	b8 64 0e 00 00       	mov    $0xe64,%eax
 826:	89 e5                	mov    %esp,%ebp
 828:	8b 55 08             	mov    0x8(%ebp),%edx
    /* setting initial seeds to mt[N] using         */
    /* the generator Line 25 of Table 1 in          */
    /* [KNUTH 1981, The Art of Computer Programming */
    /*    Vol. 2 (2nd Ed.), pp102]                  */
    mt[0]= seed & 0xffffffff;
 82b:	89 15 60 0e 00 00    	mov    %edx,0xe60
    for (mti=1; mti<N; mti++)
 831:	eb 08                	jmp    83b <sgenrand+0x1b>
 833:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 837:	90                   	nop
 838:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 83b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 841:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 843:	3d 1c 18 00 00       	cmp    $0x181c,%eax
 848:	75 ee                	jne    838 <sgenrand+0x18>
 84a:	c7 05 3c 0e 00 00 70 	movl   $0x270,0xe3c
 851:	02 00 00 
}
 854:	5d                   	pop    %ebp
 855:	c3                   	ret    
 856:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 85d:	8d 76 00             	lea    0x0(%esi),%esi

00000860 <genrand>:
{
    unsigned long y;
    static unsigned long mag01[2]={0x0, MATRIX_A};
    /* mag01[x] = x * MATRIX_A  for x=0,1 */

    if (mti >= N) { /* generate N words at one time */
 860:	a1 3c 0e 00 00       	mov    0xe3c,%eax
 865:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 86a:	7f 3d                	jg     8a9 <genrand+0x49>
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];

        mti = 0;
    }
  
    y = mt[mti++];
 86c:	8b 0c 85 60 0e 00 00 	mov    0xe60(,%eax,4),%ecx
 873:	8d 50 01             	lea    0x1(%eax),%edx
 876:	89 15 3c 0e 00 00    	mov    %edx,0xe3c
    y ^= TEMPERING_SHIFT_U(y);
 87c:	89 ca                	mov    %ecx,%edx
 87e:	c1 ea 0b             	shr    $0xb,%edx
 881:	31 ca                	xor    %ecx,%edx
    y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
 883:	89 d0                	mov    %edx,%eax
 885:	c1 e0 07             	shl    $0x7,%eax
 888:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
 88d:	31 d0                	xor    %edx,%eax
    y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
 88f:	89 c2                	mov    %eax,%edx
 891:	c1 e2 0f             	shl    $0xf,%edx
 894:	81 e2 00 00 c6 ef    	and    $0xefc60000,%edx
 89a:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_L(y);
 89c:	89 d0                	mov    %edx,%eax
 89e:	c1 e8 12             	shr    $0x12,%eax
 8a1:	31 d0                	xor    %edx,%eax

    // Strip off uppermost bit because we want a long,
    // not an unsigned long
    return y & RAND_MAX;
 8a3:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
 8a8:	c3                   	ret    
        if (mti == N+1)   /* if sgenrand() has not been called, */
 8a9:	3d 71 02 00 00       	cmp    $0x271,%eax
 8ae:	0f 84 d4 00 00 00    	je     988 <genrand+0x128>
    mt[0]= seed & 0xffffffff;
 8b4:	31 c0                	xor    %eax,%eax
 8b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8bd:	8d 76 00             	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 8c0:	8b 0c 85 60 0e 00 00 	mov    0xe60(,%eax,4),%ecx
 8c7:	83 c0 01             	add    $0x1,%eax
 8ca:	8b 14 85 60 0e 00 00 	mov    0xe60(,%eax,4),%edx
 8d1:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 8d7:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 8dd:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1];
 8df:	89 d1                	mov    %edx,%ecx
 8e1:	83 e2 01             	and    $0x1,%edx
 8e4:	d1 e9                	shr    %ecx
 8e6:	33 0c 85 90 14 00 00 	xor    0x1490(,%eax,4),%ecx
 8ed:	33 0c 95 0c 0b 00 00 	xor    0xb0c(,%edx,4),%ecx
 8f4:	89 0c 85 5c 0e 00 00 	mov    %ecx,0xe5c(,%eax,4)
        for (kk=0;kk<N-M;kk++) {
 8fb:	3d e3 00 00 00       	cmp    $0xe3,%eax
 900:	75 be                	jne    8c0 <genrand+0x60>
 902:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 908:	8b 0c 85 60 0e 00 00 	mov    0xe60(,%eax,4),%ecx
 90f:	83 c0 01             	add    $0x1,%eax
 912:	8b 14 85 60 0e 00 00 	mov    0xe60(,%eax,4),%edx
 919:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 91f:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 925:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1];
 927:	89 d1                	mov    %edx,%ecx
 929:	83 e2 01             	and    $0x1,%edx
 92c:	d1 e9                	shr    %ecx
 92e:	33 0c 85 d0 0a 00 00 	xor    0xad0(,%eax,4),%ecx
 935:	33 0c 95 0c 0b 00 00 	xor    0xb0c(,%edx,4),%ecx
 93c:	89 0c 85 5c 0e 00 00 	mov    %ecx,0xe5c(,%eax,4)
        for (;kk<N-1;kk++) {
 943:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 948:	75 be                	jne    908 <genrand+0xa8>
        y = (mt[N-1]&UPPER_MASK)|(mt[0]&LOWER_MASK);
 94a:	8b 0d 60 0e 00 00    	mov    0xe60,%ecx
 950:	a1 1c 18 00 00       	mov    0x181c,%eax
 955:	89 ca                	mov    %ecx,%edx
 957:	25 00 00 00 80       	and    $0x80000000,%eax
 95c:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 962:	09 d0                	or     %edx,%eax
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];
 964:	89 c2                	mov    %eax,%edx
 966:	83 e0 01             	and    $0x1,%eax
 969:	d1 ea                	shr    %edx
 96b:	33 15 90 14 00 00    	xor    0x1490,%edx
 971:	33 14 85 0c 0b 00 00 	xor    0xb0c(,%eax,4),%edx
 978:	89 15 1c 18 00 00    	mov    %edx,0x181c
 97e:	ba 01 00 00 00       	mov    $0x1,%edx
 983:	e9 ee fe ff ff       	jmp    876 <genrand+0x16>
    mt[0]= seed & 0xffffffff;
 988:	b8 64 0e 00 00       	mov    $0xe64,%eax
 98d:	b9 1c 18 00 00       	mov    $0x181c,%ecx
 992:	ba 05 11 00 00       	mov    $0x1105,%edx
 997:	c7 05 60 0e 00 00 05 	movl   $0x1105,0xe60
 99e:	11 00 00 
    for (mti=1; mti<N; mti++)
 9a1:	eb 08                	jmp    9ab <genrand+0x14b>
 9a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9a7:	90                   	nop
 9a8:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 9ab:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 9b1:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 9b3:	39 c1                	cmp    %eax,%ecx
 9b5:	75 f1                	jne    9a8 <genrand+0x148>
 9b7:	e9 f8 fe ff ff       	jmp    8b4 <genrand+0x54>
 9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009c0 <random_at_most>:

// Assumes 0 <= max <= RAND_MAX
// Returns in the half-open interval [0, max]
long random_at_most(long max) {
 9c0:	55                   	push   %ebp
  unsigned long
    // max <= RAND_MAX < ULONG_MAX, so this is okay.
    num_bins = (unsigned long) max + 1,
    num_rand = (unsigned long) RAND_MAX + 1,
    bin_size = num_rand / num_bins,
 9c1:	31 d2                	xor    %edx,%edx
long random_at_most(long max) {
 9c3:	89 e5                	mov    %esp,%ebp
 9c5:	56                   	push   %esi
    num_bins = (unsigned long) max + 1,
 9c6:	8b 45 08             	mov    0x8(%ebp),%eax
long random_at_most(long max) {
 9c9:	53                   	push   %ebx
    bin_size = num_rand / num_bins,
 9ca:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    num_bins = (unsigned long) max + 1,
 9cf:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 9d2:	89 d8                	mov    %ebx,%eax
 9d4:	f7 f1                	div    %ecx
 9d6:	89 c6                	mov    %eax,%esi
  long x;
  do {
   x = genrand();
  }
  // This is carefully written not to overflow
  while (num_rand - defect <= (unsigned long)x);
 9d8:	29 d3                	sub    %edx,%ebx
 9da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   x = genrand();
 9e0:	e8 7b fe ff ff       	call   860 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 9e5:	39 d8                	cmp    %ebx,%eax
 9e7:	73 f7                	jae    9e0 <random_at_most+0x20>

  // Truncated division is intentional
  return x/bin_size;
 9e9:	31 d2                	xor    %edx,%edx
}
 9eb:	5b                   	pop    %ebx
  return x/bin_size;
 9ec:	f7 f6                	div    %esi
}
 9ee:	5e                   	pop    %esi
 9ef:	5d                   	pop    %ebp
 9f0:	c3                   	ret    
 9f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9ff:	90                   	nop

00000a00 <randomrange>:

int randomrange(int low, int high){
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
 a03:	57                   	push   %edi
 a04:	56                   	push   %esi
 a05:	53                   	push   %ebx
 a06:	83 ec 0c             	sub    $0xc,%esp
 a09:	8b 75 08             	mov    0x8(%ebp),%esi
 a0c:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(high<low){
 a0f:	39 f0                	cmp    %esi,%eax
 a11:	7d 06                	jge    a19 <randomrange+0x19>
 a13:	89 f2                	mov    %esi,%edx
 a15:	89 c6                	mov    %eax,%esi
 a17:	89 d0                	mov    %edx,%eax
    int temp=high;
    high=low;
    low=temp;
  }
  int val = random_at_most(high-low) + low;
 a19:	29 f0                	sub    %esi,%eax
    bin_size = num_rand / num_bins,
 a1b:	bb 00 00 00 80       	mov    $0x80000000,%ebx
 a20:	31 d2                	xor    %edx,%edx
    num_bins = (unsigned long) max + 1,
 a22:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 a25:	89 d8                	mov    %ebx,%eax
 a27:	f7 f1                	div    %ecx
 a29:	89 c7                	mov    %eax,%edi
  while (num_rand - defect <= (unsigned long)x);
 a2b:	29 d3                	sub    %edx,%ebx
 a2d:	8d 76 00             	lea    0x0(%esi),%esi
   x = genrand();
 a30:	e8 2b fe ff ff       	call   860 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 a35:	39 d8                	cmp    %ebx,%eax
 a37:	73 f7                	jae    a30 <randomrange+0x30>
  return x/bin_size;
 a39:	31 d2                	xor    %edx,%edx
  return val;
}
 a3b:	83 c4 0c             	add    $0xc,%esp
  return x/bin_size;
 a3e:	f7 f7                	div    %edi
}
 a40:	5b                   	pop    %ebx
  int val = random_at_most(high-low) + low;
 a41:	01 f0                	add    %esi,%eax
}
 a43:	5e                   	pop    %esi
 a44:	5f                   	pop    %edi
 a45:	5d                   	pop    %ebp
 a46:	c3                   	ret    
