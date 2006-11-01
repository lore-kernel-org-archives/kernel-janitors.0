From: Adrian Bunk <bunk@stusta.de>
Date: Wed, 01 Nov 2006 02:09:12 +0000
Subject: Re: [KJ] [PATCH] lib/string.c: Two if-clauses merged
Message-Id: <20061101020912.GC27968@stusta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200610281830.18748.lists-receive@programmierforen.de>
In-Reply-To: <200610281830.18748.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Oct 28, 2006 at 10:12:57PM +0400, Alexey Dobriyan wrote:
> On Sat, Oct 28, 2006 at 06:30:18PM +0200, Andi Drebes wrote:
> > The patch just deletes two lines of code and nothing else. Tested by
> > compilation.
> 
> > --- linux/lib/string.c
> > +++ patched/lib/string.c
> > @@ -43,9 +43,7 @@
> >  			c2 = *s2;
> >  			s1++;
> >  			s2++;
> > -			if (!c1)
> > -				break;
> > -			if (!c2)
> > +			if (!c1 || !c2)
> >  				break;
> 
> Hmm... There are probably thousands of places like this. And checking
> one thing at a time is in many cases better than one long check.

The generated code is in both cases the same.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
