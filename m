From: David Miller <davem@davemloft.net>
Date: Mon, 26 Aug 2019 02:50:12 +0000
Subject: Re: [PATCH v2 net-next] cirrus: cs89x0: remove set but not used variable 'lp'
Message-Id: <20190825.195012.2266154298465148200.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822063517.71231-1-yuehaibing@huawei.com>
        <20190826024915.67642-1-yuehaibing@huawei.com>
In-Reply-To: <20190826024915.67642-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, hulkci@huawei.com

From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 26 Aug 2019 02:49:15 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/cirrus/cs89x0.c: In function 'cs89x0_platform_probe':
> drivers/net/ethernet/cirrus/cs89x0.c:1847:20: warning:
>  variable 'lp' set but not used [-Wunused-but-set-variable]
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 6751edeb8700 ("cirrus: cs89x0: Use managed interfaces")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.
