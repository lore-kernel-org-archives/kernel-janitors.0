From: Dave Chinner <david@fromorbit.com>
Date: Wed, 01 Feb 2012 21:13:26 +0000
Subject: Re: [patch] xfs: remove an unneeded NULL check
Message-Id: <20120201211326.GU9090@dastard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120128105501.GB25092@elgon.mountain>
	<20120131225601.GQ9090@dastard>
	<20120201104500.GA13672@infradead.org>
In-Reply-To: <20120201104500.GA13672@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org, xfs@oss.sgi.com, xfs-masters@oss.sgi.com, Ben Myers <bpm@sgi.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Wed, Feb 01, 2012 at 05:45:01AM -0500, Christoph Hellwig wrote:
> On Wed, Feb 01, 2012 at 09:56:01AM +1100, Dave Chinner wrote:
> > >  	/* lock out background commit */
> > >  	down_read(&log->l_cilp->xc_ctx_lock);
> > > -	if (commit_lsn)
> > > -		*commit_lsn = log->l_cilp->xc_ctx->sequence;
> > > +	*commit_lsn = log->l_cilp->xc_ctx->sequence;
> > >  
> > >  	xlog_cil_insert_items(log, log_vector, tp->t_ticket);
> > 
> > There's a set of reviewed patches (for 3.3) that change all this
> > code. The null check might still be there, but that needs to be
> > checked.
> 
> Which series is that?  I mut have to admit I've lost track by now.

The removal of all the old log code.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
