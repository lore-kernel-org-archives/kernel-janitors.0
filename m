From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 09 Feb 2006 12:52:01 +0000
Subject: Re: [KJ] Correct imprecise >= comparisons
Message-Id: <1139489521.4950.10.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20018508393855639=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
In-Reply-To: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
To: kernel-janitors@vger.kernel.org

--===============20018508393855639==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

> It probably is unlikely in several cases, but that makes it all the more a
> janitorial effort ;)
> It's just "unclean" to set a variable's limit if it didn't even actually
> step beyond the limit, which makes this more or less a janitorial task.

sound more like a madochistic task to me ... :)
Anyways, i wanted to check the cache trashing stuff...


snakebyte@alice:~$ cat test.c
#define rdtscl(low) \
             __asm__ __volatile__ ("rdtsc" : "=a" (low) : : "edx")
int main(int argc, char **argv ) {
        int a,b,i;
        i = 3;

        rdtscl(a);
        if (i>=3)
                i = 3;

        rdtscl(b);
        printf("i>=3 : %d\n", b-a);

        rdtscl(a);
        if(i>3)
                i = 3;
        rdtscl(b);

        printf("i>3 : %d\n", b-a);

}
snakebyte@alice:~$ gcc test.c
snakebyte@alice:~$ ./a.out
i>=3 : 11
i>3 : 28

seems the >= actually performs faster on my athlon xp...

on a non xp athlon i get this:
i>=3 : 11
i>3 : 31

since the asm output seems pretty good, i it seems the jump wastes 
more cycles :(

if (i>=3) case:
0x080483b7 <main+35>:   rdtsc
0x080483b9 <main+37>:   mov    %eax,0xfffffffc(%ebp)
0x080483bc <main+40>:   cmpl   $0x2,0xfffffff4(%ebp)
0x080483c0 <main+44>:   jle    0x80483c9 <main+53>
0x080483c2 <main+46>:   movl   $0x3,0xfffffff4(%ebp)
0x080483c9 <main+53>:   rdtsc

if (i>3) case:
0x080483e6 <main+82>:   rdtsc
0x080483e8 <main+84>:   mov    %eax,0xfffffffc(%ebp)
0x080483eb <main+87>:   cmpl   $0x3,0xfffffff4(%ebp)
0x080483ef <main+91>:   jle    0x80483f8 <main+100>
0x080483f1 <main+93>:   movl   $0x3,0xfffffff4(%ebp)
0x080483f8 <main+100>:  rdtsc

good i also checked an intel box :) my centrino gives the following:

i>=3 : 66
i>3 : 47

and a friends amd64

i >= 3 : 8
i>3 : 22

here the i>3 is faster... seems we need a macro for this stuff, which we
can change for each processor type ;-)

Greetings, Eric


--===============20018508393855639==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20018508393855639==--
