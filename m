From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Apr 2020 18:04:48 +0000
Subject: Re: [PATCH -next] NFSv4: Use GFP_ATOMIC under spin lock in _pnfs_grab_empty_layout()
Message-Id: <20200428180448.GJ2014@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428071932.69976-1-weiyongjun1@huawei.com>
In-Reply-To: <20200428071932.69976-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 28, 2020 at 07:19:32AM +0000, Wei Yongjun wrote:
> A spin lock is taken here so we should use GFP_ATOMIC.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  fs/nfs/pnfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/nfs/pnfs.c b/fs/nfs/pnfs.c
> index dd2e14f5875d..d84c1b7b71d2 100644
> --- a/fs/nfs/pnfs.c
> +++ b/fs/nfs/pnfs.c
> @@ -2170,7 +2170,7 @@ _pnfs_grab_empty_layout(struct inode *ino, struct nfs_open_context *ctx)
>  	struct pnfs_layout_hdr *lo;
>  
>  	spin_lock(&ino->i_lock);
                   ^^^
> -	lo = pnfs_find_alloc_layout(ino, ctx, GFP_KERNEL);
> +	lo = pnfs_find_alloc_layout(ino, ctx, GFP_ATOMIC);
                                    ^^^
It releases the lock before allocating.  It's annotated.

regards,
dan carpenter
