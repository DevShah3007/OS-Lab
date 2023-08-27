
_cpuProcTester:     file format elf32-i386


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
  22:	e8 79 03 00 00       	call   3a0 <atoi>

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
  56:	51                   	push   %ecx
  57:	51                   	push   %ecx
  58:	68 18 0b 00 00       	push   $0xb18
  5d:	6a 01                	push   $0x1
  5f:	e8 5c 05 00 00       	call   5c0 <printf>
		exit();
  64:	e8 aa 03 00 00       	call   413 <exit>
	int burst_times[n];
  69:	25 ff 0f 00 00       	and    $0xfff,%eax
  6e:	29 c4                	sub    %eax,%esp
  70:	85 c0                	test   %eax,%eax
  72:	74 05                	je     79 <main+0x79>
  74:	83 4c 04 fc 00       	orl    $0x0,-0x4(%esp,%eax,1)
  79:	89 e7                	mov    %esp,%edi

	for(int i=0;i<n;i++){
  7b:	85 db                	test   %ebx,%ebx
  7d:	0f 8e e5 00 00 00    	jle    168 <main+0x168>
  83:	31 d2                	xor    %edx,%edx
		burst_times[i] = randomrange(1,1000);
  85:	83 ec 08             	sub    $0x8,%esp
  88:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  8b:	68 e8 03 00 00       	push   $0x3e8
  90:	6a 01                	push   $0x1
  92:	e8 39 0a 00 00       	call   ad0 <randomrange>
  97:	8b 55 d4             	mov    -0x2c(%ebp),%edx
	for(int i=0;i<n;i++){
  9a:	83 c4 10             	add    $0x10,%esp
		burst_times[i] = randomrange(1,1000);
  9d:	89 04 97             	mov    %eax,(%edi,%edx,4)
	for(int i=0;i<n;i++){
  a0:	89 d6                	mov    %edx,%esi
  a2:	8d 52 01             	lea    0x1(%edx),%edx
  a5:	39 d3                	cmp    %edx,%ebx
  a7:	75 dc                	jne    85 <main+0x85>
	}

	printf(1, "\tPID \t Type \t Burst Time \t Context Switches\n");
  a9:	53                   	push   %ebx
  aa:	53                   	push   %ebx
  ab:	68 b4 0b 00 00       	push   $0xbb4
  b0:	6a 01                	push   $0x1
  b2:	e8 09 05 00 00       	call   5c0 <printf>
	printf(1, "\t___ \t ____ \t __________ \t ________________\n\n");
  b7:	58                   	pop    %eax
  b8:	5a                   	pop    %edx
  b9:	68 e4 0b 00 00       	push   $0xbe4
  be:	6a 01                	push   $0x1
  c0:	e8 fb 04 00 00       	call   5c0 <printf>
  c5:	83 c4 10             	add    $0x10,%esp
  c8:	31 d2                	xor    %edx,%edx
  ca:	eb 0d                	jmp    d9 <main+0xd9>
	for(int i=0;i<n;i++){
  cc:	8d 42 01             	lea    0x1(%edx),%eax
  cf:	39 f2                	cmp    %esi,%edx
  d1:	0f 84 b0 00 00 00    	je     187 <main+0x187>
  d7:	89 c2                	mov    %eax,%edx
  d9:	89 55 d4             	mov    %edx,-0x2c(%ebp)
		if(!fork()){
  dc:	e8 2a 03 00 00       	call   40b <fork>
  e1:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  e4:	85 c0                	test   %eax,%eax
  e6:	89 c3                	mov    %eax,%ebx
  e8:	75 e2                	jne    cc <main+0xcc>

			// CPU Bound process
			set_burst_time(burst_times[i]);
  ea:	83 ec 0c             	sub    $0xc,%esp
  ed:	ff 34 97             	push   (%edi,%edx,4)

			int it=0;
			for(int j=0;j<100;j++){
  f0:	31 f6                	xor    %esi,%esi
			set_burst_time(burst_times[i]);
  f2:	e8 f4 03 00 00       	call   4eb <set_burst_time>
  f7:	83 c4 10             	add    $0x10,%esp
  fa:	b9 40 42 0f 00       	mov    $0xf4240,%ecx
				for(int k=0;k<1000000;k++){
  ff:	89 f0                	mov    %esi,%eax
 101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
					if((j+k)%2)it++;
 108:	8d 53 01             	lea    0x1(%ebx),%edx
 10b:	83 eb 01             	sub    $0x1,%ebx
 10e:	a8 01                	test   $0x1,%al
 110:	0f 45 da             	cmovne %edx,%ebx
				for(int k=0;k<1000000;k++){
 113:	83 c0 01             	add    $0x1,%eax
 116:	39 c1                	cmp    %eax,%ecx
 118:	75 ee                	jne    108 <main+0x108>
			for(int j=0;j<100;j++){
 11a:	83 c6 01             	add    $0x1,%esi
 11d:	83 c1 01             	add    $0x1,%ecx
 120:	83 fe 64             	cmp    $0x64,%esi
 123:	75 da                	jne    ff <main+0xff>
				}
			}
			useless+=it;
			
			struct processInfo info;
			getCurrentInfo(&info);
 125:	83 ec 0c             	sub    $0xc,%esp
 128:	8d 45 dc             	lea    -0x24(%ebp),%eax
			useless+=it;
 12b:	01 1d c0 0f 00 00    	add    %ebx,0xfc0
			getCurrentInfo(&info);
 131:	50                   	push   %eax
 132:	e8 c4 03 00 00       	call   4fb <getCurrentInfo>
			int bt = get_burst_time();
 137:	e8 b7 03 00 00       	call   4f3 <get_burst_time>
			if(bt<10)
				printf(1, "\t%d \t CPU         %d                  %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 13c:	8b 75 e4             	mov    -0x1c(%ebp),%esi
			if(bt<10)
 13f:	83 c4 10             	add    $0x10,%esp
			int bt = get_burst_time();
 142:	89 c3                	mov    %eax,%ebx
			if(bt<10)
 144:	83 f8 09             	cmp    $0x9,%eax
 147:	7f 54                	jg     19d <main+0x19d>
				printf(1, "\t%d \t CPU         %d                  %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 149:	e8 b5 03 00 00       	call   503 <getCurrentPID>
 14e:	83 ec 0c             	sub    $0xc,%esp
 151:	56                   	push   %esi
 152:	53                   	push   %ebx
 153:	50                   	push   %eax
 154:	68 5c 0b 00 00       	push   $0xb5c
 159:	6a 01                	push   $0x1
 15b:	e8 60 04 00 00       	call   5c0 <printf>
 160:	83 c4 20             	add    $0x20,%esp
			else
				printf(1, "\t%d \t CPU         %d                 %d\n", getCurrentPID(), bt, info.numberContextSwitches);
			exit();
 163:	e8 ab 02 00 00       	call   413 <exit>
	printf(1, "\tPID \t Type \t Burst Time \t Context Switches\n");
 168:	50                   	push   %eax
 169:	50                   	push   %eax
 16a:	68 b4 0b 00 00       	push   $0xbb4
 16f:	6a 01                	push   $0x1
 171:	e8 4a 04 00 00       	call   5c0 <printf>
	printf(1, "\t___ \t ____ \t __________ \t ________________\n\n");
 176:	5a                   	pop    %edx
 177:	59                   	pop    %ecx
 178:	68 e4 0b 00 00       	push   $0xbe4
 17d:	6a 01                	push   $0x1
 17f:	e8 3c 04 00 00       	call   5c0 <printf>
 184:	83 c4 10             	add    $0x10,%esp


		}
	}

	while(wait()!=-1);
 187:	e8 8f 02 00 00       	call   41b <wait>
 18c:	83 f8 ff             	cmp    $0xffffffff,%eax
 18f:	74 d2                	je     163 <main+0x163>
 191:	e8 85 02 00 00       	call   41b <wait>
 196:	83 f8 ff             	cmp    $0xffffffff,%eax
 199:	75 ec                	jne    187 <main+0x187>
 19b:	eb c6                	jmp    163 <main+0x163>
				printf(1, "\t%d \t CPU         %d                 %d\n", getCurrentPID(), bt, info.numberContextSwitches);
 19d:	e8 61 03 00 00       	call   503 <getCurrentPID>
 1a2:	83 ec 0c             	sub    $0xc,%esp
 1a5:	56                   	push   %esi
 1a6:	53                   	push   %ebx
 1a7:	50                   	push   %eax
 1a8:	68 88 0b 00 00       	push   $0xb88
 1ad:	6a 01                	push   $0x1
 1af:	e8 0c 04 00 00       	call   5c0 <printf>
 1b4:	83 c4 20             	add    $0x20,%esp
 1b7:	eb aa                	jmp    163 <main+0x163>
 1b9:	66 90                	xchg   %ax,%ax
 1bb:	66 90                	xchg   %ax,%ax
 1bd:	66 90                	xchg   %ax,%ax
 1bf:	90                   	nop

000001c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1c1:	31 c0                	xor    %eax,%eax
{
 1c3:	89 e5                	mov    %esp,%ebp
 1c5:	53                   	push   %ebx
 1c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1d7:	83 c0 01             	add    $0x1,%eax
 1da:	84 d2                	test   %dl,%dl
 1dc:	75 f2                	jne    1d0 <strcpy+0x10>
    ;
  return os;
}
 1de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e1:	89 c8                	mov    %ecx,%eax
 1e3:	c9                   	leave  
 1e4:	c3                   	ret    
 1e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	53                   	push   %ebx
 1f4:	8b 55 08             	mov    0x8(%ebp),%edx
 1f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1fa:	0f b6 02             	movzbl (%edx),%eax
 1fd:	84 c0                	test   %al,%al
 1ff:	75 17                	jne    218 <strcmp+0x28>
 201:	eb 3a                	jmp    23d <strcmp+0x4d>
 203:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 207:	90                   	nop
 208:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 20c:	83 c2 01             	add    $0x1,%edx
 20f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 212:	84 c0                	test   %al,%al
 214:	74 1a                	je     230 <strcmp+0x40>
    p++, q++;
 216:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 218:	0f b6 19             	movzbl (%ecx),%ebx
 21b:	38 c3                	cmp    %al,%bl
 21d:	74 e9                	je     208 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 21f:	29 d8                	sub    %ebx,%eax
}
 221:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 224:	c9                   	leave  
 225:	c3                   	ret    
 226:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 230:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 234:	31 c0                	xor    %eax,%eax
 236:	29 d8                	sub    %ebx,%eax
}
 238:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 23b:	c9                   	leave  
 23c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 23d:	0f b6 19             	movzbl (%ecx),%ebx
 240:	31 c0                	xor    %eax,%eax
 242:	eb db                	jmp    21f <strcmp+0x2f>
 244:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 24f:	90                   	nop

00000250 <strlen>:

uint
strlen(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 256:	80 3a 00             	cmpb   $0x0,(%edx)
 259:	74 15                	je     270 <strlen+0x20>
 25b:	31 c0                	xor    %eax,%eax
 25d:	8d 76 00             	lea    0x0(%esi),%esi
 260:	83 c0 01             	add    $0x1,%eax
 263:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 267:	89 c1                	mov    %eax,%ecx
 269:	75 f5                	jne    260 <strlen+0x10>
    ;
  return n;
}
 26b:	89 c8                	mov    %ecx,%eax
 26d:	5d                   	pop    %ebp
 26e:	c3                   	ret    
 26f:	90                   	nop
  for(n = 0; s[n]; n++)
 270:	31 c9                	xor    %ecx,%ecx
}
 272:	5d                   	pop    %ebp
 273:	89 c8                	mov    %ecx,%eax
 275:	c3                   	ret    
 276:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27d:	8d 76 00             	lea    0x0(%esi),%esi

00000280 <memset>:

void*
memset(void *dst, int c, uint n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 287:	8b 4d 10             	mov    0x10(%ebp),%ecx
 28a:	8b 45 0c             	mov    0xc(%ebp),%eax
 28d:	89 d7                	mov    %edx,%edi
 28f:	fc                   	cld    
 290:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 292:	8b 7d fc             	mov    -0x4(%ebp),%edi
 295:	89 d0                	mov    %edx,%eax
 297:	c9                   	leave  
 298:	c3                   	ret    
 299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002a0 <strchr>:

char*
strchr(const char *s, char c)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2aa:	0f b6 10             	movzbl (%eax),%edx
 2ad:	84 d2                	test   %dl,%dl
 2af:	75 12                	jne    2c3 <strchr+0x23>
 2b1:	eb 1d                	jmp    2d0 <strchr+0x30>
 2b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2b7:	90                   	nop
 2b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2bc:	83 c0 01             	add    $0x1,%eax
 2bf:	84 d2                	test   %dl,%dl
 2c1:	74 0d                	je     2d0 <strchr+0x30>
    if(*s == c)
 2c3:	38 d1                	cmp    %dl,%cl
 2c5:	75 f1                	jne    2b8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2c7:	5d                   	pop    %ebp
 2c8:	c3                   	ret    
 2c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2d0:	31 c0                	xor    %eax,%eax
}
 2d2:	5d                   	pop    %ebp
 2d3:	c3                   	ret    
 2d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop

000002e0 <gets>:

char*
gets(char *buf, int max)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2e5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2e8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2e9:	31 db                	xor    %ebx,%ebx
{
 2eb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2ee:	eb 27                	jmp    317 <gets+0x37>
    cc = read(0, &c, 1);
 2f0:	83 ec 04             	sub    $0x4,%esp
 2f3:	6a 01                	push   $0x1
 2f5:	57                   	push   %edi
 2f6:	6a 00                	push   $0x0
 2f8:	e8 2e 01 00 00       	call   42b <read>
    if(cc < 1)
 2fd:	83 c4 10             	add    $0x10,%esp
 300:	85 c0                	test   %eax,%eax
 302:	7e 1d                	jle    321 <gets+0x41>
      break;
    buf[i++] = c;
 304:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 308:	8b 55 08             	mov    0x8(%ebp),%edx
 30b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 30f:	3c 0a                	cmp    $0xa,%al
 311:	74 1d                	je     330 <gets+0x50>
 313:	3c 0d                	cmp    $0xd,%al
 315:	74 19                	je     330 <gets+0x50>
  for(i=0; i+1 < max; ){
 317:	89 de                	mov    %ebx,%esi
 319:	83 c3 01             	add    $0x1,%ebx
 31c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 31f:	7c cf                	jl     2f0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 321:	8b 45 08             	mov    0x8(%ebp),%eax
 324:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 328:	8d 65 f4             	lea    -0xc(%ebp),%esp
 32b:	5b                   	pop    %ebx
 32c:	5e                   	pop    %esi
 32d:	5f                   	pop    %edi
 32e:	5d                   	pop    %ebp
 32f:	c3                   	ret    
  buf[i] = '\0';
 330:	8b 45 08             	mov    0x8(%ebp),%eax
 333:	89 de                	mov    %ebx,%esi
 335:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 339:	8d 65 f4             	lea    -0xc(%ebp),%esp
 33c:	5b                   	pop    %ebx
 33d:	5e                   	pop    %esi
 33e:	5f                   	pop    %edi
 33f:	5d                   	pop    %ebp
 340:	c3                   	ret    
 341:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 348:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 34f:	90                   	nop

00000350 <stat>:

int
stat(const char *n, struct stat *st)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	56                   	push   %esi
 354:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 355:	83 ec 08             	sub    $0x8,%esp
 358:	6a 00                	push   $0x0
 35a:	ff 75 08             	push   0x8(%ebp)
 35d:	e8 f1 00 00 00       	call   453 <open>
  if(fd < 0)
 362:	83 c4 10             	add    $0x10,%esp
 365:	85 c0                	test   %eax,%eax
 367:	78 27                	js     390 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 369:	83 ec 08             	sub    $0x8,%esp
 36c:	ff 75 0c             	push   0xc(%ebp)
 36f:	89 c3                	mov    %eax,%ebx
 371:	50                   	push   %eax
 372:	e8 f4 00 00 00       	call   46b <fstat>
  close(fd);
 377:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 37a:	89 c6                	mov    %eax,%esi
  close(fd);
 37c:	e8 ba 00 00 00       	call   43b <close>
  return r;
 381:	83 c4 10             	add    $0x10,%esp
}
 384:	8d 65 f8             	lea    -0x8(%ebp),%esp
 387:	89 f0                	mov    %esi,%eax
 389:	5b                   	pop    %ebx
 38a:	5e                   	pop    %esi
 38b:	5d                   	pop    %ebp
 38c:	c3                   	ret    
 38d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 390:	be ff ff ff ff       	mov    $0xffffffff,%esi
 395:	eb ed                	jmp    384 <stat+0x34>
 397:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39e:	66 90                	xchg   %ax,%ax

000003a0 <atoi>:

int
atoi(const char *s)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3a7:	0f be 02             	movsbl (%edx),%eax
 3aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3b5:	77 1e                	ja     3d5 <atoi+0x35>
 3b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3be:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3c0:	83 c2 01             	add    $0x1,%edx
 3c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3ca:	0f be 02             	movsbl (%edx),%eax
 3cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3d0:	80 fb 09             	cmp    $0x9,%bl
 3d3:	76 eb                	jbe    3c0 <atoi+0x20>
  return n;
}
 3d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3d8:	89 c8                	mov    %ecx,%eax
 3da:	c9                   	leave  
 3db:	c3                   	ret    
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	8b 45 10             	mov    0x10(%ebp),%eax
 3e7:	8b 55 08             	mov    0x8(%ebp),%edx
 3ea:	56                   	push   %esi
 3eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ee:	85 c0                	test   %eax,%eax
 3f0:	7e 13                	jle    405 <memmove+0x25>
 3f2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3f4:	89 d7                	mov    %edx,%edi
 3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 400:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 401:	39 f8                	cmp    %edi,%eax
 403:	75 fb                	jne    400 <memmove+0x20>
  return vdst;
}
 405:	5e                   	pop    %esi
 406:	89 d0                	mov    %edx,%eax
 408:	5f                   	pop    %edi
 409:	5d                   	pop    %ebp
 40a:	c3                   	ret    

0000040b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 40b:	b8 01 00 00 00       	mov    $0x1,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <exit>:
SYSCALL(exit)
 413:	b8 02 00 00 00       	mov    $0x2,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <wait>:
SYSCALL(wait)
 41b:	b8 03 00 00 00       	mov    $0x3,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <pipe>:
SYSCALL(pipe)
 423:	b8 04 00 00 00       	mov    $0x4,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <read>:
SYSCALL(read)
 42b:	b8 05 00 00 00       	mov    $0x5,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <write>:
SYSCALL(write)
 433:	b8 10 00 00 00       	mov    $0x10,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <close>:
SYSCALL(close)
 43b:	b8 15 00 00 00       	mov    $0x15,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <kill>:
SYSCALL(kill)
 443:	b8 06 00 00 00       	mov    $0x6,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <exec>:
SYSCALL(exec)
 44b:	b8 07 00 00 00       	mov    $0x7,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <open>:
SYSCALL(open)
 453:	b8 0f 00 00 00       	mov    $0xf,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <mknod>:
SYSCALL(mknod)
 45b:	b8 11 00 00 00       	mov    $0x11,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <unlink>:
SYSCALL(unlink)
 463:	b8 12 00 00 00       	mov    $0x12,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <fstat>:
SYSCALL(fstat)
 46b:	b8 08 00 00 00       	mov    $0x8,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <link>:
SYSCALL(link)
 473:	b8 13 00 00 00       	mov    $0x13,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <mkdir>:
SYSCALL(mkdir)
 47b:	b8 14 00 00 00       	mov    $0x14,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <chdir>:
SYSCALL(chdir)
 483:	b8 09 00 00 00       	mov    $0x9,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <dup>:
SYSCALL(dup)
 48b:	b8 0a 00 00 00       	mov    $0xa,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <getpid>:
SYSCALL(getpid)
 493:	b8 0b 00 00 00       	mov    $0xb,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <sbrk>:
SYSCALL(sbrk)
 49b:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <sleep>:
SYSCALL(sleep)
 4a3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <uptime>:
SYSCALL(uptime)
 4ab:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <thread_create>:
SYSCALL(thread_create)
 4b3:	b8 16 00 00 00       	mov    $0x16,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <thread_join>:
SYSCALL(thread_join)
 4bb:	b8 18 00 00 00       	mov    $0x18,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <thread_exit>:
SYSCALL(thread_exit)
 4c3:	b8 17 00 00 00       	mov    $0x17,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <draw>:
SYSCALL(draw)
 4cb:	b8 19 00 00 00       	mov    $0x19,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <getNumProc>:
SYSCALL(getNumProc)
 4d3:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <getMaxPid>:
SYSCALL(getMaxPid)
 4db:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <getProcInfo>:
SYSCALL(getProcInfo)
 4e3:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <set_burst_time>:
SYSCALL(set_burst_time)
 4eb:	b8 1d 00 00 00       	mov    $0x1d,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <get_burst_time>:
SYSCALL(get_burst_time)
 4f3:	b8 1e 00 00 00       	mov    $0x1e,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <getCurrentInfo>:
SYSCALL(getCurrentInfo)
 4fb:	b8 1f 00 00 00       	mov    $0x1f,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <getCurrentPID>:
SYSCALL(getCurrentPID)
 503:	b8 20 00 00 00       	mov    $0x20,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    
 50b:	66 90                	xchg   %ax,%ax
 50d:	66 90                	xchg   %ax,%ax
 50f:	90                   	nop

00000510 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	56                   	push   %esi
 515:	53                   	push   %ebx
 516:	83 ec 3c             	sub    $0x3c,%esp
 519:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 51c:	89 d1                	mov    %edx,%ecx
{
 51e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 521:	85 d2                	test   %edx,%edx
 523:	0f 89 7f 00 00 00    	jns    5a8 <printint+0x98>
 529:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 52d:	74 79                	je     5a8 <printint+0x98>
    neg = 1;
 52f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 536:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 538:	31 db                	xor    %ebx,%ebx
 53a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 53d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 540:	89 c8                	mov    %ecx,%eax
 542:	31 d2                	xor    %edx,%edx
 544:	89 cf                	mov    %ecx,%edi
 546:	f7 75 c4             	divl   -0x3c(%ebp)
 549:	0f b6 92 74 0c 00 00 	movzbl 0xc74(%edx),%edx
 550:	89 45 c0             	mov    %eax,-0x40(%ebp)
 553:	89 d8                	mov    %ebx,%eax
 555:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 558:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 55b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 55e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 561:	76 dd                	jbe    540 <printint+0x30>
  if(neg)
 563:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 566:	85 c9                	test   %ecx,%ecx
 568:	74 0c                	je     576 <printint+0x66>
    buf[i++] = '-';
 56a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 56f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 571:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 576:	8b 7d b8             	mov    -0x48(%ebp),%edi
 579:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 57d:	eb 07                	jmp    586 <printint+0x76>
 57f:	90                   	nop
    putc(fd, buf[i]);
 580:	0f b6 13             	movzbl (%ebx),%edx
 583:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 586:	83 ec 04             	sub    $0x4,%esp
 589:	88 55 d7             	mov    %dl,-0x29(%ebp)
 58c:	6a 01                	push   $0x1
 58e:	56                   	push   %esi
 58f:	57                   	push   %edi
 590:	e8 9e fe ff ff       	call   433 <write>
  while(--i >= 0)
 595:	83 c4 10             	add    $0x10,%esp
 598:	39 de                	cmp    %ebx,%esi
 59a:	75 e4                	jne    580 <printint+0x70>
}
 59c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 59f:	5b                   	pop    %ebx
 5a0:	5e                   	pop    %esi
 5a1:	5f                   	pop    %edi
 5a2:	5d                   	pop    %ebp
 5a3:	c3                   	ret    
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5a8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5af:	eb 87                	jmp    538 <printint+0x28>
 5b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bf:	90                   	nop

000005c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5cc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5cf:	0f b6 13             	movzbl (%ebx),%edx
 5d2:	84 d2                	test   %dl,%dl
 5d4:	74 6a                	je     640 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5d6:	8d 45 10             	lea    0x10(%ebp),%eax
 5d9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5dc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5df:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 5e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5e4:	eb 36                	jmp    61c <printf+0x5c>
 5e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
 5f0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5f3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5f8:	83 f8 25             	cmp    $0x25,%eax
 5fb:	74 15                	je     612 <printf+0x52>
  write(fd, &c, 1);
 5fd:	83 ec 04             	sub    $0x4,%esp
 600:	88 55 e7             	mov    %dl,-0x19(%ebp)
 603:	6a 01                	push   $0x1
 605:	57                   	push   %edi
 606:	56                   	push   %esi
 607:	e8 27 fe ff ff       	call   433 <write>
 60c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 60f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 612:	0f b6 13             	movzbl (%ebx),%edx
 615:	83 c3 01             	add    $0x1,%ebx
 618:	84 d2                	test   %dl,%dl
 61a:	74 24                	je     640 <printf+0x80>
    c = fmt[i] & 0xff;
 61c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 61f:	85 c9                	test   %ecx,%ecx
 621:	74 cd                	je     5f0 <printf+0x30>
      }
    } else if(state == '%'){
 623:	83 f9 25             	cmp    $0x25,%ecx
 626:	75 ea                	jne    612 <printf+0x52>
      if(c == 'd'){
 628:	83 f8 25             	cmp    $0x25,%eax
 62b:	0f 84 07 01 00 00    	je     738 <printf+0x178>
 631:	83 e8 63             	sub    $0x63,%eax
 634:	83 f8 15             	cmp    $0x15,%eax
 637:	77 17                	ja     650 <printf+0x90>
 639:	ff 24 85 1c 0c 00 00 	jmp    *0xc1c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 640:	8d 65 f4             	lea    -0xc(%ebp),%esp
 643:	5b                   	pop    %ebx
 644:	5e                   	pop    %esi
 645:	5f                   	pop    %edi
 646:	5d                   	pop    %ebp
 647:	c3                   	ret    
 648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
 653:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 656:	6a 01                	push   $0x1
 658:	57                   	push   %edi
 659:	56                   	push   %esi
 65a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 65e:	e8 d0 fd ff ff       	call   433 <write>
        putc(fd, c);
 663:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 667:	83 c4 0c             	add    $0xc,%esp
 66a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 66d:	6a 01                	push   $0x1
 66f:	57                   	push   %edi
 670:	56                   	push   %esi
 671:	e8 bd fd ff ff       	call   433 <write>
        putc(fd, c);
 676:	83 c4 10             	add    $0x10,%esp
      state = 0;
 679:	31 c9                	xor    %ecx,%ecx
 67b:	eb 95                	jmp    612 <printf+0x52>
 67d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	b9 10 00 00 00       	mov    $0x10,%ecx
 688:	6a 00                	push   $0x0
 68a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 68d:	8b 10                	mov    (%eax),%edx
 68f:	89 f0                	mov    %esi,%eax
 691:	e8 7a fe ff ff       	call   510 <printint>
        ap++;
 696:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 69a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 69d:	31 c9                	xor    %ecx,%ecx
 69f:	e9 6e ff ff ff       	jmp    612 <printf+0x52>
 6a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6ab:	8b 10                	mov    (%eax),%edx
        ap++;
 6ad:	83 c0 04             	add    $0x4,%eax
 6b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6b3:	85 d2                	test   %edx,%edx
 6b5:	0f 84 8d 00 00 00    	je     748 <printf+0x188>
        while(*s != 0){
 6bb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 6be:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 6c0:	84 c0                	test   %al,%al
 6c2:	0f 84 4a ff ff ff    	je     612 <printf+0x52>
 6c8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6cb:	89 d3                	mov    %edx,%ebx
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6d0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6d3:	83 c3 01             	add    $0x1,%ebx
 6d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6d9:	6a 01                	push   $0x1
 6db:	57                   	push   %edi
 6dc:	56                   	push   %esi
 6dd:	e8 51 fd ff ff       	call   433 <write>
        while(*s != 0){
 6e2:	0f b6 03             	movzbl (%ebx),%eax
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	84 c0                	test   %al,%al
 6ea:	75 e4                	jne    6d0 <printf+0x110>
      state = 0;
 6ec:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 6ef:	31 c9                	xor    %ecx,%ecx
 6f1:	e9 1c ff ff ff       	jmp    612 <printf+0x52>
 6f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 700:	83 ec 0c             	sub    $0xc,%esp
 703:	b9 0a 00 00 00       	mov    $0xa,%ecx
 708:	6a 01                	push   $0x1
 70a:	e9 7b ff ff ff       	jmp    68a <printf+0xca>
 70f:	90                   	nop
        putc(fd, *ap);
 710:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 713:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 716:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 718:	6a 01                	push   $0x1
 71a:	57                   	push   %edi
 71b:	56                   	push   %esi
        putc(fd, *ap);
 71c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 71f:	e8 0f fd ff ff       	call   433 <write>
        ap++;
 724:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 728:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72b:	31 c9                	xor    %ecx,%ecx
 72d:	e9 e0 fe ff ff       	jmp    612 <printf+0x52>
 732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 738:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 73b:	83 ec 04             	sub    $0x4,%esp
 73e:	e9 2a ff ff ff       	jmp    66d <printf+0xad>
 743:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 747:	90                   	nop
          s = "(null)";
 748:	ba 12 0c 00 00       	mov    $0xc12,%edx
        while(*s != 0){
 74d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 750:	b8 28 00 00 00       	mov    $0x28,%eax
 755:	89 d3                	mov    %edx,%ebx
 757:	e9 74 ff ff ff       	jmp    6d0 <printf+0x110>
 75c:	66 90                	xchg   %ax,%ax
 75e:	66 90                	xchg   %ax,%ax

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	a1 c4 0f 00 00       	mov    0xfc4,%eax
{
 766:	89 e5                	mov    %esp,%ebp
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	53                   	push   %ebx
 76b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 76e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 778:	89 c2                	mov    %eax,%edx
 77a:	8b 00                	mov    (%eax),%eax
 77c:	39 ca                	cmp    %ecx,%edx
 77e:	73 30                	jae    7b0 <free+0x50>
 780:	39 c1                	cmp    %eax,%ecx
 782:	72 04                	jb     788 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 784:	39 c2                	cmp    %eax,%edx
 786:	72 f0                	jb     778 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 788:	8b 73 fc             	mov    -0x4(%ebx),%esi
 78b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78e:	39 f8                	cmp    %edi,%eax
 790:	74 30                	je     7c2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 792:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 795:	8b 42 04             	mov    0x4(%edx),%eax
 798:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 79b:	39 f1                	cmp    %esi,%ecx
 79d:	74 3a                	je     7d9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 79f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7a1:	5b                   	pop    %ebx
  freep = p;
 7a2:	89 15 c4 0f 00 00    	mov    %edx,0xfc4
}
 7a8:	5e                   	pop    %esi
 7a9:	5f                   	pop    %edi
 7aa:	5d                   	pop    %ebp
 7ab:	c3                   	ret    
 7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b0:	39 c2                	cmp    %eax,%edx
 7b2:	72 c4                	jb     778 <free+0x18>
 7b4:	39 c1                	cmp    %eax,%ecx
 7b6:	73 c0                	jae    778 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7be:	39 f8                	cmp    %edi,%eax
 7c0:	75 d0                	jne    792 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7c2:	03 70 04             	add    0x4(%eax),%esi
 7c5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c8:	8b 02                	mov    (%edx),%eax
 7ca:	8b 00                	mov    (%eax),%eax
 7cc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7cf:	8b 42 04             	mov    0x4(%edx),%eax
 7d2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7d5:	39 f1                	cmp    %esi,%ecx
 7d7:	75 c6                	jne    79f <free+0x3f>
    p->s.size += bp->s.size;
 7d9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7dc:	89 15 c4 0f 00 00    	mov    %edx,0xfc4
    p->s.size += bp->s.size;
 7e2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7e5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7e8:	89 0a                	mov    %ecx,(%edx)
}
 7ea:	5b                   	pop    %ebx
 7eb:	5e                   	pop    %esi
 7ec:	5f                   	pop    %edi
 7ed:	5d                   	pop    %ebp
 7ee:	c3                   	ret    
 7ef:	90                   	nop

000007f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7fc:	8b 3d c4 0f 00 00    	mov    0xfc4,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 802:	8d 70 07             	lea    0x7(%eax),%esi
 805:	c1 ee 03             	shr    $0x3,%esi
 808:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 80b:	85 ff                	test   %edi,%edi
 80d:	0f 84 9d 00 00 00    	je     8b0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 813:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 815:	8b 4a 04             	mov    0x4(%edx),%ecx
 818:	39 f1                	cmp    %esi,%ecx
 81a:	73 6a                	jae    886 <malloc+0x96>
 81c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 821:	39 de                	cmp    %ebx,%esi
 823:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 826:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 82d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 830:	eb 17                	jmp    849 <malloc+0x59>
 832:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 838:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 83a:	8b 48 04             	mov    0x4(%eax),%ecx
 83d:	39 f1                	cmp    %esi,%ecx
 83f:	73 4f                	jae    890 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 841:	8b 3d c4 0f 00 00    	mov    0xfc4,%edi
 847:	89 c2                	mov    %eax,%edx
 849:	39 d7                	cmp    %edx,%edi
 84b:	75 eb                	jne    838 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 84d:	83 ec 0c             	sub    $0xc,%esp
 850:	ff 75 e4             	push   -0x1c(%ebp)
 853:	e8 43 fc ff ff       	call   49b <sbrk>
  if(p == (char*)-1)
 858:	83 c4 10             	add    $0x10,%esp
 85b:	83 f8 ff             	cmp    $0xffffffff,%eax
 85e:	74 1c                	je     87c <malloc+0x8c>
  hp->s.size = nu;
 860:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 863:	83 ec 0c             	sub    $0xc,%esp
 866:	83 c0 08             	add    $0x8,%eax
 869:	50                   	push   %eax
 86a:	e8 f1 fe ff ff       	call   760 <free>
  return freep;
 86f:	8b 15 c4 0f 00 00    	mov    0xfc4,%edx
      if((p = morecore(nunits)) == 0)
 875:	83 c4 10             	add    $0x10,%esp
 878:	85 d2                	test   %edx,%edx
 87a:	75 bc                	jne    838 <malloc+0x48>
        return 0;
  }
}
 87c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 87f:	31 c0                	xor    %eax,%eax
}
 881:	5b                   	pop    %ebx
 882:	5e                   	pop    %esi
 883:	5f                   	pop    %edi
 884:	5d                   	pop    %ebp
 885:	c3                   	ret    
    if(p->s.size >= nunits){
 886:	89 d0                	mov    %edx,%eax
 888:	89 fa                	mov    %edi,%edx
 88a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 890:	39 ce                	cmp    %ecx,%esi
 892:	74 4c                	je     8e0 <malloc+0xf0>
        p->s.size -= nunits;
 894:	29 f1                	sub    %esi,%ecx
 896:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 899:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 89c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 89f:	89 15 c4 0f 00 00    	mov    %edx,0xfc4
}
 8a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8a8:	83 c0 08             	add    $0x8,%eax
}
 8ab:	5b                   	pop    %ebx
 8ac:	5e                   	pop    %esi
 8ad:	5f                   	pop    %edi
 8ae:	5d                   	pop    %ebp
 8af:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8b0:	c7 05 c4 0f 00 00 c8 	movl   $0xfc8,0xfc4
 8b7:	0f 00 00 
    base.s.size = 0;
 8ba:	bf c8 0f 00 00       	mov    $0xfc8,%edi
    base.s.ptr = freep = prevp = &base;
 8bf:	c7 05 c8 0f 00 00 c8 	movl   $0xfc8,0xfc8
 8c6:	0f 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8cb:	c7 05 cc 0f 00 00 00 	movl   $0x0,0xfcc
 8d2:	00 00 00 
    if(p->s.size >= nunits){
 8d5:	e9 42 ff ff ff       	jmp    81c <malloc+0x2c>
 8da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8e0:	8b 08                	mov    (%eax),%ecx
 8e2:	89 0a                	mov    %ecx,(%edx)
 8e4:	eb b9                	jmp    89f <malloc+0xaf>
 8e6:	66 90                	xchg   %ax,%ax
 8e8:	66 90                	xchg   %ax,%ax
 8ea:	66 90                	xchg   %ax,%ax
 8ec:	66 90                	xchg   %ax,%ax
 8ee:	66 90                	xchg   %ax,%ax

000008f0 <sgenrand>:
static int mti=N+1; /* mti==N+1 means mt[N] is not initialized */

/* initializing the array with a NONZERO seed */
void
sgenrand(unsigned long seed)
{
 8f0:	55                   	push   %ebp
 8f1:	b8 e4 0f 00 00       	mov    $0xfe4,%eax
 8f6:	89 e5                	mov    %esp,%ebp
 8f8:	8b 55 08             	mov    0x8(%ebp),%edx
    /* setting initial seeds to mt[N] using         */
    /* the generator Line 25 of Table 1 in          */
    /* [KNUTH 1981, The Art of Computer Programming */
    /*    Vol. 2 (2nd Ed.), pp102]                  */
    mt[0]= seed & 0xffffffff;
 8fb:	89 15 e0 0f 00 00    	mov    %edx,0xfe0
    for (mti=1; mti<N; mti++)
 901:	eb 08                	jmp    90b <sgenrand+0x1b>
 903:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 907:	90                   	nop
 908:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 90b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 911:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 913:	3d 9c 19 00 00       	cmp    $0x199c,%eax
 918:	75 ee                	jne    908 <sgenrand+0x18>
 91a:	c7 05 b8 0f 00 00 70 	movl   $0x270,0xfb8
 921:	02 00 00 
}
 924:	5d                   	pop    %ebp
 925:	c3                   	ret    
 926:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 92d:	8d 76 00             	lea    0x0(%esi),%esi

00000930 <genrand>:
{
    unsigned long y;
    static unsigned long mag01[2]={0x0, MATRIX_A};
    /* mag01[x] = x * MATRIX_A  for x=0,1 */

    if (mti >= N) { /* generate N words at one time */
 930:	a1 b8 0f 00 00       	mov    0xfb8,%eax
 935:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 93a:	7f 3d                	jg     979 <genrand+0x49>
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];

        mti = 0;
    }
  
    y = mt[mti++];
 93c:	8b 0c 85 e0 0f 00 00 	mov    0xfe0(,%eax,4),%ecx
 943:	8d 50 01             	lea    0x1(%eax),%edx
 946:	89 15 b8 0f 00 00    	mov    %edx,0xfb8
    y ^= TEMPERING_SHIFT_U(y);
 94c:	89 ca                	mov    %ecx,%edx
 94e:	c1 ea 0b             	shr    $0xb,%edx
 951:	31 ca                	xor    %ecx,%edx
    y ^= TEMPERING_SHIFT_S(y) & TEMPERING_MASK_B;
 953:	89 d0                	mov    %edx,%eax
 955:	c1 e0 07             	shl    $0x7,%eax
 958:	25 80 56 2c 9d       	and    $0x9d2c5680,%eax
 95d:	31 d0                	xor    %edx,%eax
    y ^= TEMPERING_SHIFT_T(y) & TEMPERING_MASK_C;
 95f:	89 c2                	mov    %eax,%edx
 961:	c1 e2 0f             	shl    $0xf,%edx
 964:	81 e2 00 00 c6 ef    	and    $0xefc60000,%edx
 96a:	31 c2                	xor    %eax,%edx
    y ^= TEMPERING_SHIFT_L(y);
 96c:	89 d0                	mov    %edx,%eax
 96e:	c1 e8 12             	shr    $0x12,%eax
 971:	31 d0                	xor    %edx,%eax

    // Strip off uppermost bit because we want a long,
    // not an unsigned long
    return y & RAND_MAX;
 973:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
 978:	c3                   	ret    
        if (mti == N+1)   /* if sgenrand() has not been called, */
 979:	3d 71 02 00 00       	cmp    $0x271,%eax
 97e:	0f 84 d4 00 00 00    	je     a58 <genrand+0x128>
    mt[0]= seed & 0xffffffff;
 984:	31 c0                	xor    %eax,%eax
 986:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 98d:	8d 76 00             	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 990:	8b 0c 85 e0 0f 00 00 	mov    0xfe0(,%eax,4),%ecx
 997:	83 c0 01             	add    $0x1,%eax
 99a:	8b 14 85 e0 0f 00 00 	mov    0xfe0(,%eax,4),%edx
 9a1:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 9a7:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 9ad:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+M] ^ (y >> 1) ^ mag01[y & 0x1];
 9af:	89 d1                	mov    %edx,%ecx
 9b1:	83 e2 01             	and    $0x1,%edx
 9b4:	d1 e9                	shr    %ecx
 9b6:	33 0c 85 10 16 00 00 	xor    0x1610(,%eax,4),%ecx
 9bd:	33 0c 95 88 0c 00 00 	xor    0xc88(,%edx,4),%ecx
 9c4:	89 0c 85 dc 0f 00 00 	mov    %ecx,0xfdc(,%eax,4)
        for (kk=0;kk<N-M;kk++) {
 9cb:	3d e3 00 00 00       	cmp    $0xe3,%eax
 9d0:	75 be                	jne    990 <genrand+0x60>
 9d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            y = (mt[kk]&UPPER_MASK)|(mt[kk+1]&LOWER_MASK);
 9d8:	8b 0c 85 e0 0f 00 00 	mov    0xfe0(,%eax,4),%ecx
 9df:	83 c0 01             	add    $0x1,%eax
 9e2:	8b 14 85 e0 0f 00 00 	mov    0xfe0(,%eax,4),%edx
 9e9:	81 e1 00 00 00 80    	and    $0x80000000,%ecx
 9ef:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 9f5:	09 ca                	or     %ecx,%edx
            mt[kk] = mt[kk+(M-N)] ^ (y >> 1) ^ mag01[y & 0x1];
 9f7:	89 d1                	mov    %edx,%ecx
 9f9:	83 e2 01             	and    $0x1,%edx
 9fc:	d1 e9                	shr    %ecx
 9fe:	33 0c 85 50 0c 00 00 	xor    0xc50(,%eax,4),%ecx
 a05:	33 0c 95 88 0c 00 00 	xor    0xc88(,%edx,4),%ecx
 a0c:	89 0c 85 dc 0f 00 00 	mov    %ecx,0xfdc(,%eax,4)
        for (;kk<N-1;kk++) {
 a13:	3d 6f 02 00 00       	cmp    $0x26f,%eax
 a18:	75 be                	jne    9d8 <genrand+0xa8>
        y = (mt[N-1]&UPPER_MASK)|(mt[0]&LOWER_MASK);
 a1a:	8b 0d e0 0f 00 00    	mov    0xfe0,%ecx
 a20:	a1 9c 19 00 00       	mov    0x199c,%eax
 a25:	89 ca                	mov    %ecx,%edx
 a27:	25 00 00 00 80       	and    $0x80000000,%eax
 a2c:	81 e2 ff ff ff 7f    	and    $0x7fffffff,%edx
 a32:	09 d0                	or     %edx,%eax
        mt[N-1] = mt[M-1] ^ (y >> 1) ^ mag01[y & 0x1];
 a34:	89 c2                	mov    %eax,%edx
 a36:	83 e0 01             	and    $0x1,%eax
 a39:	d1 ea                	shr    %edx
 a3b:	33 15 10 16 00 00    	xor    0x1610,%edx
 a41:	33 14 85 88 0c 00 00 	xor    0xc88(,%eax,4),%edx
 a48:	89 15 9c 19 00 00    	mov    %edx,0x199c
 a4e:	ba 01 00 00 00       	mov    $0x1,%edx
 a53:	e9 ee fe ff ff       	jmp    946 <genrand+0x16>
    mt[0]= seed & 0xffffffff;
 a58:	b8 e4 0f 00 00       	mov    $0xfe4,%eax
 a5d:	b9 9c 19 00 00       	mov    $0x199c,%ecx
 a62:	ba 05 11 00 00       	mov    $0x1105,%edx
 a67:	c7 05 e0 0f 00 00 05 	movl   $0x1105,0xfe0
 a6e:	11 00 00 
    for (mti=1; mti<N; mti++)
 a71:	eb 08                	jmp    a7b <genrand+0x14b>
 a73:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 a77:	90                   	nop
 a78:	83 c0 04             	add    $0x4,%eax
        mt[mti] = (69069 * mt[mti-1]) & 0xffffffff;
 a7b:	69 d2 cd 0d 01 00    	imul   $0x10dcd,%edx,%edx
 a81:	89 10                	mov    %edx,(%eax)
    for (mti=1; mti<N; mti++)
 a83:	39 c1                	cmp    %eax,%ecx
 a85:	75 f1                	jne    a78 <genrand+0x148>
 a87:	e9 f8 fe ff ff       	jmp    984 <genrand+0x54>
 a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a90 <random_at_most>:

// Assumes 0 <= max <= RAND_MAX
// Returns in the half-open interval [0, max]
long random_at_most(long max) {
 a90:	55                   	push   %ebp
  unsigned long
    // max <= RAND_MAX < ULONG_MAX, so this is okay.
    num_bins = (unsigned long) max + 1,
    num_rand = (unsigned long) RAND_MAX + 1,
    bin_size = num_rand / num_bins,
 a91:	31 d2                	xor    %edx,%edx
long random_at_most(long max) {
 a93:	89 e5                	mov    %esp,%ebp
 a95:	56                   	push   %esi
    num_bins = (unsigned long) max + 1,
 a96:	8b 45 08             	mov    0x8(%ebp),%eax
long random_at_most(long max) {
 a99:	53                   	push   %ebx
    bin_size = num_rand / num_bins,
 a9a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    num_bins = (unsigned long) max + 1,
 a9f:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 aa2:	89 d8                	mov    %ebx,%eax
 aa4:	f7 f1                	div    %ecx
 aa6:	89 c6                	mov    %eax,%esi
  long x;
  do {
   x = genrand();
  }
  // This is carefully written not to overflow
  while (num_rand - defect <= (unsigned long)x);
 aa8:	29 d3                	sub    %edx,%ebx
 aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
   x = genrand();
 ab0:	e8 7b fe ff ff       	call   930 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 ab5:	39 d8                	cmp    %ebx,%eax
 ab7:	73 f7                	jae    ab0 <random_at_most+0x20>

  // Truncated division is intentional
  return x/bin_size;
 ab9:	31 d2                	xor    %edx,%edx
}
 abb:	5b                   	pop    %ebx
  return x/bin_size;
 abc:	f7 f6                	div    %esi
}
 abe:	5e                   	pop    %esi
 abf:	5d                   	pop    %ebp
 ac0:	c3                   	ret    
 ac1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ac8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 acf:	90                   	nop

00000ad0 <randomrange>:

int randomrange(int low, int high){
 ad0:	55                   	push   %ebp
 ad1:	89 e5                	mov    %esp,%ebp
 ad3:	57                   	push   %edi
 ad4:	56                   	push   %esi
 ad5:	53                   	push   %ebx
 ad6:	83 ec 0c             	sub    $0xc,%esp
 ad9:	8b 75 08             	mov    0x8(%ebp),%esi
 adc:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(high<low){
 adf:	39 f0                	cmp    %esi,%eax
 ae1:	7d 06                	jge    ae9 <randomrange+0x19>
 ae3:	89 f2                	mov    %esi,%edx
 ae5:	89 c6                	mov    %eax,%esi
 ae7:	89 d0                	mov    %edx,%eax
    int temp=high;
    high=low;
    low=temp;
  }
  int val = random_at_most(high-low) + low;
 ae9:	29 f0                	sub    %esi,%eax
    bin_size = num_rand / num_bins,
 aeb:	bb 00 00 00 80       	mov    $0x80000000,%ebx
 af0:	31 d2                	xor    %edx,%edx
    num_bins = (unsigned long) max + 1,
 af2:	8d 48 01             	lea    0x1(%eax),%ecx
    bin_size = num_rand / num_bins,
 af5:	89 d8                	mov    %ebx,%eax
 af7:	f7 f1                	div    %ecx
 af9:	89 c7                	mov    %eax,%edi
  while (num_rand - defect <= (unsigned long)x);
 afb:	29 d3                	sub    %edx,%ebx
 afd:	8d 76 00             	lea    0x0(%esi),%esi
   x = genrand();
 b00:	e8 2b fe ff ff       	call   930 <genrand>
  while (num_rand - defect <= (unsigned long)x);
 b05:	39 d8                	cmp    %ebx,%eax
 b07:	73 f7                	jae    b00 <randomrange+0x30>
  return x/bin_size;
 b09:	31 d2                	xor    %edx,%edx
  return val;
}
 b0b:	83 c4 0c             	add    $0xc,%esp
  return x/bin_size;
 b0e:	f7 f7                	div    %edi
}
 b10:	5b                   	pop    %ebx
  int val = random_at_most(high-low) + low;
 b11:	01 f0                	add    %esi,%eax
}
 b13:	5e                   	pop    %esi
 b14:	5f                   	pop    %edi
 b15:	5d                   	pop    %ebp
 b16:	c3                   	ret    
