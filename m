From: Mukesh Ojha <mojha@codeaurora.org>
Date: Wed, 24 Apr 2019 06:18:29 +0000
Subject: Re: [PATCH -next] staging: kpc2000: remove duplicated include from kp2000_module.c
Message-Id: <2316d2d2-d505-cca2-0ed0-dccbd5fe67fd@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190424025000.93077-1-yuehaibing@huawei.com>
In-Reply-To: <20190424025000.93077-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On 4/24/2019 8:20 AM, YueHaibing wrote:
> Remove duplicated include.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>   drivers/staging/kpc2000/kpc2000/kp2000_module.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/staging/kpc2000/kpc2000/kp2000_module.c b/drivers/staging/kpc2000/kpc2000/kp2000_module.c
> index 661b0b74ed66..fa3bd266ba54 100644
> --- a/drivers/staging/kpc2000/kpc2000/kp2000_module.c
> +++ b/drivers/staging/kpc2000/kpc2000/kp2000_module.c
> @@ -5,7 +5,6 @@
>   #include <linux/types.h>
>   #include <linux/export.h>
>   #include <linux/slab.h>
> -#include <linux/pci.h>
>   #include <asm/io.h>
>   #include <linux/io.h>
>   #include <linux/mfd/core.h>
>
>
>
>
>
