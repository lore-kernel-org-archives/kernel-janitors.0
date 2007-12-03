From: Adrian Bunk <bunk@kernel.org>
Date: Mon, 03 Dec 2007 01:18:35 +0000
Subject: Re: if(function()) BUG(); still bad?
Message-Id: <20071203011835.GQ15974@stusta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47534BC4.1020701@tiscali.nl>
In-Reply-To: <47534BC4.1020701@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Dec 02, 2007 at 05:32:22PM -0700, Matthew Wilcox wrote:
> On Mon, Dec 03, 2007 at 01:20:20AM +0100, Roel Kluin wrote:
> > for instance in a patch I saw this:
> > 
> > > +		if (__blk_end_request(rq, 0, 0))
> > > +			BUG();
> > >  		spin_unlock(q->queue_lock);
> > 
> > If it's still bad, what should the fix be? (I'll write a script and post
> > patches)
> 
> This one should not be converted to a BUG_ON.  We always want to call
> __blk_end_request(), whether we have CONFIG_BUG or not.  This case just
> wants to test the return value.

It can be converted, the empty BUG_ON() in include/asm-generic/bug.h 
handles it with

  #define BUG_ON(condition) do { if (condition) ; } while(0)


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

