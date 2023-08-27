
_cpuProcTester:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int useless = 0;
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
  17:	8b 51 04             	mov    0x4(%ecx),%edx
	if(argv<2){
  1a:	7e 3a                	jle    56 <main+0x56>
		printf(1, "Incorrect format!\nFormat: test_cpu_only <number of fork processes>\n");

		exit();
	}

	int n=atoi(argc[1]);
  1c:	83 ec 0c             	sub    $0xc,%esp
  1f:	ff 72 04             	push   0x4(%edx)
  22:	e8 49 03 00 00       	call   370 <atoi>

	int burst_times[n];
  27:	83 c4 10             	add    $0x10,%esp
  2a:	8d 14 85 0f 00 00 00 	lea    0xf(,%eax,4),%edx
	int n=atoi(argc[1]);
  31:	89 c3                	mov    %eax,%ebx
	int burst_times[n];
  33:	89 e1                	mov    %esp,%ecx
  35:	89 d0                	mov    %edx,%eax
  37:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  3d:	83 e0 f0             	and    $0xfffffff0,%eax
  40:	29 d1                	sub    %edx,%ecx
  42:	39 cc                	cmp    %ecx,%esp
  44:	74 23                	je     69 <main+0x69>
  46:	81 ec 00 10 00 00    	sub    $0x1000,%esp
  4c:	83 8c 24 fc 0f 00 00 	orl    $0x0,0xffc(%esp)
  53:	00 
  54:	eb ec                	jmp    42 <main+0x42>
		printf(1, "Incorrect format!\nFormat: test_cpu_only <number of fork processes>\n");
  56:	53                   	push   %ebx
  57:	53                   	push   %ebx
  58:	68 e8 0a 00 00       	push   $0xae8
  5d:	6a 01                	push   $0x1
  5f:	e8 2c 05 00 00       	call   590 <printf>
		exit();
  64:	e8 7a 03 00 00       	call   3e3 <exit>
	int burst_times[n];
  69:	25 ff 0f 00 00       	and    $0xfff,%eax
  6e:	29 c4                	sub    %eax,%esp
  70:	85 c0                	test   %eax,%eax
  72:	74 05                	je     79 <main+0x79>
  74:	83 4c 04 fc 00       	orl    $0x0,-0x4(%esp,%eax,1)
  79:	89 e7                	mov    %esp,%edi

	for(int i=0;i<n;i++){
  7b:	85 db                	test   %ebx,%ebx
  7d:	0f 8e d2 00 00 00    	jle    155 <main+0x155>
  83:	31 d2                	xor    %edx,%edx
		burst_times[i] = randomrange(1,20);
  85:	83 ec 08             	sub    $0x8,%esp
  88:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  8b:	6a 14                	push   $0x14
  8d:	6a 01                	push   $0x1
  8f:	e8 0c 0a 00 00       	call   aa0 <randomrange>
  94:	8b 55 d4             	mov    -0x2c(%ebp),%edx
	for(int i=0;i<n;i++){
  97:	83 c4 10             	add    $0x10,%esp
		burst_times[i] = randomrange(1,20);
  9a:	89 04 97             	mov    %eax,(%edi,%edx,4)
	for(int i=0;i<n;i++){
  9d:	89 d6                	mov    %edx,%esi
  9f:	8d 52 01             	lea    0x1(%edx),%edx
  a2:	39 d3                	cmp    %edx,%ebx
  a4:	75 df                	jne    85 <main+0x85>
	}

	printf(1, "\tPID \t Type \t Burst Time \t Context Switches\n");
  a6:	53                   	push   %ebx
  a7:	53                   	push   %ebx
  a8:	68 58 0b 00 00       	push   $0xb58
  ad:	6a 01                	push   $0x1
  af:	e8 dc 04 00 00       	call   590 <printf>
	printf(1, "\t___ \t ____ \t __________ \t ________________\n\n");
  b4:	58                   	pop    %eax
  b5:	5a                   	pop    %edx
  b6:	68 88 0b 00 00       	push   $0xb88
  bb:	6a 01                	push   $0x1
  bd:	e8 ce 04 00 00       	call   590 <printf>
  c2:	83 c4 10             	add    $0x10,%esp
  c5:	31 d2                	xor    %edx,%edx
  c7:	eb 0d                	jmp    d6 <main+0xd6>
	for(int i=0;i<n;i++){
  c9:	8d 42 01             	lea    0x1(%edx),%eax
  cc:	39 f2                	cmp    %esi,%edx
  ce:	0f 84 a0 00 00 00    	je     174 <main+0x174>
  d4:	89 c2                	mov    %eax,%edx
  d6:	89 55 d4             	mov    %edx,-0x2c(%ebp)
		if(!fork()){
  d9:	e8 fd 02 00 00       	call   3db <fork>
  de:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  e1:	85 c0                	test   %eax,%eax
  e3:	89 c3                	mov    %eax,%ebx
  e5:	75 e2                	jne    c9 <main+0xc9>

			// CPU Bound process
			set_burst_time(burst_times[i]);
  e7:	83 ec 0c             	sub    $0xc,%esp
  ea:	ff 34 97             	push   (%edi,%edx,4)

			int it=0;
			for(int j=0;j<100;j++){
  ed:	31 f6                	xor    %esi,%esi
			set_burst_time(burst_times[i]);
  ef:	e8 c7 03 00 00       	call   4bb <set_burst_time>
  f4:	83 c4 10             	add    $0x10,%esp
  f7:	b9 40 42 0f 00       	mov    $0xf4240,%ecx
				for(int k=0;k<1000000;k++){
  fc:	89 f0                	mov    %esi,%eax
  fe:	66 90                	xchg   %ax,%ax
					if((j+k)%2)it++;
 100:	8d 53 01             	lea    0x1(%ebx),%edx
 103:	83 eb 01             	sub    $0x1,%ebx
 106:	a8 01                	test   $0x1,%al
 108:	0f 45 da             	cmovne %edx,%ebx
				for(int k=0;k<1000000;k++){
 10b:	83 c0 01             	add    $0x1,%eax
 10e:	39 c1                	cmp    %eax,%ecx
 110:	75 ee                	jne    100 <main+0x100>
			for(int j=0;j<100;j++){
 112:	83 c6 01             	add    $0x1,%esi
 115:	83 c1 01             	add    $0x1,%ecx
 118:	83 fe 64             	cmp    $0x64,%esi
 11b:	75 df                	jne    fc <main+0xfc>
				}
			}
			useless+=it;
			
			struct processInfo info;
			getCurrentInfo(&info);
 11d:	83 ec 0c             	sub    $0xc,%esp
 120:	8d 45 dc             	lea    -0x24(%ebp),%eax
			useless+=it;
 123:	01 1d 60 0f 00 00    	add    %ebx,0xf60
			getCurrentInfo(&info);
 129:	50                   	push   %eax
 12a:	e8 9c 03 00 00       	call   4cb <getCurrentInfo>
			int bt = get_burst_time();
 12f:	e8 8f 03 00 00       	call   4c3 <get_burst_time>
 134:	89 c3                	mov    %eax,%ebx
			int currID = getCurrentPID();
 136:	e8 98 03 00 00       	call   4d3 <getCurrentPID>
			int ns = info.numberContextSwitches;
			printf(1, "\t%d \t CPU         %d                 %d\n", currID, bt, ns);
 13b:	59                   	pop    %ecx
 13c:	ff 75 e4             	push   -0x1c(%ebp)
 13f:	53                   	push   %ebx
 140:	50                   	push   %eax
 141:	68 2c 0b 00 00       	push   $0xb2c
 146:	6a 01                	push   $0x1
 148:	e8 43 04 00 00       	call   590 <printf>
			exit();
 14d:	83 c4 20             	add    $0x20,%esp
 150:	e8 8e 02 00 00       	call   3e3 <exit>
	printf(1, "\tPID \t Type \t Burst Time \t Context Switches\n");
 155:	50                   	push   %eax
 156:	50                   	push   %eax
 157:	68 58 0b 00 00       	push   $0xb58
 15c:	6a 01                	push   $0x1
 15e:	e8 2d 04 00 00       	call   590 <printf>
	printf(1, "\t___ \t ____ \t __________ \t ________________\n\n");
 163:	5a                   	pop    %edx
 164:	59                   	pop    %ecx
 165:	68 88 0b 00 00       	push   $0xb88
 16a:	6a 01                	push   $0x1
 16c:	e8 1f 04 00 00       	call   590 <printf>
 171:	83 c4 10             	add    $0x10,%esp


		}
	}

	while(wait()!=-1);
 174:	e8 72 02 00 00       	call   3eb <wait>
 179:	83 f8 ff             	cmp    $0xffffffff,%eax
 17c:	75 f6                	jne    174 <main+0x174>
	exit();
 17e:	e8 60 02 00 00       	call   3e3 <exit>
 183:	66 90                	xchg   %ax,%ax
 185:	66 90                	xchg   %ax,%ax
 187:	66 90                	xchg   %ax,%ax
 189:	66 90                	xchg   %ax,%ax
 18b:	66 90                	xchg   %ax,%ax
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 190:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 191:	31 c0                	xor    %eax,%eax
{
 193:	89 e5                	mov    %esp,%ebp
 195:	53                   	push   %ebx
 196:	8b 4d 08             	mov    0x8(%ebp),%ecx
 199:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1a0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1a4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1a7:	83 c0 01             	add    $0x1,%eax
 1aa:	84 d2                	test   %dl,%dl
 1ac:	75 f2                	jne    1a0 <strcpy+0x10>
    ;
  return os;
}
 1ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1b1:	89 c8                	mov    %ecx,%eax
 1b3:	c9                   	leave  
 1b4:	c3                   	ret    
 1b5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	53                   	push   %ebx
 1c4:	8b 55 08             	mov    0x8(%ebp),%edx
 1c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ca:	0f b6 02             	movzbl (%edx),%eax
 1cd:	84 c0                	test   %al,%al
 1cf:	75 17                	jne    1e8 <strcmp+0x28>
 1d1:	eb 3a                	jmp    20d <strcmp+0x4d>
 1d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1d7:	90                   	nop
 1d8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1dc:	83 c2 01             	add    $0x1,%edx
 1df:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1e2:	84 c0                	test   %al,%al
 1e4:	74 1a                	je     200 <strcmp+0x40>
    p++, q++;
 1e6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 1e8:	0f b6 19             	movzbl (%ecx),%ebx
 1eb:	38 c3                	cmp    %al,%bl
 1ed:	74 e9                	je     1d8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1ef:	29 d8                	sub    %ebx,%eax
}
 1f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    
 1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 200:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 204:	31 c0                	xor    %eax,%eax
 206:	29 d8                	sub    %ebx,%eax
}
 208:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 20b:	c9                   	leave  
 20c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 20d:	0f b6 19             	movzbl (%ecx),%ebx
 210:	31 c0                	xor    %eax,%eax
 212:	eb db                	jmp    1ef <strcmp+0x2f>
 214:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 21f:	90                   	nop

00000220 <strlen>:

uint
strlen(const char *s)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 226:	80 3a 00             	cmpb   $0x0,(%edx)
 229:	74 15                	je     240 <strlen+0x20>
 22b:	31 c0                	xor    %eax,%eax
 22d:	8d 76 00             	lea    0x0(%esi),%esi
 230:	83 c0 01             	add    $0x1,%eax
 233:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 237:	89 c1                	mov    %eax,%ecx
 239:	75 f5                	jne    230 <strlen+0x10>
    ;
  return n;
}
 23b:	89 c8                	mov    %ecx,%eax
 23d:	5d                   	pop    %ebp
 23e:	c3                   	ret    
 23f:	90                   	nop
  for(n = 0; s[n]; n++)
 240:	31 c9                	xor    %ecx,%ecx
}
 242:	5d                   	pop    %ebp
 243:	89 c8                	mov    %ecx,%eax
 245:	c3                   	ret    
 246:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24d:	8d 76 00             	lea    0x0(%esi),%esi

