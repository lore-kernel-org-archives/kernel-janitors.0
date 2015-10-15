From: "Bill O'Donnell" <billodo@redhat.com>
Date: Thu, 15 Oct 2015 18:48:15 +0000
Subject: Re: [patch] xfs: fix an error code in xfs_fs_fill_super()
Message-Id: <20151015184815.GA18333@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151015181951.GD3163@mwanda>
In-Reply-To: <20151015181951.GD3163@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, xfs@oss.sgi.com

On Thu, Oct 15, 2015 at 09:19:51PM +0300, Dan Carpenter wrote:
> If alloc_percpu() fails, we accidentally return PTR_ERR(NULL), which
> means success, but we intended to return -ENOMEM.
> 
> Fixes: 225e4635580c ('xfs: per-filesystem stats in sysfs')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index 368c55a..b2c252c 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -1477,7 +1477,7 @@ xfs_fs_fill_super(
>  	/* Allocate stats memory before we do operations that might use it */
>  	mp->m_stats.xs_stats = alloc_percpu(struct xfsstats);
>  	if (!mp->m_stats.xs_stats) {
> -		error = PTR_ERR(mp->m_stats.xs_stats);
> +		error = -ENOMEM;
>  		goto out_destroy_counters;
>  	}
>  

Agreed. Thanks for the patch.

Reviewed-by: Bill O'Donnell <billodo@redhat.com>

