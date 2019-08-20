From: "J . Bruce Fields" <bfields@fieldses.org>
Date: Tue, 20 Aug 2019 15:15:54 +0000
Subject: Re: [PATCH -next] nfsd: remove duplicated include from filecache.c
Message-Id: <20190820151554.GA7026@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190820013243.129865-1-yuehaibing@huawei.com>
In-Reply-To: <20190820013243.129865-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Jeff Layton <jeff.layton@primarydata.com>, Weston Andros Adamson <dros@primarydata.com>, Richard Sharpe <richard.sharpe@primarydata.com>, Trond Myklebust <trond.myklebust@primarydata.com>, Chuck Lever <chuck.lever@oracle.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Thanks, applied.--b.

On Tue, Aug 20, 2019 at 01:32:43AM +0000, YueHaibing wrote:
> Remove duplicated include.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  fs/nfsd/filecache.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
> index 4759fdc8a07e..07939f4834e8 100644
> --- a/fs/nfsd/filecache.c
> +++ b/fs/nfsd/filecache.c
> @@ -6,7 +6,6 @@
>  
>  #include <linux/hash.h>
>  #include <linux/slab.h>
> -#include <linux/hash.h>
>  #include <linux/file.h>
>  #include <linux/sched.h>
>  #include <linux/list_lru.h>
> 
> 