00000250 <memset>:

void*
memset(void *dst, int c, uint n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 257:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25a:	8b 45 0c             	mov    0xc(%ebp),%eax
 25d:	89 d7                	mov    %edx,%edi
 25f:	fc                   	cld    
 260:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 262:	8b 7d fc             	mov    -0x4(%ebp),%edi
 265:	89 d0                	mov    %edx,%eax
 267:	c9                   	leave  
 268:	c3                   	ret    
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000270 <strchr>:

char*
strchr(const char *s, char c)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 27a:	0f b6 10             	movzbl (%eax),%edx
 27d:	84 d2                	test   %dl,%dl
 27f:	75 12                	jne    293 <strchr+0x23>
 281:	eb 1d                	jmp    2a0 <strchr+0x30>
 283:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 287:	90                   	nop
 288:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 28c:	83 c0 01             	add    $0x1,%eax
 28f:	84 d2                	test   %dl,%dl
 291:	74 0d                	je     2a0 <strchr+0x30>
    if(*s == c)
 293:	38 d1                	cmp    %dl,%cl
 295:	75 f1                	jne    288 <strchr+0x18>
      return (char*)s;
  return 0;
}
 297:	5d                   	pop    %ebp
 298:	c3                   	ret    
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2a0:	31 c0                	xor    %eax,%eax
}
 2a2:	5d                   	pop    %ebp
 2a3:	c3                   	ret    
 2a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2af:	90                   	nop

