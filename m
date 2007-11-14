From: David Chinner <dgc@sgi.com>
Date: Wed, 14 Nov 2007 05:41:00 +0000
Subject: Re: [xfs-masters] Re: [PATCH] fs/xfs: remove duplicated defines
Message-Id: <20071114054100.GJ995458@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071111134351.106efb98@lucky.kitzblitz>
In-Reply-To: <20071111134351.106efb98@lucky.kitzblitz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Nov 14, 2007 at 01:46:52PM +1100, Timothy Shimmin wrote:
> David Chinner wrote:
> > Just replace them with (val & PAGE_CACHE_MASK)
                                  ^^^^^^^^^^^^^^^
......
> --- a/fs/xfs/linux-2.6/xfs_lrw.c	2007-11-14 13:02:46.000000000 +1100
> +++ b/fs/xfs/linux-2.6/xfs_lrw.c	2007-11-14 12:36:59.920080014 +1100
> @@ -254,9 +254,8 @@ xfs_read(
> 
>   	if (unlikely(ioflags & IO_ISDIRECT)) {
>   		if (VN_CACHED(vp))
> -			ret = xfs_flushinval_pages(ip,
> -					ctooff(offtoct(*offset)),
> -					-1, FI_REMAPF_LOCKED);
> +			ret = xfs_flushinval_pages(ip, (*offset & PAGE_MASK),
                                                                  ^^^^^^^^^

s/PAGE_MASK/PAGE_CACHE_MASK/g

Cheers,

Dave.
-- 
Dave Chinner
Principal Engineer
SGI Australian Software Group
