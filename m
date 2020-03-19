From: Alex Elder <elder@ieee.org>
Date: Thu, 19 Mar 2020 12:50:11 +0000
Subject: Re: [PATCH net-next] net: ipa: Remove unused including <linux/version.h>
Message-Id: <d47072c5-3d10-7097-1e01-5c814bb5c919@ieee.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200319121200.31214-1-yuehaibing@huawei.com>
In-Reply-To: <20200319121200.31214-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Alex Elder <elder@kernel.org>, "David S . Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 3/19/20 7:12 AM, YueHaibing wrote:
> Remove including <linux/version.h> that don't need it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Looks good.  Thanks for the patches.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>  drivers/net/ipa/ipa_endpoint.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
> index 915b4cd05dd2..217cbf337ad7 100644
> --- a/drivers/net/ipa/ipa_endpoint.c
> +++ b/drivers/net/ipa/ipa_endpoint.c
> @@ -9,7 +9,6 @@
>  #include <linux/slab.h>
>  #include <linux/bitfield.h>
>  #include <linux/if_rmnet.h>
> -#include <linux/version.h>
>  #include <linux/dma-direction.h>
>  
>  #include "gsi.h"
> 
> 
> 
