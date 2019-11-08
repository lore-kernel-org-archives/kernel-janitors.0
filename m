From: "Darrick J. Wong" <darrick.wong@oracle.com>
Date: Fri, 08 Nov 2019 16:06:58 +0000
Subject: Re: [PATCH] xfs: remove a stray tab in xfs_remount_rw()
Message-Id: <20191108160658.GT6219@magnolia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191108051121.GA26279@mwanda>
In-Reply-To: <20191108051121.GA26279@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ian Kent <raven@themaw.net>, linux-xfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 08, 2019 at 08:11:22AM +0300, Dan Carpenter wrote:
> The extra tab makes the code slightly confusing.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks ok,
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  fs/xfs/xfs_super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index b3188ea49413..ede6fac47c56 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -1599,7 +1599,7 @@ xfs_remount_rw(
>  	if (error) {
>  		xfs_err(mp,
>  			"Error %d recovering leftover CoW allocations.", error);
> -			xfs_force_shutdown(mp, SHUTDOWN_CORRUPT_INCORE);
> +		xfs_force_shutdown(mp, SHUTDOWN_CORRUPT_INCORE);
>  		return error;
>  	}
>  	xfs_start_block_reaping(mp);
> -- 
> 2.20.1
> 
