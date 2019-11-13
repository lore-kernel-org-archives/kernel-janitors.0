From: "Darrick J. Wong" <darrick.wong@oracle.com>
Date: Wed, 13 Nov 2019 04:10:26 +0000
Subject: Re: [PATCH -next] xfs: remove duplicated include from xfs_dir2_data.c
Message-Id: <20191113041026.GF6219@magnolia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191113022501.55816-1-yuehaibing@huawei.com>
In-Reply-To: <20191113022501.55816-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Eric Sandeen <sandeen@sandeen.net>, Brian Foster <bfoster@redhat.com>, Dave Chinner <dchinner@redhat.com>, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 13, 2019 at 02:25:01AM +0000, YueHaibing wrote:
> Remove duplicated include.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Heh, oops.  Thanks for the patch!
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  fs/xfs/libxfs/xfs_dir2_data.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/xfs/libxfs/xfs_dir2_data.c b/fs/xfs/libxfs/xfs_dir2_data.c
> index 9e471a28b6c6..30293a1d03f6 100644
> --- a/fs/xfs/libxfs/xfs_dir2_data.c
> +++ b/fs/xfs/libxfs/xfs_dir2_data.c
> @@ -18,7 +18,6 @@
>  #include "xfs_trans.h"
>  #include "xfs_buf_item.h"
>  #include "xfs_log.h"
> -#include "xfs_dir2_priv.h"
>  
>  static xfs_failaddr_t xfs_dir2_data_freefind_verify(
>  		struct xfs_dir2_data_hdr *hdr, struct xfs_dir2_data_free *bf,
> 
> 
> 
