From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 May 2014 14:35:50 +0000
Subject: Re: [patch] [XFS] indent an if statement
Message-Id: <20140521143550.GC15585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140521122746.GD23396@mwanda>
	<20140521142909.GA22281@infradead.org>
In-Reply-To: <20140521142909.GA22281@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

On Wed, May 21, 2014 at 07:29:09AM -0700, Christoph Hellwig wrote:
> On Wed, May 21, 2014 at 03:27:46PM +0300, Dan Carpenter wrote:
> > The "n += 32;" goes with the if statement on the line before so it
> > should be indented.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/fs/xfs/xfs_bit.h b/fs/xfs/xfs_bit.h
> > index f1e3c90..f685942 100644
> > --- a/fs/xfs/xfs_bit.h
> > +++ b/fs/xfs/xfs_bit.h
> > @@ -67,7 +67,7 @@ static inline int xfs_lowbit64(__uint64_t v)
> >  	} else {	/* upper bits */
> >  		w = (__uint32_t)(v >> 32);
> >  		if (w && (n = ffs(w)))
> > -		n += 32;
> > +			n += 32;
> 
> If we want to clean up this stuff let's do it properly:
> 
> 		if (w) {
> 			n = ffs(w);
> 			if (n)
> 				n += 32;
> 		}
>

Sure.  I will resend.

regards,
dan carpenter


