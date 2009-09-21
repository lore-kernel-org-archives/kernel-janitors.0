From: "Dr. David Alan Gilbert" <linux@treblig.org>
Date: Mon, 21 Sep 2009 17:34:00 +0000
Subject: char* -> char[] replacement
Message-Id: <20090921173400.GA1942@gallifrey>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,
  I noticed the apparently simple entry in the TODO list saying:

     From: Jeff Garzik

     1) The string form

        [const] char *foo = "blah";
           creates two variables in the final assembly output, a
           static string, and a char pointer to the static string.
           The alternate string form

        [const] char foo[] = "blah";
           is better because it declares a single variable.

        For variables marked __initdata, the "*foo" form causes only
        the pointer, not the string itself, to be dropped from the
        kernel image, which is a bug. Using the "foo[]" form with
        regular 'ole local variables also makes the assembly shorter.

A quick grep found some targets - but I'm not sure that there is
really a benefit; I was comparing the size of the .o's before and
after the change and noticed that on x86-64 gcc 4.4.1
(ubuntu karmic alpha 4:4.4.1-1ubuntu2)
the two different forms cause wildly different optimisation, and
the [] form causes gcc to build the string using instructions.

e.g. with a little standalone test:

int main(int argc, char* argv[]){
    /*char *frob="hello";*/
    char frob[]="hello";
    printf("%s\n", frob);
}

produces code that looks like:

	movl	$1819043176, (%rsp)
	movw	$111, 4(%rsp)
	call	__printf_chk

Doing the same trick to some of the error messages in ntfs/inode.c
I can see the same thing is happening for fairly large strings - e.g.

0000000000000280 <ntfs_truncate>:
     280:	55                   	push   %rbp
     281:	49 ba 20 20 4c 65 61 	mov    $0x6e697661654c2020,%r10
     288:	76 69 6e 
     28b:	48 89 e5             	mov    %rsp,%rbp
     28e:	49 b9 67 20 66 69 6c 	mov    $0x6c20656c69662067,%r9
     295:	65 20 6c 
     298:	41 57                	push   %r15
     29a:	49 b8 65 6e 67 74 68 	mov    $0x756f206874676e65,%r8
     2a1:	20 6f 75 
     2a4:	41 56                	push   %r14
     2a6:	48 be 74 20 6f 66 20 	mov    $0x6e797320666f2074,%rsi
     2ad:	73 79 6e 
     2b0:	41 55                	push   %r13
     2b2:	48 b9 63 20 77 69 74 	mov    $0x6920687469772063,%rcx
     2b9:	68 20 69 
     2bc:	41 54                	push   %r12
     2be:	53                   	push   %rbx
     2bf:	48 89 fb             	mov    %rdi,%rbx
     2c2:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
     2c9:	48 81 eb 08 01 00 00 	sub    $0x108,%rbx
     2d0:	48 89 bd 38 ff ff ff 	mov    %rdi,-0xc8(%rbp)
     2d7:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
     2de:	00 00 
     2e0:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
     2e4:	31 c0                	xor    %eax,%eax
     2e6:	48 8b 97 28 ff ff ff 	mov    -0xd8(%rdi),%rdx
     2ed:	48 89 75 a8          	mov    %rsi,-0x58(%rbp)
     2f1:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
     2f8:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
     2fc:	4c 89 55 90          	mov    %r10,-0x70(%rbp)
     300:	4c 89 4d 98          	mov    %r9,-0x68(%rbp)
     304:	4c 89 45 a0          	mov    %r8,-0x60(%rbp)
     308:	c7 45 b8 5f 73 69 7a 	movl   $0x7a69735f,-0x48(%rbp)
     30f:	66 c7 45 bc 65 2e    	movw   $0x2e65,-0x44(%rbp)
     315:	c6 45 be 00          	movb   $0x0,-0x42(%rbp)
     319:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx
     320:	4c 8b 47 40          	mov    0x40(%rdi),%r8
     324:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
     32b:	be 43 09 00 00       	mov    $0x943,%esi
     330:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
     337:	e8 00 00 00 00       	callq  33c <ntfs_truncate+0xbc>

as opposed to the old:

0000000000000280 <ntfs_truncate>:
     280:	55                   	push   %rbp
     281:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx
     288:	48 89 e5             	mov    %rsp,%rbp
     28b:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
     292:	41 57                	push   %r15
     294:	be 43 09 00 00       	mov    $0x943,%esi
     299:	41 56                	push   %r14
     29b:	41 55                	push   %r13
     29d:	41 54                	push   %r12
     29f:	53                   	push   %rbx
     2a0:	48 89 fb             	mov    %rdi,%rbx
     2a3:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
     2aa:	48 81 eb 08 01 00 00 	sub    $0x108,%rbx
     2b1:	48 89 bd 78 ff ff ff 	mov    %rdi,-0x88(%rbp)
     2b8:	48 8b 87 28 ff ff ff 	mov    -0xd8(%rdi),%rax
     2bf:	48 89 45 88          	mov    %rax,-0x78(%rbp)
     2c3:	31 c0                	xor    %eax,%eax
     2c5:	4c 8b 47 40          	mov    0x40(%rdi),%r8
     2c9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
     2d0:	e8 00 00 00 00       	callq  2d5 <ntfs_truncate+0x55>

This seems pretty mad - is there a good reason gcc is doing this?
Because from that it would seem that changing to char*'s to char[] is
currently growing code rather than shrinking it. Is gcc just being overly
enthusiastic for instructions with large constants?

On related questions, looking through some of the constant strings
in the code does find some oddities:

1) fs/ntfs/inode.c:2331 
  static const char *es = "  Leaving inconsistent metadata.  Unmount and run "
                "chkdsk.";

  is a bit weird (especially since some functions declare a local es).

2) security/tomoyo/common.c:tomoyo_print_double_path_acl
   I'm missing why the atmark1 and atmark2 exist at all.


Dave
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    | Running GNU/Linux on Alpha,68K| Happy  \ 
\ gro.gilbert @ treblig.org | MIPS,x86,ARM,SPARC,PPC & HPPA | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
