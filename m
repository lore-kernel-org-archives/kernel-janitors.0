From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Feb 2014 19:43:40 +0000
Subject: Re: [DRBD-user] [patch -resend] drbd: fix resync_dump_detail() output
Message-Id: <20140217194340.GF26776@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120608123128.GA18293@elgon.mountain>
 <20120608185008.GC8030@soda.linbit>
In-Reply-To: <20120608185008.GC8030@soda.linbit>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Ellenberg <drbd-dev@lists.linbit.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, drbd-user@lists.linbit.com

On Fri, Jun 08, 2012 at 08:50:08PM +0200, Lars Ellenberg wrote:
> On Fri, Jun 08, 2012 at 03:31:28PM +0300, Dan Carpenter wrote:
> > The tests here aren't correct.  It should be doing a shift before doing
> > the bitwise AND.  (bme->flags & BME_NO_WRITES) is always false and
> > (bme->flags & BME_LOCKED) checks for BME_NO_WRITES instead of checking
> > for locked.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Ack.
> 
> > ---
> > I sent this to the drbd-user list in March, but never recieved a
> > response.
> 
> Sorry, seems to have been lost :-(
> 

Still lost in 2014.  :P  Who is supposed to take this patch?  I assume
it's someone on the drbd list?

regards,
dan carpenter

> 	Lars
> 
> > diff --git a/drivers/block/drbd/drbd_proc.c b/drivers/block/drbd/drbd_proc.c
> > index 2959cdf..ffe1ee4 100644
> > --- a/drivers/block/drbd/drbd_proc.c
> > +++ b/drivers/block/drbd/drbd_proc.c
> > @@ -187,8 +187,10 @@ static void resync_dump_detail(struct seq_file *seq, struct lc_element *e)
> >  	struct bm_extent *bme = lc_entry(e, struct bm_extent, lce);
> >  
> >  	seq_printf(seq, "%5d %s %s\n", bme->rs_left,
> > -		   bme->flags & BME_NO_WRITES ? "NO_WRITES" : "---------",
> > -		   bme->flags & BME_LOCKED ? "LOCKED" : "------"
> > +		   test_bit(BME_NO_WRITES, &bme->flags) ?
> > +			"NO_WRITES" : "---------",
> > +		   test_bit(BME_LOCKED, &bme->flags) ?
> > +			"LOCKED" : "------"
> >  		   );
> >  }
> 
> -- 
> : Lars Ellenberg
> : LINBIT | Your Way to High Availability
> : DRBD/HA support and consulting http://www.linbit.com
