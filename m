From: "Darrick J. Wong" <darrick.wong@oracle.com>
Date: Thu, 22 Aug 2019 14:44:24 +0000
Subject: Re: [PATCH] xfs: Use BUG_ON rather than BUG() to remove unreachable code
Message-Id: <20190822144424.GG1037350@magnolia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822062320.GA35267@LGEARND20B15>
In-Reply-To: <20190822062320.GA35267@LGEARND20B15>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Austin Kim <austindh.kim@gmail.com>
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 22, 2019 at 03:23:20PM +0900, Austin Kim wrote:
> Code after BUG is unreachable since system would be crashed
> after the call to BUG is made.
> So change BUG_ON instead of BUG() to remove unreachable code.
> ---
>  fs/xfs/xfs_mount.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/fs/xfs/xfs_mount.c b/fs/xfs/xfs_mount.c
> index 322da69..a681808 100644
> --- a/fs/xfs/xfs_mount.c
> +++ b/fs/xfs/xfs_mount.c
> @@ -213,13 +213,7 @@ xfs_initialize_perag(
>  			goto out_hash_destroy;
>  
>  		spin_lock(&mp->m_perag_lock);
> -		if (radix_tree_insert(&mp->m_perag_tree, index, pag)) {
> -			BUG();
> -			spin_unlock(&mp->m_perag_lock);
> -			radix_tree_preload_end();
> -			error = -EEXIST;
> -			goto out_hash_destroy;
> -		}
> +		BUG_ON(radix_tree_insert(&mp->m_perag_tree, index, pag));

/me thinks this should WARN on the insertion error but otherwise
preserve the existing bailout behavior, since we can always fail the
mount or shutdown the fs and move on....

--D

>  		spin_unlock(&mp->m_perag_lock);
>  		radix_tree_preload_end();
>  		/* first new pag is fully initialized */
> -- 
> 2.6.2
> 
