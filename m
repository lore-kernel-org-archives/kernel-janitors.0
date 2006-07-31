From: Domen Puncer <domen@coderock.org>
Date: Mon, 31 Jul 2006 10:28:40 +0000
Subject: Re: [KJ] [PATCH] drivers/block/acsi.c: Add KERN_* to printk
Message-Id: <20060731102840.GG4969@nd47.coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060731002238.GA10973@chello.nl>
In-Reply-To: <20060731002238.GA10973@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 31/07/06 11:57 +0200, h.vanberkum@chello.nl wrote:
> 
> > 
> > van: Domen Puncer <domen@coderock.org>
> > datum: 2006/07/31 Mon AM 07:38:16 CEST
> > aan: Richard <h.vanberkum@chello.nl>
> > cc: kj <kernel-janitors@lists.osdl.org>
> > onderwerp: Re: [KJ] [PATCH] drivers/block/acsi.c: Add KERN_* to printk statements
> > 
> > On 31/07/06 02:22 +0200, Richard wrote:
> > ...
> > >  #ifdef DEBUG
> > > -		printk("ACSI: skipping 0xff status byte\n" );
> > > +		printk( KERN_DEBUG "ACSI: skipping 0xff status byte\n" );
> > >  #endif
> > 
> > This looks like a perfect example of where pr_debug can be used.
> > 
> 
> Is this prefered above the situation above? 

Yes. It's shorter, no ugly ifdefs, and does the same thing.

> 
> > >  #ifdef DEBUG_DETECT
> > > -		printk("target %d lun %d: timeout\n", aip->target, aip->lun);
> > > +		printk( KERN_DEBUG "target %d lun %d: timeout\n", aip->target, aip->lun);
> > >  #endif
> > 
> > Unfortunately this one doesn't fit so much with pr_debug :-(
> 
> Unless the intent is to have more levels of debuging, you can change that to #ifdef DEBUG etc. 

It looks like there are more debugging levels.


	Domen
> 
> Richard
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
