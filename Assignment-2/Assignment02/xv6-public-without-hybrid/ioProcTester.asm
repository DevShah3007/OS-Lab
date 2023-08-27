
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
  22:	e8 59 03 00 00       	call   380 <atoi>

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
  58:	68 f8 0a 00 00       	push   $0xaf8
  5d:	6a 01                	push   $0x1
  5f:	e8 3c 05 00 00       	call   5a0 <printf>
		exit();
  64:	e8 8a 03 00 00       	call   3f3 <exit>
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
  80:	0f 8e c9 00 00 00    	jle    14f <main+0x14f>
  86:	31 db                	xor    %ebx,%ebx
  88:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8f:	90                   	nop
		burst_times[i] = randomrange(1,20);
  90:	83 ec 08             	sub    $0x8,%esp
  93:	89 df                	mov    %ebx,%edi
  95:	6a 14                	push   $0x14
  97:	6a 01                	push   $0x1
  99:	e8 12 0a 00 00       	call   ab0 <randomrange>
	for(int i=0;i<n;i++){
  9e:	83 c4 10             	add    $0x10,%esp
		burst_times[i] = randomrange(1,20);
  a1:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
	for(int i=0;i<n;i++){
  a4:	8d 5b 01             	lea    0x1(%ebx),%ebx
  a7:	39 5d d4             	cmp    %ebx,-0x2c(%ebp)
  aa:	75 e4                	jne    90 <main+0x90>
	}

	printf(1, "\tPID \t Type \t Burst Time \t Context Switches\n");
  ac:	53                   	push   %ebx
  ad:	53                   	push   %ebx
	printf(1, "\t___ \t ____ \t __________ \t ________________\n\n");
  ae:	31 db                	xor    %ebx,%ebx
	printf(1, "\tPID \t Type \t Burst Time \t Context Switches\n");
  b0:	68 94 0b 00 00       	push   $0xb94
  b5:	6a 01                	push   $0x1
  b7:	e8 e4 04 00 00       	call   5a0 <printf>
	printf(1, "\t___ \t ____ \t __________ \t ________________\n\n");
  bc:	58                   	pop    %eax
  bd:	5a                   	pop    %edx
  be:	68 c4 0b 00 00       	push   $0xbc4
  c3:	6a 01                	push   $0x1
  c5:	e8 d6 04 00 00       	call   5a0 <printf>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	eb 0e                	jmp    dd <main+0xdd>
  cf:	90                   	nop
	for(int i=0;i<n;i++){
  d0:	8d 43 01             	lea    0x1(%ebx),%eax
  d3:	39 fb                	cmp    %edi,%ebx
  d5:	0f 84 93 00 00 00    	je     16e <main+0x16e>
  db:	89 c3                	mov    %eax,%ebx
		if(!fork()){
  dd:	e8 09 03 00 00       	call   3eb <fork>
  e2:	85 c0                	test   %eax,%eax
  e4:	75 ea                	jne    d0 <main+0xd0>

			// CPU Bound process
			set_burst_time(burst_times[i]);
  e6:	83 ec 0c             	sub    $0xc,%esp
  e9:	ff 34 9e             	push   (%esi,%ebx,4)
  ec:	bb 14 00 00 00       	mov    $0x14,%ebx
  f1:	e8 d5 03 00 00       	call   4cb <set_burst_time>
  f6:	83 c4 10             	add    $0x10,%esp
  f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

			for(int i=0;i<20;i++){
				sleep(1);
 100:	83 ec 0c             	sub    $0xc,%esp
 103:	6a 01                	push   $0x1
 105:	e8 79 03 00 00       	call   483 <sleep>
			for(int i=0;i<20;i++){
 10a:	83 c4 10             	add    $0x10,%esp
 10d:	83 eb 01             	sub    $0x1,%ebx
 110:	75 ee                	jne    100 <main+0x100>
			}
			
			struct processInfo info;
			getCurrentInfo(&info);
 112:	83 ec 0c             	sub    $0xc,%esp
 115:	8d 45 dc             	lea    -0x24(%ebp),%eax
 118:	50                   	push   %eax
 119:	e8 bd 03 00 00       	call   4db <getCurrentInfo>
			int bt = get_burst_time();
 11e:	e8 b0 03 00 00       	call   4d3 <get_burst_time>
			if(bt<10)
				printf(1, "\t%d \t I/O         %d                  %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 123:	8b 75 e4             	mov    -0x1c(%ebp),%esi
			if(bt<10)
 126:	83 c4 10             	add    $0x10,%esp
			int bt = get_burst_time();
 129:	89 c3                	mov    %eax,%ebx
			if(bt<10)
 12b:	83 f8 09             	cmp    $0x9,%eax
 12e:	7f 54                	jg     184 <main+0x184>
				printf(1, "\t%d \t I/O         %d                  %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 130:	e8 ae 03 00 00       	call   4e3 <getCurrentPID>
 135:	83 ec 0c             	sub    $0xc,%esp
 138:	56                   	push   %esi
 139:	53                   	push   %ebx
 13a:	50                   	push   %eax
 13b:	68 3c 0b 00 00       	push   $0xb3c
 140:	6a 01                	push   $0x1
 142:	e8 59 04 00 00       	call   5a0 <printf>
 147:	83 c4 20             	add    $0x20,%esp
			else
				printf(1, "\t%d \t I/O         %d                 %d\n", getCurrentPID(), bt, info.numberContextSwitches);
			exit();
 14a:	e8 a4 02 00 00       	call   3f3 <exit>
	printf(1, "\tPID \t Type \t Burst Time \t Context Switches\n");
 14f:	50                   	push   %eax
 150:	50                   	push   %eax
 151:	68 94 0b 00 00       	push   $0xb94
 156:	6a 01                	push   $0x1
 158:	e8 43 04 00 00       	call   5a0 <printf>
	printf(1, "\t___ \t ____ \t __________ \t ________________\n\n");
 15d:	5a                   	pop    %edx
 15e:	59                   	pop    %ecx
 15f:	68 c4 0b 00 00       	push   $0xbc4
 164:	6a 01                	push   $0x1
 166:	e8 35 04 00 00       	call   5a0 <printf>
 16b:	83 c4 10             	add    $0x10,%esp


		}
	}

	while(wait()!=-1);
 16e:	e8 88 02 00 00       	call   3fb <wait>
 173:	83 f8 ff             	cmp    $0xffffffff,%eax
 176:	74 d2                	je     14a <main+0x14a>
 178:	e8 7e 02 00 00       	call   3fb <wait>
 17d:	83 f8 ff             	cmp    $0xffffffff,%eax
 180:	75 ec                	jne    16e <main+0x16e>
 182:	eb c6                	jmp    14a <main+0x14a>
				printf(1, "\t%d \t I/O         %d                 %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 184:	e8 5a 03 00 00       	call   4e3 <getCurrentPID>
 189:	83 ec 0c             	sub    $0xc,%esp
 18c:	56                   	push   %esi
 18d:	53                   	push   %ebx
 18e:	50                   	push   %eax
 18f:	68 68 0b 00 00       	push   $0xb68
 194:	6a 01                	push   $0x1
 196:	e8 05 04 00 00       	call   5a0 <printf>
 19b:	83 c4 20             	add    $0x20,%esp
 19e:	eb aa                	jmp    14a <main+0x14a>

000001a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1a0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1a1:	31 c0                	xor    %eax,%eax
{
 1a3:	89 e5                	mov    %esp,%ebp
 1a5:	53                   	push   %ebx
 1a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1b7:	83 c0 01             	add    $0x1,%eax
 1ba:	84 d2                	test   %dl,%dl
 1bc:	75 f2                	jne    1b0 <strcpy+0x10>
    ;
  return os;
}
 1be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c1:	89 c8                	mov    %ecx,%eax
 1c3:	c9                   	leave  
 1c4:	c3                   	ret    
 1c5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
 1d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1da:	0f b6 02             	movzbl (%edx),%eax
 1dd:	84 c0                	test   %al,%al
 1df:	75 17                	jne    1f8 <strcmp+0x28>
 1e1:	eb 3a                	jmp    21d <strcmp+0x4d>
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1ec:	83 c2 01             	add    $0x1,%edx
 1ef:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1f2:	84 c0                	test   %al,%al
 1f4:	74 1a                	je     210 <strcmp+0x40>
    p++, q++;
 1f6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 1f8:	0f b6 19             	movzbl (%ecx),%ebx
 1fb:	38 c3                	cmp    %al,%bl
 1fd:	74 e9                	je     1e8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1ff:	29 d8                	sub    %ebx,%eax
}
 201:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 204:	c9                   	leave  
 205:	c3                   	ret    
 206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 210:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 214:	31 c0                	xor    %eax,%eax
 216:	29 d8                	sub    %ebx,%eax
}
 218:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 21b:	c9                   	leave  
 21c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 21d:	0f b6 19             	movzbl (%ecx),%ebx
 220:	31 c0                	xor    %eax,%eax
 222:	eb db                	jmp    1ff <strcmp+0x2f>
 224:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <strlen>:

uint
strlen(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 236:	80 3a 00             	cmpb   $0x0,(%edx)
 239:	74 15                	je     250 <strlen+0x20>
 23b:	31 c0                	xor    %eax,%eax
 23d:	8d 76 00             	lea    0x0(%esi),%esi
 240:	83 c0 01             	add    $0x1,%eax
 243:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 247:	89 c1                	mov    %eax,%ecx
 249:	75 f5                	jne    240 <strlen+0x10>
    ;
  return n;
}
 24b:	89 c8                	mov    %ecx,%eax
 24d:	5d                   	pop    %ebp
 24e:	c3                   	ret    
 24f:	90                   	nop
  for(n = 0; s[n]; n++)
 250:	31 c9                	xor    %ecx,%ecx
}
 252:	5d                   	pop    %ebp
 253:	89 c8                	mov    %ecx,%eax
 255:	c3                   	ret    
 256:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25d:	8d 76 00             	lea    0x0(%esi),%esi

00000260 <memset>:

void*
memset(void *dst, int c, uint n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 267:	8b 4d 10             	mov    0x10(%ebp),%ecx
 26a:	8b 45 0c             	mov    0xc(%ebp),%eax
 26d:	89 d7                	mov    %edx,%edi
 26f:	fc                   	cld    
 270:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 272:	8b 7d fc             	mov    -0x4(%ebp),%edi
 275:	89 d0                	mov    %edx,%eax
 277:	c9                   	leave  
 278:	c3                   	ret    
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <strchr>:

char*
strchr(const char *s, char c)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 28a:	0f b6 10             	movzbl (%eax),%edx
 28d:	84 d2                	test   %dl,%dl
 28f:	75 12                	jne    2a3 <strchr+0x23>
 291:	eb 1d                	jmp    2b0 <strchr+0x30>
 293:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 297:	90                   	nop
 298:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 29c:	83 c0 01             	add    $0x1,%eax
 29f:	84 d2                	test   %dl,%dl
 2a1:	74 0d                	je     2b0 <strchr+0x30>
    if(*s == c)
 2a3:	38 d1                	cmp    %dl,%cl
 2a5:	75 f1                	jne    298 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2a7:	5d                   	pop    %ebp
 2a8:	c3                   	ret    
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2b0:	31 c0                	xor    %eax,%eax
}
 2b2:	5d                   	pop    %ebp
 2b3:	c3                   	ret    
 2b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2bf:	90                   	nop

000002c0 <gets>:

char*
gets(char *buf, int max)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2c5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2c8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2c9:	31 db                	xor    %ebx,%ebx
{
 2cb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2ce:	eb 27                	jmp    2f7 <gets+0x37>
    cc = read(0, &c, 1);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	6a 01                	push   $0x1
 2d5:	57                   	push   %edi
 2d6:	6a 00                	push   $0x0
 2d8:	e8 2e 01 00 00       	call   40b <read>
    if(cc < 1)
 2dd:	83 c4 10             	add    $0x10,%esp
 2e0:	85 c0                	test   %eax,%eax
 2e2:	7e 1d                	jle    301 <gets+0x41>
      break;
    buf[i++] = c;
 2e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2e8:	8b 55 08             	mov    0x8(%ebp),%edx
 2eb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2ef:	3c 0a                	cmp    $0xa,%al
 2f1:	74 1d                	je     310 <gets+0x50>
 2f3:	3c 0d                	cmp    $0xd,%al
 2f5:	74 19                	je     310 <gets+0x50>
  for(i=0; i+1 < max; ){
 2f7:	89 de                	mov    %ebx,%esi
 2f9:	83 c3 01             	add    $0x1,%ebx
 2fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ff:	7c cf                	jl     2d0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 301:	8b 45 08             	mov    0x8(%ebp),%eax
 304:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 308:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30b:	5b                   	pop    %ebx
 30c:	5e                   	pop    %esi
 30d:	5f                   	pop    %edi
 30e:	5d                   	pop    %ebp
 30f:	c3                   	ret    
  buf[i] = '\0';
 310:	8b 45 08             	mov    0x8(%ebp),%eax
 313:	89 de                	mov    %ebx,%esi
 315:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 319:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31c:	5b                   	pop    %ebx
 31d:	5e                   	pop    %esi
 31e:	5f                   	pop    %edi
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    
 321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 328:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32f:	90                   	nop

00000330 <stat>:

int
stat(const char *n, struct stat *st)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	56                   	push   %esi
 334:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 335:	83 ec 08             	sub    $0x8,%esp
 338:	6a 00                	push   $0x0
 33a:	ff 75 08             	push   0x8(%ebp)
 33d:	e8 f1 00 00 00       	call   433 <open>
  if(fd < 0)
 342:	83 c4 10             	add    $0x10,%esp
 345:	85 c0                	test   %eax,%eax
 347:	78 27                	js     370 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 349:	83 ec 08             	sub    $0x8,%esp
 34c:	ff 75 0c             	push   0xc(%ebp)
 34f:	89 c3                	mov    %eax,%ebx
 351:	50                   	push   %eax
 352:	e8 f4 00 00 00       	call   44b <fstat>
  close(fd);
 357:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 35a:	89 c6                	mov    %eax,%esi
  close(fd);
 35c:	e8 ba 00 00 00       	call   41b <close>
  return r;
 361:	83 c4 10             	add    $0x10,%esp
}
 364:	8d 65 f8             	lea    -0x8(%ebp),%esp
 367:	89 f0                	mov    %esi,%eax
 369:	5b                   	pop    %ebx
 36a:	5e                   	pop    %esi
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    
 36d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 370:	be ff ff ff ff       	mov    $0xffffffff,%esi
 375:	eb ed                	jmp    364 <stat+0x34>
 377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37e:	66 90                	xchg   %ax,%ax

00000380 <atoi>:

int
atoi(const char *s)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 387:	0f be 02             	movsbl (%edx),%eax
 38a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 38d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 390:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 395:	77 1e                	ja     3b5 <atoi+0x35>
 397:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3a0:	83 c2 01             	add    $0x1,%edx
 3a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3aa:	0f be 02             	movsbl (%edx),%eax
 3ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3b0:	80 fb 09             	cmp    $0x9,%bl
 3b3:	76 eb                	jbe    3a0 <atoi+0x20>
  return n;
}
 3b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b8:	89 c8                	mov    %ecx,%eax
 3ba:	c9                   	leave  
 3bb:	c3                   	ret    
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	8b 45 10             	mov    0x10(%ebp),%eax
 3c7:	8b 55 08             	mov    0x8(%ebp),%edx
 3ca:	56                   	push   %esi
 3cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ce:	85 c0                	test   %eax,%eax
 3d0:	7e 13                	jle    3e5 <memmove+0x25>
 3d2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3d4:	89 d7                	mov    %edx,%edi
 3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3e1:	39 f8                	cmp    %edi,%eax
 3e3:	75 fb                	jne    3e0 <memmove+0x20>
  return vdst;
}
 3e5:	5e                   	pop    %esi
 3e6:	89 d0                	mov    %edx,%eax
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    

000003eb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3eb:	b8 01 00 00 00       	mov    $0x1,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <exit>:
SYSCALL(exit)
 3f3:	b8 02 00 00 00       	mov    $0x2,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <wait>:
SYSCALL(wait)
 3fb:	b8 03 00 00 00       	mov    $0x3,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <pipe>:
SYSCALL(pipe)
 403:	b8 04 00 00 00       	mov    $0x4,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <read>:
SYSCALL(read)
 40b:	b8 05 00 00 00       	mov    $0x5,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <write>:
SYSCALL(write)
 413:	b8 10 00 00 00       	mov    $0x10,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <close>:
SYSCALL(close)
 41b:	b8 15 00 00 00       	mov    $0x15,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <kill>:
SYSCALL(kill)
 423:	b8 06 00 00 00       	mov    $0x6,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <exec>:
SYSCALL(exec)
 42b:	b8 07 00 00 00       	mov    $0x7,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <open>:
SYSCALL(open)
 433:	b8 0f 00 00 00       	mov    $0xf,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <mknod>:
SYSCALL(mknod)
 43b:	b8 11 00 00 00       	mov    $0x11,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <unlink>:
SYSCALL(unlink)
 443:	b8 12 00 00 00       	mov    $0x12,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <fstat>:
SYSCALL(fstat)
 44b:	b8 08 00 00 00       	mov    $0x8,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <link>:
SYSCALL(link)
 453:	b8 13 00 00 00       	mov    $0x13,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <mkdir>:
SYSCALL(mkdir)
 45b:	b8 14 00 00 00       	mov    $0x14,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <chdir>:
SYSCALL(chdir)
 463:	b8 09 00 00 00       	mov    $0x9,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <dup>:
SYSCALL(dup)
 46b:	b8 0a 00 00 00       	mov    $0xa,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <getpid>:
SYSCALL(getpid)
 473:	b8 0b 00 00 00       	mov    $0xb,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <sbrk>:
SYSCALL(sbrk)
 47b:	b8 0c 00 00 00       	mov    $0xc,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <sleep>:
SYSCALL(sleep)
 483:	b8 0d 00 00 00       	mov    $0xd,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <uptime>:
SYSCALL(uptime)
 48b:	b8 0e 00 00 00       	mov    $0xe,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <thread_create>:
SYSCALL(thread_create)
 493:	b8 16 00 00 00       	mov    $0x16,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <thread_join>:
SYSCALL(thread_join)
 49b:	b8 18 00 00 00       	mov    $0x18,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <thread_exit>:
SYSCALL(thread_exit)
 4a3:	b8 17 00 00 00       	mov    $0x17,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <draw>:
SYSCALL(draw)
 4ab:	b8 19 00 00 00       	mov    $0x19,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <getNumProc>:
SYSCALL(getNumProc)
 4b3:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <getMaxPid>:
SYSCALL(getMaxPid)
 4bb:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <getProcInfo>:
SYSCALL(getProcInfo)
 4c3:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <set_burst_time>:
SYSCALL(set_burst_time)
 4cb:	b8 1d 00 00 00       	mov    $0x1d,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <get_burst_time>:
SYSCALL(get_burst_time)
 4d3:	b8 1e 00 00 00       	mov    $0x1e,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <getCurrentInfo>:
SYSCALL(getCurrentInfo)
 4db:	b8 1f 00 00 00       	mov    $0x1f,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <getCurrentPID>:
SYSCALL(getCurrentPID)
 4e3:	b8 20 00 00 00       	mov    $0x20,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    
 4eb:	66 90                	xchg   %ax,%ax
 4ed:	66 90                	xchg   %ax,%ax
 4ef:	90                   	nop

000004f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	83 ec 3c             	sub    $0x3c,%esp
 4f9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4fc:	89 d1                	mov    %edx,%ecx
{
 4fe:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 501:	85 d2                	test   %edx,%edx
 503:	0f 89 7f 00 00 00    	jns    588 <printint+0x98>
 509:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 50d:	74 79                	je     588 <printint+0x98>
    neg = 1;
 50f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 516:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 518:	31 db                	xor    %ebx,%ebx
 51a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 51d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 520:	89 c8                	mov    %ecx,%eax
 522:	31 d2                	xor    %edx,%edx
 524:	89 cf                	mov    %ecx,%edi
 526:	f7 75 c4             	divl   -0x3c(%ebp)
 529:	0f b6 92 54 0c 00 00 	movzbl 0xc54(%edx),%edx
 530:	89 45 c0             	mov    %eax,-0x40(%ebp)
 533:	89 d8                	mov    %ebx,%eax
 535:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 538:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 53b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 53e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 541:	76 dd                	jbe    520 <printint+0x30>
  if(neg)
 543:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 546:	85 c9                	test   %ecx,%ecx
 548:	74 0c                	je     556 <printint+0x66>
    buf[i++] = '-';
 54a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 54f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 551:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 556:	8b 7d b8             	mov    -0x48(%ebp),%edi
 559:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 55d:	eb 07                	jmp    566 <printint+0x76>
 55f:	90                   	nop
    putc(fd, buf[i]);
 560:	0f b6 13             	movzbl (%ebx),%edx
 563:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 566:	83 ec 04             	sub    $0x4,%esp
 569:	88 55 d7             	mov    %dl,-0x29(%ebp)
 56c:	6a 01                	push   $0x1
 56e:	56                   	push   %esi
 56f:	57                   	push   %edi
 570:	e8 9e fe ff ff       	call   413 <write>
  while(--i >= 0)
 575:	83 c4 10             	add    $0x10,%esp
 578:	39 de                	cmp    %ebx,%esi
 57a:	75 e4                	jne    560 <printint+0x70>
}
 57c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 57f:	5b                   	pop    %ebx
 580:	5e                   	pop    %esi
 581:	5f                   	pop    %edi
 582:	5d                   	pop    %ebp
 583:	c3                   	ret    
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 588:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 58f:	eb 87                	jmp    518 <printint+0x28>
 591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 598:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop

000005a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5ac:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5af:	0f b6 13             	movzbl (%ebx),%edx
 5b2:	84 d2                	test   %dl,%dl
 5b4:	74 6a                	je     620 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5b6:	8d 45 10             	lea    0x10(%ebp),%eax
 5b9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5bc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5bf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 5c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5c4:	eb 36                	jmp    5fc <printf+0x5c>
 5c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
 5d0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5d3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5d8:	83 f8 25             	cmp    $0x25,%eax
 5db:	74 15                	je     5f2 <printf+0x52>
  write(fd, &c, 1);
 5dd:	83 ec 04             	sub    $0x4,%esp
 5e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5e3:	6a 01                	push   $0x1
 5e5:	57                   	push   %edi
 5e6:	56                   	push   %esi
 5e7:	e8 27 fe ff ff       	call   413 <write>
 5ec:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 5ef:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5f2:	0f b6 13             	movzbl (%ebx),%edx
 5f5:	83 c3 01             	add    $0x1,%ebx
 5f8:	84 d2                	test   %dl,%dl
 5fa:	74 24                	je     620 <printf+0x80>
    c = fmt[i] & 0xff;
 5fc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5ff:	85 c9                	test   %ecx,%ecx
 601:	74 cd                	je     5d0 <printf+0x30>
      }
    } else if(state == '%'){
 603:	83 f9 25             	cmp    $0x25,%ecx
 606:	75 ea                	jne    5f2 <printf+0x52>
      if(c == 'd'){
 608:	83 f8 25             	cmp    $0x25,%eax
 60b:	0f 84 07 01 00 00    	je     718 <printf+0x178>
 611:	83 e8 63             	sub    $0x63,%eax
 614:	83 f8 15             	cmp    $0x15,%eax
 617:	77 17                	ja     630 <printf+0x90>
 619:	ff 24 85 fc 0b 00 00 	jmp    *0xbfc(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 620:	8d 65 f4             	lea    -0xc(%ebp),%esp
 623:	5b                   	pop    %ebx
 624:	5e                   	pop    %esi
 625:	5f                   	pop    %edi
 626:	5d                   	pop    %ebp
 627:	c3                   	ret    
 628:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62f:	90                   	nop
  write(fd, &c, 1);
 630:	83 ec 04             	sub    $0x4,%esp
 633:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 636:	6a 01                	push   $0x1
 638:	57                   	push   %edi
 639:	56                   	push   %esi
 63a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 63e:	e8 d0 fd ff ff       	call   413 <write>
        putc(fd, c);
 643:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 647:	83 c4 0c             	add    $0xc,%esp
 64a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 64d:	6a 01                	push   $0x1
 64f:	57                   	push   %edi
 650:	56                   	push   %esi
 651:	e8 bd fd ff ff       	call   413 <write>
        putc(fd, c);
 656:	83 c4 10             	add    $0x10,%esp
      state = 0;
 659:	31 c9                	xor    %ecx,%ecx
 65b:	eb 95                	jmp    5f2 <printf+0x52>
 65d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 660:	83 ec 0c             	sub    $0xc,%esp
 663:	b9 10 00 00 00       	mov    $0x10,%ecx
 668:	6a 00                	push   $0x0
 66a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 66d:	8b 10                	mov    (%eax),%edx
 66f:	89 f0                	mov    %esi,%eax
 671:	e8 7a fe ff ff       	call   4f0 <printint>
        ap++;
 676:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 67a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67d:	31 c9                	xor    %ecx,%ecx
 67f:	e9 6e ff ff ff       	jmp    5f2 <printf+0x52>
 684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 688:	8b 45 d0             	mov    -0x30(%ebp),%eax
 68b:	8b 10                	mov    (%eax),%edx
        ap++;
 68d:	83 c0 04             	add    $0x4,%eax
 690:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 693:	85 d2                	test   %edx,%edx
 695:	0f 84 8d 00 00 00    	je     728 <printf+0x188>
        while(*s != 0){
 69b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 69e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 6a0:	84 c0                	test   %al,%al
 6a2:	0f 84 4a ff ff ff    	je     5f2 <printf+0x52>
 6a8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6ab:	89 d3                	mov    %edx,%ebx
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6b0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6b3:	83 c3 01             	add    $0x1,%ebx
 6b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6b9:	6a 01                	push   $0x1
 6bb:	57                   	push   %edi
 6bc:	56                   	push   %esi
 6bd:	e8 51 fd ff ff       	call   413 <write>
        while(*s != 0){
 6c2:	0f b6 03             	movzbl (%ebx),%eax
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	84 c0                	test   %al,%al
 6ca:	75 e4                	jne    6b0 <printf+0x110>
      state = 0;
 6cc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 6cf:	31 c9                	xor    %ecx,%ecx
 6d1:	e9 1c ff ff ff       	jmp    5f2 <printf+0x52>
 6d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6e0:	83 ec 0c             	sub    $0xc,%esp
 6e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e8:	6a 01                	push   $0x1
 6ea:	e9 7b ff ff ff       	jmp    66a <printf+0xca>
 6ef:	90                   	nop
        putc(fd, *ap);
 6f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 6f3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6f6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6f8:	6a 01                	push   $0x1
 6fa:	57                   	push   %edi
 6fb:	56                   	push   %esi
        putc(fd, *ap);
 6fc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6ff:	e8 0f fd ff ff       	call   413 <write>
        ap++;
 704:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 708:	83 c4 10             	add    $0x10,%esp
      state = 0;
 70b:	31 c9                	xor    %ecx,%ecx
 70d:	e9 e0 fe ff ff       	jmp    5f2 <printf+0x52>
 712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 718:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 71b:	83 ec 04             	sub    $0x4,%esp
 71e:	e9 2a ff ff ff       	jmp    64d <printf+0xad>
 723:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 727:	90                   	nop
          s = "(null)";
 728:	ba f2 0b 00 00       	mov    $0xbf2,%edx
        while(*s != 0){
 72d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 730:	b8 28 00 00 00       	mov    $0x28,%eax
 735:	89 d3                	mov    %edx,%ebx
 737:	e9 74 ff ff ff       	jmp    6b0 <printf+0x110>
 73c:	66 90                	xchg   %ax,%ax
 73e:	66 90                	xchg   %ax,%ax

00000740 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 740:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 741:	a1 a0 0f 00 00       	mov    0xfa0,%eax
{
 746:	89 e5                	mov    %esp,%ebp
 748:	57                   	push   %edi
 749:	56                   	push   %esi
 74a:	53                   	push   %ebx
 74b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 74e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 751:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 758:	89 c2                	mov    %eax,%edx
 75a:	8b 00                	mov    (%eax),%eax
 75c:	39 ca                	cmp    %ecx,%edx
 75e:	73 30                	jae    790 <free+0x50>
 760:	39 c1                	cmp    %eax,%ecx
 762:	72 04                	jb     768 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 764:	39 c2                	cmp    %eax,%edx
 766:	72 f0                	jb     758 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 768:	8b 73 fc             	mov    -0x4(%ebx),%esi
 76b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 76e:	39 f8                	cmp    %edi,%eax
 770:	74 30                	je     7a2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 772:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 775:	8b 42 04             	mov    0x4(%edx),%eax
 778:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 77b:	39 f1                	cmp    %esi,%ecx
 77d:	74 3a                	je     7b9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 77f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 781:	5b                   	pop    %ebx
  freep = p;
 782:	89 15 a0 0f 00 00    	mov    %edx,0xfa0
}
 788:	5e                   	pop    %esi
 789:	5f                   	pop    %edi
 78a:	5d                   	pop    %ebp
 78b:	c3                   	ret    
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 790:	39 c2                	cmp    %eax,%edx
 792:	72 c4                	jb     758 <free+0x18>
 794:	39 c1                	cmp    %eax,%ecx
 796:	73 c0                	jae    758 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 798:	8b 73 fc             	mov    -0x4(%ebx),%esi
 79b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 79e:	39 f8                	cmp    %edi,%eax
 7a0:	75 d0                	jne    772 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7a2:	03 70 04             	add    0x4(%eax),%esi
 7a5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a8:	8b 02                	mov    (%edx),%eax
 7aa:	8b 00                	mov    (%eax),%eax
 7ac:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7af:	8b 42 04             	mov    0x4(%edx),%eax
 7b2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7b5:	39 f1                	cmp    %esi,%ecx
 7b7:	75 c6                	jne    77f <free+0x3f>
    p->s.size += bp->s.size;
 7b9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7bc:	89 15 a0 0f 00 00    	mov    %edx,0xfa0
    p->s.size += bp->s.size;
 7c2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7c5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7c8:	89 0a                	mov    %ecx,(%edx)
}
 7ca:	5b                   	pop    %ebx
 7cb:	5e                   	pop    %esi
 7cc:	5f                   	pop    %edi
 7cd:	5d                   	pop    %ebp
 7ce:	c3                   	ret    
 7cf:	90                   	nop

000007d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	57                   	push   %edi
 7d4:	56                   	push   %esi
 7d5:	53                   	push   %ebx
 7d6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7dc:	8b 3d a0 0f 00 00    	mov    0xfa0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e2:	8d 70 07             	lea    0x7(%eax),%esi
 7e5:	c1 ee 03             	shr    $0x3,%esi
 7e8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7eb:	85 ff                	test   %edi,%edi
 7ed:	0f 84 9d 00 00 00    	je     890 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 7f5:	8b 4a 04             	mov    0x4(%edx),%ecx
 7f8:	39 f1                	cmp    %esi,%ecx
 7fa:	73 6a                	jae    866 <malloc+0x96>
 7fc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 801:	39 de                	cmp    %ebx,%esi
 803:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 806:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 80d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 810:	eb 17                	jmp    829 <malloc+0x59>
 812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 818:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 81a:	8b 48 04             	mov    0x4(%eax),%ecx
 81d:	39 f1                	cmp    %esi,%ecx
 81f:	73 4f                	jae    870 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 821:	8b 3d a0 0f 00 00    	mov    0xfa0,%edi
 827:	89 c2                	mov    %eax,%edx
 829:	39 d7                	cmp    %edx,%edi
 82b:	75 eb                	jne    818 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 82d:	83 ec 0c             	sub    $0xc,%esp
 830:	ff 75 e4             	push   -0x1c(%ebp)
 833:	e8 43 fc ff ff       	call   47b <sbrk>
  if(p == (char*)-1)
 838:	83 c4 10             	add    $0x10,%esp
 83b:	83 f8 ff             	cmp    $0xffffffff,%eax
 83e:	74 1c                	je     85c <malloc+0x8c>
  hp->s.size = nu;
 840:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 843:	83 ec 0c             	sub    $0xc,%esp
 846:	83 c0 08             	add    $0x8,%eax
 849:	50                   	push   %eax
 84a:	e8 f1 fe ff ff       	call   740 <free>
  return freep;
 84f:	8b 15 a0 0f 00 00    	mov    0xfa0,%edx
      if((p = morecore(nunits)) == 0)
 855:	83 c4 10             	add    $0x10,%esp
 858:	85 d2                	test   %edx,%edx
 85a:	75 bc                	jne    818 <malloc+0x48>
        return 0;
  }
}
 85c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 85f:	31 c0                	xor    %eax,%eax
}
 861:	5b                   	pop    %ebx
 862:	5e                   	pop    %esi
 863:	5f                   	pop    %edi
 864:	5d                   	pop    %ebp
 865:	c3                   	ret    
    if(p->s.size >= nunits){
 866:	89 d0                	mov    %edx,%eax
 868:	89 fa                	mov    %edi,%edx
 86a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 870:	39 ce                	cmp    %ecx,%esi
 872:	74 4c                	je     8c0 <malloc+0xf0>
        p->s.size -= nunits;
 874:	29 f1                	sub    %esi,%ecx
 876:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 879:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 87c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 87f:	89 15 a0 0f 00 00    	mov    %edx,0xfa0
}
 885:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 888:	83 c0 08             	add    $0x8,%eax
}
 88b:	5b                   	pop    %ebx
 88c:	5e                   	pop    %esi
 88d:	5f                   	pop    %edi
 88e:	5d                   	pop    %ebp
 88f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 890:	c7 05 a0 0f 00 00 a4 	movl   $0xfa4,0xfa0
 897:	0f 00 00 
    base.s.size = 0;
 89a:	bf a4 0f 00 00       	mov    $0xfa4,%edi
    base.s.ptr = freep = prevp = &base;
 89f:	c7 05 a4 0f 00 00 a4 	movl   $0xfa4,0xfa4
 8a6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8ab:	c7 05 a8 0f 00 00 00 	movl   $0x0,0xfa8
 8b2:	00 00 00 
    if(p->s.size >= nunits){
 8b5:	e9 42 ff ff ff       	jmp    7fc <malloc+0x2c>
 8ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8c0:	8b 08                	mov    (%eax),%ecx
 8c2:	89 0a                	mov    %ecx,(%edx)
 8c4:	eb b9                	jmp    87f <malloc+0xaf>
 8c6:	66 90                	xchg   %ax,%ax
 8c8:	66 90                	xchg   %ax,%ax
 8ca:	66 90                	xchg   %ax,%ax
 8cc:	66 90                	xchg   %ax,%ax
 8ce:	66 90                	xchg   %ax,%ax

000008d0 <sgenrand>:
static int mti=N+1; /* mti==N+1 means mt[N] is not initialized */

/* initializing the array with a NONZERO seed */
void
sgenrand(unsigned long seed)
{
 8d0:	55                   	push   %ebp
 8d1:	b8 c4 0f 00 00       	mov    $0xfc4,%eax
 8d6:	89 e5                	mov    %esp,%ebp
 8d8:	8b 55 08             	mov    0x8(%ebp),%edx
    /* setting initial seeds to mt[N] using         */
    /* the generator Line 25 of Table 1 in          */
    /* [KNUTH 1981, The Art of Computer Programming */
    /*    Vol. 2 (2nd Ed.), pp102]                  */
    mt[0]= seed & 0xffffffff;
 8db:	89 15 c0 0f 00 00    	mov    %edx,0xfc0
    for (mti=1; mti<N; mti++)
 8e1:	eb 08                	jmp    8eb <sgenrand+0x1b>
 8e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8e7:	90                   	nop
 8e8:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 8eb:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 8f1:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 8f3:	3d 7c 19 00 00       	cmp    $0x197c,%eax
 8f8:	75 ee                	jne    8e8 <sgenrand+0x18>
 8fa:	c7 05 98 0f 00 00 70 	movl   $0x270,0xf98
 901:	02 00 00 
}
 904:	5d                   	pop    %ebp
 905:	c3                   	ret    
 906:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 90d:	8d 76 00             	lea    0x0(%esi),%esi

00000910 <genrand>:
{
    unsigned long y;
    static unsigned long mag01[2]={0x0, MATRIX_A};
    /* mag01[x] = x * MATRIX_A  for x=0,1 */

    if (mti >= N) { /* generate N words at one time */
 910:	a1 98 0f 00 00       	mov    0xf98,%eax
 915:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 91a:	7f 3d                	jg     959 <genrand+0x49>
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];

        mti = 0;
    }
  
    y = mt[mti++];
 91c:	8b 0c 85 c0 0f 00 00 	mov    0xfc0(,%eax,4),%ecx
 923:	8d 50 01             	lea    0x1(%eax),%edx
 926:	89 15 98 0f 00 00    	mov    %edx,0xf98
    y ^= TEMPERING_SHIFT_U(y);
 92c:	89 ca                	mov    %ecx,%edx
 92e:	c1 ea 0b             	shr    $0xb,%edx
 931:	31 ca                	xor    %ecx,%edx
    y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
 933:	89 d0                	mov    %edx,%eax
 935:	c1 e0 07             	shl    $0x7,%eax
 938:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
 93d:	31 d0                	xor    %edx,%eax
    y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
 93f:	89 c2                	mov    %eax,%edx
 941:	c1 e2 0f             	shl    $0xf,%edx
 944:	81 e2 00 00 c6 ef    	and    $0xefc60000,%edx
 94a:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_L(y);
 94c:	89 d0                	mov    %edx,%eax
 94e:	c1 e8 12             	shr    $0x12,%eax
 951:	31 d0                	xor    %edx,%eax

    // Strip off uppermost bit because we want a long,
    // not an unsigned long
    return y & RAND_MAX;
 953:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
 958:	c3                   	ret    
        if (mti == N+1)   /* if sgenrand() has not been called, */
 959:	3d 71 02 00 00       	cmp    $0x271,%eax
 95e:	0f 84 d4 00 00 00    	je     a38 <genrand+0x128>
    mt[0]= seed & 0xffffffff;
 964:	31 c0                	xor    %eax,%eax
 966:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 96d:	8d 76 00             	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 970:	8b 0c 85 c0 0f 00 00 	mov    0xfc0(,%eax,4),%ecx
 977:	83 c0 01             	add    $0x1,%eax
 97a:	8b 14 85 c0 0f 00 00 	mov    0xfc0(,%eax,4),%edx
 981:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 987:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 98d:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1];
 98f:	89 d1                	mov    %edx,%ecx
 991:	83 e2 01             	and    $0x1,%edx
 994:	d1 e9                	shr    %ecx
 996:	33 0c 85 f0 15 00 00 	xor    0x15f0(,%eax,4),%ecx
 99d:	33 0c 95 68 0c 00 00 	xor    0xc68(,%edx,4),%ecx
 9a4:	89 0c 85 bc 0f 00 00 	mov    %ecx,0xfbc(,%eax,4)
        for (kk=0;kk<N-M;kk++) {
 9ab:	3d e3 00 00 00       	cmp    $0xe3,%eax
 9b0:	75 be                	jne    970 <genrand+0x60>
 9b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 9b8:	8b 0c 85 c0 0f 00 00 	mov    0xfc0(,%eax,4),%ecx
 9bf:	83 c0 01             	add    $0x1,%eax
 9c2:	8b 14 85 c0 0f 00 00 	mov    0xfc0(,%eax,4),%edx
 9c9:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 9cf:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 9d5:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1];
 9d7:	89 d1                	mov    %edx,%ecx
 9d9:	83 e2 01             	and    $0x1,%edx
 9dc:	d1 e9                	shr    %ecx
 9de:	33 0c 85 30 0c 00 00 	xor    0xc30(,%eax,4),%ecx
 9e5:	33 0c 95 68 0c 00 00 	xor    0xc68(,%edx,4),%ecx
 9ec:	89 0c 85 bc 0f 00 00 	mov    %ecx,0xfbc(,%eax,4)
        for (;kk<N-1;kk++) {
 9f3:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 9f8:	75 be                	jne    9b8 <genrand+0xa8>
        y = (mt[N-1]&UPPER_MASK)|(mt[0]&LOWER_MASK);
 9fa:	8b 0d c0 0f 00 00    	mov    0xfc0,%ecx
 a00:	a1 7c 19 00 00       	mov    0x197c,%eax
 a05:	89 ca                	mov    %ecx,%edx
 a07:	25 00 00 00 80       	and    $0x80000000,%eax
 a0c:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 a12:	09 d0                	or     %edx,%eax
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];
 a14:	89 c2                	mov    %eax,%edx
 a16:	83 e0 01             	and    $0x1,%eax
 a19:	d1 ea                	shr    %edx
 a1b:	33 15 f0 15 00 00    	xor    0x15f0,%edx
 a21:	33 14 85 68 0c 00 00 	xor    0xc68(,%eax,4),%edx
 a28:	89 15 7c 19 00 00    	mov    %edx,0x197c
 a2e:	ba 01 00 00 00       	mov    $0x1,%edx
 a33:	e9 ee fe ff ff       	jmp    926 <genrand+0x16>
    mt[0]= seed & 0xffffffff;
 a38:	b8 c4 0f 00 00       	mov    $0xfc4,%eax
 a3d:	b9 7c 19 00 00       	mov    $0x197c,%ecx
 a42:	ba 05 11 00 00       	mov    $0x1105,%edx
 a47:	c7 05 c0 0f 00 00 05 	movl   $0x1105,0xfc0
 a4e:	11 00 00 
    for (mti=1; mti<N; mti++)
 a51:	eb 08                	jmp    a5b <genrand+0x14b>
 a53:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a57:	90                   	nop
 a58:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 a5b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 a61:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 a63:	39 c1                	cmp    %eax,%ecx
 a65:	75 f1                	jne    a58 <genrand+0x148>
 a67:	e9 f8 fe ff ff       	jmp    964 <genrand+0x54>
 a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a70 <random_at_most>:

// Assumes 0 <= max <= RAND_MAX
// Returns in the half-open interval [0, max]
long random_at_most(long max) {
 a70:	55                   	push   %ebp
  unsigned long
    // max <= RAND_MAX < ULONG_MAX, so this is okay.
    num_bins = (unsigned long) max + 1,
    num_rand = (unsigned long) RAND_MAX + 1,
    bin_size = num_rand / num_bins,
 a71:	31 d2                	xor    %edx,%edx
long random_at_most(long max) {
 a73:	89 e5                	mov    %esp,%ebp
 a75:	56                   	push   %esi
    num_bins = (unsigned long) max + 1,
 a76:	8b 45 08             	mov    0x8(%ebp),%eax
long random_at_most(long max) {
 a79:	53                   	push   %ebx
    bin_size = num_rand / num_bins,
 a7a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    num_bins = (unsigned long) max + 1,
 a7f:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 a82:	89 d8                	mov    %ebx,%eax
 a84:	f7 f1                	div    %ecx
 a86:	89 c6                	mov    %eax,%esi
  long x;
  do {
   x = genrand();
  }
  // This is carefully written not to overflow
  while (num_rand - defect <= (unsigned long)x);
 a88:	29 d3                	sub    %edx,%ebx
 a8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   x = genrand();
 a90:	e8 7b fe ff ff       	call   910 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 a95:	39 d8                	cmp    %ebx,%eax
 a97:	73 f7                	jae    a90 <random_at_most+0x20>

  // Truncated division is intentional
  return x/bin_size;
 a99:	31 d2                	xor    %edx,%edx
}
 a9b:	5b                   	pop    %ebx
  return x/bin_size;
 a9c:	f7 f6                	div    %esi
}
 a9e:	5e                   	pop    %esi
 a9f:	5d                   	pop    %ebp
 aa0:	c3                   	ret    
 aa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 aa8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 aaf:	90                   	nop

00000ab0 <randomrange>:

int randomrange(int low, int high){
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	57                   	push   %edi
 ab4:	56                   	push   %esi
 ab5:	53                   	push   %ebx
 ab6:	83 ec 0c             	sub    $0xc,%esp
 ab9:	8b 75 08             	mov    0x8(%ebp),%esi
 abc:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(high<low){
 abf:	39 f0                	cmp    %esi,%eax
 ac1:	7d 06                	jge    ac9 <randomrange+0x19>
 ac3:	89 f2                	mov    %esi,%edx
 ac5:	89 c6                	mov    %eax,%esi
 ac7:	89 d0                	mov    %edx,%eax
    int temp=high;
    high=low;
    low=temp;
  }
  int val = random_at_most(high-low) + low;
 ac9:	29 f0                	sub    %esi,%eax
    bin_size = num_rand / num_bins,
 acb:	bb 00 00 00 80       	mov    $0x80000000,%ebx
 ad0:	31 d2                	xor    %edx,%edx
    num_bins = (unsigned long) max + 1,
 ad2:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 ad5:	89 d8                	mov    %ebx,%eax
 ad7:	f7 f1                	div    %ecx
 ad9:	89 c7                	mov    %eax,%edi
  while (num_rand - defect <= (unsigned long)x);
 adb:	29 d3                	sub    %edx,%ebx
 add:	8d 76 00             	lea    0x0(%esi),%esi
   x = genrand();
 ae0:	e8 2b fe ff ff       	call   910 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 ae5:	39 d8                	cmp    %ebx,%eax
 ae7:	73 f7                	jae    ae0 <randomrange+0x30>
  return x/bin_size;
 ae9:	31 d2                	xor    %edx,%edx
  return val;
}
 aeb:	83 c4 0c             	add    $0xc,%esp
  return x/bin_size;
 aee:	f7 f7                	div    %edi
}
 af0:	5b                   	pop    %ebx
  int val = random_at_most(high-low) + low;
 af1:	01 f0                	add    %esi,%eax
}
 af3:	5e                   	pop    %esi
 af4:	5f                   	pop    %edi
 af5:	5d                   	pop    %ebp
 af6:	c3                   	ret    
