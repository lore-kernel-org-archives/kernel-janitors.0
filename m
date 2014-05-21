From: Eric Sandeen <sandeen@sandeen.net>
Date: Wed, 21 May 2014 12:44:08 +0000
Subject: Re: [patch] [XFS] indent an if statement
Message-Id: <537C9F98.8020306@sandeen.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140521122746.GD23396@mwanda>
In-Reply-To: <20140521122746.GD23396@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Dave Chinner <david@fromorbit.com>
Cc: kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

On 5/21/14, 7:27 AM, Dan Carpenter wrote:
> The "n += 32;" goes with the if statement on the line before so it
> should be indented.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Easy one ;)

Wow, it's been this way ever since 79071eb0 in 2008.

Reviewed-by: Eric Sandeen <sandeen@redhat.com>

> diff --git a/fs/xfs/xfs_bit.h b/fs/xfs/xfs_bit.h
> index f1e3c90..f685942 100644
> --- a/fs/xfs/xfs_bit.h
> +++ b/fs/xfs/xfs_bit.h
> @@ -67,7 +67,7 @@ static inline int xfs_lowbit64(__uint64_t v)
>  	} else {	/* upper bits */
>  		w = (__uint32_t)(v >> 32);
>  		if (w && (n = ffs(w)))
> -		n += 32;
> +			n += 32;
>  	}
>  	return n - 1;
>  }
> 
> _______________________________________________
> xfs mailing list
> xfs@oss.sgi.com
> http://oss.sgi.com/mailman/listinfo/xfs
> 

