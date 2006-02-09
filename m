From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 09 Feb 2006 14:06:34 +0000
Subject: Re: [KJ] Correct imprecise >= comparisons
Message-Id: <1139493994.5374.9.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10102657341929921=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
In-Reply-To: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
To: kernel-janitors@vger.kernel.org

--===============10102657341929921==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,
> Hmm, 11/28 ops, 11/31, 66/47, 8/22.
> Sure sounds like one hell of a fluctuation.

These were on different cpus, so this is expected. When i run it several
times on one cpu it stays constant

>  Would this code wait for
> the memory write to hit the hardware?

i guess writing an int into the memory is pretty atomic

> Plus, are you sure that there was no compiler optimization going on?
> The
>   i = 3;
> if (i >= 3)
>   i = 3;

there was compiler optimization ( kind of, but it doesnt seem to
matter ) The if (i>=3) case gets optimized to if(i>2)

0x080483bc <main+40>:   cmpl   $0x2,0xfffffff4(%ebp)

> case is very dangerous, I'd say. Better to fetch the value 3 from calling
> another function that returns 3. Otherwise the compiler might be very tempted
> to optimize the whole thing away.

I changed it a bit, so gcc -O3 doesnt compile anything away, because i
wanted to check if it can optimize this case. using gcc version 3.4.5
the assembler output stays unoptimized

#define rdtscl(low) \
	     __asm__ __volatile__ ("rdtsc" : "=a" (low) : : "edx")
int main(int argc, char **argv ) {
	int a,b,i;

	i = atoi(argv[1]);
	rdtscl(a);
	if (i>=3)
		i = 3;
	rdtscl(b);
	printf("i>=3 : %d %d\n", b-a, i);

	i = atoi(argv[1]);
	rdtscl(a);
	if(i>3)
		i = 3;
	rdtscl(b);
	printf("i>3 : %d %d\n", b-a, i);


        i = atoi(argv[1]);
        rdtscl(a);
        if (i>=3)
             i = 3;
        rdtscl(b);
        printf("i>=3 : %d %d\n", b-a, i);

}

It is still

0x080483fe <main+30>:   rdtsc
0x08048400 <main+32>:   cmp    $0x2,%ecx
0x08048403 <main+35>:   mov    %eax,%ebx
0x08048405 <main+37>:   jle    0x804840c <main+44>
0x08048407 <main+39>:   mov    $0x3,%ecx
0x0804840c <main+44>:   rdtsc

vs 

0x08048431 <main+81>:   rdtsc
0x08048433 <main+83>:   cmp    $0x3,%ecx
0x08048436 <main+86>:   mov    %eax,%ebx
0x08048438 <main+88>:   jle    0x804843f <main+95>
0x0804843a <main+90>:   mov    $0x3,%ecx
0x0804843f <main+95>:   rdtsc

> > here the i>3 is faster... seems we need a macro for this stuff, which we
> > can change for each processor type ;-)
> 
> Problem is that then one could easily object that this should have been
> properly decided by the compiler itself already...
> (and that objection would be very valid, I think)

sorry i forgot the <irony> tags :)
I created a bugzilla entry on gcc for this:
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=26196

Greetings, Eric


--===============10102657341929921==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10102657341929921==--
