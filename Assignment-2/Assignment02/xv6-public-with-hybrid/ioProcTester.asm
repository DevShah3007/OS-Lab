
_ioProcTester:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argv, char* argc[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 28             	sub    $0x28,%esp

	if(argv<2){
  14:	83 39 01             	cmpl   $0x1,(%ecx)
main(int argv, char* argc[]){
  17:	8b 41 04             	mov    0x4(%ecx),%eax
	if(argv<2){
  1a:	7e 3a                	jle    56 <main+0x56>
		printf(1, "Incorrect format!\nFormat: test_cpu_only <number of fork processes>\n");

		exit();
	}

	int n=atoi(argc[1]);
  1c:	83 ec 0c             	sub    $0xc,%esp
  1f:	ff 70 04             	push   0x4(%eax)
  22:	e8 69 03 00 00       	call   390 <atoi>

	int burst_times[n];
  27:	83 c4 10             	add    $0x10,%esp
	int n=atoi(argc[1]);
  2a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	int burst_times[n];
  2d:	8d 04 85 0f 00 00 00 	lea    0xf(,%eax,4),%eax
  34:	89 e1                	mov    %esp,%ecx
  36:	89 c2                	mov    %eax,%edx
  38:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  3d:	83 e2 f0             	and    $0xfffffff0,%edx
  40:	29 c1                	sub    %eax,%ecx
  42:	39 cc                	cmp    %ecx,%esp
  44:	74 23                	je     69 <main+0x69>
  46:	81 ec 00 10 00 00    	sub    $0x1000,%esp
  4c:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
  53:	00 
  54:	eb ec                	jmp    42 <main+0x42>
		printf(1, "Incorrect format!\nFormat: test_cpu_only <number of fork processes>\n");
  56:	51                   	push   %ecx
  57:	51                   	push   %ecx
  58:	68 08 0b 00 00       	push   $0xb08
  5d:	6a 01                	push   $0x1
  5f:	e8 4c 05 00 00       	call   5b0 <printf>
		exit();
  64:	e8 9a 03 00 00       	call   403 <exit>
	int burst_times[n];
  69:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  6f:	29 d4                	sub    %edx,%esp
  71:	85 d2                	test   %edx,%edx
  73:	74 05                	je     7a <main+0x7a>
  75:	83 4c 14 fc 00       	orl    $0x0,-0x4(%esp,%edx,1)

	for(int i=0;i<n;i++){
  7a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
	int burst_times[n];
  7e:	89 e6                	mov    %esp,%esi
	for(int i=0;i<n;i++){
  80:	0f 8e d1 00 00 00    	jle    157 <main+0x157>
  86:	31 db                	xor    %ebx,%ebx
  88:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8f:	90                   	nop
		burst_times[i] = randomrange(1,1000);
  90:	83 ec 08             	sub    $0x8,%esp
  93:	89 df                	mov    %ebx,%edi
  95:	68 e8 03 00 00       	push   $0x3e8
  9a:	6a 01                	push   $0x1
  9c:	e8 1f 0a 00 00       	call   ac0 <randomrange>
	for(int i=0;i<n;i++){
  a1:	83 c4 10             	add    $0x10,%esp
		burst_times[i] = randomrange(1,1000);
  a4:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
	for(int i=0;i<n;i++){
  a7:	8d 5b 01             	lea    0x1(%ebx),%ebx
  aa:	39 5d d4             	cmp    %ebx,-0x2c(%ebp)
  ad:	75 e1                	jne    90 <main+0x90>
	}

	printf(1, "\tPID \t Type \t Burst Time \t Context Switches\n");
  af:	53                   	push   %ebx
  b0:	53                   	push   %ebx
	printf(1, "\t___ \t ____ \t __________ \t ________________\n\n");
  b1:	31 db                	xor    %ebx,%ebx
	printf(1, "\tPID \t Type \t Burst Time \t Context Switches\n");
  b3:	68 a4 0b 00 00       	push   $0xba4
  b8:	6a 01                	push   $0x1
  ba:	e8 f1 04 00 00       	call   5b0 <printf>
	printf(1, "\t___ \t ____ \t __________ \t ________________\n\n");
  bf:	58                   	pop    %eax
  c0:	5a                   	pop    %edx
  c1:	68 d4 0b 00 00       	push   $0xbd4
  c6:	6a 01                	push   $0x1
  c8:	e8 e3 04 00 00       	call   5b0 <printf>
  cd:	83 c4 10             	add    $0x10,%esp
  d0:	eb 13                	jmp    e5 <main+0xe5>
  d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	for(int i=0;i<n;i++){
  d8:	8d 43 01             	lea    0x1(%ebx),%eax
  db:	39 fb                	cmp    %edi,%ebx
  dd:	0f 84 93 00 00 00    	je     176 <main+0x176>
  e3:	89 c3                	mov    %eax,%ebx
		if(!fork()){
  e5:	e8 11 03 00 00       	call   3fb <fork>
  ea:	85 c0                	test   %eax,%eax
  ec:	75 ea                	jne    d8 <main+0xd8>

			// CPU Bound process
			set_burst_time(burst_times[i]);
  ee:	83 ec 0c             	sub    $0xc,%esp
  f1:	ff 34 9e             	push   (%esi,%ebx,4)
  f4:	bb 14 00 00 00       	mov    $0x14,%ebx
  f9:	e8 dd 03 00 00       	call   4db <set_burst_time>
  fe:	83 c4 10             	add    $0x10,%esp
 101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

			for(int i=0;i<20;i++){
				sleep(1);
 108:	83 ec 0c             	sub    $0xc,%esp
 10b:	6a 01                	push   $0x1
 10d:	e8 81 03 00 00       	call   493 <sleep>
			for(int i=0;i<20;i++){
 112:	83 c4 10             	add    $0x10,%esp
 115:	83 eb 01             	sub    $0x1,%ebx
 118:	75 ee                	jne    108 <main+0x108>
			}
			
			struct processInfo info;
			getCurrentInfo(&info);
 11a:	83 ec 0c             	sub    $0xc,%esp
 11d:	8d 45 dc             	lea    -0x24(%ebp),%eax
 120:	50                   	push   %eax
 121:	e8 c5 03 00 00       	call   4eb <getCurrentInfo>
			int bt = get_burst_time();
 126:	e8 b8 03 00 00       	call   4e3 <get_burst_time>
			if(bt<10)
				printf(1, "\t%d \t I/O         %d                  %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 12b:	8b 75 e4             	mov    -0x1c(%ebp),%esi
			if(bt<10)
 12e:	83 c4 10             	add    $0x10,%esp
			int bt = get_burst_time();
 131:	89 c3                	mov    %eax,%ebx
			if(bt<10)
 133:	83 f8 09             	cmp    $0x9,%eax
 136:	7f 54                	jg     18c <main+0x18c>
				printf(1, "\t%d \t I/O         %d                  %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 138:	e8 b6 03 00 00       	call   4f3 <getCurrentPID>
 13d:	83 ec 0c             	sub    $0xc,%esp
 140:	56                   	push   %esi
 141:	53                   	push   %ebx
 142:	50                   	push   %eax
 143:	68 4c 0b 00 00       	push   $0xb4c
 148:	6a 01                	push   $0x1
 14a:	e8 61 04 00 00       	call   5b0 <printf>
 14f:	83 c4 20             	add    $0x20,%esp
			else
				printf(1, "\t%d \t I/O         %d                 %d\n", getCurrentPID(), bt, info.numberContextSwitches);
			exit();
 152:	e8 ac 02 00 00       	call   403 <exit>
	printf(1, "\tPID \t Type \t Burst Time \t Context Switches\n");
 157:	50                   	push   %eax
 158:	50                   	push   %eax
 159:	68 a4 0b 00 00       	push   $0xba4
 15e:	6a 01                	push   $0x1
 160:	e8 4b 04 00 00       	call   5b0 <printf>
	printf(1, "\t___ \t ____ \t __________ \t ________________\n\n");
 165:	5a                   	pop    %edx
 166:	59                   	pop    %ecx
 167:	68 d4 0b 00 00       	push   $0xbd4
 16c:	6a 01                	push   $0x1
 16e:	e8 3d 04 00 00       	call   5b0 <printf>
 173:	83 c4 10             	add    $0x10,%esp


		}
	}

	while(wait()!=-1);
 176:	e8 90 02 00 00       	call   40b <wait>
 17b:	83 f8 ff             	cmp    $0xffffffff,%eax
 17e:	74 d2                	je     152 <main+0x152>
 180:	e8 86 02 00 00       	call   40b <wait>
 185:	83 f8 ff             	cmp    $0xffffffff,%eax
 188:	75 ec                	jne    176 <main+0x176>
 18a:	eb c6                	jmp    152 <main+0x152>
				printf(1, "\t%d \t I/O         %d                 %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 18c:	e8 62 03 00 00       	call   4f3 <getCurrentPID>
 191:	83 ec 0c             	sub    $0xc,%esp
 194:	56                   	push   %esi
 195:	53                   	push   %ebx
 196:	50                   	push   %eax
 197:	68 78 0b 00 00       	push   $0xb78
 19c:	6a 01                	push   $0x1
 19e:	e8 0d 04 00 00       	call   5b0 <printf>
 1a3:	83 c4 20             	add    $0x20,%esp
 1a6:	eb aa                	jmp    152 <main+0x152>
 1a8:	66 90                	xchg   %ax,%ax
 1aa:	66 90                	xchg   %ax,%ax
 1ac:	66 90                	xchg   %ax,%ax
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1b0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1b1:	31 c0                	xor    %eax,%eax
{
 1b3:	89 e5                	mov    %esp,%ebp
 1b5:	53                   	push   %ebx
 1b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1c0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1c4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1c7:	83 c0 01             	add    $0x1,%eax
 1ca:	84 d2                	test   %dl,%dl
 1cc:	75 f2                	jne    1c0 <strcpy+0x10>
    ;
  return os;
}
 1ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1d1:	89 c8                	mov    %ecx,%eax
 1d3:	c9                   	leave  
 1d4:	c3                   	ret    
 1d5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	53                   	push   %ebx
 1e4:	8b 55 08             	mov    0x8(%ebp),%edx
 1e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ea:	0f b6 02             	movzbl (%edx),%eax
 1ed:	84 c0                	test   %al,%al
 1ef:	75 17                	jne    208 <strcmp+0x28>
 1f1:	eb 3a                	jmp    22d <strcmp+0x4d>
 1f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f7:	90                   	nop
 1f8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1fc:	83 c2 01             	add    $0x1,%edx
 1ff:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 202:	84 c0                	test   %al,%al
 204:	74 1a                	je     220 <strcmp+0x40>
    p++, q++;
 206:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 208:	0f b6 19             	movzbl (%ecx),%ebx
 20b:	38 c3                	cmp    %al,%bl
 20d:	74 e9                	je     1f8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 20f:	29 d8                	sub    %ebx,%eax
}
 211:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 214:	c9                   	leave  
 215:	c3                   	ret    
 216:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 220:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 224:	31 c0                	xor    %eax,%eax
 226:	29 d8                	sub    %ebx,%eax
}
 228:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 22b:	c9                   	leave  
 22c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 22d:	0f b6 19             	movzbl (%ecx),%ebx
 230:	31 c0                	xor    %eax,%eax
 232:	eb db                	jmp    20f <strcmp+0x2f>
 234:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 23f:	90                   	nop

00000240 <strlen>:

uint
strlen(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 246:	80 3a 00             	cmpb   $0x0,(%edx)
 249:	74 15                	je     260 <strlen+0x20>
 24b:	31 c0                	xor    %eax,%eax
 24d:	8d 76 00             	lea    0x0(%esi),%esi
 250:	83 c0 01             	add    $0x1,%eax
 253:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 257:	89 c1                	mov    %eax,%ecx
 259:	75 f5                	jne    250 <strlen+0x10>
    ;
  return n;
}
 25b:	89 c8                	mov    %ecx,%eax
 25d:	5d                   	pop    %ebp
 25e:	c3                   	ret    
 25f:	90                   	nop
  for(n = 0; s[n]; n++)
 260:	31 c9                	xor    %ecx,%ecx
}
 262:	5d                   	pop    %ebp
 263:	89 c8                	mov    %ecx,%eax
 265:	c3                   	ret    
 266:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26d:	8d 76 00             	lea    0x0(%esi),%esi

00000270 <memset>:

void*
memset(void *dst, int c, uint n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 277:	8b 4d 10             	mov    0x10(%ebp),%ecx
 27a:	8b 45 0c             	mov    0xc(%ebp),%eax
 27d:	89 d7                	mov    %edx,%edi
 27f:	fc                   	cld    
 280:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 282:	8b 7d fc             	mov    -0x4(%ebp),%edi
 285:	89 d0                	mov    %edx,%eax
 287:	c9                   	leave  
 288:	c3                   	ret    
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000290 <strchr>:

char*
strchr(const char *s, char c)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 29a:	0f b6 10             	movzbl (%eax),%edx
 29d:	84 d2                	test   %dl,%dl
 29f:	75 12                	jne    2b3 <strchr+0x23>
 2a1:	eb 1d                	jmp    2c0 <strchr+0x30>
 2a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2a7:	90                   	nop
 2a8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2ac:	83 c0 01             	add    $0x1,%eax
 2af:	84 d2                	test   %dl,%dl
 2b1:	74 0d                	je     2c0 <strchr+0x30>
    if(*s == c)
 2b3:	38 d1                	cmp    %dl,%cl
 2b5:	75 f1                	jne    2a8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2b7:	5d                   	pop    %ebp
 2b8:	c3                   	ret    
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2c0:	31 c0                	xor    %eax,%eax
}
 2c2:	5d                   	pop    %ebp
 2c3:	c3                   	ret    
 2c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <gets>:

char*
gets(char *buf, int max)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2d5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2d8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2d9:	31 db                	xor    %ebx,%ebx
{
 2db:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2de:	eb 27                	jmp    307 <gets+0x37>
    cc = read(0, &c, 1);
 2e0:	83 ec 04             	sub    $0x4,%esp
 2e3:	6a 01                	push   $0x1
 2e5:	57                   	push   %edi
 2e6:	6a 00                	push   $0x0
 2e8:	e8 2e 01 00 00       	call   41b <read>
    if(cc < 1)
 2ed:	83 c4 10             	add    $0x10,%esp
 2f0:	85 c0                	test   %eax,%eax
 2f2:	7e 1d                	jle    311 <gets+0x41>
      break;
    buf[i++] = c;
 2f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2f8:	8b 55 08             	mov    0x8(%ebp),%edx
 2fb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2ff:	3c 0a                	cmp    $0xa,%al
 301:	74 1d                	je     320 <gets+0x50>
 303:	3c 0d                	cmp    $0xd,%al
 305:	74 19                	je     320 <gets+0x50>
  for(i=0; i+1 < max; ){
 307:	89 de                	mov    %ebx,%esi
 309:	83 c3 01             	add    $0x1,%ebx
 30c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 30f:	7c cf                	jl     2e0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 311:	8b 45 08             	mov    0x8(%ebp),%eax
 314:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 318:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31b:	5b                   	pop    %ebx
 31c:	5e                   	pop    %esi
 31d:	5f                   	pop    %edi
 31e:	5d                   	pop    %ebp
 31f:	c3                   	ret    
  buf[i] = '\0';
 320:	8b 45 08             	mov    0x8(%ebp),%eax
 323:	89 de                	mov    %ebx,%esi
 325:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 329:	8d 65 f4             	lea    -0xc(%ebp),%esp
 32c:	5b                   	pop    %ebx
 32d:	5e                   	pop    %esi
 32e:	5f                   	pop    %edi
 32f:	5d                   	pop    %ebp
 330:	c3                   	ret    
 331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 338:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33f:	90                   	nop

00000340 <stat>:

int
stat(const char *n, struct stat *st)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	56                   	push   %esi
 344:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 345:	83 ec 08             	sub    $0x8,%esp
 348:	6a 00                	push   $0x0
 34a:	ff 75 08             	push   0x8(%ebp)
 34d:	e8 f1 00 00 00       	call   443 <open>
  if(fd < 0)
 352:	83 c4 10             	add    $0x10,%esp
 355:	85 c0                	test   %eax,%eax
 357:	78 27                	js     380 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 359:	83 ec 08             	sub    $0x8,%esp
 35c:	ff 75 0c             	push   0xc(%ebp)
 35f:	89 c3                	mov    %eax,%ebx
 361:	50                   	push   %eax
 362:	e8 f4 00 00 00       	call   45b <fstat>
  close(fd);
 367:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 36a:	89 c6                	mov    %eax,%esi
  close(fd);
 36c:	e8 ba 00 00 00       	call   42b <close>
  return r;
 371:	83 c4 10             	add    $0x10,%esp
}
 374:	8d 65 f8             	lea    -0x8(%ebp),%esp
 377:	89 f0                	mov    %esi,%eax
 379:	5b                   	pop    %ebx
 37a:	5e                   	pop    %esi
 37b:	5d                   	pop    %ebp
 37c:	c3                   	ret    
 37d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 380:	be ff ff ff ff       	mov    $0xffffffff,%esi
 385:	eb ed                	jmp    374 <stat+0x34>
 387:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38e:	66 90                	xchg   %ax,%ax

00000390 <atoi>:

int
atoi(const char *s)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	53                   	push   %ebx
 394:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 397:	0f be 02             	movsbl (%edx),%eax
 39a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 39d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3a0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3a5:	77 1e                	ja     3c5 <atoi+0x35>
 3a7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ae:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3b0:	83 c2 01             	add    $0x1,%edx
 3b3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3b6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3ba:	0f be 02             	movsbl (%edx),%eax
 3bd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3c0:	80 fb 09             	cmp    $0x9,%bl
 3c3:	76 eb                	jbe    3b0 <atoi+0x20>
  return n;
}
 3c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c8:	89 c8                	mov    %ecx,%eax
 3ca:	c9                   	leave  
 3cb:	c3                   	ret    
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003d0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	57                   	push   %edi
 3d4:	8b 45 10             	mov    0x10(%ebp),%eax
 3d7:	8b 55 08             	mov    0x8(%ebp),%edx
 3da:	56                   	push   %esi
 3db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3de:	85 c0                	test   %eax,%eax
 3e0:	7e 13                	jle    3f5 <memmove+0x25>
 3e2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3e4:	89 d7                	mov    %edx,%edi
 3e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3f0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3f1:	39 f8                	cmp    %edi,%eax
 3f3:	75 fb                	jne    3f0 <memmove+0x20>
  return vdst;
}
 3f5:	5e                   	pop    %esi
 3f6:	89 d0                	mov    %edx,%eax
 3f8:	5f                   	pop    %edi
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    

000003fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3fb:	b8 01 00 00 00       	mov    $0x1,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <exit>:
SYSCALL(exit)
 403:	b8 02 00 00 00       	mov    $0x2,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <wait>:
SYSCALL(wait)
 40b:	b8 03 00 00 00       	mov    $0x3,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <pipe>:
SYSCALL(pipe)
 413:	b8 04 00 00 00       	mov    $0x4,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <read>:
SYSCALL(read)
 41b:	b8 05 00 00 00       	mov    $0x5,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <write>:
SYSCALL(write)
 423:	b8 10 00 00 00       	mov    $0x10,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <close>:
SYSCALL(close)
 42b:	b8 15 00 00 00       	mov    $0x15,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <kill>:
SYSCALL(kill)
 433:	b8 06 00 00 00       	mov    $0x6,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <exec>:
SYSCALL(exec)
 43b:	b8 07 00 00 00       	mov    $0x7,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <open>:
SYSCALL(open)
 443:	b8 0f 00 00 00       	mov    $0xf,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <mknod>:
SYSCALL(mknod)
 44b:	b8 11 00 00 00       	mov    $0x11,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <unlink>:
SYSCALL(unlink)
 453:	b8 12 00 00 00       	mov    $0x12,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <fstat>:
SYSCALL(fstat)
 45b:	b8 08 00 00 00       	mov    $0x8,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <link>:
SYSCALL(link)
 463:	b8 13 00 00 00       	mov    $0x13,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <mkdir>:
SYSCALL(mkdir)
 46b:	b8 14 00 00 00       	mov    $0x14,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <chdir>:
SYSCALL(chdir)
 473:	b8 09 00 00 00       	mov    $0x9,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <dup>:
SYSCALL(dup)
 47b:	b8 0a 00 00 00       	mov    $0xa,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <getpid>:
SYSCALL(getpid)
 483:	b8 0b 00 00 00       	mov    $0xb,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <sbrk>:
SYSCALL(sbrk)
 48b:	b8 0c 00 00 00       	mov    $0xc,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <sleep>:
SYSCALL(sleep)
 493:	b8 0d 00 00 00       	mov    $0xd,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <uptime>:
SYSCALL(uptime)
 49b:	b8 0e 00 00 00       	mov    $0xe,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <thread_create>:
SYSCALL(thread_create)
 4a3:	b8 16 00 00 00       	mov    $0x16,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <thread_join>:
SYSCALL(thread_join)
 4ab:	b8 18 00 00 00       	mov    $0x18,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <thread_exit>:
SYSCALL(thread_exit)
 4b3:	b8 17 00 00 00       	mov    $0x17,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <draw>:
SYSCALL(draw)
 4bb:	b8 19 00 00 00       	mov    $0x19,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <getNumProc>:
SYSCALL(getNumProc)
 4c3:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <getMaxPid>:
SYSCALL(getMaxPid)
 4cb:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <getProcInfo>:
SYSCALL(getProcInfo)
 4d3:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <set_burst_time>:
SYSCALL(set_burst_time)
 4db:	b8 1d 00 00 00       	mov    $0x1d,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <get_burst_time>:
SYSCALL(get_burst_time)
 4e3:	b8 1e 00 00 00       	mov    $0x1e,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <getCurrentInfo>:
SYSCALL(getCurrentInfo)
 4eb:	b8 1f 00 00 00       	mov    $0x1f,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <getCurrentPID>:
SYSCALL(getCurrentPID)
 4f3:	b8 20 00 00 00       	mov    $0x20,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    
 4fb:	66 90                	xchg   %ax,%ax
 4fd:	66 90                	xchg   %ax,%ax
 4ff:	90                   	nop

00000500 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	83 ec 3c             	sub    $0x3c,%esp
 509:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 50c:	89 d1                	mov    %edx,%ecx
{
 50e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 511:	85 d2                	test   %edx,%edx
 513:	0f 89 7f 00 00 00    	jns    598 <printint+0x98>
 519:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 51d:	74 79                	je     598 <printint+0x98>
    neg = 1;
 51f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 526:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 528:	31 db                	xor    %ebx,%ebx
 52a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 52d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 530:	89 c8                	mov    %ecx,%eax
 532:	31 d2                	xor    %edx,%edx
 534:	89 cf                	mov    %ecx,%edi
 536:	f7 75 c4             	divl   -0x3c(%ebp)
 539:	0f b6 92 64 0c 00 00 	movzbl 0xc64(%edx),%edx
 540:	89 45 c0             	mov    %eax,-0x40(%ebp)
 543:	89 d8                	mov    %ebx,%eax
 545:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 548:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 54b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 54e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 551:	76 dd                	jbe    530 <printint+0x30>
  if(neg)
 553:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 556:	85 c9                	test   %ecx,%ecx
 558:	74 0c                	je     566 <printint+0x66>
    buf[i++] = '-';
 55a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 55f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 561:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 566:	8b 7d b8             	mov    -0x48(%ebp),%edi
 569:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 56d:	eb 07                	jmp    576 <printint+0x76>
 56f:	90                   	nop
    putc(fd, buf[i]);
 570:	0f b6 13             	movzbl (%ebx),%edx
 573:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 576:	83 ec 04             	sub    $0x4,%esp
 579:	88 55 d7             	mov    %dl,-0x29(%ebp)
 57c:	6a 01                	push   $0x1
 57e:	56                   	push   %esi
 57f:	57                   	push   %edi
 580:	e8 9e fe ff ff       	call   423 <write>
  while(--i >= 0)
 585:	83 c4 10             	add    $0x10,%esp
 588:	39 de                	cmp    %ebx,%esi
 58a:	75 e4                	jne    570 <printint+0x70>
}
 58c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 58f:	5b                   	pop    %ebx
 590:	5e                   	pop    %esi
 591:	5f                   	pop    %edi
 592:	5d                   	pop    %ebp
 593:	c3                   	ret    
 594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 598:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 59f:	eb 87                	jmp    528 <printint+0x28>
 5a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop

000005b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	57                   	push   %edi
 5b4:	56                   	push   %esi
 5b5:	53                   	push   %ebx
 5b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5bc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5bf:	0f b6 13             	movzbl (%ebx),%edx
 5c2:	84 d2                	test   %dl,%dl
 5c4:	74 6a                	je     630 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5c6:	8d 45 10             	lea    0x10(%ebp),%eax
 5c9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5cc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5cf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 5d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d4:	eb 36                	jmp    60c <printf+0x5c>
 5d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
 5e0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5e3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5e8:	83 f8 25             	cmp    $0x25,%eax
 5eb:	74 15                	je     602 <printf+0x52>
  write(fd, &c, 1);
 5ed:	83 ec 04             	sub    $0x4,%esp
 5f0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5f3:	6a 01                	push   $0x1
 5f5:	57                   	push   %edi
 5f6:	56                   	push   %esi
 5f7:	e8 27 fe ff ff       	call   423 <write>
 5fc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 5ff:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 602:	0f b6 13             	movzbl (%ebx),%edx
 605:	83 c3 01             	add    $0x1,%ebx
 608:	84 d2                	test   %dl,%dl
 60a:	74 24                	je     630 <printf+0x80>
    c = fmt[i] & 0xff;
 60c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 60f:	85 c9                	test   %ecx,%ecx
 611:	74 cd                	je     5e0 <printf+0x30>
      }
    } else if(state == '%'){
 613:	83 f9 25             	cmp    $0x25,%ecx
 616:	75 ea                	jne    602 <printf+0x52>
      if(c == 'd'){
 618:	83 f8 25             	cmp    $0x25,%eax
 61b:	0f 84 07 01 00 00    	je     728 <printf+0x178>
 621:	83 e8 63             	sub    $0x63,%eax
 624:	83 f8 15             	cmp    $0x15,%eax
 627:	77 17                	ja     640 <printf+0x90>
 629:	ff 24 85 0c 0c 00 00 	jmp    *0xc0c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 630:	8d 65 f4             	lea    -0xc(%ebp),%esp
 633:	5b                   	pop    %ebx
 634:	5e                   	pop    %esi
 635:	5f                   	pop    %edi
 636:	5d                   	pop    %ebp
 637:	c3                   	ret    
 638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop
  write(fd, &c, 1);
 640:	83 ec 04             	sub    $0x4,%esp
 643:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 646:	6a 01                	push   $0x1
 648:	57                   	push   %edi
 649:	56                   	push   %esi
 64a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 64e:	e8 d0 fd ff ff       	call   423 <write>
        putc(fd, c);
 653:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 657:	83 c4 0c             	add    $0xc,%esp
 65a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 65d:	6a 01                	push   $0x1
 65f:	57                   	push   %edi
 660:	56                   	push   %esi
 661:	e8 bd fd ff ff       	call   423 <write>
        putc(fd, c);
 666:	83 c4 10             	add    $0x10,%esp
      state = 0;
 669:	31 c9                	xor    %ecx,%ecx
 66b:	eb 95                	jmp    602 <printf+0x52>
 66d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 670:	83 ec 0c             	sub    $0xc,%esp
 673:	b9 10 00 00 00       	mov    $0x10,%ecx
 678:	6a 00                	push   $0x0
 67a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 67d:	8b 10                	mov    (%eax),%edx
 67f:	89 f0                	mov    %esi,%eax
 681:	e8 7a fe ff ff       	call   500 <printint>
        ap++;
 686:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 68a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 68d:	31 c9                	xor    %ecx,%ecx
 68f:	e9 6e ff ff ff       	jmp    602 <printf+0x52>
 694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 698:	8b 45 d0             	mov    -0x30(%ebp),%eax
 69b:	8b 10                	mov    (%eax),%edx
        ap++;
 69d:	83 c0 04             	add    $0x4,%eax
 6a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6a3:	85 d2                	test   %edx,%edx
 6a5:	0f 84 8d 00 00 00    	je     738 <printf+0x188>
        while(*s != 0){
 6ab:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 6ae:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 6b0:	84 c0                	test   %al,%al
 6b2:	0f 84 4a ff ff ff    	je     602 <printf+0x52>
 6b8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6bb:	89 d3                	mov    %edx,%ebx
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6c0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6c3:	83 c3 01             	add    $0x1,%ebx
 6c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6c9:	6a 01                	push   $0x1
 6cb:	57                   	push   %edi
 6cc:	56                   	push   %esi
 6cd:	e8 51 fd ff ff       	call   423 <write>
        while(*s != 0){
 6d2:	0f b6 03             	movzbl (%ebx),%eax
 6d5:	83 c4 10             	add    $0x10,%esp
 6d8:	84 c0                	test   %al,%al
 6da:	75 e4                	jne    6c0 <printf+0x110>
      state = 0;
 6dc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 6df:	31 c9                	xor    %ecx,%ecx
 6e1:	e9 1c ff ff ff       	jmp    602 <printf+0x52>
 6e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6f0:	83 ec 0c             	sub    $0xc,%esp
 6f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6f8:	6a 01                	push   $0x1
 6fa:	e9 7b ff ff ff       	jmp    67a <printf+0xca>
 6ff:	90                   	nop
        putc(fd, *ap);
 700:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 703:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 706:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 708:	6a 01                	push   $0x1
 70a:	57                   	push   %edi
 70b:	56                   	push   %esi
        putc(fd, *ap);
 70c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 70f:	e8 0f fd ff ff       	call   423 <write>
        ap++;
 714:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 718:	83 c4 10             	add    $0x10,%esp
      state = 0;
 71b:	31 c9                	xor    %ecx,%ecx
 71d:	e9 e0 fe ff ff       	jmp    602 <printf+0x52>
 722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 728:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 72b:	83 ec 04             	sub    $0x4,%esp
 72e:	e9 2a ff ff ff       	jmp    65d <printf+0xad>
 733:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 737:	90                   	nop
          s = "(null)";
 738:	ba 02 0c 00 00       	mov    $0xc02,%edx
        while(*s != 0){
 73d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 740:	b8 28 00 00 00       	mov    $0x28,%eax
 745:	89 d3                	mov    %edx,%ebx
 747:	e9 74 ff ff ff       	jmp    6c0 <printf+0x110>
 74c:	66 90                	xchg   %ax,%ax
 74e:	66 90                	xchg   %ax,%ax

00000750 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 750:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 751:	a1 c0 0f 00 00       	mov    0xfc0,%eax
{
 756:	89 e5                	mov    %esp,%ebp
 758:	57                   	push   %edi
 759:	56                   	push   %esi
 75a:	53                   	push   %ebx
 75b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 75e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 768:	89 c2                	mov    %eax,%edx
 76a:	8b 00                	mov    (%eax),%eax
 76c:	39 ca                	cmp    %ecx,%edx
 76e:	73 30                	jae    7a0 <free+0x50>
 770:	39 c1                	cmp    %eax,%ecx
 772:	72 04                	jb     778 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 774:	39 c2                	cmp    %eax,%edx
 776:	72 f0                	jb     768 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 778:	8b 73 fc             	mov    -0x4(%ebx),%esi
 77b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 77e:	39 f8                	cmp    %edi,%eax
 780:	74 30                	je     7b2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 782:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 785:	8b 42 04             	mov    0x4(%edx),%eax
 788:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 78b:	39 f1                	cmp    %esi,%ecx
 78d:	74 3a                	je     7c9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 78f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 791:	5b                   	pop    %ebx
  freep = p;
 792:	89 15 c0 0f 00 00    	mov    %edx,0xfc0
}
 798:	5e                   	pop    %esi
 799:	5f                   	pop    %edi
 79a:	5d                   	pop    %ebp
 79b:	c3                   	ret    
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a0:	39 c2                	cmp    %eax,%edx
 7a2:	72 c4                	jb     768 <free+0x18>
 7a4:	39 c1                	cmp    %eax,%ecx
 7a6:	73 c0                	jae    768 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ae:	39 f8                	cmp    %edi,%eax
 7b0:	75 d0                	jne    782 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7b2:	03 70 04             	add    0x4(%eax),%esi
 7b5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b8:	8b 02                	mov    (%edx),%eax
 7ba:	8b 00                	mov    (%eax),%eax
 7bc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7bf:	8b 42 04             	mov    0x4(%edx),%eax
 7c2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7c5:	39 f1                	cmp    %esi,%ecx
 7c7:	75 c6                	jne    78f <free+0x3f>
    p->s.size += bp->s.size;
 7c9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7cc:	89 15 c0 0f 00 00    	mov    %edx,0xfc0
    p->s.size += bp->s.size;
 7d2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7d5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7d8:	89 0a                	mov    %ecx,(%edx)
}
 7da:	5b                   	pop    %ebx
 7db:	5e                   	pop    %esi
 7dc:	5f                   	pop    %edi
 7dd:	5d                   	pop    %ebp
 7de:	c3                   	ret    
 7df:	90                   	nop

000007e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	57                   	push   %edi
 7e4:	56                   	push   %esi
 7e5:	53                   	push   %ebx
 7e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ec:	8b 3d c0 0f 00 00    	mov    0xfc0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f2:	8d 70 07             	lea    0x7(%eax),%esi
 7f5:	c1 ee 03             	shr    $0x3,%esi
 7f8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7fb:	85 ff                	test   %edi,%edi
 7fd:	0f 84 9d 00 00 00    	je     8a0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 803:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 805:	8b 4a 04             	mov    0x4(%edx),%ecx
 808:	39 f1                	cmp    %esi,%ecx
 80a:	73 6a                	jae    876 <malloc+0x96>
 80c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 811:	39 de                	cmp    %ebx,%esi
 813:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 816:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 81d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 820:	eb 17                	jmp    839 <malloc+0x59>
 822:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 828:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 82a:	8b 48 04             	mov    0x4(%eax),%ecx
 82d:	39 f1                	cmp    %esi,%ecx
 82f:	73 4f                	jae    880 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 831:	8b 3d c0 0f 00 00    	mov    0xfc0,%edi
 837:	89 c2                	mov    %eax,%edx
 839:	39 d7                	cmp    %edx,%edi
 83b:	75 eb                	jne    828 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 83d:	83 ec 0c             	sub    $0xc,%esp
 840:	ff 75 e4             	push   -0x1c(%ebp)
 843:	e8 43 fc ff ff       	call   48b <sbrk>
  if(p == (char*)-1)
 848:	83 c4 10             	add    $0x10,%esp
 84b:	83 f8 ff             	cmp    $0xffffffff,%eax
 84e:	74 1c                	je     86c <malloc+0x8c>
  hp->s.size = nu;
 850:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 853:	83 ec 0c             	sub    $0xc,%esp
 856:	83 c0 08             	add    $0x8,%eax
 859:	50                   	push   %eax
 85a:	e8 f1 fe ff ff       	call   750 <free>
  return freep;
 85f:	8b 15 c0 0f 00 00    	mov    0xfc0,%edx
      if((p = morecore(nunits)) == 0)
 865:	83 c4 10             	add    $0x10,%esp
 868:	85 d2                	test   %edx,%edx
 86a:	75 bc                	jne    828 <malloc+0x48>
        return 0;
  }
}
 86c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 86f:	31 c0                	xor    %eax,%eax
}
 871:	5b                   	pop    %ebx
 872:	5e                   	pop    %esi
 873:	5f                   	pop    %edi
 874:	5d                   	pop    %ebp
 875:	c3                   	ret    
    if(p->s.size >= nunits){
 876:	89 d0                	mov    %edx,%eax
 878:	89 fa                	mov    %edi,%edx
 87a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 880:	39 ce                	cmp    %ecx,%esi
 882:	74 4c                	je     8d0 <malloc+0xf0>
        p->s.size -= nunits;
 884:	29 f1                	sub    %esi,%ecx
 886:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 889:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 88c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 88f:	89 15 c0 0f 00 00    	mov    %edx,0xfc0
}
 895:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 898:	83 c0 08             	add    $0x8,%eax
}
 89b:	5b                   	pop    %ebx
 89c:	5e                   	pop    %esi
 89d:	5f                   	pop    %edi
 89e:	5d                   	pop    %ebp
 89f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8a0:	c7 05 c0 0f 00 00 c4 	movl   $0xfc4,0xfc0
 8a7:	0f 00 00 
    base.s.size = 0;
 8aa:	bf c4 0f 00 00       	mov    $0xfc4,%edi
    base.s.ptr = freep = prevp = &base;
 8af:	c7 05 c4 0f 00 00 c4 	movl   $0xfc4,0xfc4
 8b6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8bb:	c7 05 c8 0f 00 00 00 	movl   $0x0,0xfc8
 8c2:	00 00 00 
    if(p->s.size >= nunits){
 8c5:	e9 42 ff ff ff       	jmp    80c <malloc+0x2c>
 8ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8d0:	8b 08                	mov    (%eax),%ecx
 8d2:	89 0a                	mov    %ecx,(%edx)
 8d4:	eb b9                	jmp    88f <malloc+0xaf>
 8d6:	66 90                	xchg   %ax,%ax
 8d8:	66 90                	xchg   %ax,%ax
 8da:	66 90                	xchg   %ax,%ax
 8dc:	66 90                	xchg   %ax,%ax
 8de:	66 90                	xchg   %ax,%ax

000008e0 <sgenrand>:
static int mti=N+1; /* mti==N+1 means mt[N] is not initialized */

/* initializing the array with a NONZERO seed */
void
sgenrand(unsigned long seed)
{
 8e0:	55                   	push   %ebp
 8e1:	b8 e4 0f 00 00       	mov    $0xfe4,%eax
 8e6:	89 e5                	mov    %esp,%ebp
 8e8:	8b 55 08             	mov    0x8(%ebp),%edx
    /* setting initial seeds to mt[N] using         */
    /* the generator Line 25 of Table 1 in          */
    /* [KNUTH 1981, The Art of Computer Programming */
    /*    Vol. 2 (2nd Ed.), pp102]                  */
    mt[0]= seed & 0xffffffff;
 8eb:	89 15 e0 0f 00 00    	mov    %edx,0xfe0
    for (mti=1; mti<N; mti++)
 8f1:	eb 08                	jmp    8fb <sgenrand+0x1b>
 8f3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8f7:	90                   	nop
 8f8:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 8fb:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 901:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 903:	3d 9c 19 00 00       	cmp    $0x199c,%eax
 908:	75 ee                	jne    8f8 <sgenrand+0x18>
 90a:	c7 05 a8 0f 00 00 70 	movl   $0x270,0xfa8
 911:	02 00 00 
}
 914:	5d                   	pop    %ebp
 915:	c3                   	ret    
 916:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 91d:	8d 76 00             	lea    0x0(%esi),%esi

00000920 <genrand>:
{
    unsigned long y;
    static unsigned long mag01[2]={0x0, MATRIX_A};
    /* mag01[x] = x * MATRIX_A  for x=0,1 */

    if (mti >= N) { /* generate N words at one time */
 920:	a1 a8 0f 00 00       	mov    0xfa8,%eax
 925:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 92a:	7f 3d                	jg     969 <genrand+0x49>
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];

        mti = 0;
    }
  
    y = mt[mti++];
 92c:	8b 0c 85 e0 0f 00 00 	mov    0xfe0(,%eax,4),%ecx
 933:	8d 50 01             	lea    0x1(%eax),%edx
 936:	89 15 a8 0f 00 00    	mov    %edx,0xfa8
    y ^= TEMPERING_SHIFT_U(y);
 93c:	89 ca                	mov    %ecx,%edx
 93e:	c1 ea 0b             	shr    $0xb,%edx
 941:	31 ca                	xor    %ecx,%edx
    y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
 943:	89 d0                	mov    %edx,%eax
 945:	c1 e0 07             	shl    $0x7,%eax
 948:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
 94d:	31 d0                	xor    %edx,%eax
    y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
 94f:	89 c2                	mov    %eax,%edx
 951:	c1 e2 0f             	shl    $0xf,%edx
 954:	81 e2 00 00 c6 ef    	and    $0xefc60000,%edx
 95a:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_L(y);
 95c:	89 d0                	mov    %edx,%eax
 95e:	c1 e8 12             	shr    $0x12,%eax
 961:	31 d0                	xor    %edx,%eax

    // Strip off uppermost bit because we want a long,
    // not an unsigned long
    return y & RAND_MAX;
 963:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
 968:	c3                   	ret    
        if (mti == N+1)   /* if sgenrand() has not been called, */
 969:	3d 71 02 00 00       	cmp    $0x271,%eax
 96e:	0f 84 d4 00 00 00    	je     a48 <genrand+0x128>
    mt[0]= seed & 0xffffffff;
 974:	31 c0                	xor    %eax,%eax
 976:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 97d:	8d 76 00             	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 980:	8b 0c 85 e0 0f 00 00 	mov    0xfe0(,%eax,4),%ecx
 987:	83 c0 01             	add    $0x1,%eax
 98a:	8b 14 85 e0 0f 00 00 	mov    0xfe0(,%eax,4),%edx
 991:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 997:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 99d:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1];
 99f:	89 d1                	mov    %edx,%ecx
 9a1:	83 e2 01             	and    $0x1,%edx
 9a4:	d1 e9                	shr    %ecx
 9a6:	33 0c 85 10 16 00 00 	xor    0x1610(,%eax,4),%ecx
 9ad:	33 0c 95 78 0c 00 00 	xor    0xc78(,%edx,4),%ecx
 9b4:	89 0c 85 dc 0f 00 00 	mov    %ecx,0xfdc(,%eax,4)
        for (kk=0;kk<N-M;kk++) {
 9bb:	3d e3 00 00 00       	cmp    $0xe3,%eax
 9c0:	75 be                	jne    980 <genrand+0x60>
 9c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 9c8:	8b 0c 85 e0 0f 00 00 	mov    0xfe0(,%eax,4),%ecx
 9cf:	83 c0 01             	add    $0x1,%eax
 9d2:	8b 14 85 e0 0f 00 00 	mov    0xfe0(,%eax,4),%edx
 9d9:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 9df:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 9e5:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1];
 9e7:	89 d1                	mov    %edx,%ecx
 9e9:	83 e2 01             	and    $0x1,%edx
 9ec:	d1 e9                	shr    %ecx
 9ee:	33 0c 85 50 0c 00 00 	xor    0xc50(,%eax,4),%ecx
 9f5:	33 0c 95 78 0c 00 00 	xor    0xc78(,%edx,4),%ecx
 9fc:	89 0c 85 dc 0f 00 00 	mov    %ecx,0xfdc(,%eax,4)
        for (;kk<N-1;kk++) {
 a03:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 a08:	75 be                	jne    9c8 <genrand+0xa8>
        y = (mt[N-1]&UPPER_MASK)|(mt[0]&LOWER_MASK);
 a0a:	8b 0d e0 0f 00 00    	mov    0xfe0,%ecx
 a10:	a1 9c 19 00 00       	mov    0x199c,%eax
 a15:	89 ca                	mov    %ecx,%edx
 a17:	25 00 00 00 80       	and    $0x80000000,%eax
 a1c:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 a22:	09 d0                	or     %edx,%eax
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];
 a24:	89 c2                	mov    %eax,%edx
 a26:	83 e0 01             	and    $0x1,%eax
 a29:	d1 ea                	shr    %edx
 a2b:	33 15 10 16 00 00    	xor    0x1610,%edx
 a31:	33 14 85 78 0c 00 00 	xor    0xc78(,%eax,4),%edx
 a38:	89 15 9c 19 00 00    	mov    %edx,0x199c
 a3e:	ba 01 00 00 00       	mov    $0x1,%edx
 a43:	e9 ee fe ff ff       	jmp    936 <genrand+0x16>
    mt[0]= seed & 0xffffffff;
 a48:	b8 e4 0f 00 00       	mov    $0xfe4,%eax
 a4d:	b9 9c 19 00 00       	mov    $0x199c,%ecx
 a52:	ba 05 11 00 00       	mov    $0x1105,%edx
 a57:	c7 05 e0 0f 00 00 05 	movl   $0x1105,0xfe0
 a5e:	11 00 00 
    for (mti=1; mti<N; mti++)
 a61:	eb 08                	jmp    a6b <genrand+0x14b>
 a63:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a67:	90                   	nop
 a68:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 a6b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 a71:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 a73:	39 c1                	cmp    %eax,%ecx
 a75:	75 f1                	jne    a68 <genrand+0x148>
 a77:	e9 f8 fe ff ff       	jmp    974 <genrand+0x54>
 a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a80 <random_at_most>:

// Assumes 0 <= max <= RAND_MAX
// Returns in the half-open interval [0, max]
long random_at_most(long max) {
 a80:	55                   	push   %ebp
  unsigned long
    // max <= RAND_MAX < ULONG_MAX, so this is okay.
    num_bins = (unsigned long) max + 1,
    num_rand = (unsigned long) RAND_MAX + 1,
    bin_size = num_rand / num_bins,
 a81:	31 d2                	xor    %edx,%edx
long random_at_most(long max) {
 a83:	89 e5                	mov    %esp,%ebp
 a85:	56                   	push   %esi
    num_bins = (unsigned long) max + 1,
 a86:	8b 45 08             	mov    0x8(%ebp),%eax
long random_at_most(long max) {
 a89:	53                   	push   %ebx
    bin_size = num_rand / num_bins,
 a8a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    num_bins = (unsigned long) max + 1,
 a8f:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 a92:	89 d8                	mov    %ebx,%eax
 a94:	f7 f1                	div    %ecx
 a96:	89 c6                	mov    %eax,%esi
  long x;
  do {
   x = genrand();
  }
  // This is carefully written not to overflow
  while (num_rand - defect <= (unsigned long)x);
 a98:	29 d3                	sub    %edx,%ebx
 a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   x = genrand();
 aa0:	e8 7b fe ff ff       	call   920 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 aa5:	39 d8                	cmp    %ebx,%eax
 aa7:	73 f7                	jae    aa0 <random_at_most+0x20>

  // Truncated division is intentional
  return x/bin_size;
 aa9:	31 d2                	xor    %edx,%edx
}
 aab:	5b                   	pop    %ebx
  return x/bin_size;
 aac:	f7 f6                	div    %esi
}
 aae:	5e                   	pop    %esi
 aaf:	5d                   	pop    %ebp
 ab0:	c3                   	ret    
 ab1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ab8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 abf:	90                   	nop

00000ac0 <randomrange>:

int randomrange(int low, int high){
 ac0:	55                   	push   %ebp
 ac1:	89 e5                	mov    %esp,%ebp
 ac3:	57                   	push   %edi
 ac4:	56                   	push   %esi
 ac5:	53                   	push   %ebx
 ac6:	83 ec 0c             	sub    $0xc,%esp
 ac9:	8b 75 08             	mov    0x8(%ebp),%esi
 acc:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(high<low){
 acf:	39 f0                	cmp    %esi,%eax
 ad1:	7d 06                	jge    ad9 <randomrange+0x19>
 ad3:	89 f2                	mov    %esi,%edx
 ad5:	89 c6                	mov    %eax,%esi
 ad7:	89 d0                	mov    %edx,%eax
    int temp=high;
    high=low;
    low=temp;
  }
  int val = random_at_most(high-low) + low;
 ad9:	29 f0                	sub    %esi,%eax
    bin_size = num_rand / num_bins,
 adb:	bb 00 00 00 80       	mov    $0x80000000,%ebx
 ae0:	31 d2                	xor    %edx,%edx
    num_bins = (unsigned long) max + 1,
 ae2:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 ae5:	89 d8                	mov    %ebx,%eax
 ae7:	f7 f1                	div    %ecx
 ae9:	89 c7                	mov    %eax,%edi
  while (num_rand - defect <= (unsigned long)x);
 aeb:	29 d3                	sub    %edx,%ebx
 aed:	8d 76 00             	lea    0x0(%esi),%esi
   x = genrand();
 af0:	e8 2b fe ff ff       	call   920 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 af5:	39 d8                	cmp    %ebx,%eax
 af7:	73 f7                	jae    af0 <randomrange+0x30>
  return x/bin_size;
 af9:	31 d2                	xor    %edx,%edx
  return val;
}
 afb:	83 c4 0c             	add    $0xc,%esp
  return x/bin_size;
 afe:	f7 f7                	div    %edi
}
 b00:	5b                   	pop    %ebx
  int val = random_at_most(high-low) + low;
 b01:	01 f0                	add    %esi,%eax
}
 b03:	5e                   	pop    %esi
 b04:	5f                   	pop    %edi
 b05:	5d                   	pop    %ebp
 b06:	c3                   	ret    