000002b0 <gets>:

char*
gets(char *buf, int max)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2b5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2b8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2b9:	31 db                	xor    %ebx,%ebx
{
 2bb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2be:	eb 27                	jmp    2e7 <gets+0x37>
    cc = read(0, &c, 1);
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	6a 01                	push   $0x1
 2c5:	57                   	push   %edi
 2c6:	6a 00                	push   $0x0
 2c8:	e8 2e 01 00 00       	call   3fb <read>
    if(cc < 1)
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7e 1d                	jle    2f1 <gets+0x41>
      break;
    buf[i++] = c;
 2d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2d8:	8b 55 08             	mov    0x8(%ebp),%edx
 2db:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2df:	3c 0a                	cmp    $0xa,%al
 2e1:	74 1d                	je     300 <gets+0x50>
 2e3:	3c 0d                	cmp    $0xd,%al
 2e5:	74 19                	je     300 <gets+0x50>
  for(i=0; i+1 < max; ){
 2e7:	89 de                	mov    %ebx,%esi
 2e9:	83 c3 01             	add    $0x1,%ebx
 2ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ef:	7c cf                	jl     2c0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2f1:	8b 45 08             	mov    0x8(%ebp),%eax
 2f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fb:	5b                   	pop    %ebx
 2fc:	5e                   	pop    %esi
 2fd:	5f                   	pop    %edi
 2fe:	5d                   	pop    %ebp
 2ff:	c3                   	ret    
  buf[i] = '\0';
 300:	8b 45 08             	mov    0x8(%ebp),%eax
 303:	89 de                	mov    %ebx,%esi
 305:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 309:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30c:	5b                   	pop    %ebx
 30d:	5e                   	pop    %esi
 30e:	5f                   	pop    %edi
 30f:	5d                   	pop    %ebp
 310:	c3                   	ret    
 311:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 318:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31f:	90                   	nop

00000320 <stat>:

int
stat(const char *n, struct stat *st)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	56                   	push   %esi
 324:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 325:	83 ec 08             	sub    $0x8,%esp
 328:	6a 00                	push   $0x0
 32a:	ff 75 08             	push   0x8(%ebp)
 32d:	e8 f1 00 00 00       	call   423 <open>
  if(fd < 0)
 332:	83 c4 10             	add    $0x10,%esp
 335:	85 c0                	test   %eax,%eax
 337:	78 27                	js     360 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 339:	83 ec 08             	sub    $0x8,%esp
 33c:	ff 75 0c             	push   0xc(%ebp)
 33f:	89 c3                	mov    %eax,%ebx
 341:	50                   	push   %eax
 342:	e8 f4 00 00 00       	call   43b <fstat>
  close(fd);
 347:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 34a:	89 c6                	mov    %eax,%esi
  close(fd);
 34c:	e8 ba 00 00 00       	call   40b <close>
  return r;
 351:	83 c4 10             	add    $0x10,%esp
}
 354:	8d 65 f8             	lea    -0x8(%ebp),%esp
 357:	89 f0                	mov    %esi,%eax
 359:	5b                   	pop    %ebx
 35a:	5e                   	pop    %esi
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret    
 35d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 360:	be ff ff ff ff       	mov    $0xffffffff,%esi
 365:	eb ed                	jmp    354 <stat+0x34>
 367:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36e:	66 90                	xchg   %ax,%ax

00000370 <atoi>:

int
atoi(const char *s)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 377:	0f be 02             	movsbl (%edx),%eax
 37a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 37d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 380:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 385:	77 1e                	ja     3a5 <atoi+0x35>
 387:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 390:	83 c2 01             	add    $0x1,%edx
 393:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 396:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 39a:	0f be 02             	movsbl (%edx),%eax
 39d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3a0:	80 fb 09             	cmp    $0x9,%bl
 3a3:	76 eb                	jbe    390 <atoi+0x20>
  return n;
}
 3a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3a8:	89 c8                	mov    %ecx,%eax
 3aa:	c9                   	leave  
 3ab:	c3                   	ret    
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003b0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	8b 45 10             	mov    0x10(%ebp),%eax
 3b7:	8b 55 08             	mov    0x8(%ebp),%edx
 3ba:	56                   	push   %esi
 3bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3be:	85 c0                	test   %eax,%eax
 3c0:	7e 13                	jle    3d5 <memmove+0x25>
 3c2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3c4:	89 d7                	mov    %edx,%edi
 3c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3d0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3d1:	39 f8                	cmp    %edi,%eax
 3d3:	75 fb                	jne    3d0 <memmove+0x20>
  return vdst;
}
 3d5:	5e                   	pop    %esi
 3d6:	89 d0                	mov    %edx,%eax
 3d8:	5f                   	pop    %edi
 3d9:	5d                   	pop    %ebp
 3da:	c3                   	ret    

000003db <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3db:	b8 01 00 00 00       	mov    $0x1,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <exit>:
SYSCALL(exit)
 3e3:	b8 02 00 00 00       	mov    $0x2,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <wait>:
