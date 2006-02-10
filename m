From: Adrian Bunk <bunk@stusta.de>
Date: Fri, 10 Feb 2006 00:30:26 +0000
Subject: Re: [KJ] Correct imprecise >= comparisons
Message-Id: <20060210003026.GF3524@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72481753354842493=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
In-Reply-To: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
To: kernel-janitors@vger.kernel.org

--===============72481753354842493==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 10, 2006 at 09:16:36AM +1100, Darren Jenkins wrote:
> On 2/9/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> 
> > snakebyte@alice:~$ gcc test.c
> > snakebyte@alice:~$ ./a.out
> > i>=3 : 11
> > i>3 : 28
> >
> > seems the >= actually performs faster on my athlon xp...
> >
> > on a non xp athlon i get this:
> > i>=3 : 11
> > i>3 : 31
> >
> > good i also checked an intel box :) my centrino gives the following:
> >
> > i>=3 : 66
> > i>3 : 47
> >
> > and a friends amd64
> >
> > i >= 3 : 8
> > i>3 : 22
> >
> > here the i>3 is faster... seems we need a macro for this stuff, which we
> > can change for each processor type ;-)
> >
> > Greetings, Eric
> 
> Interesting
> I guess on alot of arch's doing
> 
> if (value >= max+1)
>         value = max;
> 
> might be the more efficient.
> 
> hmm will have to investigate further.

What is the purpose of all this?

With modern compilers, the general rule is to write readable C code and 
let the compiler do the rest.

Exceptions could be in real hot paths, but even in such cases there's 
the problem that tricky code performing better with today's compilers 
might perform worse with future compilers (similar to the goto tricks 
people used in the past to circumvent some compiler limitations).

> Darren J.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============72481753354842493==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72481753354842493==--
