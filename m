From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 20 Dec 2006 21:27:29 +0000
Subject: Re: [KJ] [RFC][PATCH] does this patch look remotely sane?
Message-Id: <Pine.LNX.4.64.0612201625480.9772@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0612201607010.6547@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0612201607010.6547@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 20 Dec 2006, Frederik Deweerdt wrote:

> On Wed, Dec 20, 2006 at 04:09:07PM -0500, Robert P. J. Day wrote:
> >
> >   followup to my previous question, if that equivalence holds, does
> > this patch look like it would make sense?
> >
> > --- a/kernel/kexec.c
> > +++ b/kernel/kexec.c
> > @@ -698,7 +698,7 @@ static struct page *kimage_alloc_page(struct kimage *image,
> >  		kimage_entry_t *old;
> >
> >  		/* Allocate a page, if we run out of memory give up */
> > -		page = kimage_alloc_pages(gfp_mask, 0);
> > +		page = kimage_alloc_page(gfp_mask);
> >  		if (!page)
> >  			return NULL;
> >  		/* If the page cannot be used file it away */
> Equivalence is limited to alloc_page, though :).

ah, quite right, i missed that.  better tighten up the regular
expression.  thanks.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