SYSCALL(wait)
 3eb:	b8 03 00 00 00       	mov    $0x3,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <pipe>:
SYSCALL(pipe)
 3f3:	b8 04 00 00 00       	mov    $0x4,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <read>:
SYSCALL(read)
 3fb:	b8 05 00 00 00       	mov    $0x5,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <write>:
SYSCALL(write)
 403:	b8 10 00 00 00       	mov    $0x10,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <close>:
SYSCALL(close)
 40b:	b8 15 00 00 00       	mov    $0x15,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <kill>:
SYSCALL(kill)
 413:	b8 06 00 00 00       	mov    $0x6,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <exec>:
SYSCALL(exec)
 41b:	b8 07 00 00 00       	mov    $0x7,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <open>:
SYSCALL(open)
 423:	b8 0f 00 00 00       	mov    $0xf,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <mknod>:
SYSCALL(mknod)
 42b:	b8 11 00 00 00       	mov    $0x11,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <unlink>:
SYSCALL(unlink)
 433:	b8 12 00 00 00       	mov    $0x12,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <fstat>:
SYSCALL(fstat)
 43b:	b8 08 00 00 00       	mov    $0x8,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <link>:
SYSCALL(link)
 443:	b8 13 00 00 00       	mov    $0x13,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <mkdir>:
SYSCALL(mkdir)
 44b:	b8 14 00 00 00       	mov    $0x14,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <chdir>:
SYSCALL(chdir)
 453:	b8 09 00 00 00       	mov    $0x9,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <dup>:
SYSCALL(dup)
 45b:	b8 0a 00 00 00       	mov    $0xa,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <getpid>:
SYSCALL(getpid)
 463:	b8 0b 00 00 00       	mov    $0xb,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <sbrk>:
SYSCALL(sbrk)
 46b:	b8 0c 00 00 00       	mov    $0xc,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <sleep>:
SYSCALL(sleep)
 473:	b8 0d 00 00 00       	mov    $0xd,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <uptime>:
SYSCALL(uptime)
 47b:	b8 0e 00 00 00       	mov    $0xe,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <thread_create>:
SYSCALL(thread_create)
 483:	b8 16 00 00 00       	mov    $0x16,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <thread_join>:
SYSCALL(thread_join)
 48b:	b8 18 00 00 00       	mov    $0x18,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <thread_exit>:
SYSCALL(thread_exit)
 493:	b8 17 00 00 00       	mov    $0x17,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <draw>:
SYSCALL(draw)
 49b:	b8 19 00 00 00       	mov    $0x19,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <getNumProc>:
SYSCALL(getNumProc)
 4a3:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <getMaxPid>:
SYSCALL(getMaxPid)
 4ab:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <getProcInfo>:
SYSCALL(getProcInfo)
 4b3:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <set_burst_time>:
SYSCALL(set_burst_time)
 4bb:	b8 1d 00 00 00       	mov    $0x1d,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <get_burst_time>:
SYSCALL(get_burst_time)
 4c3:	b8 1e 00 00 00       	mov    $0x1e,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <getCurrentInfo>:
SYSCALL(getCurrentInfo)
 4cb:	b8 1f 00 00 00       	mov    $0x1f,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <getCurrentPID>:
SYSCALL(getCurrentPID)
 4d3:	b8 20 00 00 00       	mov    $0x20,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    
 4db:	66 90                	xchg   %ax,%ax
 4dd:	66 90                	xchg   %ax,%ax
 4df:	90                   	nop

000004e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	83 ec 3c             	sub    $0x3c,%esp
 4e9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4ec:	89 d1                	mov    %edx,%ecx
{
 4ee:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 4f1:	85 d2                	test   %edx,%edx
 4f3:	0f 89 7f 00 00 00    	jns    578 <printint+0x98>
 4f9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4fd:	74 79                	je     578 <printint+0x98>
    neg = 1;
 4ff:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 506:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 508:	31 db                	xor    %ebx,%ebx
 50a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 50d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 510:	89 c8                	mov    %ecx,%eax
 512:	31 d2                	xor    %edx,%edx
 514:	89 cf                	mov    %ecx,%edi
 516:	f7 75 c4             	divl   -0x3c(%ebp)
 519:	0f b6 92 18 0c 00 00 	movzbl 0xc18(%edx),%edx
 520:	89 45 c0             	mov    %eax,-0x40(%ebp)
 523:	89 d8                	mov    %ebx,%eax
 525:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 528:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 52b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 52e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 531:	76 dd                	jbe    510 <printint+0x30>
  if(neg)
 533:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 536:	85 c9                	test   %ecx,%ecx
 538:	74 0c                	je     546 <printint+0x66>
    buf[i++] = '-';
 53a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 53f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 541:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 546:	8b 7d b8             	mov    -0x48(%ebp),%edi
 549:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 54d:	eb 07                	jmp    556 <printint+0x76>
 54f:	90                   	nop
    putc(fd, buf[i]);
 550:	0f b6 13             	movzbl (%ebx),%edx
 553:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 556:	83 ec 04             	sub    $0x4,%esp
 559:	88 55 d7             	mov    %dl,-0x29(%ebp)
 55c:	6a 01                	push   $0x1
 55e:	56                   	push   %esi
 55f:	57                   	push   %edi
 560:	e8 9e fe ff ff       	call   403 <write>
  while(--i >= 0)
 565:	83 c4 10             	add    $0x10,%esp
 568:	39 de                	cmp    %ebx,%esi
 56a:	75 e4                	jne    550 <printint+0x70>
}
 56c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 56f:	5b                   	pop    %ebx
 570:	5e                   	pop    %esi
 571:	5f                   	pop    %edi
 572:	5d                   	pop    %ebp
 573:	c3                   	ret    
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 578:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 57f:	eb 87                	jmp    508 <printint+0x28>
 581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 588:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58f:	90                   	nop

