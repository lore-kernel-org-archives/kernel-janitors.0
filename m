From: Shannon Nelson <snelson@pensando.io>
Date: Fri, 06 Sep 2019 15:36:19 +0000
Subject: Re: [PATCH net-next] ionic: Remove unused including <linux/version.h>
Message-Id: <3556b355-0cd5-ed28-8821-525d24197d07@pensando.io>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190906095410.107596-1-yuehaibing@huawei.com>
In-Reply-To: <20190906095410.107596-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Pensando Drivers <drivers@pensando.io>, "David S . Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org


On 9/6/19 2:54 AM, YueHaibing wrote:
> Remove including <linux/version.h> that don't need it.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>   drivers/net/ethernet/pensando/ionic/ionic_main.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_main.c b/drivers/net/ethernet/pensando/ionic/ionic_main.c
> index 5ec67f3f1853..15e432386b35 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_main.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_main.c
> @@ -2,7 +2,6 @@
>   /* Copyright(c) 2017 - 2019 Pensando Systems, Inc */
>   
>   #include <linux/module.h>
> -#include <linux/version.h>
>   #include <linux/netdevice.h>
>   #include <linux/utsname.h>
>
>

Acked-by: Shannon Nelson <snelson@pensando.io>
