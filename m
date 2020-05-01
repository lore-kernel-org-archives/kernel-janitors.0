From: David Miller <davem@davemloft.net>
Date: Fri, 01 May 2020 22:28:17 +0000
Subject: Re: [PATCH net-next v2] drivers: net: davinci_mdio: fix potential NULL dereference in davinci_mdio_p
Message-Id: <20200501.152817.688071349221528108.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427094032.181184-1-weiyongjun1@huawei.com>
        <20200429025220.166415-1-weiyongjun1@huawei.com>
In-Reply-To: <20200429025220.166415-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: grygorii.strashko@ti.com, david@lechnology.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 29 Apr 2020 02:52:20 +0000

> platform_get_resource() may fail and return NULL, so we should
> better check it's return value to avoid a NULL pointer dereference
> since devm_ioremap() does not check input parameters for null.
> 
> This is detected by Coccinelle semantic patch.
> 
> @@
> expression pdev, res, n, t, e, e1, e2;
> @@
> 
> res = \(platform_get_resource\|platform_get_resource_byname\)(pdev, t, n);
> + if (!res)
> +   return -EINVAL;
> ... when != res = NULL
> e = devm_ioremap(e1, res->start, e2);
> 
> Fixes: 03f66f067560 ("net: ethernet: ti: davinci_mdio: use devm_ioremap()")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

Applied.
