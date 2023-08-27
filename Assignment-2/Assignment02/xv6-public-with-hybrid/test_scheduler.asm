
_test_scheduler:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"

int useless;

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
  11:	83 ec 38             	sub    $0x38,%esp

	if(argv<2){
  14:	83 39 01             	cmpl   $0x1,(%ecx)
main(int argv, char* argc[]){
  17:	8b 51 04             	mov    0x4(%ecx),%edx
	if(argv<2){
  1a:	7e 3a                	jle    56 <main+0x56>
		printf(1, "Incorrect format!\nFormat: test_scheduler <number of fork processes>\n");

		exit();
	}

	int n=atoi(argc[1]);
  1c:	83 ec 0c             	sub    $0xc,%esp
  1f:	ff 72 04             	push   0x4(%edx)
  22:	e8 09 04 00 00       	call   430 <atoi>

	int burst_times[n];
  27:	83 c4 10             	add    $0x10,%esp
  2a:	8d 14 85 0f 00 00 00 	lea    0xf(,%eax,4),%edx
	int n=atoi(argc[1]);
  31:	89 c7                	mov    %eax,%edi
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
		printf(1, "Incorrect format!\nFormat: test_scheduler <number of fork processes>\n");
  56:	50                   	push   %eax
  57:	50                   	push   %eax
  58:	68 a8 0b 00 00       	push   $0xba8
  5d:	6a 01                	push   $0x1
  5f:	e8 ec 05 00 00       	call   650 <printf>
		exit();
  64:	e8 3a 04 00 00       	call   4a3 <exit>
	int burst_times[n];
  69:	25 ff 0f 00 00       	and    $0xfff,%eax
  6e:	29 c4                	sub    %eax,%esp
  70:	85 c0                	test   %eax,%eax
  72:	74 05                	je     79 <main+0x79>
  74:	83 4c 04 fc 00       	orl    $0x0,-0x4(%esp,%eax,1)
  79:	89 65 c4             	mov    %esp,-0x3c(%ebp)

	for(int i=0;i<n;i++){
  7c:	85 ff                	test   %edi,%edi
  7e:	0f 8e f0 00 00 00    	jle    174 <main+0x174>
  84:	31 db                	xor    %ebx,%ebx
		burst_times[i] = randomrange(1,1000);
  86:	83 ec 08             	sub    $0x8,%esp
  89:	68 e8 03 00 00       	push   $0x3e8
  8e:	6a 01                	push   $0x1
  90:	e8 cb 0a 00 00       	call   b60 <randomrange>
  95:	8b 75 c4             	mov    -0x3c(%ebp),%esi
	for(int i=0;i<n;i++){
  98:	83 c4 10             	add    $0x10,%esp
		burst_times[i] = randomrange(1,1000);
  9b:	89 04 9e             	mov    %eax,(%esi,%ebx,4)
	for(int i=0;i<n;i++){
  9e:	89 de                	mov    %ebx,%esi
  a0:	8d 5b 01             	lea    0x1(%ebx),%ebx
  a3:	39 df                	cmp    %ebx,%edi
  a5:	75 df                	jne    86 <main+0x86>
	}

	printf(1, "\tPID \t Type \t Burst Time \t Context Switches\n");
  a7:	53                   	push   %ebx
  a8:	53                   	push   %ebx
  a9:	68 a0 0c 00 00       	push   $0xca0
  ae:	6a 01                	push   $0x1
  b0:	e8 9b 05 00 00       	call   650 <printf>
	printf(1, "\t___ \t ____ \t __________ \t ________________\n\n");
  b5:	5f                   	pop    %edi
  b6:	58                   	pop    %eax
  b7:	68 d0 0c 00 00       	push   $0xcd0
  bc:	6a 01                	push   $0x1
  be:	31 ff                	xor    %edi,%edi
  c0:	e8 8b 05 00 00       	call   650 <printf>
  c5:	83 c4 10             	add    $0x10,%esp
  c8:	eb 0d                	jmp    d7 <main+0xd7>

	for(int i=0;i<n;i++){
  ca:	8d 47 01             	lea    0x1(%edi),%eax
  cd:	39 fe                	cmp    %edi,%esi
  cf:	0f 84 be 00 00 00    	je     193 <main+0x193>
  d5:	89 c7                	mov    %eax,%edi
		if(!fork()){
  d7:	e8 bf 03 00 00       	call   49b <fork>
  dc:	89 c3                	mov    %eax,%ebx
  de:	85 c0                	test   %eax,%eax
  e0:	75 e8                	jne    ca <main+0xca>

			if(i%2){
				// CPU Bound process
				set_burst_time(burst_times[i]);
  e2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  e5:	8b 04 b8             	mov    (%eax,%edi,4),%eax
			if(i%2){
  e8:	83 e7 01             	and    $0x1,%edi
  eb:	0f 84 b8 00 00 00    	je     1a9 <main+0x1a9>
				set_burst_time(burst_times[i]);
  f1:	83 ec 0c             	sub    $0xc,%esp

				int it=0;
				for(int j=0;j<100;j++){
  f4:	31 f6                	xor    %esi,%esi
				set_burst_time(burst_times[i]);
  f6:	50                   	push   %eax
  f7:	e8 7f 04 00 00       	call   57b <set_burst_time>
  fc:	83 c4 10             	add    $0x10,%esp
  ff:	b9 80 84 1e 00       	mov    $0x1e8480,%ecx
					for(int k=0;k<2000000;k++){
 104:	89 f0                	mov    %esi,%eax
 106:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10d:	8d 76 00             	lea    0x0(%esi),%esi
						if((j+k)%2)it++;
 110:	8d 53 01             	lea    0x1(%ebx),%edx
 113:	83 eb 01             	sub    $0x1,%ebx
 116:	a8 01                	test   $0x1,%al
 118:	0f 45 da             	cmovne %edx,%ebx
					for(int k=0;k<2000000;k++){
 11b:	83 c0 01             	add    $0x1,%eax
 11e:	39 c8                	cmp    %ecx,%eax
 120:	75 ee                	jne    110 <main+0x110>
				for(int j=0;j<100;j++){
 122:	83 c6 01             	add    $0x1,%esi
 125:	8d 48 01             	lea    0x1(%eax),%ecx
 128:	83 fe 64             	cmp    $0x64,%esi
 12b:	75 d7                	jne    104 <main+0x104>
				useless+=it;


			
				struct processInfo info;
				getCurrentInfo(&info);
 12d:	83 ec 0c             	sub    $0xc,%esp
 130:	8d 45 d0             	lea    -0x30(%ebp),%eax
				useless+=it;
 133:	01 1d c0 10 00 00    	add    %ebx,0x10c0
				getCurrentInfo(&info);
 139:	50                   	push   %eax
 13a:	e8 4c 04 00 00       	call   58b <getCurrentInfo>
				int bt = get_burst_time();
 13f:	e8 3f 04 00 00       	call   583 <get_burst_time>
				if(bt<10)
					printf(1, "\t%d \t CPU         %d                  %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 144:	8b 75 d8             	mov    -0x28(%ebp),%esi
				if(bt<10)
 147:	83 c4 10             	add    $0x10,%esp
				int bt = get_burst_time();
 14a:	89 c3                	mov    %eax,%ebx
				if(bt<10)
 14c:	83 f8 09             	cmp    $0x9,%eax
 14f:	0f 8f b4 00 00 00    	jg     209 <main+0x209>
					printf(1, "\t%d \t CPU         %d                  %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 155:	e8 39 04 00 00       	call   593 <getCurrentPID>
 15a:	83 ec 0c             	sub    $0xc,%esp
 15d:	56                   	push   %esi
 15e:	53                   	push   %ebx
 15f:	50                   	push   %eax
 160:	68 f0 0b 00 00       	push   $0xbf0
 165:	6a 01                	push   $0x1
 167:	e8 e4 04 00 00       	call   650 <printf>
 16c:	83 c4 20             	add    $0x20,%esp
				else
					printf(1, "\t%d \t CPU         %d                 %d\n", getCurrentPID(), bt, info.numberContextSwitches);
				exit();	
 16f:	e8 2f 03 00 00       	call   4a3 <exit>
	printf(1, "\tPID \t Type \t Burst Time \t Context Switches\n");
 174:	50                   	push   %eax
 175:	50                   	push   %eax
 176:	68 a0 0c 00 00       	push   $0xca0
 17b:	6a 01                	push   $0x1
 17d:	e8 ce 04 00 00       	call   650 <printf>
	printf(1, "\t___ \t ____ \t __________ \t ________________\n\n");
 182:	5a                   	pop    %edx
 183:	59                   	pop    %ecx
 184:	68 d0 0c 00 00       	push   $0xcd0
 189:	6a 01                	push   $0x1
 18b:	e8 c0 04 00 00       	call   650 <printf>
 190:	83 c4 10             	add    $0x10,%esp

			}
		}
	}

	while(wait()!=-1);
 193:	e8 13 03 00 00       	call   4ab <wait>
 198:	83 f8 ff             	cmp    $0xffffffff,%eax
 19b:	74 d2                	je     16f <main+0x16f>
 19d:	e8 09 03 00 00       	call   4ab <wait>
 1a2:	83 f8 ff             	cmp    $0xffffffff,%eax
 1a5:	75 ec                	jne    193 <main+0x193>
 1a7:	eb c6                	jmp    16f <main+0x16f>
				set_burst_time(burst_times[i]);
 1a9:	83 ec 0c             	sub    $0xc,%esp
 1ac:	bb 0a 00 00 00       	mov    $0xa,%ebx
 1b1:	50                   	push   %eax
 1b2:	e8 c4 03 00 00       	call   57b <set_burst_time>
 1b7:	83 c4 10             	add    $0x10,%esp
					sleep(1);
 1ba:	83 ec 0c             	sub    $0xc,%esp
 1bd:	6a 01                	push   $0x1
 1bf:	e8 6f 03 00 00       	call   533 <sleep>
				for(int i=0;i<10;i++){
 1c4:	83 c4 10             	add    $0x10,%esp
 1c7:	83 eb 01             	sub    $0x1,%ebx
 1ca:	75 ee                	jne    1ba <main+0x1ba>
				getCurrentInfo(&info);
 1cc:	83 ec 0c             	sub    $0xc,%esp
 1cf:	8d 45 dc             	lea    -0x24(%ebp),%eax
 1d2:	50                   	push   %eax
 1d3:	e8 b3 03 00 00       	call   58b <getCurrentInfo>
				int bt = get_burst_time();
 1d8:	e8 a6 03 00 00       	call   583 <get_burst_time>
					printf(1, "\t%d \t I/O         %d                  %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 1dd:	8b 75 e4             	mov    -0x1c(%ebp),%esi
				if(bt<10)
 1e0:	83 c4 10             	add    $0x10,%esp
				int bt = get_burst_time();
 1e3:	89 c3                	mov    %eax,%ebx
				if(bt<10)
 1e5:	83 f8 09             	cmp    $0x9,%eax
 1e8:	7f 3e                	jg     228 <main+0x228>
					printf(1, "\t%d \t I/O         %d                  %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 1ea:	e8 a4 03 00 00       	call   593 <getCurrentPID>
 1ef:	83 ec 0c             	sub    $0xc,%esp
 1f2:	56                   	push   %esi
 1f3:	53                   	push   %ebx
 1f4:	50                   	push   %eax
 1f5:	68 48 0c 00 00       	push   $0xc48
 1fa:	6a 01                	push   $0x1
 1fc:	e8 4f 04 00 00       	call   650 <printf>
 201:	83 c4 20             	add    $0x20,%esp
 204:	e9 66 ff ff ff       	jmp    16f <main+0x16f>
					printf(1, "\t%d \t CPU         %d                 %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 209:	e8 85 03 00 00       	call   593 <getCurrentPID>
 20e:	83 ec 0c             	sub    $0xc,%esp
 211:	56                   	push   %esi
 212:	53                   	push   %ebx
 213:	50                   	push   %eax
 214:	68 1c 0c 00 00       	push   $0xc1c
 219:	6a 01                	push   $0x1
 21b:	e8 30 04 00 00       	call   650 <printf>
 220:	83 c4 20             	add    $0x20,%esp
 223:	e9 47 ff ff ff       	jmp    16f <main+0x16f>
					printf(1, "\t%d \t I/O         %d                 %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 228:	e8 66 03 00 00       	call   593 <getCurrentPID>
 22d:	83 ec 0c             	sub    $0xc,%esp
 230:	56                   	push   %esi
 231:	53                   	push   %ebx
 232:	50                   	push   %eax
 233:	68 74 0c 00 00       	push   $0xc74
 238:	6a 01                	push   $0x1
 23a:	e8 11 04 00 00       	call   650 <printf>
 23f:	83 c4 20             	add    $0x20,%esp
 242:	e9 28 ff ff ff       	jmp    16f <main+0x16f>
 247:	66 90                	xchg   %ax,%ax
 249:	66 90                	xchg   %ax,%ax
 24b:	66 90                	xchg   %ax,%ax
 24d:	66 90                	xchg   %ax,%ax
 24f:	90                   	nop

00000250 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 250:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 251:	31 c0                	xor    %eax,%eax
{
 253:	89 e5                	mov    %esp,%ebp
 255:	53                   	push   %ebx
 256:	8b 4d 08             	mov    0x8(%ebp),%ecx
 259:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 260:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 264:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 267:	83 c0 01             	add    $0x1,%eax
 26a:	84 d2                	test   %dl,%dl
 26c:	75 f2                	jne    260 <strcpy+0x10>
    ;
  return os;
}
 26e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 271:	89 c8                	mov    %ecx,%eax
 273:	c9                   	leave  
 274:	c3                   	ret    
 275:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000280 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	53                   	push   %ebx
 284:	8b 55 08             	mov    0x8(%ebp),%edx
 287:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 28a:	0f b6 02             	movzbl (%edx),%eax
 28d:	84 c0                	test   %al,%al
 28f:	75 17                	jne    2a8 <strcmp+0x28>
 291:	eb 3a                	jmp    2cd <strcmp+0x4d>
 293:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 297:	90                   	nop
 298:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 29c:	83 c2 01             	add    $0x1,%edx
 29f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 2a2:	84 c0                	test   %al,%al
 2a4:	74 1a                	je     2c0 <strcmp+0x40>
    p++, q++;
 2a6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 2a8:	0f b6 19             	movzbl (%ecx),%ebx
 2ab:	38 c3                	cmp    %al,%bl
 2ad:	74 e9                	je     298 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 2af:	29 d8                	sub    %ebx,%eax
}
 2b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2b4:	c9                   	leave  
 2b5:	c3                   	ret    
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 2c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 2c4:	31 c0                	xor    %eax,%eax
 2c6:	29 d8                	sub    %ebx,%eax
}
 2c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2cb:	c9                   	leave  
 2cc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 2cd:	0f b6 19             	movzbl (%ecx),%ebx
 2d0:	31 c0                	xor    %eax,%eax
 2d2:	eb db                	jmp    2af <strcmp+0x2f>
 2d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop

000002e0 <strlen>:

uint
strlen(const char *s)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 2e6:	80 3a 00             	cmpb   $0x0,(%edx)
 2e9:	74 15                	je     300 <strlen+0x20>
 2eb:	31 c0                	xor    %eax,%eax
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
 2f0:	83 c0 01             	add    $0x1,%eax
 2f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 2f7:	89 c1                	mov    %eax,%ecx
 2f9:	75 f5                	jne    2f0 <strlen+0x10>
    ;
  return n;
}
 2fb:	89 c8                	mov    %ecx,%eax
 2fd:	5d                   	pop    %ebp
 2fe:	c3                   	ret    
 2ff:	90                   	nop
  for(n = 0; s[n]; n++)
 300:	31 c9                	xor    %ecx,%ecx
}
 302:	5d                   	pop    %ebp
 303:	89 c8                	mov    %ecx,%eax
 305:	c3                   	ret    
 306:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30d:	8d 76 00             	lea    0x0(%esi),%esi

00000310 <memset>:

void*
memset(void *dst, int c, uint n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 317:	8b 4d 10             	mov    0x10(%ebp),%ecx
 31a:	8b 45 0c             	mov    0xc(%ebp),%eax
 31d:	89 d7                	mov    %edx,%edi
 31f:	fc                   	cld    
 320:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 322:	8b 7d fc             	mov    -0x4(%ebp),%edi
 325:	89 d0                	mov    %edx,%eax
 327:	c9                   	leave  
 328:	c3                   	ret    
 329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000330 <strchr>:

char*
strchr(const char *s, char c)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	8b 45 08             	mov    0x8(%ebp),%eax
 336:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 33a:	0f b6 10             	movzbl (%eax),%edx
 33d:	84 d2                	test   %dl,%dl
 33f:	75 12                	jne    353 <strchr+0x23>
 341:	eb 1d                	jmp    360 <strchr+0x30>
 343:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 347:	90                   	nop
 348:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 34c:	83 c0 01             	add    $0x1,%eax
 34f:	84 d2                	test   %dl,%dl
 351:	74 0d                	je     360 <strchr+0x30>
    if(*s == c)
 353:	38 d1                	cmp    %dl,%cl
 355:	75 f1                	jne    348 <strchr+0x18>
      return (char*)s;
  return 0;
}
 357:	5d                   	pop    %ebp
 358:	c3                   	ret    
 359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 360:	31 c0                	xor    %eax,%eax
}
 362:	5d                   	pop    %ebp
 363:	c3                   	ret    
 364:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <gets>:

char*
gets(char *buf, int max)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 375:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 378:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 379:	31 db                	xor    %ebx,%ebx
{
 37b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 37e:	eb 27                	jmp    3a7 <gets+0x37>
    cc = read(0, &c, 1);
 380:	83 ec 04             	sub    $0x4,%esp
 383:	6a 01                	push   $0x1
 385:	57                   	push   %edi
 386:	6a 00                	push   $0x0
 388:	e8 2e 01 00 00       	call   4bb <read>
    if(cc < 1)
 38d:	83 c4 10             	add    $0x10,%esp
 390:	85 c0                	test   %eax,%eax
 392:	7e 1d                	jle    3b1 <gets+0x41>
      break;
    buf[i++] = c;
 394:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 398:	8b 55 08             	mov    0x8(%ebp),%edx
 39b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 39f:	3c 0a                	cmp    $0xa,%al
 3a1:	74 1d                	je     3c0 <gets+0x50>
 3a3:	3c 0d                	cmp    $0xd,%al
 3a5:	74 19                	je     3c0 <gets+0x50>
  for(i=0; i+1 < max; ){
 3a7:	89 de                	mov    %ebx,%esi
 3a9:	83 c3 01             	add    $0x1,%ebx
 3ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3af:	7c cf                	jl     380 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 3b1:	8b 45 08             	mov    0x8(%ebp),%eax
 3b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 3b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3bb:	5b                   	pop    %ebx
 3bc:	5e                   	pop    %esi
 3bd:	5f                   	pop    %edi
 3be:	5d                   	pop    %ebp
 3bf:	c3                   	ret    
  buf[i] = '\0';
 3c0:	8b 45 08             	mov    0x8(%ebp),%eax
 3c3:	89 de                	mov    %ebx,%esi
 3c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 3c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3cc:	5b                   	pop    %ebx
 3cd:	5e                   	pop    %esi
 3ce:	5f                   	pop    %edi
 3cf:	5d                   	pop    %ebp
 3d0:	c3                   	ret    
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop

000003e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	56                   	push   %esi
 3e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3e5:	83 ec 08             	sub    $0x8,%esp
 3e8:	6a 00                	push   $0x0
 3ea:	ff 75 08             	push   0x8(%ebp)
 3ed:	e8 f1 00 00 00       	call   4e3 <open>
  if(fd < 0)
 3f2:	83 c4 10             	add    $0x10,%esp
 3f5:	85 c0                	test   %eax,%eax
 3f7:	78 27                	js     420 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 3f9:	83 ec 08             	sub    $0x8,%esp
 3fc:	ff 75 0c             	push   0xc(%ebp)
 3ff:	89 c3                	mov    %eax,%ebx
 401:	50                   	push   %eax
 402:	e8 f4 00 00 00       	call   4fb <fstat>
  close(fd);
 407:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 40a:	89 c6                	mov    %eax,%esi
  close(fd);
 40c:	e8 ba 00 00 00       	call   4cb <close>
  return r;
 411:	83 c4 10             	add    $0x10,%esp
}
 414:	8d 65 f8             	lea    -0x8(%ebp),%esp
 417:	89 f0                	mov    %esi,%eax
 419:	5b                   	pop    %ebx
 41a:	5e                   	pop    %esi
 41b:	5d                   	pop    %ebp
 41c:	c3                   	ret    
 41d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 420:	be ff ff ff ff       	mov    $0xffffffff,%esi
 425:	eb ed                	jmp    414 <stat+0x34>
 427:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42e:	66 90                	xchg   %ax,%ax

00000430 <atoi>:

int
atoi(const char *s)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	53                   	push   %ebx
 434:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 437:	0f be 02             	movsbl (%edx),%eax
 43a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 43d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 440:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 445:	77 1e                	ja     465 <atoi+0x35>
 447:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 44e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 450:	83 c2 01             	add    $0x1,%edx
 453:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 456:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 45a:	0f be 02             	movsbl (%edx),%eax
 45d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 460:	80 fb 09             	cmp    $0x9,%bl
 463:	76 eb                	jbe    450 <atoi+0x20>
  return n;
}
 465:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 468:	89 c8                	mov    %ecx,%eax
 46a:	c9                   	leave  
 46b:	c3                   	ret    
 46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000470 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	8b 45 10             	mov    0x10(%ebp),%eax
 477:	8b 55 08             	mov    0x8(%ebp),%edx
 47a:	56                   	push   %esi
 47b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 47e:	85 c0                	test   %eax,%eax
 480:	7e 13                	jle    495 <memmove+0x25>
 482:	01 d0                	add    %edx,%eax
  dst = vdst;
 484:	89 d7                	mov    %edx,%edi
 486:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 490:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 491:	39 f8                	cmp    %edi,%eax
 493:	75 fb                	jne    490 <memmove+0x20>
  return vdst;
}
 495:	5e                   	pop    %esi
 496:	89 d0                	mov    %edx,%eax
 498:	5f                   	pop    %edi
 499:	5d                   	pop    %ebp
 49a:	c3                   	ret    

0000049b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 49b:	b8 01 00 00 00       	mov    $0x1,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <exit>:
SYSCALL(exit)
 4a3:	b8 02 00 00 00       	mov    $0x2,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <wait>:
SYSCALL(wait)
 4ab:	b8 03 00 00 00       	mov    $0x3,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <pipe>:
SYSCALL(pipe)
 4b3:	b8 04 00 00 00       	mov    $0x4,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <read>:
SYSCALL(read)
 4bb:	b8 05 00 00 00       	mov    $0x5,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <write>:
SYSCALL(write)
 4c3:	b8 10 00 00 00       	mov    $0x10,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <close>:
SYSCALL(close)
 4cb:	b8 15 00 00 00       	mov    $0x15,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <kill>:
SYSCALL(kill)
 4d3:	b8 06 00 00 00       	mov    $0x6,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <exec>:
SYSCALL(exec)
 4db:	b8 07 00 00 00       	mov    $0x7,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <open>:
SYSCALL(open)
 4e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <mknod>:
SYSCALL(mknod)
 4eb:	b8 11 00 00 00       	mov    $0x11,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <unlink>:
SYSCALL(unlink)
 4f3:	b8 12 00 00 00       	mov    $0x12,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <fstat>:
SYSCALL(fstat)
 4fb:	b8 08 00 00 00       	mov    $0x8,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <link>:
SYSCALL(link)
 503:	b8 13 00 00 00       	mov    $0x13,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <mkdir>:
SYSCALL(mkdir)
 50b:	b8 14 00 00 00       	mov    $0x14,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <chdir>:
SYSCALL(chdir)
 513:	b8 09 00 00 00       	mov    $0x9,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <dup>:
SYSCALL(dup)
 51b:	b8 0a 00 00 00       	mov    $0xa,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <getpid>:
SYSCALL(getpid)
 523:	b8 0b 00 00 00       	mov    $0xb,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <sbrk>:
SYSCALL(sbrk)
 52b:	b8 0c 00 00 00       	mov    $0xc,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <sleep>:
SYSCALL(sleep)
 533:	b8 0d 00 00 00       	mov    $0xd,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <uptime>:
SYSCALL(uptime)
 53b:	b8 0e 00 00 00       	mov    $0xe,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <thread_create>:
SYSCALL(thread_create)
 543:	b8 16 00 00 00       	mov    $0x16,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <thread_join>:
SYSCALL(thread_join)
 54b:	b8 18 00 00 00       	mov    $0x18,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <thread_exit>:
SYSCALL(thread_exit)
 553:	b8 17 00 00 00       	mov    $0x17,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <draw>:
SYSCALL(draw)
 55b:	b8 19 00 00 00       	mov    $0x19,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <getNumProc>:
SYSCALL(getNumProc)
 563:	b8 1a 00 00 00       	mov    $0x1a,%eax
 568:	cd 40                	int    $0x40
 56a:	c3                   	ret    

0000056b <getMaxPid>:
SYSCALL(getMaxPid)
 56b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <getProcInfo>:
SYSCALL(getProcInfo)
 573:	b8 1c 00 00 00       	mov    $0x1c,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <set_burst_time>:
SYSCALL(set_burst_time)
 57b:	b8 1d 00 00 00       	mov    $0x1d,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <get_burst_time>:
SYSCALL(get_burst_time)
 583:	b8 1e 00 00 00       	mov    $0x1e,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <getCurrentInfo>:
SYSCALL(getCurrentInfo)
 58b:	b8 1f 00 00 00       	mov    $0x1f,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <getCurrentPID>:
SYSCALL(getCurrentPID)
 593:	b8 20 00 00 00       	mov    $0x20,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    
 59b:	66 90                	xchg   %ax,%ax
 59d:	66 90                	xchg   %ax,%ax
 59f:	90                   	nop

000005a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	57                   	push   %edi
 5a4:	56                   	push   %esi
 5a5:	53                   	push   %ebx
 5a6:	83 ec 3c             	sub    $0x3c,%esp
 5a9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 5ac:	89 d1                	mov    %edx,%ecx
{
 5ae:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 5b1:	85 d2                	test   %edx,%edx
 5b3:	0f 89 7f 00 00 00    	jns    638 <printint+0x98>
 5b9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 5bd:	74 79                	je     638 <printint+0x98>
    neg = 1;
 5bf:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 5c6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 5c8:	31 db                	xor    %ebx,%ebx
 5ca:	8d 75 d7             	lea    -0x29(%ebp),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 5d0:	89 c8                	mov    %ecx,%eax
 5d2:	31 d2                	xor    %edx,%edx
 5d4:	89 cf                	mov    %ecx,%edi
 5d6:	f7 75 c4             	divl   -0x3c(%ebp)
 5d9:	0f b6 92 60 0d 00 00 	movzbl 0xd60(%edx),%edx
 5e0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 5e3:	89 d8                	mov    %ebx,%eax
 5e5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 5e8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 5eb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 5ee:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 5f1:	76 dd                	jbe    5d0 <printint+0x30>
  if(neg)
 5f3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 5f6:	85 c9                	test   %ecx,%ecx
 5f8:	74 0c                	je     606 <printint+0x66>
    buf[i++] = '-';
 5fa:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 5ff:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 601:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 606:	8b 7d b8             	mov    -0x48(%ebp),%edi
 609:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 60d:	eb 07                	jmp    616 <printint+0x76>
 60f:	90                   	nop
    putc(fd, buf[i]);
 610:	0f b6 13             	movzbl (%ebx),%edx
 613:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 616:	83 ec 04             	sub    $0x4,%esp
 619:	88 55 d7             	mov    %dl,-0x29(%ebp)
 61c:	6a 01                	push   $0x1
 61e:	56                   	push   %esi
 61f:	57                   	push   %edi
 620:	e8 9e fe ff ff       	call   4c3 <write>
  while(--i >= 0)
 625:	83 c4 10             	add    $0x10,%esp
 628:	39 de                	cmp    %ebx,%esi
 62a:	75 e4                	jne    610 <printint+0x70>
}
 62c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 62f:	5b                   	pop    %ebx
 630:	5e                   	pop    %esi
 631:	5f                   	pop    %edi
 632:	5d                   	pop    %ebp
 633:	c3                   	ret    
 634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 638:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 63f:	eb 87                	jmp    5c8 <printint+0x28>
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop

00000650 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 659:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 65c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 65f:	0f b6 13             	movzbl (%ebx),%edx
 662:	84 d2                	test   %dl,%dl
 664:	74 6a                	je     6d0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 666:	8d 45 10             	lea    0x10(%ebp),%eax
 669:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 66c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 66f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 671:	89 45 d0             	mov    %eax,-0x30(%ebp)
 674:	eb 36                	jmp    6ac <printf+0x5c>
 676:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67d:	8d 76 00             	lea    0x0(%esi),%esi
 680:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 683:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 688:	83 f8 25             	cmp    $0x25,%eax
 68b:	74 15                	je     6a2 <printf+0x52>
  write(fd, &c, 1);
 68d:	83 ec 04             	sub    $0x4,%esp
 690:	88 55 e7             	mov    %dl,-0x19(%ebp)
 693:	6a 01                	push   $0x1
 695:	57                   	push   %edi
 696:	56                   	push   %esi
 697:	e8 27 fe ff ff       	call   4c3 <write>
 69c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 69f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6a2:	0f b6 13             	movzbl (%ebx),%edx
 6a5:	83 c3 01             	add    $0x1,%ebx
 6a8:	84 d2                	test   %dl,%dl
 6aa:	74 24                	je     6d0 <printf+0x80>
    c = fmt[i] & 0xff;
 6ac:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 6af:	85 c9                	test   %ecx,%ecx
 6b1:	74 cd                	je     680 <printf+0x30>
      }
    } else if(state == '%'){
 6b3:	83 f9 25             	cmp    $0x25,%ecx
 6b6:	75 ea                	jne    6a2 <printf+0x52>
      if(c == 'd'){
 6b8:	83 f8 25             	cmp    $0x25,%eax
 6bb:	0f 84 07 01 00 00    	je     7c8 <printf+0x178>
 6c1:	83 e8 63             	sub    $0x63,%eax
 6c4:	83 f8 15             	cmp    $0x15,%eax
 6c7:	77 17                	ja     6e0 <printf+0x90>
 6c9:	ff 24 85 08 0d 00 00 	jmp    *0xd08(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6d3:	5b                   	pop    %ebx
 6d4:	5e                   	pop    %esi
 6d5:	5f                   	pop    %edi
 6d6:	5d                   	pop    %ebp
 6d7:	c3                   	ret    
 6d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6df:	90                   	nop
  write(fd, &c, 1);
 6e0:	83 ec 04             	sub    $0x4,%esp
 6e3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 6e6:	6a 01                	push   $0x1
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 6ee:	e8 d0 fd ff ff       	call   4c3 <write>
        putc(fd, c);
 6f3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 6f7:	83 c4 0c             	add    $0xc,%esp
 6fa:	88 55 e7             	mov    %dl,-0x19(%ebp)
 6fd:	6a 01                	push   $0x1
 6ff:	57                   	push   %edi
 700:	56                   	push   %esi
 701:	e8 bd fd ff ff       	call   4c3 <write>
        putc(fd, c);
 706:	83 c4 10             	add    $0x10,%esp
      state = 0;
 709:	31 c9                	xor    %ecx,%ecx
 70b:	eb 95                	jmp    6a2 <printf+0x52>
 70d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 710:	83 ec 0c             	sub    $0xc,%esp
 713:	b9 10 00 00 00       	mov    $0x10,%ecx
 718:	6a 00                	push   $0x0
 71a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 71d:	8b 10                	mov    (%eax),%edx
 71f:	89 f0                	mov    %esi,%eax
 721:	e8 7a fe ff ff       	call   5a0 <printint>
        ap++;
 726:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 72a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72d:	31 c9                	xor    %ecx,%ecx
 72f:	e9 6e ff ff ff       	jmp    6a2 <printf+0x52>
 734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 738:	8b 45 d0             	mov    -0x30(%ebp),%eax
 73b:	8b 10                	mov    (%eax),%edx
        ap++;
 73d:	83 c0 04             	add    $0x4,%eax
 740:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 743:	85 d2                	test   %edx,%edx
 745:	0f 84 8d 00 00 00    	je     7d8 <printf+0x188>
        while(*s != 0){
 74b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 74e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 750:	84 c0                	test   %al,%al
 752:	0f 84 4a ff ff ff    	je     6a2 <printf+0x52>
 758:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 75b:	89 d3                	mov    %edx,%ebx
 75d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 760:	83 ec 04             	sub    $0x4,%esp
          s++;
 763:	83 c3 01             	add    $0x1,%ebx
 766:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 769:	6a 01                	push   $0x1
 76b:	57                   	push   %edi
 76c:	56                   	push   %esi
 76d:	e8 51 fd ff ff       	call   4c3 <write>
        while(*s != 0){
 772:	0f b6 03             	movzbl (%ebx),%eax
 775:	83 c4 10             	add    $0x10,%esp
 778:	84 c0                	test   %al,%al
 77a:	75 e4                	jne    760 <printf+0x110>
      state = 0;
 77c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 77f:	31 c9                	xor    %ecx,%ecx
 781:	e9 1c ff ff ff       	jmp    6a2 <printf+0x52>
 786:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 78d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 790:	83 ec 0c             	sub    $0xc,%esp
 793:	b9 0a 00 00 00       	mov    $0xa,%ecx
 798:	6a 01                	push   $0x1
 79a:	e9 7b ff ff ff       	jmp    71a <printf+0xca>
 79f:	90                   	nop
        putc(fd, *ap);
 7a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 7a3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 7a6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 7a8:	6a 01                	push   $0x1
 7aa:	57                   	push   %edi
 7ab:	56                   	push   %esi
        putc(fd, *ap);
 7ac:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 7af:	e8 0f fd ff ff       	call   4c3 <write>
        ap++;
 7b4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 7b8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7bb:	31 c9                	xor    %ecx,%ecx
 7bd:	e9 e0 fe ff ff       	jmp    6a2 <printf+0x52>
 7c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 7c8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 7cb:	83 ec 04             	sub    $0x4,%esp
 7ce:	e9 2a ff ff ff       	jmp    6fd <printf+0xad>
 7d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7d7:	90                   	nop
          s = "(null)";
 7d8:	ba fe 0c 00 00       	mov    $0xcfe,%edx
        while(*s != 0){
 7dd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 7e0:	b8 28 00 00 00       	mov    $0x28,%eax
 7e5:	89 d3                	mov    %edx,%ebx
 7e7:	e9 74 ff ff ff       	jmp    760 <printf+0x110>
 7ec:	66 90                	xchg   %ax,%ax
 7ee:	66 90                	xchg   %ax,%ax

000007f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f1:	a1 c4 10 00 00       	mov    0x10c4,%eax
{
 7f6:	89 e5                	mov    %esp,%ebp
 7f8:	57                   	push   %edi
 7f9:	56                   	push   %esi
 7fa:	53                   	push   %ebx
 7fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 7fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 801:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 808:	89 c2                	mov    %eax,%edx
 80a:	8b 00                	mov    (%eax),%eax
 80c:	39 ca                	cmp    %ecx,%edx
 80e:	73 30                	jae    840 <free+0x50>
 810:	39 c1                	cmp    %eax,%ecx
 812:	72 04                	jb     818 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 814:	39 c2                	cmp    %eax,%edx
 816:	72 f0                	jb     808 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 818:	8b 73 fc             	mov    -0x4(%ebx),%esi
 81b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 81e:	39 f8                	cmp    %edi,%eax
 820:	74 30                	je     852 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 822:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 825:	8b 42 04             	mov    0x4(%edx),%eax
 828:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 82b:	39 f1                	cmp    %esi,%ecx
 82d:	74 3a                	je     869 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 82f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 831:	5b                   	pop    %ebx
  freep = p;
 832:	89 15 c4 10 00 00    	mov    %edx,0x10c4
}
 838:	5e                   	pop    %esi
 839:	5f                   	pop    %edi
 83a:	5d                   	pop    %ebp
 83b:	c3                   	ret    
 83c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 840:	39 c2                	cmp    %eax,%edx
 842:	72 c4                	jb     808 <free+0x18>
 844:	39 c1                	cmp    %eax,%ecx
 846:	73 c0                	jae    808 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 848:	8b 73 fc             	mov    -0x4(%ebx),%esi
 84b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 84e:	39 f8                	cmp    %edi,%eax
 850:	75 d0                	jne    822 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 852:	03 70 04             	add    0x4(%eax),%esi
 855:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 858:	8b 02                	mov    (%edx),%eax
 85a:	8b 00                	mov    (%eax),%eax
 85c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 85f:	8b 42 04             	mov    0x4(%edx),%eax
 862:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 865:	39 f1                	cmp    %esi,%ecx
 867:	75 c6                	jne    82f <free+0x3f>
    p->s.size += bp->s.size;
 869:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 86c:	89 15 c4 10 00 00    	mov    %edx,0x10c4
    p->s.size += bp->s.size;
 872:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 875:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 878:	89 0a                	mov    %ecx,(%edx)
}
 87a:	5b                   	pop    %ebx
 87b:	5e                   	pop    %esi
 87c:	5f                   	pop    %edi
 87d:	5d                   	pop    %ebp
 87e:	c3                   	ret    
 87f:	90                   	nop

00000880 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	57                   	push   %edi
 884:	56                   	push   %esi
 885:	53                   	push   %ebx
 886:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 889:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 88c:	8b 3d c4 10 00 00    	mov    0x10c4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 892:	8d 70 07             	lea    0x7(%eax),%esi
 895:	c1 ee 03             	shr    $0x3,%esi
 898:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 89b:	85 ff                	test   %edi,%edi
 89d:	0f 84 9d 00 00 00    	je     940 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 8a5:	8b 4a 04             	mov    0x4(%edx),%ecx
 8a8:	39 f1                	cmp    %esi,%ecx
 8aa:	73 6a                	jae    916 <malloc+0x96>
 8ac:	bb 00 10 00 00       	mov    $0x1000,%ebx
 8b1:	39 de                	cmp    %ebx,%esi
 8b3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 8b6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8c0:	eb 17                	jmp    8d9 <malloc+0x59>
 8c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 8ca:	8b 48 04             	mov    0x4(%eax),%ecx
 8cd:	39 f1                	cmp    %esi,%ecx
 8cf:	73 4f                	jae    920 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8d1:	8b 3d c4 10 00 00    	mov    0x10c4,%edi
 8d7:	89 c2                	mov    %eax,%edx
 8d9:	39 d7                	cmp    %edx,%edi
 8db:	75 eb                	jne    8c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 8dd:	83 ec 0c             	sub    $0xc,%esp
 8e0:	ff 75 e4             	push   -0x1c(%ebp)
 8e3:	e8 43 fc ff ff       	call   52b <sbrk>
  if(p == (char*)-1)
 8e8:	83 c4 10             	add    $0x10,%esp
 8eb:	83 f8 ff             	cmp    $0xffffffff,%eax
 8ee:	74 1c                	je     90c <malloc+0x8c>
  hp->s.size = nu;
 8f0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8f3:	83 ec 0c             	sub    $0xc,%esp
 8f6:	83 c0 08             	add    $0x8,%eax
 8f9:	50                   	push   %eax
 8fa:	e8 f1 fe ff ff       	call   7f0 <free>
  return freep;
 8ff:	8b 15 c4 10 00 00    	mov    0x10c4,%edx
      if((p = morecore(nunits)) == 0)
 905:	83 c4 10             	add    $0x10,%esp
 908:	85 d2                	test   %edx,%edx
 90a:	75 bc                	jne    8c8 <malloc+0x48>
        return 0;
  }
}
 90c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 90f:	31 c0                	xor    %eax,%eax
}
 911:	5b                   	pop    %ebx
 912:	5e                   	pop    %esi
 913:	5f                   	pop    %edi
 914:	5d                   	pop    %ebp
 915:	c3                   	ret    
    if(p->s.size >= nunits){
 916:	89 d0                	mov    %edx,%eax
 918:	89 fa                	mov    %edi,%edx
 91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 920:	39 ce                	cmp    %ecx,%esi
 922:	74 4c                	je     970 <malloc+0xf0>
        p->s.size -= nunits;
 924:	29 f1                	sub    %esi,%ecx
 926:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 929:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 92c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 92f:	89 15 c4 10 00 00    	mov    %edx,0x10c4
}
 935:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 938:	83 c0 08             	add    $0x8,%eax
}
 93b:	5b                   	pop    %ebx
 93c:	5e                   	pop    %esi
 93d:	5f                   	pop    %edi
 93e:	5d                   	pop    %ebp
 93f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 940:	c7 05 c4 10 00 00 c8 	movl   $0x10c8,0x10c4
 947:	10 00 00 
    base.s.size = 0;
 94a:	bf c8 10 00 00       	mov    $0x10c8,%edi
    base.s.ptr = freep = prevp = &base;
 94f:	c7 05 c8 10 00 00 c8 	movl   $0x10c8,0x10c8
 956:	10 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 959:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 95b:	c7 05 cc 10 00 00 00 	movl   $0x0,0x10cc
 962:	00 00 00 
    if(p->s.size >= nunits){
 965:	e9 42 ff ff ff       	jmp    8ac <malloc+0x2c>
 96a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 970:	8b 08                	mov    (%eax),%ecx
 972:	89 0a                	mov    %ecx,(%edx)
 974:	eb b9                	jmp    92f <malloc+0xaf>
 976:	66 90                	xchg   %ax,%ax
 978:	66 90                	xchg   %ax,%ax
 97a:	66 90                	xchg   %ax,%ax
 97c:	66 90                	xchg   %ax,%ax
 97e:	66 90                	xchg   %ax,%ax

00000980 <sgenrand>:
static int mti=N+1; /* mti==N+1 means mt[N] is not initialized */

/* initializing the array with a NONZERO seed */
void
sgenrand(unsigned long seed)
{
 980:	55                   	push   %ebp
 981:	b8 e4 10 00 00       	mov    $0x10e4,%eax
 986:	89 e5                	mov    %esp,%ebp
 988:	8b 55 08             	mov    0x8(%ebp),%edx
    /* setting initial seeds to mt[N] using         */
    /* the generator Line 25 of Table 1 in          */
    /* [KNUTH 1981, The Art of Computer Programming */
    /*    Vol. 2 (2nd Ed.), pp102]                  */
    mt[0]= seed & 0xffffffff;
 98b:	89 15 e0 10 00 00    	mov    %edx,0x10e0
    for (mti=1; mti<N; mti++)
 991:	eb 08                	jmp    99b <sgenrand+0x1b>
 993:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 997:	90                   	nop
 998:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 99b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 9a1:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 9a3:	3d 9c 1a 00 00       	cmp    $0x1a9c,%eax
 9a8:	75 ee                	jne    998 <sgenrand+0x18>
 9aa:	c7 05 a4 10 00 00 70 	movl   $0x270,0x10a4
 9b1:	02 00 00 
}
 9b4:	5d                   	pop    %ebp
 9b5:	c3                   	ret    
 9b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 9bd:	8d 76 00             	lea    0x0(%esi),%esi

000009c0 <genrand>:
{
    unsigned long y;
    static unsigned long mag01[2]={0x0, MATRIX_A};
    /* mag01[x] = x * MATRIX_A  for x=0,1 */

    if (mti >= N) { /* generate N words at one time */
 9c0:	a1 a4 10 00 00       	mov    0x10a4,%eax
 9c5:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 9ca:	7f 3d                	jg     a09 <genrand+0x49>
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];

        mti = 0;
    }
  
    y = mt[mti++];
 9cc:	8b 0c 85 e0 10 00 00 	mov    0x10e0(,%eax,4),%ecx
 9d3:	8d 50 01             	lea    0x1(%eax),%edx
 9d6:	89 15 a4 10 00 00    	mov    %edx,0x10a4
    y ^= TEMPERING_SHIFT_U(y);
 9dc:	89 ca                	mov    %ecx,%edx
 9de:	c1 ea 0b             	shr    $0xb,%edx
 9e1:	31 ca                	xor    %ecx,%edx
    y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
 9e3:	89 d0                	mov    %edx,%eax
 9e5:	c1 e0 07             	shl    $0x7,%eax
 9e8:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
 9ed:	31 d0                	xor    %edx,%eax
    y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
 9ef:	89 c2                	mov    %eax,%edx
 9f1:	c1 e2 0f             	shl    $0xf,%edx
 9f4:	81 e2 00 00 c6 ef    	and    $0xefc60000,%edx
 9fa:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_L(y);
 9fc:	89 d0                	mov    %edx,%eax
 9fe:	c1 e8 12             	shr    $0x12,%eax
 a01:	31 d0                	xor    %edx,%eax

    // Strip off uppermost bit because we want a long,
    // not an unsigned long
    return y & RAND_MAX;
 a03:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
 a08:	c3                   	ret    
        if (mti == N+1)   /* if sgenrand() has not been called, */
 a09:	3d 71 02 00 00       	cmp    $0x271,%eax
 a0e:	0f 84 d4 00 00 00    	je     ae8 <genrand+0x128>
    mt[0]= seed & 0xffffffff;
 a14:	31 c0                	xor    %eax,%eax
 a16:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a1d:	8d 76 00             	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 a20:	8b 0c 85 e0 10 00 00 	mov    0x10e0(,%eax,4),%ecx
 a27:	83 c0 01             	add    $0x1,%eax
 a2a:	8b 14 85 e0 10 00 00 	mov    0x10e0(,%eax,4),%edx
 a31:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 a37:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 a3d:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1];
 a3f:	89 d1                	mov    %edx,%ecx
 a41:	83 e2 01             	and    $0x1,%edx
 a44:	d1 e9                	shr    %ecx
 a46:	33 0c 85 10 17 00 00 	xor    0x1710(,%eax,4),%ecx
 a4d:	33 0c 95 74 0d 00 00 	xor    0xd74(,%edx,4),%ecx
 a54:	89 0c 85 dc 10 00 00 	mov    %ecx,0x10dc(,%eax,4)
        for (kk=0;kk<N-M;kk++) {
 a5b:	3d e3 00 00 00       	cmp    $0xe3,%eax
 a60:	75 be                	jne    a20 <genrand+0x60>
 a62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 a68:	8b 0c 85 e0 10 00 00 	mov    0x10e0(,%eax,4),%ecx
 a6f:	83 c0 01             	add    $0x1,%eax
 a72:	8b 14 85 e0 10 00 00 	mov    0x10e0(,%eax,4),%edx
 a79:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 a7f:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 a85:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1];
 a87:	89 d1                	mov    %edx,%ecx
 a89:	83 e2 01             	and    $0x1,%edx
 a8c:	d1 e9                	shr    %ecx
 a8e:	33 0c 85 50 0d 00 00 	xor    0xd50(,%eax,4),%ecx
 a95:	33 0c 95 74 0d 00 00 	xor    0xd74(,%edx,4),%ecx
 a9c:	89 0c 85 dc 10 00 00 	mov    %ecx,0x10dc(,%eax,4)
        for (;kk<N-1;kk++) {
 aa3:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 aa8:	75 be                	jne    a68 <genrand+0xa8>
        y = (mt[N-1]&UPPER_MASK)|(mt[0]&LOWER_MASK);
 aaa:	8b 0d e0 10 00 00    	mov    0x10e0,%ecx
 ab0:	a1 9c 1a 00 00       	mov    0x1a9c,%eax
 ab5:	89 ca                	mov    %ecx,%edx
 ab7:	25 00 00 00 80       	and    $0x80000000,%eax
 abc:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 ac2:	09 d0                	or     %edx,%eax
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];
 ac4:	89 c2                	mov    %eax,%edx
 ac6:	83 e0 01             	and    $0x1,%eax
 ac9:	d1 ea                	shr    %edx
 acb:	33 15 10 17 00 00    	xor    0x1710,%edx
 ad1:	33 14 85 74 0d 00 00 	xor    0xd74(,%eax,4),%edx
 ad8:	89 15 9c 1a 00 00    	mov    %edx,0x1a9c
 ade:	ba 01 00 00 00       	mov    $0x1,%edx
 ae3:	e9 ee fe ff ff       	jmp    9d6 <genrand+0x16>
    mt[0]= seed & 0xffffffff;
 ae8:	b8 e4 10 00 00       	mov    $0x10e4,%eax
 aed:	b9 9c 1a 00 00       	mov    $0x1a9c,%ecx
 af2:	ba 05 11 00 00       	mov    $0x1105,%edx
 af7:	c7 05 e0 10 00 00 05 	movl   $0x1105,0x10e0
 afe:	11 00 00 
    for (mti=1; mti<N; mti++)
 b01:	eb 08                	jmp    b0b <genrand+0x14b>
 b03:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b07:	90                   	nop
 b08:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 b0b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 b11:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 b13:	39 c1                	cmp    %eax,%ecx
 b15:	75 f1                	jne    b08 <genrand+0x148>
 b17:	e9 f8 fe ff ff       	jmp    a14 <genrand+0x54>
 b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b20 <random_at_most>:

// Assumes 0 <= max <= RAND_MAX
// Returns in the half-open interval [0, max]
long random_at_most(long max) {
 b20:	55                   	push   %ebp
  unsigned long
    // max <= RAND_MAX < ULONG_MAX, so this is okay.
    num_bins = (unsigned long) max + 1,
    num_rand = (unsigned long) RAND_MAX + 1,
    bin_size = num_rand / num_bins,
 b21:	31 d2                	xor    %edx,%edx
long random_at_most(long max) {
 b23:	89 e5                	mov    %esp,%ebp
 b25:	56                   	push   %esi
    num_bins = (unsigned long) max + 1,
 b26:	8b 45 08             	mov    0x8(%ebp),%eax
long random_at_most(long max) {
 b29:	53                   	push   %ebx
    bin_size = num_rand / num_bins,
 b2a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    num_bins = (unsigned long) max + 1,
 b2f:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 b32:	89 d8                	mov    %ebx,%eax
 b34:	f7 f1                	div    %ecx
 b36:	89 c6                	mov    %eax,%esi
  long x;
  do {
   x = genrand();
  }
  // This is carefully written not to overflow
  while (num_rand - defect <= (unsigned long)x);
 b38:	29 d3                	sub    %edx,%ebx
 b3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   x = genrand();
 b40:	e8 7b fe ff ff       	call   9c0 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 b45:	39 d8                	cmp    %ebx,%eax
 b47:	73 f7                	jae    b40 <random_at_most+0x20>

  // Truncated division is intentional
  return x/bin_size;
 b49:	31 d2                	xor    %edx,%edx
}
 b4b:	5b                   	pop    %ebx
  return x/bin_size;
 b4c:	f7 f6                	div    %esi
}
 b4e:	5e                   	pop    %esi
 b4f:	5d                   	pop    %ebp
 b50:	c3                   	ret    
 b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 b5f:	90                   	nop

00000b60 <randomrange>:

int randomrange(int low, int high){
 b60:	55                   	push   %ebp
 b61:	89 e5                	mov    %esp,%ebp
 b63:	57                   	push   %edi
 b64:	56                   	push   %esi
 b65:	53                   	push   %ebx
 b66:	83 ec 0c             	sub    $0xc,%esp
 b69:	8b 75 08             	mov    0x8(%ebp),%esi
 b6c:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(high<low){
 b6f:	39 f0                	cmp    %esi,%eax
 b71:	7d 06                	jge    b79 <randomrange+0x19>
 b73:	89 f2                	mov    %esi,%edx
 b75:	89 c6                	mov    %eax,%esi
 b77:	89 d0                	mov    %edx,%eax
    int temp=high;
    high=low;
    low=temp;
  }
  int val = random_at_most(high-low) + low;
 b79:	29 f0                	sub    %esi,%eax
    bin_size = num_rand / num_bins,
 b7b:	bb 00 00 00 80       	mov    $0x80000000,%ebx
 b80:	31 d2                	xor    %edx,%edx
    num_bins = (unsigned long) max + 1,
 b82:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 b85:	89 d8                	mov    %ebx,%eax
 b87:	f7 f1                	div    %ecx
 b89:	89 c7                	mov    %eax,%edi
  while (num_rand - defect <= (unsigned long)x);
 b8b:	29 d3                	sub    %edx,%ebx
 b8d:	8d 76 00             	lea    0x0(%esi),%esi
   x = genrand();
 b90:	e8 2b fe ff ff       	call   9c0 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 b95:	39 d8                	cmp    %ebx,%eax
 b97:	73 f7                	jae    b90 <randomrange+0x30>
  return x/bin_size;
 b99:	31 d2                	xor    %edx,%edx
  return val;
}
 b9b:	83 c4 0c             	add    $0xc,%esp
  return x/bin_size;
 b9e:	f7 f7                	div    %edi
}
 ba0:	5b                   	pop    %ebx
  int val = random_at_most(high-low) + low;
 ba1:	01 f0                	add    %esi,%eax
}
 ba3:	5e                   	pop    %esi
 ba4:	5f                   	pop    %edi
 ba5:	5d                   	pop    %ebp
 ba6:	c3                   	ret    
