From: Brian Foster <bfoster@redhat.com>
Date: Mon, 12 Oct 2015 12:49:10 +0000
Subject: Re: [PATCH] xfs: constify sysfs_ops structures
Message-Id: <20151012124910.GB25023@bfoster.bfoster>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444560146-22737-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1444560146-22737-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, xfs@oss.sgi.com

On Sun, Oct 11, 2015 at 12:42:26PM +0200, Julia Lawall wrote:
> These sysfs_ops structures are never modified.  All other sysfs_ops
> structures in the kernel are declared as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 

The fix looks correct, but these data structures just happened to be
removed and condensed into a more generic xfs_sysfs_ops definition as
part of the recent per-mount stats series. See commit a27c2640 ("xfs:
consolidate sysfs ops") for reference.

Brian

> ---
>  fs/xfs/xfs_sysfs.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/xfs/xfs_sysfs.c b/fs/xfs/xfs_sysfs.c
> index aa03670..192c865 100644
> --- a/fs/xfs/xfs_sysfs.c
> +++ b/fs/xfs/xfs_sysfs.c
> @@ -112,7 +112,7 @@ xfs_dbg_store(
>  	return xfs_attr->store ? xfs_attr->store(buf, count, NULL) : 0;
>  }
>  
> -static struct sysfs_ops xfs_dbg_ops = {
> +static const struct sysfs_ops xfs_dbg_ops = {
>  	.show = xfs_dbg_show,
>  	.store = xfs_dbg_store,
>  };
> @@ -227,7 +227,7 @@ xfs_log_store(
>  	return xfs_attr->store ? xfs_attr->store(buf, count, log) : 0;
>  }
>  
> -static struct sysfs_ops xfs_log_ops = {
> +static const struct sysfs_ops xfs_log_ops = {
>  	.show = xfs_log_show,
>  	.store = xfs_log_store,
>  };
> 
> _______________________________________________
> xfs mailing list
> xfs@oss.sgi.com
> http://oss.sgi.com/mailman/listinfo/xfs
