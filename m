From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 10 May 2007 16:40:08 +0000
Subject: Re: [KJ] [KJ PATCH] Replacing alloc_pages(gfp, 0) with alloc_page(gfp)
Message-Id: <Pine.LNX.4.64.0705101237550.10986@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178711839.2280.21.camel@shani-win>
In-Reply-To: <1178711839.2280.21.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 10 May 2007, walter harms wrote:

>
> hi Shani,
> i do not know if that is useful because
> alloc_page(mask) is actualy a macro for alloc_pages(mask,0)
>
> re,
>  wh

there's nothing wrong with that cleanup since that would appear to be
the very reason "alloc_page(mask)" exists -- to act as a short form.
however, i'd try to do this as a large-scale change rather than a
single instance at a time, if you want to take care of all of them.

rday

p.s.  this is a change i documented quite some time ago:

http://fsdev.net/wiki/index.php?title=Memory_allocation
>
> Shani Moideen wrote:
> > Hi,
> >
> > Replacing alloc_pages(gfp,0) with alloc_page(gfp) in
> > arch/i386/mm/pageattr.c.
> >
> > Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
> > ----
> >
> > diff --git a/arch/i386/mm/pageattr.c b/arch/i386/mm/pageattr.c
> > index 412ebbd..12f7f14 100644
> > --- a/arch/i386/mm/pageattr.c
> > +++ b/arch/i386/mm/pageattr.c
> > @@ -45,7 +45,7 @@ static struct page *split_large_page(unsigned long address, pgprot_t prot,
> >  	pte_t *pbase;
> >
> >  	spin_unlock_irq(&cpa_lock);
> > -	base = alloc_pages(GFP_KERNEL, 0);
> > +	base = alloc_page(GFP_KERNEL);
> >  	spin_lock_irq(&cpa_lock);
> >  	if (!base)
> >  		return NULL;
> >
> >
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
>

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
