From: "Suresh Jayaraman" <sjayaraman@novell.com>
Date: Wed, 04 Jul 2007 05:02:47 +0000
Subject: Re: [KJ] [PATCH] cris/arch-v32: Remove unnecessary cast of
Message-Id: <468B774F020000F40000ABFE@lucius.provo.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <46857CC8020000F40000AA4A@lucius.provo.novell.com>
In-Reply-To: <46857CC8020000F40000AA4A@lucius.provo.novell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2007-07-03 at 12:32 +0000, walter harms wrote:
> 
> Suresh Jayaraman wrote:
> > Remove unnecessary cast of return value of kmalloc() in
> > cris/arch-v32/mm/intmem.c
> > 
> > Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
> > ---
> > 
> > diff --git a/arch/cris/arch-v32/mm/intmem.c b/arch/cris/arch-v32/mm/intmem.c
> > index 41ee7f7..d1e0bf4 100644
> > --- a/arch/cris/arch-v32/mm/intmem.c
> > +++ b/arch/cris/arch-v32/mm/intmem.c
> > @@ -27,8 +27,8 @@ static void crisv32_intmem_init(void)
> >  {
> >  	static int initiated = 0;
> >  	if (!initiated) {
> > -		struct intmem_allocation* alloc > > -		  (struct intmem_allocation*)kmalloc(sizeof *alloc, GFP_KERNEL);
> > +		struct intmem_allocation *alloc = kmalloc(sizeof *alloc,
> > +							  GFP_KERNEL);
> 
> IMHO every kmalloc() should check if it worked at all
> 
> 	if (!alloc) {
> 	  kprintf("no memory panic !\n");
> 	   return;

>           }

If we all agree that kmalloc() checks should be done everwhere, this
probably can be a separate Kernel Janitor task.

-- 
Suresh Jayaraman


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
