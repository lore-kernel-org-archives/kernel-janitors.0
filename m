From: Christoph Hellwig <hch@infradead.org>
Date: Wed, 01 Feb 2012 10:45:01 +0000
Subject: Re: [patch] xfs: remove an unneeded NULL check
Message-Id: <20120201104500.GA13672@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120128105501.GB25092@elgon.mountain>
	<20120131225601.GQ9090@dastard>
In-Reply-To: <20120131225601.GQ9090@dastard>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Chinner <david@fromorbit.com>
Cc: Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org, xfs@oss.sgi.com, xfs-masters@oss.sgi.com, Ben Myers <bpm@sgi.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Wed, Feb 01, 2012 at 09:56:01AM +1100, Dave Chinner wrote:
> >  	/* lock out background commit */
> >  	down_read(&log->l_cilp->xc_ctx_lock);
> > -	if (commit_lsn)
> > -		*commit_lsn = log->l_cilp->xc_ctx->sequence;
> > +	*commit_lsn = log->l_cilp->xc_ctx->sequence;
> >  
> >  	xlog_cil_insert_items(log, log_vector, tp->t_ticket);
> 
> There's a set of reviewed patches (for 3.3) that change all this
> code. The null check might still be there, but that needs to be
> checked.

Which series is that?  I mut have to admit I've lost track by now.

