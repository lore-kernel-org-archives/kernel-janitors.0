From: Uli Luckas <u.luckas@road.de>
Date: Fri, 27 Jul 2007 13:17:59 +0000
Subject: Re: [PATCH 04/68] 0 -> NULL, for arch/blackfin
Message-Id: <200707271517.59770.u.luckas@road.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17116@ifs.emn.fr> <1185531824.11601.25.camel@roc-desktop>
In-Reply-To: <1185531824.11601.25.camel@roc-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>, bryan.wu@analog.com
Cc: Yoann Padioleau <padator@wanadoo.fr>, kernel-janitors@vger.kernel.org, aubrey.li@analog.com, akpm@linux-foundation.org

On Friday, 27. July 2007, Bryan Wu wrote:
> On Fri, 2007-07-27 at 11:44 +0200, Yoann Padioleau wrote:
> > When comparing a pointer, it's clearer to compare it to NULL than to 0.
> >
> > Here is an excerpt of the semantic patch:
> >
> > @@
> > expression *E;
> > @@
> >
> >   E =
> > - 0
> > + NULL
> >
> > @@
> > expression *E;
> > @@
> >
> >   E !> > - 0
> > + NULL
> >
> > Signed-off-by: Yoann Padioleau <padator@wanadoo.fr>
> > Cc: aubrey.li@analog.com
> > Cc: bryan.wu@analog.com
> > Cc: akpm@linux-foundation.org
> > ---
> >
> >  traps.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/blackfin/kernel/traps.c b/arch/blackfin/kernel/traps.c
> > index 3909f5b..691c66d 100644
> > --- a/arch/blackfin/kernel/traps.c
> > +++ b/arch/blackfin/kernel/traps.c
> > @@ -546,7 +546,7 @@ void dump_bfin_regs(struct pt_regs *fp,
> >  	}
> >
> >  	printk(KERN_EMERG "return address: [0x%p]; contents of:", retaddr);
> > -	if (retaddr != 0 && retaddr <= (void *)physical_mem_end
> > +	if (retaddr != NULL && retaddr <= (void *)physical_mem_end
> >  #if L1_CODE_LENGTH != 0
> >  	    /* FIXME: Copy the code out of L1 Instruction SRAM through dma
> >  	       memcpy.  */
>
> Why not just use " if (!E)" instead of " if (E != NULL)"?
> more readable?
>
Or even "if (E)"

Uli

-- 

------- ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing directors: Hans-Peter Constien, Hubertus von Streit
