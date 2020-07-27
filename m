From: Frank van der Linden <fllinden@amazon.com>
Date: Mon, 27 Jul 2020 16:34:23 +0000
Subject: Re: [PATCH] NFSv4.2: Fix an error code in nfs4_xattr_cache_init()
Message-Id: <20200727163423.GA7563@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727112344.GH389488@mwanda>
In-Reply-To: <20200727112344.GH389488@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Mon, Jul 27, 2020 at 02:23:44PM +0300, Dan Carpenter wrote:
> 
> 
> This should return -ENOMEM on failure instead of success.
> 
> Fixes: 95ad37f90c33 ("NFSv4.2: add client side xattr caching.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> ---
>  fs/nfs/nfs42xattr.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/nfs/nfs42xattr.c b/fs/nfs/nfs42xattr.c
> index 23fdab977a2a..e75c4bb70266 100644
> --- a/fs/nfs/nfs42xattr.c
> +++ b/fs/nfs/nfs42xattr.c
> @@ -1040,8 +1040,10 @@ int __init nfs4_xattr_cache_init(void)
>                 goto out2;
> 
>         nfs4_xattr_cache_wq = alloc_workqueue("nfs4_xattr", WQ_MEM_RECLAIM, 0);
> -       if (nfs4_xattr_cache_wq = NULL)
> +       if (nfs4_xattr_cache_wq = NULL) {
> +               ret = -ENOMEM;
>                 goto out1;
> +       }
> 
>         ret = register_shrinker(&nfs4_xattr_cache_shrinker);
>         if (ret)
> --
> 2.27.0
> 

Thanks for catching that one. Since this is against linux-next via Trond,
I assume Trond will add it to his tree (right?)

In any case:


Reviewed-by: Frank van der Linden <fllinden@amazon.com>


- Frank
