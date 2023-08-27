
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 47                	jle    65 <main+0x65>
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  23:	83 c3 01             	add    $0x1,%ebx
  26:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  2a:	39 f3                	cmp    %esi,%ebx
  2c:	74 22                	je     50 <main+0x50>
  2e:	66 90                	xchg   %ax,%ax
  30:	68 c8 09 00 00       	push   $0x9c8
  35:	83 c3 01             	add    $0x1,%ebx
  38:	50                   	push   %eax
  39:	68 ca 09 00 00       	push   $0x9ca
  3e:	6a 01                	push   $0x1
  40:	e8 2b 04 00 00       	call   470 <printf>
  45:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  49:	83 c4 10             	add    $0x10,%esp
  4c:	39 f3                	cmp    %esi,%ebx
  4e:	75 e0                	jne    30 <main+0x30>
  50:	68 cf 09 00 00       	push   $0x9cf
  55:	50                   	push   %eax
  56:	68 ca 09 00 00       	push   $0x9ca
  5b:	6a 01                	push   $0x1
  5d:	e8 0e 04 00 00       	call   470 <printf>
  62:	83 c4 10             	add    $0x10,%esp
  exit();
  65:	e8 59 02 00 00       	call   2c3 <exit>
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  70:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  71:	31 c0                	xor    %eax,%eax
{
  73:	89 e5                	mov    %esp,%ebp
  75:	53                   	push   %ebx
  76:	8b 4d 08             	mov    0x8(%ebp),%ecx
  79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  87:	83 c0 01             	add    $0x1,%eax
  8a:	84 d2                	test   %dl,%dl
  8c:	75 f2                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  91:	89 c8                	mov    %ecx,%eax
  93:	c9                   	leave  
  94:	c3                   	ret    
  95:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  a4:	8b 55 08             	mov    0x8(%ebp),%edx
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  aa:	0f b6 02             	movzbl (%edx),%eax
  ad:	84 c0                	test   %al,%al
  af:	75 17                	jne    c8 <strcmp+0x28>
  b1:	eb 3a                	jmp    ed <strcmp+0x4d>
  b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b7:	90                   	nop
  b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  bc:	83 c2 01             	add    $0x1,%edx
  bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  c2:	84 c0                	test   %al,%al
  c4:	74 1a                	je     e0 <strcmp+0x40>
    p++, q++;
  c6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  c8:	0f b6 19             	movzbl (%ecx),%ebx
  cb:	38 c3                	cmp    %al,%bl
  cd:	74 e9                	je     b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  cf:	29 d8                	sub    %ebx,%eax
}
  d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d4:	c9                   	leave  
  d5:	c3                   	ret    
  d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  e4:	31 c0                	xor    %eax,%eax
  e6:	29 d8                	sub    %ebx,%eax
}
  e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  eb:	c9                   	leave  
  ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  ed:	0f b6 19             	movzbl (%ecx),%ebx
  f0:	31 c0                	xor    %eax,%eax
  f2:	eb db                	jmp    cf <strcmp+0x2f>
  f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ff:	90                   	nop

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 106:	80 3a 00             	cmpb   $0x0,(%edx)
 109:	74 15                	je     120 <strlen+0x20>
 10b:	31 c0                	xor    %eax,%eax
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c0 01             	add    $0x1,%eax
 113:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 117:	89 c1                	mov    %eax,%ecx
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	89 c8                	mov    %ecx,%eax
 11d:	5d                   	pop    %ebp
 11e:	c3                   	ret    
 11f:	90                   	nop
  for(n = 0; s[n]; n++)
 120:	31 c9                	xor    %ecx,%ecx
}
 122:	5d                   	pop    %ebp
 123:	89 c8                	mov    %ecx,%eax
 125:	c3                   	ret    
 126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12d:	8d 76 00             	lea    0x0(%esi),%esi

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	8b 7d fc             	mov    -0x4(%ebp),%edi
 145:	89 d0                	mov    %edx,%eax
 147:	c9                   	leave  
 148:	c3                   	ret    
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	75 12                	jne    173 <strchr+0x23>
 161:	eb 1d                	jmp    180 <strchr+0x30>
 163:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 167:	90                   	nop
 168:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 16c:	83 c0 01             	add    $0x1,%eax
 16f:	84 d2                	test   %dl,%dl
 171:	74 0d                	je     180 <strchr+0x30>
    if(*s == c)
 173:	38 d1                	cmp    %dl,%cl
 175:	75 f1                	jne    168 <strchr+0x18>
      return (char*)s;
  return 0;
}
 177:	5d                   	pop    %ebp
 178:	c3                   	ret    
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 180:	31 c0                	xor    %eax,%eax
}
 182:	5d                   	pop    %ebp
 183:	c3                   	ret    
 184:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 18f:	90                   	nop

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 195:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 198:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 199:	31 db                	xor    %ebx,%ebx
{
 19b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 19e:	eb 27                	jmp    1c7 <gets+0x37>
    cc = read(0, &c, 1);
 1a0:	83 ec 04             	sub    $0x4,%esp
 1a3:	6a 01                	push   $0x1
 1a5:	57                   	push   %edi
 1a6:	6a 00                	push   $0x0
 1a8:	e8 2e 01 00 00       	call   2db <read>
    if(cc < 1)
 1ad:	83 c4 10             	add    $0x10,%esp
 1b0:	85 c0                	test   %eax,%eax
 1b2:	7e 1d                	jle    1d1 <gets+0x41>
      break;
    buf[i++] = c;
 1b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
 1bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1bf:	3c 0a                	cmp    $0xa,%al
 1c1:	74 1d                	je     1e0 <gets+0x50>
 1c3:	3c 0d                	cmp    $0xd,%al
 1c5:	74 19                	je     1e0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1c7:	89 de                	mov    %ebx,%esi
 1c9:	83 c3 01             	add    $0x1,%ebx
 1cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1cf:	7c cf                	jl     1a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1d1:	8b 45 08             	mov    0x8(%ebp),%eax
 1d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1db:	5b                   	pop    %ebx
 1dc:	5e                   	pop    %esi
 1dd:	5f                   	pop    %edi
 1de:	5d                   	pop    %ebp
 1df:	c3                   	ret    
  buf[i] = '\0';
 1e0:	8b 45 08             	mov    0x8(%ebp),%eax
 1e3:	89 de                	mov    %ebx,%esi
 1e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ec:	5b                   	pop    %ebx
 1ed:	5e                   	pop    %esi
 1ee:	5f                   	pop    %edi
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    
 1f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ff:	90                   	nop

00000200 <stat>:

int
stat(const char *n, struct stat *st)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 205:	83 ec 08             	sub    $0x8,%esp
 208:	6a 00                	push   $0x0
 20a:	ff 75 08             	push   0x8(%ebp)
 20d:	e8 f1 00 00 00       	call   303 <open>
  if(fd < 0)
 212:	83 c4 10             	add    $0x10,%esp
 215:	85 c0                	test   %eax,%eax
 217:	78 27                	js     240 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 219:	83 ec 08             	sub    $0x8,%esp
 21c:	ff 75 0c             	push   0xc(%ebp)
 21f:	89 c3                	mov    %eax,%ebx
 221:	50                   	push   %eax
 222:	e8 f4 00 00 00       	call   31b <fstat>
  close(fd);
 227:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 22a:	89 c6                	mov    %eax,%esi
  close(fd);
 22c:	e8 ba 00 00 00       	call   2eb <close>
  return r;
 231:	83 c4 10             	add    $0x10,%esp
}
 234:	8d 65 f8             	lea    -0x8(%ebp),%esp
 237:	89 f0                	mov    %esi,%eax
 239:	5b                   	pop    %ebx
 23a:	5e                   	pop    %esi
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 240:	be ff ff ff ff       	mov    $0xffffffff,%esi
 245:	eb ed                	jmp    234 <stat+0x34>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax

00000250 <atoi>:

int
atoi(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 257:	0f be 02             	movsbl (%edx),%eax
 25a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 25d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 260:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 265:	77 1e                	ja     285 <atoi+0x35>
 267:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 270:	83 c2 01             	add    $0x1,%edx
 273:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 276:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 27a:	0f be 02             	movsbl (%edx),%eax
 27d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 280:	80 fb 09             	cmp    $0x9,%bl
 283:	76 eb                	jbe    270 <atoi+0x20>
  return n;
}
 285:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 288:	89 c8                	mov    %ecx,%eax
 28a:	c9                   	leave  
 28b:	c3                   	ret    
 28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	8b 45 10             	mov    0x10(%ebp),%eax
 297:	8b 55 08             	mov    0x8(%ebp),%edx
 29a:	56                   	push   %esi
 29b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 29e:	85 c0                	test   %eax,%eax
 2a0:	7e 13                	jle    2b5 <memmove+0x25>
 2a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2a4:	89 d7                	mov    %edx,%edi
 2a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2b1:	39 f8                	cmp    %edi,%eax
 2b3:	75 fb                	jne    2b0 <memmove+0x20>
  return vdst;
}
 2b5:	5e                   	pop    %esi
 2b6:	89 d0                	mov    %edx,%eax
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    

000002bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2bb:	b8 01 00 00 00       	mov    $0x1,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <exit>:
SYSCALL(exit)
 2c3:	b8 02 00 00 00       	mov    $0x2,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <wait>:
SYSCALL(wait)
 2cb:	b8 03 00 00 00       	mov    $0x3,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <pipe>:
SYSCALL(pipe)
 2d3:	b8 04 00 00 00       	mov    $0x4,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <read>:
SYSCALL(read)
 2db:	b8 05 00 00 00       	mov    $0x5,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <write>:
SYSCALL(write)
 2e3:	b8 10 00 00 00       	mov    $0x10,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <close>:
SYSCALL(close)
 2eb:	b8 15 00 00 00       	mov    $0x15,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <kill>:
SYSCALL(kill)
 2f3:	b8 06 00 00 00       	mov    $0x6,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <exec>:
SYSCALL(exec)
 2fb:	b8 07 00 00 00       	mov    $0x7,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <open>:
SYSCALL(open)
 303:	b8 0f 00 00 00       	mov    $0xf,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <mknod>:
SYSCALL(mknod)
 30b:	b8 11 00 00 00       	mov    $0x11,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <unlink>:
SYSCALL(unlink)
 313:	b8 12 00 00 00       	mov    $0x12,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <fstat>:
SYSCALL(fstat)
 31b:	b8 08 00 00 00       	mov    $0x8,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <link>:
SYSCALL(link)
 323:	b8 13 00 00 00       	mov    $0x13,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <mkdir>:
SYSCALL(mkdir)
 32b:	b8 14 00 00 00       	mov    $0x14,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <chdir>:
SYSCALL(chdir)
 333:	b8 09 00 00 00       	mov    $0x9,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <dup>:
SYSCALL(dup)
 33b:	b8 0a 00 00 00       	mov    $0xa,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <getpid>:
SYSCALL(getpid)
 343:	b8 0b 00 00 00       	mov    $0xb,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <sbrk>:
SYSCALL(sbrk)
 34b:	b8 0c 00 00 00       	mov    $0xc,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <sleep>:
SYSCALL(sleep)
 353:	b8 0d 00 00 00       	mov    $0xd,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <uptime>:
SYSCALL(uptime)
 35b:	b8 0e 00 00 00       	mov    $0xe,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <thread_create>:
SYSCALL(thread_create)
 363:	b8 16 00 00 00       	mov    $0x16,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <thread_join>:
SYSCALL(thread_join)
 36b:	b8 18 00 00 00       	mov    $0x18,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <thread_exit>:
SYSCALL(thread_exit)
 373:	b8 17 00 00 00       	mov    $0x17,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <draw>:
SYSCALL(draw)
 37b:	b8 19 00 00 00       	mov    $0x19,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <getNumProc>:
SYSCALL(getNumProc)
 383:	b8 1a 00 00 00       	mov    $0x1a,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <getMaxPid>:
SYSCALL(getMaxPid)
 38b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <getProcInfo>:
SYSCALL(getProcInfo)
 393:	b8 1c 00 00 00       	mov    $0x1c,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <set_burst_time>:
SYSCALL(set_burst_time)
 39b:	b8 1d 00 00 00       	mov    $0x1d,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <get_burst_time>:
SYSCALL(get_burst_time)
 3a3:	b8 1e 00 00 00       	mov    $0x1e,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <getCurrentInfo>:
SYSCALL(getCurrentInfo)
 3ab:	b8 1f 00 00 00       	mov    $0x1f,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <getCurrentPID>:
SYSCALL(getCurrentPID)
 3b3:	b8 20 00 00 00       	mov    $0x20,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    
 3bb:	66 90                	xchg   %ax,%ax
 3bd:	66 90                	xchg   %ax,%ax
 3bf:	90                   	nop

000003c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
 3c6:	83 ec 3c             	sub    $0x3c,%esp
 3c9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3cc:	89 d1                	mov    %edx,%ecx
{
 3ce:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 3d1:	85 d2                	test   %edx,%edx
 3d3:	0f 89 7f 00 00 00    	jns    458 <printint+0x98>
 3d9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3dd:	74 79                	je     458 <printint+0x98>
    neg = 1;
 3df:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 3e6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 3e8:	31 db                	xor    %ebx,%ebx
 3ea:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3f0:	89 c8                	mov    %ecx,%eax
 3f2:	31 d2                	xor    %edx,%edx
 3f4:	89 cf                	mov    %ecx,%edi
 3f6:	f7 75 c4             	divl   -0x3c(%ebp)
 3f9:	0f b6 92 30 0a 00 00 	movzbl 0xa30(%edx),%edx
 400:	89 45 c0             	mov    %eax,-0x40(%ebp)
 403:	89 d8                	mov    %ebx,%eax
 405:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 408:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 40b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 40e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 411:	76 dd                	jbe    3f0 <printint+0x30>
  if(neg)
 413:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 416:	85 c9                	test   %ecx,%ecx
 418:	74 0c                	je     426 <printint+0x66>
    buf[i++] = '-';
 41a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 41f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 421:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 426:	8b 7d b8             	mov    -0x48(%ebp),%edi
 429:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 42d:	eb 07                	jmp    436 <printint+0x76>
 42f:	90                   	nop
    putc(fd, buf[i]);
 430:	0f b6 13             	movzbl (%ebx),%edx
 433:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 436:	83 ec 04             	sub    $0x4,%esp
 439:	88 55 d7             	mov    %dl,-0x29(%ebp)
 43c:	6a 01                	push   $0x1
 43e:	56                   	push   %esi
 43f:	57                   	push   %edi
 440:	e8 9e fe ff ff       	call   2e3 <write>
  while(--i >= 0)
 445:	83 c4 10             	add    $0x10,%esp
 448:	39 de                	cmp    %ebx,%esi
 44a:	75 e4                	jne    430 <printint+0x70>
}
 44c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 44f:	5b                   	pop    %ebx
 450:	5e                   	pop    %esi
 451:	5f                   	pop    %edi
 452:	5d                   	pop    %ebp
 453:	c3                   	ret    
 454:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 458:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 45f:	eb 87                	jmp    3e8 <printint+0x28>
 461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 468:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop

00000470 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	56                   	push   %esi
 475:	53                   	push   %ebx
 476:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 479:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 47c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 47f:	0f b6 13             	movzbl (%ebx),%edx
 482:	84 d2                	test   %dl,%dl
 484:	74 6a                	je     4f0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 486:	8d 45 10             	lea    0x10(%ebp),%eax
 489:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 48c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 48f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 491:	89 45 d0             	mov    %eax,-0x30(%ebp)
 494:	eb 36                	jmp    4cc <printf+0x5c>
 496:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49d:	8d 76 00             	lea    0x0(%esi),%esi
 4a0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4a3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 4a8:	83 f8 25             	cmp    $0x25,%eax
 4ab:	74 15                	je     4c2 <printf+0x52>
  write(fd, &c, 1);
 4ad:	83 ec 04             	sub    $0x4,%esp
 4b0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4b3:	6a 01                	push   $0x1
 4b5:	57                   	push   %edi
 4b6:	56                   	push   %esi
 4b7:	e8 27 fe ff ff       	call   2e3 <write>
 4bc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 4bf:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4c2:	0f b6 13             	movzbl (%ebx),%edx
 4c5:	83 c3 01             	add    $0x1,%ebx
 4c8:	84 d2                	test   %dl,%dl
 4ca:	74 24                	je     4f0 <printf+0x80>
    c = fmt[i] & 0xff;
 4cc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 4cf:	85 c9                	test   %ecx,%ecx
 4d1:	74 cd                	je     4a0 <printf+0x30>
      }
    } else if(state == '%'){
 4d3:	83 f9 25             	cmp    $0x25,%ecx
 4d6:	75 ea                	jne    4c2 <printf+0x52>
      if(c == 'd'){
 4d8:	83 f8 25             	cmp    $0x25,%eax
 4db:	0f 84 07 01 00 00    	je     5e8 <printf+0x178>
 4e1:	83 e8 63             	sub    $0x63,%eax
 4e4:	83 f8 15             	cmp    $0x15,%eax
 4e7:	77 17                	ja     500 <printf+0x90>
 4e9:	ff 24 85 d8 09 00 00 	jmp    *0x9d8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4f3:	5b                   	pop    %ebx
 4f4:	5e                   	pop    %esi
 4f5:	5f                   	pop    %edi
 4f6:	5d                   	pop    %ebp
 4f7:	c3                   	ret    
 4f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ff:	90                   	nop
  write(fd, &c, 1);
 500:	83 ec 04             	sub    $0x4,%esp
 503:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 506:	6a 01                	push   $0x1
 508:	57                   	push   %edi
 509:	56                   	push   %esi
 50a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 50e:	e8 d0 fd ff ff       	call   2e3 <write>
        putc(fd, c);
 513:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 517:	83 c4 0c             	add    $0xc,%esp
 51a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 51d:	6a 01                	push   $0x1
 51f:	57                   	push   %edi
 520:	56                   	push   %esi
 521:	e8 bd fd ff ff       	call   2e3 <write>
        putc(fd, c);
 526:	83 c4 10             	add    $0x10,%esp
      state = 0;
 529:	31 c9                	xor    %ecx,%ecx
 52b:	eb 95                	jmp    4c2 <printf+0x52>
 52d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 530:	83 ec 0c             	sub    $0xc,%esp
 533:	b9 10 00 00 00       	mov    $0x10,%ecx
 538:	6a 00                	push   $0x0
 53a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 53d:	8b 10                	mov    (%eax),%edx
 53f:	89 f0                	mov    %esi,%eax
 541:	e8 7a fe ff ff       	call   3c0 <printint>
        ap++;
 546:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 54a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 54d:	31 c9                	xor    %ecx,%ecx
 54f:	e9 6e ff ff ff       	jmp    4c2 <printf+0x52>
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 558:	8b 45 d0             	mov    -0x30(%ebp),%eax
 55b:	8b 10                	mov    (%eax),%edx
        ap++;
 55d:	83 c0 04             	add    $0x4,%eax
 560:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 563:	85 d2                	test   %edx,%edx
 565:	0f 84 8d 00 00 00    	je     5f8 <printf+0x188>
        while(*s != 0){
 56b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 56e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 570:	84 c0                	test   %al,%al
 572:	0f 84 4a ff ff ff    	je     4c2 <printf+0x52>
 578:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 57b:	89 d3                	mov    %edx,%ebx
 57d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 580:	83 ec 04             	sub    $0x4,%esp
          s++;
 583:	83 c3 01             	add    $0x1,%ebx
 586:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 589:	6a 01                	push   $0x1
 58b:	57                   	push   %edi
 58c:	56                   	push   %esi
 58d:	e8 51 fd ff ff       	call   2e3 <write>
        while(*s != 0){
 592:	0f b6 03             	movzbl (%ebx),%eax
 595:	83 c4 10             	add    $0x10,%esp
 598:	84 c0                	test   %al,%al
 59a:	75 e4                	jne    580 <printf+0x110>
      state = 0;
 59c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 59f:	31 c9                	xor    %ecx,%ecx
 5a1:	e9 1c ff ff ff       	jmp    4c2 <printf+0x52>
 5a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5b0:	83 ec 0c             	sub    $0xc,%esp
 5b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5b8:	6a 01                	push   $0x1
 5ba:	e9 7b ff ff ff       	jmp    53a <printf+0xca>
 5bf:	90                   	nop
        putc(fd, *ap);
 5c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 5c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5c6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5c8:	6a 01                	push   $0x1
 5ca:	57                   	push   %edi
 5cb:	56                   	push   %esi
        putc(fd, *ap);
 5cc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5cf:	e8 0f fd ff ff       	call   2e3 <write>
        ap++;
 5d4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5d8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5db:	31 c9                	xor    %ecx,%ecx
 5dd:	e9 e0 fe ff ff       	jmp    4c2 <printf+0x52>
 5e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 5e8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 5eb:	83 ec 04             	sub    $0x4,%esp
 5ee:	e9 2a ff ff ff       	jmp    51d <printf+0xad>
 5f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5f7:	90                   	nop
          s = "(null)";
 5f8:	ba d1 09 00 00       	mov    $0x9d1,%edx
        while(*s != 0){
 5fd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 600:	b8 28 00 00 00       	mov    $0x28,%eax
 605:	89 d3                	mov    %edx,%ebx
 607:	e9 74 ff ff ff       	jmp    580 <printf+0x110>
 60c:	66 90                	xchg   %ax,%ax
 60e:	66 90                	xchg   %ax,%ax

00000610 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 610:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 611:	a1 80 0d 00 00       	mov    0xd80,%eax
{
 616:	89 e5                	mov    %esp,%ebp
 618:	57                   	push   %edi
 619:	56                   	push   %esi
 61a:	53                   	push   %ebx
 61b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 61e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 628:	89 c2                	mov    %eax,%edx
 62a:	8b 00                	mov    (%eax),%eax
 62c:	39 ca                	cmp    %ecx,%edx
 62e:	73 30                	jae    660 <free+0x50>
 630:	39 c1                	cmp    %eax,%ecx
 632:	72 04                	jb     638 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 634:	39 c2                	cmp    %eax,%edx
 636:	72 f0                	jb     628 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 638:	8b 73 fc             	mov    -0x4(%ebx),%esi
 63b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 63e:	39 f8                	cmp    %edi,%eax
 640:	74 30                	je     672 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 642:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 645:	8b 42 04             	mov    0x4(%edx),%eax
 648:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 64b:	39 f1                	cmp    %esi,%ecx
 64d:	74 3a                	je     689 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 64f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 651:	5b                   	pop    %ebx
  freep = p;
 652:	89 15 80 0d 00 00    	mov    %edx,0xd80
}
 658:	5e                   	pop    %esi
 659:	5f                   	pop    %edi
 65a:	5d                   	pop    %ebp
 65b:	c3                   	ret    
 65c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 660:	39 c2                	cmp    %eax,%edx
 662:	72 c4                	jb     628 <free+0x18>
 664:	39 c1                	cmp    %eax,%ecx
 666:	73 c0                	jae    628 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 668:	8b 73 fc             	mov    -0x4(%ebx),%esi
 66b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 66e:	39 f8                	cmp    %edi,%eax
 670:	75 d0                	jne    642 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 672:	03 70 04             	add    0x4(%eax),%esi
 675:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 678:	8b 02                	mov    (%edx),%eax
 67a:	8b 00                	mov    (%eax),%eax
 67c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 67f:	8b 42 04             	mov    0x4(%edx),%eax
 682:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 685:	39 f1                	cmp    %esi,%ecx
 687:	75 c6                	jne    64f <free+0x3f>
    p->s.size += bp->s.size;
 689:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 68c:	89 15 80 0d 00 00    	mov    %edx,0xd80
    p->s.size += bp->s.size;
 692:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 695:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 698:	89 0a                	mov    %ecx,(%edx)
}
 69a:	5b                   	pop    %ebx
 69b:	5e                   	pop    %esi
 69c:	5f                   	pop    %edi
 69d:	5d                   	pop    %ebp
 69e:	c3                   	ret    
 69f:	90                   	nop

000006a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	56                   	push   %esi
 6a5:	53                   	push   %ebx
 6a6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6ac:	8b 3d 80 0d 00 00    	mov    0xd80,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b2:	8d 70 07             	lea    0x7(%eax),%esi
 6b5:	c1 ee 03             	shr    $0x3,%esi
 6b8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 6bb:	85 ff                	test   %edi,%edi
 6bd:	0f 84 9d 00 00 00    	je     760 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6c3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 6c5:	8b 4a 04             	mov    0x4(%edx),%ecx
 6c8:	39 f1                	cmp    %esi,%ecx
 6ca:	73 6a                	jae    736 <malloc+0x96>
 6cc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6d1:	39 de                	cmp    %ebx,%esi
 6d3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 6d6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6e0:	eb 17                	jmp    6f9 <malloc+0x59>
 6e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6ea:	8b 48 04             	mov    0x4(%eax),%ecx
 6ed:	39 f1                	cmp    %esi,%ecx
 6ef:	73 4f                	jae    740 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6f1:	8b 3d 80 0d 00 00    	mov    0xd80,%edi
 6f7:	89 c2                	mov    %eax,%edx
 6f9:	39 d7                	cmp    %edx,%edi
 6fb:	75 eb                	jne    6e8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 6fd:	83 ec 0c             	sub    $0xc,%esp
 700:	ff 75 e4             	push   -0x1c(%ebp)
 703:	e8 43 fc ff ff       	call   34b <sbrk>
  if(p == (char*)-1)
 708:	83 c4 10             	add    $0x10,%esp
 70b:	83 f8 ff             	cmp    $0xffffffff,%eax
 70e:	74 1c                	je     72c <malloc+0x8c>
  hp->s.size = nu;
 710:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 713:	83 ec 0c             	sub    $0xc,%esp
 716:	83 c0 08             	add    $0x8,%eax
 719:	50                   	push   %eax
 71a:	e8 f1 fe ff ff       	call   610 <free>
  return freep;
 71f:	8b 15 80 0d 00 00    	mov    0xd80,%edx
      if((p = morecore(nunits)) == 0)
 725:	83 c4 10             	add    $0x10,%esp
 728:	85 d2                	test   %edx,%edx
 72a:	75 bc                	jne    6e8 <malloc+0x48>
        return 0;
  }
}
 72c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 72f:	31 c0                	xor    %eax,%eax
}
 731:	5b                   	pop    %ebx
 732:	5e                   	pop    %esi
 733:	5f                   	pop    %edi
 734:	5d                   	pop    %ebp
 735:	c3                   	ret    
    if(p->s.size >= nunits){
 736:	89 d0                	mov    %edx,%eax
 738:	89 fa                	mov    %edi,%edx
 73a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 740:	39 ce                	cmp    %ecx,%esi
 742:	74 4c                	je     790 <malloc+0xf0>
        p->s.size -= nunits;
 744:	29 f1                	sub    %esi,%ecx
 746:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 749:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 74c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 74f:	89 15 80 0d 00 00    	mov    %edx,0xd80
}
 755:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 758:	83 c0 08             	add    $0x8,%eax
}
 75b:	5b                   	pop    %ebx
 75c:	5e                   	pop    %esi
 75d:	5f                   	pop    %edi
 75e:	5d                   	pop    %ebp
 75f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 760:	c7 05 80 0d 00 00 84 	movl   $0xd84,0xd80
 767:	0d 00 00 
    base.s.size = 0;
 76a:	bf 84 0d 00 00       	mov    $0xd84,%edi
    base.s.ptr = freep = prevp = &base;
 76f:	c7 05 84 0d 00 00 84 	movl   $0xd84,0xd84
 776:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 779:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 77b:	c7 05 88 0d 00 00 00 	movl   $0x0,0xd88
 782:	00 00 00 
    if(p->s.size >= nunits){
 785:	e9 42 ff ff ff       	jmp    6cc <malloc+0x2c>
 78a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 790:	8b 08                	mov    (%eax),%ecx
 792:	89 0a                	mov    %ecx,(%edx)
 794:	eb b9                	jmp    74f <malloc+0xaf>
 796:	66 90                	xchg   %ax,%ax
 798:	66 90                	xchg   %ax,%ax
 79a:	66 90                	xchg   %ax,%ax
 79c:	66 90                	xchg   %ax,%ax
 79e:	66 90                	xchg   %ax,%ax

000007a0 <sgenrand>:
static int mti=N+1; /* mti==N+1 means mt[N] is not initialized */

/* initializing the array with a NONZERO seed */
void
sgenrand(unsigned long seed)
{
 7a0:	55                   	push   %ebp
 7a1:	b8 a4 0d 00 00       	mov    $0xda4,%eax
 7a6:	89 e5                	mov    %esp,%ebp
 7a8:	8b 55 08             	mov    0x8(%ebp),%edx
    /* setting initial seeds to mt[N] using         */
    /* the generator Line 25 of Table 1 in          */
    /* [KNUTH 1981, The Art of Computer Programming */
    /*    Vol. 2 (2nd Ed.), pp102]                  */
    mt[0]= seed & 0xffffffff;
 7ab:	89 15 a0 0d 00 00    	mov    %edx,0xda0
    for (mti=1; mti<N; mti++)
 7b1:	eb 08                	jmp    7bb <sgenrand+0x1b>
 7b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7b7:	90                   	nop
 7b8:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 7bb:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 7c1:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 7c3:	3d 5c 17 00 00       	cmp    $0x175c,%eax
 7c8:	75 ee                	jne    7b8 <sgenrand+0x18>
 7ca:	c7 05 74 0d 00 00 70 	movl   $0x270,0xd74
 7d1:	02 00 00 
}
 7d4:	5d                   	pop    %ebp
 7d5:	c3                   	ret    
 7d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7dd:	8d 76 00             	lea    0x0(%esi),%esi

000007e0 <genrand>:
{
    unsigned long y;
    static unsigned long mag01[2]={0x0, MATRIX_A};
    /* mag01[x] = x * MATRIX_A  for x=0,1 */

    if (mti >= N) { /* generate N words at one time */
 7e0:	a1 74 0d 00 00       	mov    0xd74,%eax
 7e5:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 7ea:	7f 3d                	jg     829 <genrand+0x49>
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];

        mti = 0;
    }
  
    y = mt[mti++];
 7ec:	8b 0c 85 a0 0d 00 00 	mov    0xda0(,%eax,4),%ecx
 7f3:	8d 50 01             	lea    0x1(%eax),%edx
 7f6:	89 15 74 0d 00 00    	mov    %edx,0xd74
    y ^= TEMPERING_SHIFT_U(y);
 7fc:	89 ca                	mov    %ecx,%edx
 7fe:	c1 ea 0b             	shr    $0xb,%edx
 801:	31 ca                	xor    %ecx,%edx
    y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
 803:	89 d0                	mov    %edx,%eax
 805:	c1 e0 07             	shl    $0x7,%eax
 808:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
 80d:	31 d0                	xor    %edx,%eax
    y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
 80f:	89 c2                	mov    %eax,%edx
 811:	c1 e2 0f             	shl    $0xf,%edx
 814:	81 e2 00 00 c6 ef    	and    $0xefc60000,%edx
 81a:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_L(y);
 81c:	89 d0                	mov    %edx,%eax
 81e:	c1 e8 12             	shr    $0x12,%eax
 821:	31 d0                	xor    %edx,%eax

    // Strip off uppermost bit because we want a long,
    // not an unsigned long
    return y & RAND_MAX;
 823:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
 828:	c3                   	ret    
        if (mti == N+1)   /* if sgenrand() has not been called, */
 829:	3d 71 02 00 00       	cmp    $0x271,%eax
 82e:	0f 84 d4 00 00 00    	je     908 <genrand+0x128>
    mt[0]= seed & 0xffffffff;
 834:	31 c0                	xor    %eax,%eax
 836:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 83d:	8d 76 00             	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 840:	8b 0c 85 a0 0d 00 00 	mov    0xda0(,%eax,4),%ecx
 847:	83 c0 01             	add    $0x1,%eax
 84a:	8b 14 85 a0 0d 00 00 	mov    0xda0(,%eax,4),%edx
 851:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 857:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 85d:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1];
 85f:	89 d1                	mov    %edx,%ecx
 861:	83 e2 01             	and    $0x1,%edx
 864:	d1 e9                	shr    %ecx
 866:	33 0c 85 d0 13 00 00 	xor    0x13d0(,%eax,4),%ecx
 86d:	33 0c 95 44 0a 00 00 	xor    0xa44(,%edx,4),%ecx
 874:	89 0c 85 9c 0d 00 00 	mov    %ecx,0xd9c(,%eax,4)
        for (kk=0;kk<N-M;kk++) {
 87b:	3d e3 00 00 00       	cmp    $0xe3,%eax
 880:	75 be                	jne    840 <genrand+0x60>
 882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 888:	8b 0c 85 a0 0d 00 00 	mov    0xda0(,%eax,4),%ecx
 88f:	83 c0 01             	add    $0x1,%eax
 892:	8b 14 85 a0 0d 00 00 	mov    0xda0(,%eax,4),%edx
 899:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 89f:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 8a5:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1];
 8a7:	89 d1                	mov    %edx,%ecx
 8a9:	83 e2 01             	and    $0x1,%edx
 8ac:	d1 e9                	shr    %ecx
 8ae:	33 0c 85 10 0a 00 00 	xor    0xa10(,%eax,4),%ecx
 8b5:	33 0c 95 44 0a 00 00 	xor    0xa44(,%edx,4),%ecx
 8bc:	89 0c 85 9c 0d 00 00 	mov    %ecx,0xd9c(,%eax,4)
        for (;kk<N-1;kk++) {
 8c3:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 8c8:	75 be                	jne    888 <genrand+0xa8>
        y = (mt[N-1]&UPPER_MASK)|(mt[0]&LOWER_MASK);
 8ca:	8b 0d a0 0d 00 00    	mov    0xda0,%ecx
 8d0:	a1 5c 17 00 00       	mov    0x175c,%eax
 8d5:	89 ca                	mov    %ecx,%edx
 8d7:	25 00 00 00 80       	and    $0x80000000,%eax
 8dc:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 8e2:	09 d0                	or     %edx,%eax
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];
 8e4:	89 c2                	mov    %eax,%edx
 8e6:	83 e0 01             	and    $0x1,%eax
 8e9:	d1 ea                	shr    %edx
 8eb:	33 15 d0 13 00 00    	xor    0x13d0,%edx
 8f1:	33 14 85 44 0a 00 00 	xor    0xa44(,%eax,4),%edx
 8f8:	89 15 5c 17 00 00    	mov    %edx,0x175c
 8fe:	ba 01 00 00 00       	mov    $0x1,%edx
 903:	e9 ee fe ff ff       	jmp    7f6 <genrand+0x16>
    mt[0]= seed & 0xffffffff;
 908:	b8 a4 0d 00 00       	mov    $0xda4,%eax
 90d:	b9 5c 17 00 00       	mov    $0x175c,%ecx
 912:	ba 05 11 00 00       	mov    $0x1105,%edx
 917:	c7 05 a0 0d 00 00 05 	movl   $0x1105,0xda0
 91e:	11 00 00 
    for (mti=1; mti<N; mti++)
 921:	eb 08                	jmp    92b <genrand+0x14b>
 923:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 927:	90                   	nop
 928:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 92b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 931:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 933:	39 c1                	cmp    %eax,%ecx
 935:	75 f1                	jne    928 <genrand+0x148>
 937:	e9 f8 fe ff ff       	jmp    834 <genrand+0x54>
 93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000940 <random_at_most>:

