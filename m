From: Dave Chinner <david@fromorbit.com>
Date: Thu, 16 May 2013 23:03:14 +0000
Subject: Re: [patch] xfs: bug widening binary "not" operation
Message-Id: <20130516230314.GH24635@dastard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130516075330.GB7494@elgon.mountain>
In-Reply-To: <20130516075330.GB7494@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ben Myers <bpm@sgi.com>, Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

On Thu, May 16, 2013 at 10:53:30AM +0300, Dan Carpenter wrote:
> The problem here is:
> 
> 	ioffset = offset & ~(rounding - 1);
> 
> "offset" and "ioffset" are type xfs_off_t (__s64) and "rounding" is
> unsigned int.  The "offset & ~(rounding - 1)" clears the high 32 bits
> and which is unintentional.
> 
> This is a static checker fix so I'm not sure how much difference this
> makes in real life.

It is a real problem, but one that is masked by the way we do range
flushing right now.

As it is, the static checker missed the:

	rounding = max_t(uint, ....);

The line before the above usage. I posted a patch to fix this this
2 weeks ago here:

http://oss.sgi.com/pipermail/xfs/2013-May/025986.html

But thanks for the independent confirmation of the problem, Dan. ;)

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
