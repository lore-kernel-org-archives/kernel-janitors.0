From: Dave Chinner <dchinner@redhat.com>
Date: Wed, 11 Sep 2013 02:07:25 +0000
Subject: Re: [patch] xfs: = vs == typo in ASSERT()
Message-Id: <20130911020725.GE2445@devil.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130911211731.GA10527@elgon.mountain>
In-Reply-To: <20130911211731.GA10527@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ben Myers <bpm@sgi.com>, Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

On Thu, Sep 12, 2013 at 12:17:31AM +0300, Dan Carpenter wrote:
> There is a '=' vs '=' typo so the ASSERT()s are always true.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Introduced in 21b5c9784b ('xfs: swap extents operations for CRC
> filesystems')
> 
> diff --git a/fs/xfs/xfs_bmap_btree.c b/fs/xfs/xfs_bmap_btree.c
> index 531b020..bb8de8e 100644
> --- a/fs/xfs/xfs_bmap_btree.c
> +++ b/fs/xfs/xfs_bmap_btree.c
> @@ -957,9 +957,9 @@ xfs_bmbt_change_owner(
>  	ASSERT(tp || buffer_list);
>  	ASSERT(!(tp && buffer_list));
>  	if (whichfork = XFS_DATA_FORK)
> -		ASSERT(ip->i_d.di_format = XFS_DINODE_FMT_BTREE);
> +		ASSERT(ip->i_d.di_format = XFS_DINODE_FMT_BTREE);
>  	else
> -		ASSERT(ip->i_d.di_aformat = XFS_DINODE_FMT_BTREE);
> +		ASSERT(ip->i_d.di_aformat = XFS_DINODE_FMT_BTREE);
>  

Eek!

Well, actually, it's harmless, because the only callers of that
function do so after checking that ip->i_d.di_format =
XFS_DINODE_FMT_BTREE.

So, the fix is definitely needed, but it's not as bad as it looks.

Reviewed-by: Dave Chinner <dchinner@redhat.com>

Thanks, Dan.

Cheers,

Dave.
-- 
Dave Chinner
dchinner@redhat.com