00000590 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
 596:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 599:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 59c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 59f:	0f b6 13             	movzbl (%ebx),%edx
 5a2:	84 d2                	test   %dl,%dl
 5a4:	74 6a                	je     610 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5a6:	8d 45 10             	lea    0x10(%ebp),%eax
 5a9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5ac:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5af:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 5b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5b4:	eb 36                	jmp    5ec <printf+0x5c>
 5b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
 5c0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5c3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5c8:	83 f8 25             	cmp    $0x25,%eax
 5cb:	74 15                	je     5e2 <printf+0x52>
  write(fd, &c, 1);
 5cd:	83 ec 04             	sub    $0x4,%esp
 5d0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5d3:	6a 01                	push   $0x1
 5d5:	57                   	push   %edi
 5d6:	56                   	push   %esi
 5d7:	e8 27 fe ff ff       	call   403 <write>
 5dc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 5df:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5e2:	0f b6 13             	movzbl (%ebx),%edx
 5e5:	83 c3 01             	add    $0x1,%ebx
 5e8:	84 d2                	test   %dl,%dl
 5ea:	74 24                	je     610 <printf+0x80>
    c = fmt[i] & 0xff;
 5ec:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5ef:	85 c9                	test   %ecx,%ecx
 5f1:	74 cd                	je     5c0 <printf+0x30>
      }
    } else if(state == '%'){
 5f3:	83 f9 25             	cmp    $0x25,%ecx
 5f6:	75 ea                	jne    5e2 <printf+0x52>
      if(c == 'd'){
 5f8:	83 f8 25             	cmp    $0x25,%eax
 5fb:	0f 84 07 01 00 00    	je     708 <printf+0x178>
 601:	83 e8 63             	sub    $0x63,%eax
 604:	83 f8 15             	cmp    $0x15,%eax
 607:	77 17                	ja     620 <printf+0x90>
 609:	ff 24 85 c0 0b 00 00 	jmp    *0xbc0(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 610:	8d 65 f4             	lea    -0xc(%ebp),%esp
 613:	5b                   	pop    %ebx
 614:	5e                   	pop    %esi
 615:	5f                   	pop    %edi
 616:	5d                   	pop    %ebp
 617:	c3                   	ret    
 618:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 61f:	90                   	nop
  write(fd, &c, 1);
 620:	83 ec 04             	sub    $0x4,%esp
 623:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 626:	6a 01                	push   $0x1
 628:	57                   	push   %edi
 629:	56                   	push   %esi
 62a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 62e:	e8 d0 fd ff ff       	call   403 <write>
        putc(fd, c);
 633:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 637:	83 c4 0c             	add    $0xc,%esp
 63a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 63d:	6a 01                	push   $0x1
 63f:	57                   	push   %edi
 640:	56                   	push   %esi
 641:	e8 bd fd ff ff       	call   403 <write>
        putc(fd, c);
 646:	83 c4 10             	add    $0x10,%esp
      state = 0;
 649:	31 c9                	xor    %ecx,%ecx
 64b:	eb 95                	jmp    5e2 <printf+0x52>
 64d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 650:	83 ec 0c             	sub    $0xc,%esp
 653:	b9 10 00 00 00       	mov    $0x10,%ecx
 658:	6a 00                	push   $0x0
 65a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 65d:	8b 10                	mov    (%eax),%edx
 65f:	89 f0                	mov    %esi,%eax
 661:	e8 7a fe ff ff       	call   4e0 <printint>
        ap++;
 666:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 66a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 66d:	31 c9                	xor    %ecx,%ecx
 66f:	e9 6e ff ff ff       	jmp    5e2 <printf+0x52>
 674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 678:	8b 45 d0             	mov    -0x30(%ebp),%eax
 67b:	8b 10                	mov    (%eax),%edx
        ap++;
 67d:	83 c0 04             	add    $0x4,%eax
 680:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 683:	85 d2                	test   %edx,%edx
 685:	0f 84 8d 00 00 00    	je     718 <printf+0x188>
        while(*s != 0){
 68b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 68e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 690:	84 c0                	test   %al,%al
 692:	0f 84 4a ff ff ff    	je     5e2 <printf+0x52>
 698:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 69b:	89 d3                	mov    %edx,%ebx
 69d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6a3:	83 c3 01             	add    $0x1,%ebx
 6a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6a9:	6a 01                	push   $0x1
 6ab:	57                   	push   %edi
 6ac:	56                   	push   %esi
 6ad:	e8 51 fd ff ff       	call   403 <write>
        while(*s != 0){
 6b2:	0f b6 03             	movzbl (%ebx),%eax
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	84 c0                	test   %al,%al
 6ba:	75 e4                	jne    6a0 <printf+0x110>
      state = 0;
 6bc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 6bf:	31 c9                	xor    %ecx,%ecx
 6c1:	e9 1c ff ff ff       	jmp    5e2 <printf+0x52>
 6c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6d0:	83 ec 0c             	sub    $0xc,%esp
 6d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6d8:	6a 01                	push   $0x1
 6da:	e9 7b ff ff ff       	jmp    65a <printf+0xca>
 6df:	90                   	nop
        putc(fd, *ap);
 6e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 6e3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6e6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6e8:	6a 01                	push   $0x1
 6ea:	57                   	push   %edi
 6eb:	56                   	push   %esi
        putc(fd, *ap);
 6ec:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6ef:	e8 0f fd ff ff       	call   403 <write>
        ap++;
 6f4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6f8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6fb:	31 c9                	xor    %ecx,%ecx
 6fd:	e9 e0 fe ff ff       	jmp    5e2 <printf+0x52>
 702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 708:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 70b:	83 ec 04             	sub    $0x4,%esp
 70e:	e9 2a ff ff ff       	jmp    63d <printf+0xad>
 713:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 717:	90                   	nop
          s = "(null)";
 718:	ba b6 0b 00 00       	mov    $0xbb6,%edx
        while(*s != 0){
 71d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 720:	b8 28 00 00 00       	mov    $0x28,%eax
 725:	89 d3                	mov    %edx,%ebx
 727:	e9 74 ff ff ff       	jmp    6a0 <printf+0x110>
 72c:	66 90                	xchg   %ax,%ax
 72e:	66 90                	xchg   %ax,%ax

00000730 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 730:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 731:	a1 64 0f 00 00       	mov    0xf64,%eax
{
 736:	89 e5                	mov    %esp,%ebp
 738:	57                   	push   %edi
 739:	56                   	push   %esi
 73a:	53                   	push   %ebx
 73b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 73e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 748:	89 c2                	mov    %eax,%edx
 74a:	8b 00                	mov    (%eax),%eax
 74c:	39 ca                	cmp    %ecx,%edx
 74e:	73 30                	jae    780 <free+0x50>
 750:	39 c1                	cmp    %eax,%ecx
 752:	72 04                	jb     758 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 754:	39 c2                	cmp    %eax,%edx
 756:	72 f0                	jb     748 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 758:	8b 73 fc             	mov    -0x4(%ebx),%esi
 75b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 75e:	39 f8                	cmp    %edi,%eax
 760:	74 30                	je     792 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 762:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 765:	8b 42 04             	mov    0x4(%edx),%eax
 768:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 76b:	39 f1                	cmp    %esi,%ecx
 76d:	74 3a                	je     7a9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 76f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 771:	5b                   	pop    %ebx
  freep = p;
 772:	89 15 64 0f 00 00    	mov    %edx,0xf64
}
 778:	5e                   	pop    %esi
 779:	5f                   	pop    %edi
 77a:	5d                   	pop    %ebp
 77b:	c3                   	ret    
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 780:	39 c2                	cmp    %eax,%edx
 782:	72 c4                	jb     748 <free+0x18>
 784:	39 c1                	cmp    %eax,%ecx
 786:	73 c0                	jae    748 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 788:	8b 73 fc             	mov    -0x4(%ebx),%esi
 78b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78e:	39 f8                	cmp    %edi,%eax
 790:	75 d0                	jne    762 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 792:	03 70 04             	add    0x4(%eax),%esi
 795:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 798:	8b 02                	mov    (%edx),%eax
 79a:	8b 00                	mov    (%eax),%eax
 79c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 79f:	8b 42 04             	mov    0x4(%edx),%eax
 7a2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7a5:	39 f1                	cmp    %esi,%ecx
 7a7:	75 c6                	jne    76f <free+0x3f>
    p->s.size += bp->s.size;
 7a9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7ac:	89 15 64 0f 00 00    	mov    %edx,0xf64
    p->s.size += bp->s.size;
 7b2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7b5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7b8:	89 0a                	mov    %ecx,(%edx)
}
 7ba:	5b                   	pop    %ebx
 7bb:	5e                   	pop    %esi
 7bc:	5f                   	pop    %edi
 7bd:	5d                   	pop    %ebp
 7be:	c3                   	ret    
 7bf:	90                   	nop

000007c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	57                   	push   %edi
 7c4:	56                   	push   %esi
 7c5:	53                   	push   %ebx
 7c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7cc:	8b 3d 64 0f 00 00    	mov    0xf64,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d2:	8d 70 07             	lea    0x7(%eax),%esi
 7d5:	c1 ee 03             	shr    $0x3,%esi
 7d8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7db:	85 ff                	test   %edi,%edi
 7dd:	0f 84 9d 00 00 00    	je     880 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 7e5:	8b 4a 04             	mov    0x4(%edx),%ecx
 7e8:	39 f1                	cmp    %esi,%ecx
 7ea:	73 6a                	jae    856 <malloc+0x96>
 7ec:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7f1:	39 de                	cmp    %ebx,%esi
 7f3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 7f6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 800:	eb 17                	jmp    819 <malloc+0x59>
 802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 808:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 80a:	8b 48 04             	mov    0x4(%eax),%ecx
 80d:	39 f1                	cmp    %esi,%ecx
 80f:	73 4f                	jae    860 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 811:	8b 3d 64 0f 00 00    	mov    0xf64,%edi
 817:	89 c2                	mov    %eax,%edx
 819:	39 d7                	cmp    %edx,%edi
 81b:	75 eb                	jne    808 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 81d:	83 ec 0c             	sub    $0xc,%esp
 820:	ff 75 e4             	push   -0x1c(%ebp)
 823:	e8 43 fc ff ff       	call   46b <sbrk>
  if(p == (char*)-1)
 828:	83 c4 10             	add    $0x10,%esp
 82b:	83 f8 ff             	cmp    $0xffffffff,%eax
 82e:	74 1c                	je     84c <malloc+0x8c>
  hp->s.size = nu;
 830:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 833:	83 ec 0c             	sub    $0xc,%esp
 836:	83 c0 08             	add    $0x8,%eax
 839:	50                   	push   %eax
 83a:	e8 f1 fe ff ff       	call   730 <free>
  return freep;
 83f:	8b 15 64 0f 00 00    	mov    0xf64,%edx
      if((p = morecore(nunits)) == 0)
 845:	83 c4 10             	add    $0x10,%esp
 848:	85 d2                	test   %edx,%edx
 84a:	75 bc                	jne    808 <malloc+0x48>
        return 0;
  }
}
 84c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 84f:	31 c0                	xor    %eax,%eax
}
 851:	5b                   	pop    %ebx
 852:	5e                   	pop    %esi
 853:	5f                   	pop    %edi
 854:	5d                   	pop    %ebp
 855:	c3                   	ret    
    if(p->s.size >= nunits){
 856:	89 d0                	mov    %edx,%eax
 858:	89 fa                	mov    %edi,%edx
 85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 860:	39 ce                	cmp    %ecx,%esi
 862:	74 4c                	je     8b0 <malloc+0xf0>
        p->s.size -= nunits;
 864:	29 f1                	sub    %esi,%ecx
 866:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 869:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 86c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 86f:	89 15 64 0f 00 00    	mov    %edx,0xf64
}
 875:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 878:	83 c0 08             	add    $0x8,%eax
}
 87b:	5b                   	pop    %ebx
 87c:	5e                   	pop    %esi
 87d:	5f                   	pop    %edi
 87e:	5d                   	pop    %ebp
 87f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 880:	c7 05 64 0f 00 00 68 	movl   $0xf68,0xf64
 887:	0f 00 00 
    base.s.size = 0;
 88a:	bf 68 0f 00 00       	mov    $0xf68,%edi
    base.s.ptr = freep = prevp = &base;
 88f:	c7 05 68 0f 00 00 68 	movl   $0xf68,0xf68
 896:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 899:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 89b:	c7 05 6c 0f 00 00 00 	movl   $0x0,0xf6c
 8a2:	00 00 00 
    if(p->s.size >= nunits){
 8a5:	e9 42 ff ff ff       	jmp    7ec <malloc+0x2c>
 8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8b0:	8b 08                	mov    (%eax),%ecx
 8b2:	89 0a                	mov    %ecx,(%edx)
 8b4:	eb b9                	jmp    86f <malloc+0xaf>
 8b6:	66 90                	xchg   %ax,%ax
 8b8:	66 90                	xchg   %ax,%ax
 8ba:	66 90                	xchg   %ax,%ax
 8bc:	66 90                	xchg   %ax,%ax
 8be:	66 90                	xchg   %ax,%ax

000008c0 <sgenrand>:
static int mti=N+1; /* mti==N+1 means mt[N] is not initialized */

/* initializing the array with a NONZERO seed */
void
sgenrand(unsigned long seed)
{
 8c0:	55                   	push   %ebp
 8c1:	b8 84 0f 00 00       	mov    $0xf84,%eax
 8c6:	89 e5                	mov    %esp,%ebp
 8c8:	8b 55 08             	mov    0x8(%ebp),%edx
    /* setting initial seeds to mt[N] using         */
    /* the generator Line 25 of Table 1 in          */
    /* [KNUTH 1981, The Art of Computer Programming */
    /*    Vol. 2 (2nd Ed.), pp102]                  */
    mt[0]= seed & 0xffffffff;
 8cb:	89 15 80 0f 00 00    	mov    %edx,0xf80
    for (mti=1; mti<N; mti++)
 8d1:	eb 08                	jmp    8db <sgenrand+0x1b>
 8d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8d7:	90                   	nop
 8d8:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 8db:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 8e1:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 8e3:	3d 3c 19 00 00       	cmp    $0x193c,%eax
 8e8:	75 ee                	jne    8d8 <sgenrand+0x18>
 8ea:	c7 05 5c 0f 00 00 70 	movl   $0x270,0xf5c
 8f1:	02 00 00 
}
 8f4:	5d                   	pop    %ebp
 8f5:	c3                   	ret    
 8f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8fd:	8d 76 00             	lea    0x0(%esi),%esi

00000900 <genrand>:
{
    unsigned long y;
    static unsigned long mag01[2]={0x0, MATRIX_A};
    /* mag01[x] = x * MATRIX_A  for x=0,1 */

    if (mti >= N) { /* generate N words at one time */
 900:	a1 5c 0f 00 00       	mov    0xf5c,%eax
 905:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 90a:	7f 3d                	jg     949 <genrand+0x49>
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];

        mti = 0;
    }
  
    y = mt[mti++];
 90c:	8b 0c 85 80 0f 00 00 	mov    0xf80(,%eax,4),%ecx
 913:	8d 50 01             	lea    0x1(%eax),%edx
 916:	89 15 5c 0f 00 00    	mov    %edx,0xf5c
    y ^= TEMPERING_SHIFT_U(y);
 91c:	89 ca                	mov    %ecx,%edx
 91e:	c1 ea 0b             	shr    $0xb,%edx
 921:	31 ca                	xor    %ecx,%edx
    y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
 923:	89 d0                	mov    %edx,%eax
 925:	c1 e0 07             	shl    $0x7,%eax
 928:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
 92d:	31 d0                	xor    %edx,%eax
    y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
 92f:	89 c2                	mov    %eax,%edx
 931:	c1 e2 0f             	shl    $0xf,%edx
 934:	81 e2 00 00 c6 ef    	and    $0xefc60000,%edx
 93a:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_L(y);
 93c:	89 d0                	mov    %edx,%eax
 93e:	c1 e8 12             	shr    $0x12,%eax
 941:	31 d0                	xor    %edx,%eax

    // Strip off uppermost bit because we want a long,
    // not an unsigned long
    return y & RAND_MAX;
 943:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
 948:	c3                   	ret    
        if (mti == N+1)   /* if sgenrand() has not been called, */
 949:	3d 71 02 00 00       	cmp    $0x271,%eax
 94e:	0f 84 d4 00 00 00    	je     a28 <genrand+0x128>
    mt[0]= seed & 0xffffffff;
 954:	31 c0                	xor    %eax,%eax
 956:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 95d:	8d 76 00             	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 960:	8b 0c 85 80 0f 00 00 	mov    0xf80(,%eax,4),%ecx
 967:	83 c0 01             	add    $0x1,%eax
 96a:	8b 14 85 80 0f 00 00 	mov    0xf80(,%eax,4),%edx
 971:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 977:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 97d:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1];
 97f:	89 d1                	mov    %edx,%ecx
 981:	83 e2 01             	and    $0x1,%edx
 984:	d1 e9                	shr    %ecx
 986:	33 0c 85 b0 15 00 00 	xor    0x15b0(,%eax,4),%ecx
 98d:	33 0c 95 2c 0c 00 00 	xor    0xc2c(,%edx,4),%ecx
 994:	89 0c 85 7c 0f 00 00 	mov    %ecx,0xf7c(,%eax,4)
        for (kk=0;kk<N-M;kk++) {
 99b:	3d e3 00 00 00       	cmp    $0xe3,%eax
 9a0:	75 be                	jne    960 <genrand+0x60>
 9a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 9a8:	8b 0c 85 80 0f 00 00 	mov    0xf80(,%eax,4),%ecx
 9af:	83 c0 01             	add    $0x1,%eax
 9b2:	8b 14 85 80 0f 00 00 	mov    0xf80(,%eax,4),%edx
 9b9:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 9bf:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 9c5:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1];
 9c7:	89 d1                	mov    %edx,%ecx
 9c9:	83 e2 01             	and    $0x1,%edx
 9cc:	d1 e9                	shr    %ecx
 9ce:	33 0c 85 f0 0b 00 00 	xor    0xbf0(,%eax,4),%ecx
 9d5:	33 0c 95 2c 0c 00 00 	xor    0xc2c(,%edx,4),%ecx
 9dc:	89 0c 85 7c 0f 00 00 	mov    %ecx,0xf7c(,%eax,4)
        for (;kk<N-1;kk++) {
 9e3:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 9e8:	75 be                	jne    9a8 <genrand+0xa8>
        y = (mt[N-1]&UPPER_MASK)|(mt[0]&LOWER_MASK);
 9ea:	8b 0d 80 0f 00 00    	mov    0xf80,%ecx
 9f0:	a1 3c 19 00 00       	mov    0x193c,%eax
 9f5:	89 ca                	mov    %ecx,%edx
 9f7:	25 00 00 00 80       	and    $0x80000000,%eax
 9fc:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 a02:	09 d0                	or     %edx,%eax
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];
 a04:	89 c2                	mov    %eax,%edx
 a06:	83 e0 01             	and    $0x1,%eax
 a09:	d1 ea                	shr    %edx
 a0b:	33 15 b0 15 00 00    	xor    0x15b0,%edx
 a11:	33 14 85 2c 0c 00 00 	xor    0xc2c(,%eax,4),%edx
 a18:	89 15 3c 19 00 00    	mov    %edx,0x193c
 a1e:	ba 01 00 00 00       	mov    $0x1,%edx
 a23:	e9 ee fe ff ff       	jmp    916 <genrand+0x16>
    mt[0]= seed & 0xffffffff;
 a28:	b8 84 0f 00 00       	mov    $0xf84,%eax
 a2d:	b9 3c 19 00 00       	mov    $0x193c,%ecx
 a32:	ba 05 11 00 00       	mov    $0x1105,%edx
 a37:	c7 05 80 0f 00 00 05 	movl   $0x1105,0xf80
 a3e:	11 00 00 
    for (mti=1; mti<N; mti++)
 a41:	eb 08                	jmp    a4b <genrand+0x14b>
 a43:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a47:	90                   	nop
 a48:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 a4b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 a51:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 a53:	39 c1                	cmp    %eax,%ecx
 a55:	75 f1                	jne    a48 <genrand+0x148>
 a57:	e9 f8 fe ff ff       	jmp    954 <genrand+0x54>
 a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a60 <random_at_most>:

// Assumes 0 <= max <= RAND_MAX
// Returns in the half-open interval [0, max]
long random_at_most(long max) {
 a60:	55                   	push   %ebp
  unsigned long
    // max <= RAND_MAX < ULONG_MAX, so this is okay.
    num_bins = (unsigned long) max + 1,
    num_rand = (unsigned long) RAND_MAX + 1,
    bin_size = num_rand / num_bins,
 a61:	31 d2                	xor    %edx,%edx
long random_at_most(long max) {
 a63:	89 e5                	mov    %esp,%ebp
 a65:	56                   	push   %esi
    num_bins = (unsigned long) max + 1,
 a66:	8b 45 08             	mov    0x8(%ebp),%eax
long random_at_most(long max) {
 a69:	53                   	push   %ebx
    bin_size = num_rand / num_bins,
 a6a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    num_bins = (unsigned long) max + 1,
 a6f:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 a72:	89 d8                	mov    %ebx,%eax
 a74:	f7 f1                	div    %ecx
 a76:	89 c6                	mov    %eax,%esi
  long x;
  do {
   x = genrand();
  }
  // This is carefully written not to overflow
  while (num_rand - defect <= (unsigned long)x);
 a78:	29 d3                	sub    %edx,%ebx
 a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   x = genrand();
 a80:	e8 7b fe ff ff       	call   900 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 a85:	39 d8                	cmp    %ebx,%eax
 a87:	73 f7                	jae    a80 <random_at_most+0x20>

  // Truncated division is intentional
  return x/bin_size;
 a89:	31 d2                	xor    %edx,%edx
}
 a8b:	5b                   	pop    %ebx
  return x/bin_size;
 a8c:	f7 f6                	div    %esi
}
 a8e:	5e                   	pop    %esi
 a8f:	5d                   	pop    %ebp
 a90:	c3                   	ret    
 a91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a9f:	90                   	nop

00000aa0 <randomrange>:

int randomrange(int low, int high){
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
 aa3:	57                   	push   %edi
 aa4:	56                   	push   %esi
 aa5:	53                   	push   %ebx
 aa6:	83 ec 0c             	sub    $0xc,%esp
 aa9:	8b 75 08             	mov    0x8(%ebp),%esi
 aac:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(high<low){
 aaf:	39 f0                	cmp    %esi,%eax
 ab1:	7d 06                	jge    ab9 <randomrange+0x19>
 ab3:	89 f2                	mov    %esi,%edx
 ab5:	89 c6                	mov    %eax,%esi
 ab7:	89 d0                	mov    %edx,%eax
    int temp=high;
    high=low;
    low=temp;
  }
  int val = random_at_most(high-low) + low;
 ab9:	29 f0                	sub    %esi,%eax
    bin_size = num_rand / num_bins,
 abb:	bb 00 00 00 80       	mov    $0x80000000,%ebx
 ac0:	31 d2                	xor    %edx,%edx
    num_bins = (unsigned long) max + 1,
 ac2:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 ac5:	89 d8                	mov    %ebx,%eax
 ac7:	f7 f1                	div    %ecx
 ac9:	89 c7                	mov    %eax,%edi
  while (num_rand - defect <= (unsigned long)x);
 acb:	29 d3                	sub    %edx,%ebx
 acd:	8d 76 00             	lea    0x0(%esi),%esi
   x = genrand();
 ad0:	e8 2b fe ff ff       	call   900 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 ad5:	39 d8                	cmp    %ebx,%eax
 ad7:	73 f7                	jae    ad0 <randomrange+0x30>
  return x/bin_size;
 ad9:	31 d2                	xor    %edx,%edx
  return val;
}
 adb:	83 c4 0c             	add    $0xc,%esp
  return x/bin_size;
 ade:	f7 f7                	div    %edi
}
 ae0:	5b                   	pop    %ebx
  int val = random_at_most(high-low) + low;
 ae1:	01 f0                	add    %esi,%eax
}
 ae3:	5e                   	pop    %esi
 ae4:	5f                   	pop    %edi
 ae5:	5d                   	pop    %ebp
 ae6:	c3                   	ret    
