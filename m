From: Dave Chinner <david@fromorbit.com>
Date: Fri, 17 May 2013 10:19:08 +0000
Subject: Re: [patch] xfs: bug widening binary "not" operation
Message-Id: <20130517101908.GS24635@dastard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130516075330.GB7494@elgon.mountain>
	<20130516230314.GH24635@dastard> <20130517063159.GO1360@mwanda>
In-Reply-To: <20130517063159.GO1360@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ben Myers <bpm@sgi.com>, Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

On Fri, May 17, 2013 at 09:31:59AM +0300, Dan Carpenter wrote:
> On Fri, May 17, 2013 at 09:03:14AM +1000, Dave Chinner wrote:
> > As it is, the static checker missed the:
> > 
> > 	rounding = max_t(uint, ....);
> > 
> > The line before the above usage. I posted a patch to fix this this
> > 2 weeks ago here:
> > 
> > http://oss.sgi.com/pipermail/xfs/2013-May/025986.html
> > 
> 
> Ah.  Grand.  There is still a problem with the max_t().  The shift
> operation will wrap before we do the cast.  It should be:

It probably looks that way, but it can't overflow as
mp->m_sb.sb_blocklog has a maximum value of 16 (i.e. 64k maximum
filesystem block size).

> 
> -	rounding = max_t(xfs_off_t, 1 << mp->m_sb.sb_blocklog, PAGE_CACHE_SIZE);
> +	rounding = max_t(xfs_off_t, 1ULL << mp->m_sb.sb_blocklog, PAGE_CACHE_SIZE);

So it is safe the way it is and this is not necessary.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
