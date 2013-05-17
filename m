From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 May 2013 06:31:59 +0000
Subject: Re: [patch] xfs: bug widening binary "not" operation
Message-Id: <20130517063159.GO1360@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130516075330.GB7494@elgon.mountain>
	<20130516230314.GH24635@dastard>
In-Reply-To: <20130516230314.GH24635@dastard>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Chinner <david@fromorbit.com>
Cc: Ben Myers <bpm@sgi.com>, Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

On Fri, May 17, 2013 at 09:03:14AM +1000, Dave Chinner wrote:
> As it is, the static checker missed the:
> 
> 	rounding = max_t(uint, ....);
> 
> The line before the above usage. I posted a patch to fix this this
> 2 weeks ago here:
> 
> http://oss.sgi.com/pipermail/xfs/2013-May/025986.html
> 

Ah.  Grand.  There is still a problem with the max_t().  The shift
operation will wrap before we do the cast.  It should be:

-	rounding = max_t(xfs_off_t, 1 << mp->m_sb.sb_blocklog, PAGE_CACHE_SIZE);
+	rounding = max_t(xfs_off_t, 1ULL << mp->m_sb.sb_blocklog, PAGE_CACHE_SIZE);

regards,
dan carpenter