// Assumes 0 <= max <= RAND_MAX
// Returns in the half-open interval [0, max]
long random_at_most(long max) {
 940:	55                   	push   %ebp
  unsigned long
    // max <= RAND_MAX < ULONG_MAX, so this is okay.
    num_bins = (unsigned long) max + 1,
    num_rand = (unsigned long) RAND_MAX + 1,
    bin_size = num_rand / num_bins,
 941:	31 d2                	xor    %edx,%edx
long random_at_most(long max) {
 943:	89 e5                	mov    %esp,%ebp
 945:	56                   	push   %esi
    num_bins = (unsigned long) max + 1,
 946:	8b 45 08             	mov    0x8(%ebp),%eax
long random_at_most(long max) {
 949:	53                   	push   %ebx
    bin_size = num_rand / num_bins,
 94a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    num_bins = (unsigned long) max + 1,
 94f:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 952:	89 d8                	mov    %ebx,%eax
 954:	f7 f1                	div    %ecx
 956:	89 c6                	mov    %eax,%esi
  long x;
  do {
   x = genrand();
  }
  // This is carefully written not to overflow
  while (num_rand - defect <= (unsigned long)x);
 958:	29 d3                	sub    %edx,%ebx
 95a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   x = genrand();
 960:	e8 7b fe ff ff       	call   7e0 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 965:	39 d8                	cmp    %ebx,%eax
 967:	73 f7                	jae    960 <random_at_most+0x20>

  // Truncated division is intentional
  return x/bin_size;
 969:	31 d2                	xor    %edx,%edx
}
 96b:	5b                   	pop    %ebx
  return x/bin_size;
 96c:	f7 f6                	div    %esi
}
 96e:	5e                   	pop    %esi
 96f:	5d                   	pop    %ebp
 970:	c3                   	ret    
 971:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 978:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 97f:	90                   	nop

00000980 <randomrange>:

int randomrange(int low, int high){
 980:	55                   	push   %ebp
 981:	89 e5                	mov    %esp,%ebp
 983:	57                   	push   %edi
 984:	56                   	push   %esi
 985:	53                   	push   %ebx
 986:	83 ec 0c             	sub    $0xc,%esp
 989:	8b 75 08             	mov    0x8(%ebp),%esi
 98c:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(high<low){
 98f:	39 f0                	cmp    %esi,%eax
 991:	7d 06                	jge    999 <randomrange+0x19>
 993:	89 f2                	mov    %esi,%edx
 995:	89 c6                	mov    %eax,%esi
 997:	89 d0                	mov    %edx,%eax
    int temp=high;
    high=low;
    low=temp;
  }
  int val = random_at_most(high-low) + low;
 999:	29 f0                	sub    %esi,%eax
    bin_size = num_rand / num_bins,
 99b:	bb 00 00 00 80       	mov    $0x80000000,%ebx
 9a0:	31 d2                	xor    %edx,%edx
    num_bins = (unsigned long) max + 1,
 9a2:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 9a5:	89 d8                	mov    %ebx,%eax
 9a7:	f7 f1                	div    %ecx
 9a9:	89 c7                	mov    %eax,%edi
  while (num_rand - defect <= (unsigned long)x);
 9ab:	29 d3                	sub    %edx,%ebx
 9ad:	8d 76 00             	lea    0x0(%esi),%esi
   x = genrand();
 9b0:	e8 2b fe ff ff       	call   7e0 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 9b5:	39 d8                	cmp    %ebx,%eax
 9b7:	73 f7                	jae    9b0 <randomrange+0x30>
  return x/bin_size;
 9b9:	31 d2                	xor    %edx,%edx
  return val;
}
 9bb:	83 c4 0c             	add    $0xc,%esp
  return x/bin_size;
 9be:	f7 f7                	div    %edi
}
 9c0:	5b                   	pop    %ebx
  int val = random_at_most(high-low) + low;
 9c1:	01 f0                	add    %esi,%eax
}
 9c3:	5e                   	pop    %esi
 9c4:	5f                   	pop    %edi
 9c5:	5d                   	pop    %ebp
 9c6:	c3                   	ret    
