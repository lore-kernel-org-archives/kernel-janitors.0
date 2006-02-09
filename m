From: Andreas Mohr <andi@rhlx01.fht-esslingen.de>
Date: Thu, 09 Feb 2006 13:45:54 +0000
Subject: Re: [KJ] Correct imprecise >= comparisons
Message-Id: <20060209134554.GA29507@rhlx01.fht-esslingen.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44899528707624825=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
In-Reply-To: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
To: kernel-janitors@vger.kernel.org

--===============44899528707624825==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Feb 09, 2006 at 01:52:01PM +0100, Eric Sesterhenn wrote:
> hi,
> 
> > It probably is unlikely in several cases, but that makes it all the more a
> > janitorial effort ;)
> > It's just "unclean" to set a variable's limit if it didn't even actually
> > step beyond the limit, which makes this more or less a janitorial task.
> 
> sound more like a madochistic task to me ... :)
> Anyways, i wanted to check the cache trashing stuff...
> 
> 
> snakebyte@alice:~$ cat test.c
> #define rdtscl(low) \
>              __asm__ __volatile__ ("rdtsc" : "=a" (low) : : "edx")
> int main(int argc, char **argv ) {
>         int a,b,i;
>         i = 3;
> 
>         rdtscl(a);
>         if (i>=3)
>                 i = 3;
> 
>         rdtscl(b);
>         printf("i>=3 : %d\n", b-a);
> 
>         rdtscl(a);
>         if(i>3)
>                 i = 3;
>         rdtscl(b);
> 
>         printf("i>3 : %d\n", b-a);
> 
> }

Hmm, 11/28 ops, 11/31, 66/47, 8/22.
Sure sounds like one hell of a fluctuation. Would this code wait for
the memory write to hit the hardware? In that case the fluctuation
would be justified. Oh, and this means that the two operations are
inter-dependent! (the second most likely needs to wait for the first one
to get read back!). Better use "j" for a second test...

Plus, are you sure that there was no compiler optimization going on?
The
  i = 3;
if (i >= 3)
  i = 3;
case is very dangerous, I'd say. Better to fetch the value 3 from calling
another function that returns 3. Otherwise the compiler might be very tempted
to optimize the whole thing away.

> here the i>3 is faster... seems we need a macro for this stuff, which we
> can change for each processor type ;-)

Problem is that then one could easily object that this should have been
properly decided by the compiler itself already...
(and that objection would be very valid, I think)

Andreas Mohr

--===============44899528707624825==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44899528707624825==--
