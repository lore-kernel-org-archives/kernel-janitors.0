From: "Darrick J. Wong" <darrick.wong@oracle.com>
Date: Mon, 13 Jul 2020 16:20:33 +0000
Subject: Re: [PATCH -next] xfs: remove duplicated include from xfs_buf_item.c
Message-Id: <20200713162033.GX7606@magnolia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200711073458.27029-1-yuehaibing@huawei.com>
In-Reply-To: <20200711073458.27029-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: linux-xfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jul 11, 2020 at 07:34:58AM +0000, YueHaibing wrote:
> Remove duplicated include.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Looks ok,
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  fs/xfs/xfs_buf_item.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/xfs/xfs_buf_item.c b/fs/xfs/xfs_buf_item.c
> index e9428c30862a..ed1bf1d99483 100644
> --- a/fs/xfs/xfs_buf_item.c
> +++ b/fs/xfs/xfs_buf_item.c
> @@ -19,7 +19,6 @@
>  #include "xfs_quota.h"
>  #include "xfs_dquot_item.h"
>  #include "xfs_dquot.h"
> -#include "xfs_trans_priv.h"
>  #include "xfs_trace.h"
>  #include "xfs_log.h"
>  
> 
> 
> 
> 
> 
